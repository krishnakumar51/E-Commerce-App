import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store/commmon/styles/spacing_styles.dart';
import 'package:t_store/commmon/widgets/login_signup/form_divider.dart';
import 'package:t_store/commmon/widgets/login_signup/social_button.dart';
import 'package:t_store/features/authentication/screens/login/widgets/login_form.dart';
import 'package:t_store/features/authentication/screens/login/widgets/login_header.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/constants/text_strings.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: TSpacingStyle.paddingWithAppBarHeight,
        child: Column(
          children: [
            // logo, title, subtitle
            const TLoginHeader(),

            const TLoginForm(),

            TFormDivider(
              dividerText: TTexts.orSignInWith.capitalize!,
            ),

            const SizedBox(
              height: TSizes.spaceBtwSections,
            ),

            const TSocialButtons()
          ],
        ),
      ),
    );
  }
}
