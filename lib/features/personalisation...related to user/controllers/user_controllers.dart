import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:t_store/data/repositories/user/user_repository.dart';
import 'package:t_store/features/personalisation...related%20to%20user/models/user_model.dart';
import 'package:t_store/utils/popups/loader.dart';

class UserController extends GetxController {
  static UserController get instance => Get.find();

  final userRepositroy = Get.put(UserRepository());
  Rx<UserModel> user = UserModel.empty().obs;

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
}
