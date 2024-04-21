import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store/data/repositories/authentication/authentication_repository.dart';
import 'package:t_store/data/repositories/user/user_repository.dart';
import 'package:t_store/features/authentication/screens/signup/verify_enail.dart';
import 'package:t_store/features/personalisation...related%20to%20user/models/user_model.dart';
import 'package:t_store/utils/constants/image_strings.dart';
import 'package:t_store/utils/helpers/network_manager.dart';
import 'package:t_store/utils/popups/full_screen_lodaer.dart';
import 'package:t_store/utils/popups/loader.dart';

class SignupController extends GetxController {
  static SignupController get instance => Get.find();

  //variables
  final firstName = TextEditingController();
  final lastName = TextEditingController();
  final userName = TextEditingController();
  final email = TextEditingController();
  final password = TextEditingController();
  final phoneNumber = TextEditingController();
  final hidePassword = true.obs;
  final privacyPolicay = true.obs;
  GlobalKey<FormState> signupFormKey = GlobalKey<FormState>();

  // sign up

  void signup() async {
    try {
      // Start loading
      TFullScreenLoader.voidOpenLoadingDialog(
          "We are processing your information...", TImages.dockerAnimation);

      // Check Internet connectivity
      final isConnected = await NetworkManager.instance.isConnected();

      if (!isConnected) {
        // remove loader
        TFullScreenLoader.stopLoading();
        return;
      }

      // form validation

      if (!signupFormKey.currentState!.validate()) {
        // remove loader
        TFullScreenLoader.stopLoading();
        return;
      }

      // privacy policy check
      if (!privacyPolicay.value) {
        TLoaders.warningSnackbar(
            title: "Accept Privacy Policy",
            message:
                "In order to create the account you need to read and accept the Privacy Policy");
        return;
      }

      // register user in firebase authentication & save user data in firebase
      final userCredential = await AuthenticationRepository.instance
          .registerWithEmailAndPassword(
              email.text.trim(), password.text.trim());

      // save authenticated user data in firebase firestore
      final newUser = UserModel(
        id: userCredential.user!.uid,
        firstName: firstName.text.trim(),
        lastName: lastName.text.trim(),
        userName: userName.text.trim(),
        email: email.text.trim(),
        phoneNumber: phoneNumber.text.trim(),
        profilePicture: "",
      );

      final userRepository = Get.put(UserRepository());
      await userRepository.saveUserRecord(newUser);

      // remove loader
      TFullScreenLoader.stopLoading();

      // show success msg
      TLoaders.successSnackbar(
          title: "Congratulations!",
          message:
              "Your account has been created successfully! Verify Email to continue.");

      // move to verify email screen
      Get.to(() => VerifyEmailScreen(
            email: email.text.trim(),
          ));
    } catch (e) {
      // remove loader
      TFullScreenLoader.stopLoading();
      // show some generic error to the user
      TLoaders.errorSnackbar(title: "Oh Snap!", message: e.toString());
    }
  }
}
