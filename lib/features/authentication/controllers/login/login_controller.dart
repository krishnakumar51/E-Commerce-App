import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:get_storage/get_storage.dart';
import 'package:t_store/data/repositories/authentication/authentication_repository.dart';
import 'package:t_store/features/personalisation...related%20to%20user/controllers/user_controllers.dart';
import 'package:t_store/utils/constants/image_strings.dart';
import 'package:t_store/utils/helpers/network_manager.dart';
import 'package:t_store/utils/popups/full_screen_lodaer.dart';
import 'package:t_store/utils/popups/loader.dart';

class LoginController extends GetxController {
  static LoginController get instance => Get.find();

  //variables
  final localStorage = GetStorage();
  final email = TextEditingController();
  final password = TextEditingController();
  final hidePassword = true.obs;
  final rememberMe = false.obs;
  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  final userController = Get.put(UserController());

  @override
  void onInit() {
    final rememberMeEmail = localStorage.read("REMEMBER_ME_EMAIL");
    final rememberMePassword = localStorage.read("REMEMBER_ME_PASSWORD");

    if (rememberMeEmail != null) {
      email.text = rememberMeEmail;
    }

    if (rememberMePassword != null) {
      password.text = rememberMePassword;
    }

    super.onInit();
  }

  // logging in

  Future<void> emailAndPasswordSignIn() async {
    try {
      // Start loading
      TFullScreenLoader.voidOpenLoadingDialog(
          "Logging you in...", TImages.dockerAnimation);

      // Check Internet connectivity
      final isConnected = await NetworkManager.instance.isConnected();

      if (!isConnected) {
        // remove loader
        TFullScreenLoader.stopLoading();
        return;
      }

      // form validation

      if (!loginFormKey.currentState!.validate()) {
        // remove loader
        TFullScreenLoader.stopLoading();
        return;
      }

      // saving data
      if (rememberMe.value) {
        localStorage.write("REMEMBER_ME_EMAIL", email.text.trim());
        localStorage.write("REMEMBER_ME_PASSWORD", password.text.trim());
      }

      // login using email and password
      final userCredential = await AuthenticationRepository.instance
          .loginWithEmailAndPassword(email.text.trim(), password.text.trim());

      // remove loader
      TFullScreenLoader.stopLoading();

      AuthenticationRepository.instance.screenRedirect();
    } catch (e) {
      // remove loader
      TFullScreenLoader.stopLoading();
      // show some generic error to the user
      TLoaders.errorSnackbar(title: "Oh Snap!", message: e.toString());
    }
  }

  // google sign in authentication
  Future<void> googleSignIn() async {
    try {
      // Start loading
      TFullScreenLoader.voidOpenLoadingDialog(
          "Logging you in...", TImages.dockerAnimation);

      // Check Internet connectivity
      final isConnected = await NetworkManager.instance.isConnected();

      if (!isConnected) {
        // remove loader
        TFullScreenLoader.stopLoading();
        return;
      }

      // google authentication
      final userCredentials =
          await AuthenticationRepository.instance.signInWithGoogle();

      // save user record
      await userController.saveUserRecord(userCredentials);

      // remove loader
      TFullScreenLoader.stopLoading();

      // redirect
      AuthenticationRepository.instance.screenRedirect();
    } catch (e) {
      // remove loader
      TFullScreenLoader.stopLoading();
      // show some generic error to the user
      TLoaders.errorSnackbar(title: "Oh Snap!", message: e.toString());
    }
  }
}
