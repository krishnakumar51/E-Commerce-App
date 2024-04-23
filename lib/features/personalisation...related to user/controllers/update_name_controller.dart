import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store/data/repositories/user/user_repository.dart';
import 'package:t_store/features/personalisation...related%20to%20user/controllers/user_controllers.dart';
import 'package:t_store/features/personalisation...related%20to%20user/screens/profile/profile.dart';
import 'package:t_store/utils/constants/image_strings.dart';
import 'package:t_store/utils/helpers/network_manager.dart';
import 'package:t_store/utils/popups/full_screen_lodaer.dart';
import 'package:t_store/utils/popups/loader.dart';

class UpdateNameController extends GetxController {
  static UpdateNameController get instance => Get.find();

  final firstName = TextEditingController();
  final lastName = TextEditingController();
  final userController = UserController.instance;
  final userRepository = Get.put(UserRepository());
  GlobalKey<FormState> updateUserNameFormKey = GlobalKey<FormState>();

  // init user data when home screen appears
  @override
  void onInit() {
    initializeNames();
    super.onInit();
  }

  Future<void> initializeNames() async {
    firstName.text = userController.user.value.firstName;
    lastName.text = userController.user.value.lastName;
  }

  Future<void> updateUserName() async {
    try {
      // Start loading
      TFullScreenLoader.voidOpenLoadingDialog(
          "We are updating ypour information...", TImages.dockerAnimation);

      // Check Internet connectivity
      final isConnected = await NetworkManager.instance.isConnected();

      if (!isConnected) {
        // remove loader
        TFullScreenLoader.stopLoading();
        return;
      }

      // form validation
      if (!updateUserNameFormKey.currentState!.validate()) {
        // remove loader
        TFullScreenLoader.stopLoading();
        return;
      }

      // update the user's firstname and lastname in the firebase firestore
      Map<String, dynamic> name = {
        "firstName": firstName.text.trim(),
        "lasttName": lastName.text.trim(),
      };
      await userRepository.updateSingleField(name);

      // update the Rx user value
      userController.user.value.firstName = firstName.text.trim();
      userController.user.value.lastName = lastName.text.trim();

      // remove loader
      TFullScreenLoader.stopLoading();

      // show succes message
      TLoaders.successSnackbar(
          title: "Congratulations!", message: "Your Name has been updated.");

      // Move to previous screen
      Get.off(() => const ProfileScreen());
    } catch (e) {
      // remove loader
      TFullScreenLoader.stopLoading();

      // show some generic error to the user
      TLoaders.errorSnackbar(title: "Oh Snap!", message: e.toString());
    }
  }
}
