import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:t_store/data/repositories/authentication/authentication_repository.dart';
import 'package:t_store/data/repositories/user/user_repository.dart';
import 'package:t_store/features/authentication/screens/login/login.dart';
import 'package:t_store/features/personalisation...related%20to%20user/models/user_model.dart';
import 'package:t_store/features/personalisation...related%20to%20user/screens/profile/widgets/re_auth_user_login_form.dart';
import 'package:t_store/utils/constants/image_strings.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/helpers/network_manager.dart';
import 'package:t_store/utils/popups/full_screen_lodaer.dart';
import 'package:t_store/utils/popups/loader.dart';

class UserController extends GetxController {
  static UserController get instance => Get.find();

  final userRepositroy = Get.put(UserRepository());
  Rx<UserModel> user = UserModel.empty().obs;

  final hidePassword = false.obs;
  final verifyEmail = TextEditingController();
  final verifyPassword = TextEditingController();
  final userRepository = Get.put(UserRepository());
  GlobalKey<FormState> reAuthFormKey = GlobalKey<FormState>();

  @override
  void onInit() {
    super.onInit();
    fetchUserRecord();
  }

  Future<void> fetchUserRecord() async {
    try {
      final user = await userRepositroy.fetchUserDetials();
      this.user(user);
    } catch (e) {
      user(UserModel.empty());
    }
  }

  // save the user record from any registration provider
  Future<void> saveUserRecord(UserCredential? userCredentials) async {
    try {
      // first update Rx user and check if user data is already stored.if Not store new data
      await fetchUserRecord();

      if (userCredentials != null) {
        // conversion of first name and last name
        final nameParts =
            UserModel.nameParts(userCredentials.user!.displayName ?? "");
        final username =
            UserModel.generateUsername(userCredentials.user!.displayName ?? "");

        // mapping the data
        final user = UserModel(
          id: userCredentials.user!.uid,
          firstName: nameParts[0],
          lastName: nameParts.length > 1 ? nameParts.sublist(1).join(" ") : "",
          userName: username,
          email: userCredentials.user!.email ?? "",
          phoneNumber: userCredentials.user!.phoneNumber ?? "",
          profilePicture: userCredentials.user!.photoURL ?? "",
        );

        await userRepositroy.saveUserRecord(user);
      }
    } catch (e) {
      TLoaders.warningSnackbar(
          title: "Data not saved!",
          message:
              "Something went wrong while saving your information. You can re-save your data in Your Profile.");
    }
  }

  void deleteAccountWarningPopup() {
    Get.defaultDialog(
      contentPadding: const EdgeInsets.all(TSizes.md),
      title: "Delete Account",
      middleText:
          "Are you sure you want to DELETE your account PERMANENTLY? This action is not reversible, your data will be lost permanently.",
      confirm: ElevatedButton(
        onPressed: () async => deleteUserAccount(),
        style: ElevatedButton.styleFrom(
            backgroundColor: Colors.red,
            side: const BorderSide(color: Colors.red)),
        child: const Padding(
          padding: EdgeInsets.symmetric(horizontal: TSizes.lg),
          child: Text("Delete"),
        ),
      ),
      cancel: OutlinedButton(
        onPressed: () => Navigator.of(Get.overlayContext!).pop(),
        child: const Text("Cancel"),
      ),
    );
  }

  void deleteUserAccount() async {
    try {
      // Start loading
      TFullScreenLoader.voidOpenLoadingDialog(
          "Processing...", TImages.dockerAnimation);

      // first re-authenticate the user
      final auth = AuthenticationRepository.instance;
      final provider =
          auth.authUser!.providerData.map((e) => e.providerId).first;
      if (provider.isNotEmpty) {
        // re verify auth email
        if (provider == "google.com") {
          await auth.signInWithGoogle();
          await auth.deleteAccount();
          TFullScreenLoader.stopLoading();
          Get.offAll(() => const LoginScreen());
        } else if (provider == "password") {
          TFullScreenLoader.stopLoading();
          Get.to(() => const ReAuthenticatUserLoginForm());
        }
      }
    } catch (e) {
      TFullScreenLoader.stopLoading();
      TLoaders.errorSnackbar(title: "Oh Snap!", message: e.toString());
    }
  }

  Future<void> reAuthenticateEmailAndPasswordUser() async {
    try {
      // Start loading
      TFullScreenLoader.voidOpenLoadingDialog(
          "Processing...", TImages.dockerAnimation);

      // Check Internet connectivity
      final isConnected = await NetworkManager.instance.isConnected();

      if (!isConnected) {
        // remove loader
        TFullScreenLoader.stopLoading();
        return;
      }

      // form validation
      if (!reAuthFormKey.currentState!.validate()) {
        // remove loader
        TFullScreenLoader.stopLoading();
        return;
      }

      await AuthenticationRepository.instance.reAuthenticateEmailAndPassword(
          verifyEmail.text.trim(), verifyPassword.text.trim());
      await AuthenticationRepository.instance.deleteAccount();

      TFullScreenLoader.stopLoading();
      Get.to(() => const LoginScreen());
    } catch (e) {
      TFullScreenLoader.stopLoading();
      TLoaders.errorSnackbar(title: "Oh Snap!", message: e.toString());
    }
  }

  void uploadUserProfilePicture() async {
    try {
      final image = await ImagePicker().pickImage(
          source: ImageSource.gallery,
          imageQuality: 70,
          maxHeight: 512,
          maxWidth: 512);
      if (image != null) {
        // upload image
        final imageUrl =
            await userRepository.uploadImage("Users/Images/Profile", image);

        // update userr image record
        Map<String, dynamic> json = {"ProfilePicture": imageUrl};
        await userRepositroy.updateSingleField(json);

        user.value.profilePicture = imageUrl;
        user.refresh();

        // success
        TLoaders.successSnackbar(
            title: "Congratulations!",
            message: "Your Profile Image has been updated!");
      }
    } catch (e) {
      TLoaders.errorSnackbar(
          title: "Oh Snap!", message: "Something went wrong: $e");
    }
  }
}
