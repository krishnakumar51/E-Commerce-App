import 'package:flutter/material.dart';
import 'package:t_store/commmon/widgets/cutom_shapes/containers/rounded_container.dart';
import 'package:t_store/commmon/widgets/images/circular_image.dart';
import 'package:t_store/commmon/widgets/texts/brand_title_with_verfication.dart';
import 'package:t_store/commmon/widgets/texts/product_price_text.dart';
import 'package:t_store/commmon/widgets/texts/product_title_text.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/constants/enums.dart';
import 'package:t_store/utils/constants/image_strings.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/helpers/helper_functions.dart';

class TProductMetaData extends StatelessWidget {
  const TProductMetaData({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Price and sale price

        Row(
          children: [
            // Sale Tag

            TRoundedContainer(
              radius: TSizes.sm,
              backgroundColor: TColors.secondary.withOpacity(0.8),
              padding: const EdgeInsets.symmetric(
                  horizontal: TSizes.sm, vertical: TSizes.xs),
              child: Text("25%",
                  style: Theme.of(context).textTheme.labelLarge!.apply(
                        color: TColors.black,
                      )),
            ),

            const SizedBox(
              width: TSizes.spaceBtwItems,
            ),

            // price

            Text("\$250",
                style: Theme.of(context).textTheme.titleSmall!.apply(
                      decoration: TextDecoration.lineThrough,
                    )),
            const SizedBox(width: TSizes.spaceBtwItems),
            const TProductPriceText(
              price: '175',
              isLarge: true,
            ),
          ],
        ),

        const SizedBox(
          height: TSizes.spaceBtwItems / 1.5,
        ),

        // Title

        const TProductTitleText(title: "Green Nike Sports Shirt"),
        const SizedBox(
          height: TSizes.spaceBtwItems / 1.5,
        ),

        // stock status

        Row(
          children: [
            const TProductTitleText(title: "Status"),
            const SizedBox(width: TSizes.spaceBtwItems),
            Text(
              "In stock",
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ],
        ),
        const SizedBox(
          height: TSizes.spaceBtwItems / 1.5,
        ),

        // brand
        Row(
          children: [
            TCircularImage(
              image: TImages.nikeLogo,
              height: 32,
              width: 32,
              overlayColor: dark ? TColors.white : TColors.black,
              backgroundColor: Colors.transparent,
            ),
            const TBrandTitileWithVerification(
              title: "Nike",
              brandtextSize: TextSizes.medium,
            )
          ],
        )
      ],
    );
  }
}
