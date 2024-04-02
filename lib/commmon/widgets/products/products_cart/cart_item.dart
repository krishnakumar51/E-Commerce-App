import 'package:flutter/material.dart';
import 'package:t_store/commmon/widgets/images/rounded_images.dart';
import 'package:t_store/commmon/widgets/texts/brand_title_with_verfication.dart';
import 'package:t_store/commmon/widgets/texts/product_title_text.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/constants/image_strings.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/helpers/helper_functions.dart';

class TCartItem extends StatelessWidget {
  const TCartItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);

    return Row(
      children: [
        // Image
        TRoundedImage(
          imgUrl: TImages.productImage1,
          width: 60,
          height: 60,
          padding: const EdgeInsets.all(TSizes.sm),
          backgroundColor: dark ? TColors.darkerGrey : TColors.light,
        ),

        const SizedBox(
          width: TSizes.spaceBtwItems,
        ),

        // title, price, size
        Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const TBrandTitileWithVerification(title: "Nike"),
              const Flexible(
                  child: TProductTitleText(
                title: "Black Sports shoes",
                maxLines: 1,
              )),

              // Attributes
              Text.rich(TextSpan(children: [
                TextSpan(
                    text: "Color ",
                    style: Theme.of(context).textTheme.bodySmall),
                TextSpan(
                    text: "Green ",
                    style: Theme.of(context).textTheme.bodyLarge),
                TextSpan(
                    text: "Size ",
                    style: Theme.of(context).textTheme.bodySmall),
                TextSpan(
                    text: "UK 34 ",
                    style: Theme.of(context).textTheme.bodyLarge),
              ])),
            ],
          ),
        ),
      ],
    );
  }
}
