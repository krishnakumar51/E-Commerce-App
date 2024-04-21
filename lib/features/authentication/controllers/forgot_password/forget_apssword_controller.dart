import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store/data/repositories/authentication/authentication_repository.dart';
import 'package:t_store/features/authentication/screens/password_configuration/rerset_password.dart';
import 'package:t_store/utils/constants/image_strings.dart';
import 'package:t_store/utils/helpers/network_manager.dart';
import 'package:t_store/utils/popups/full_screen_lodaer.dart';
import 'package:t_store/utils/popups/loader.dart';

class ForgetPasswordController extends GetxController {
  static ForgetPasswordController get instance => Get.find();

  // variables
  final email = TextEditingController();
  GlobalKey<FormState> forgetPasswordFormKey = GlobalKey<FormState>();

  // send reset password email
  sendPasswordResetEmail() async {
    try {
      // Start loading
      TFullScreenLoader.voidOpenLoadingDialog(
          "Processing your Request...", TImages.dockerAnimation);

      // Check Internet connectivity
      final isConnected = await NetworkManager.instance.isConnected();

      if (!isConnected) {
        // remove loader
        TFullScreenLoader.stopLoading();
        return;
      }

      // form validation

      if (!forgetPasswordFormKey.currentState!.validate()) {
        // remove loader
        TFullScreenLoader.stopLoading();
        return;
      }

      //send email to rest the password
      await AuthenticationRepository.instance
          .sendPasswordResetEmail(email.text.trim());

      // remove loader
      TFullScreenLoader.stopLoading();

      // show success screeen
      TLoaders.successSnackbar(
          title: "Email Sent",
          message:
              "A link is sent to your registered email to reset your password.");

      // get to resetpasswordscreen
      Get.to(() => RersetPasswordScreen(
            email: email.text.trim(),
          ));
    } catch (e) {
      // remove loader
      TFullScreenLoader.stopLoading();

      // error snakcbar
      TLoaders.errorSnackbar(title: "Oh Snap!", message: e.toString());
    }
  }

  // resend reset password email

  resendPasswordResetEmail(String email) async {
    try {
      // Start loading
      TFullScreenLoader.voidOpenLoadingDialog(
          "Processing your Request...", TImages.dockerAnimation);

      // Check Internet connectivity
      final isConnected = await NetworkManager.instance.isConnected();

      if (!isConnected) {
        // remove loader
        TFullScreenLoader.stopLoading();
        return;
      }

      //send email to rest the password
      await AuthenticationRepository.instance.sendPasswordResetEmail(email);

      // remove loader
      TFullScreenLoader.stopLoading();

      // show success screeen
      TLoaders.successSnackbar(
          title: "Email Sent",
          message:
              "A link is sent to your registered email to reset your password.");
    } catch (e) {
      // remove loader
      TFullScreenLoader.stopLoading();

      // error snakcbar
      TLoaders.errorSnackbar(title: "Oh Snap!", message: e.toString());
    }
  }
}
