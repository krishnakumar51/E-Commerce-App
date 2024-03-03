import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store/commmon/widgets/login_signup/form_divider.dart';
import 'package:t_store/commmon/widgets/login_signup/social_button.dart';
import 'package:t_store/features/authentication/screens/signup/widgets/signup_form.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/constants/text_strings.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Title
              Text(
                TTexts.signupTitle,
                style: Theme.of(context).textTheme.headlineMedium,
              ),

              const SizedBox(
                height: TSizes.spaceBtwSections,
              ),

              // Form
              const TSignupForm(),

              const SizedBox(
                height: TSizes.spaceBtwSections,
              ),

              TFormDivider(dividerText: TTexts.orSignUpWith.capitalize!),

              const SizedBox(
                height: TSizes.spaceBtwSections,
              ),

              const TSocialButtons(),
            ],
          ),
        ),
      ),
    );
  }
}
