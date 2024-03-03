import 'package:flutter/material.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/constants/text_strings.dart';
import 'package:t_store/utils/helpers/helper_functions.dart';

class TTermsAndConditions extends StatelessWidget {
  const TTermsAndConditions({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);

    return Row(
      children: [
        SizedBox(
          height: 24,
          width: 24,
          child: Checkbox(value: true, onChanged: (value) {}),
        ),
        const SizedBox(
          width: TSizes.spaceBtwItems,
        ),
        Expanded(
          child: Text.rich(TextSpan(children: [
            TextSpan(
                text: '${TTexts.iAgreeTo} ',
                style: Theme.of(context).textTheme.titleMedium),
            TextSpan(
                text: TTexts.privacyPolicy,
                style: Theme.of(context).textTheme.titleMedium!.apply(
                      color: dark ? TColors.white : TColors.primary,
                      decoration: TextDecoration.underline,
                      decorationColor: dark ? TColors.white : TColors.primary,
                    )),
            TextSpan(
                text: ' ${TTexts.termsOfUse} ',
                style: Theme.of(context).textTheme.titleMedium),
            TextSpan(
                text: TTexts.privacyPolicy,
                style: Theme.of(context).textTheme.titleMedium!.apply(
                      color: dark ? TColors.white : TColors.primary,
                      decoration: TextDecoration.underline,
                      decorationColor: dark ? TColors.white : TColors.primary,
                    )),
          ])),
        )
      ],
    );
  }
}
