import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store/commmon/widgets/loaders/animation_loader.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/helpers/helper_functions.dart';

class TFullScreenLoader {
  // open a full screen loading animation with a given text and animation
  // this method doesn't return anything

  // parameters:
  // - text: the text to display in the loading animation
  // - animation: the lotti animation to display in the loading animation
  static voidOpenLoadingDialog(String text, String animation) {
    final dark = THelperFunctions.isDarkMode(Get.context!);

    showDialog(
        context: Get.overlayContext!, //for overlay dialogs
        barrierDismissible:
            false, // the dialog can't be dismmised by tapping outside

        builder: (_) => PopScope(
              canPop: false, //disable popping with the back button
              child: Container(
                color: dark ? TColors.dark : TColors.white,
                height: double.infinity,
                width: double.infinity,
                child: Column(
                  children: [
                    const SizedBox(
                      height: 250,
                    ),
                    TAnimationLoader(
                      text: text,
                      animation: animation,
                    )
                  ],
                ),
              ),
            ));
  }

  static stopLoading() {
    Navigator.of(Get.overlayContext!)
        .pop(); //close the dioalog using the navigator
  }
}
