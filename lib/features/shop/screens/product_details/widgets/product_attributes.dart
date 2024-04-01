import 'package:flutter/material.dart';
import 'package:t_store/commmon/widgets/chips/choice_chips.dart';
import 'package:t_store/commmon/widgets/cutom_shapes/containers/rounded_container.dart';
import 'package:t_store/commmon/widgets/texts/product_price_text.dart';
import 'package:t_store/commmon/widgets/texts/product_title_text.dart';
import 'package:t_store/commmon/widgets/texts/section_heading.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/helpers/helper_functions.dart';

class TProductAttributes extends StatelessWidget {
  const TProductAttributes({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);

    return Column(
      children: [
        // selected attribute and pricing description
        TRoundedContainer(
          padding: const EdgeInsets.all(TSizes.md),
          backgroundColor: dark ? TColors.darkerGrey : TColors.grey,
          child: Column(
            children: [
              // Title , price and stock status
              Row(
                children: [
                  const TSectionHeading(
                    title: "Variation",
                    showActionButton: false,
                  ),
                  const SizedBox(
                    width: TSizes.spaceBtwItems,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const TProductTitleText(
                            title: "Price : ",
                            smallSize: true,
                          ),
                          // actual price

                          Text(
                            "\$25 ",
                            style: Theme.of(context)
                                .textTheme
                                .titleSmall!
                                .apply(decoration: TextDecoration.lineThrough),
                          ),

                          // sale price
                          const TProductPriceText(
                            price: "20",
                          ),
                        ],
                      ),

                      // Stock
                      Row(
                        children: [
                          const TProductTitleText(
                            title: "Stock : ",
                            smallSize: true,
                          ),
                          Text("In stock",
                              style: Theme.of(context).textTheme.titleMedium!),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              // variration Description
              const TProductTitleText(
                title:
                    "This is the description of product and it can be max of 4 lines",
                smallSize: true,
                maxLines: 4,
              ),
            ],
          ),
        ),
        const SizedBox(
          height: TSizes.spaceBtwItems,
        ),

        // Attributes
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const TSectionHeading(
              title: "Colors",
            ),
            const SizedBox(
              height: TSizes.spaceBtwItems / 2,
            ),
            Wrap(
              spacing: 8,
              children: [
                TChoiceChips(
                  text: 'Green',
                  selected: true,
                  onSelected: (value) {},
                ),
                TChoiceChips(
                  text: 'Red',
                  selected: false,
                  onSelected: (value) {},
                ),
                TChoiceChips(
                  text: 'Blue',
                  selected: false,
                  onSelected: (value) {},
                ),
              ],
            ),
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const TSectionHeading(
              title: "Sizes",
            ),
            const SizedBox(
              height: TSizes.spaceBtwItems / 2,
            ),
            Wrap(
              spacing: 8,
              children: [
                TChoiceChips(
                  text: 'EU 32',
                  selected: true,
                  onSelected: (value) {},
                ),
                TChoiceChips(
                  text: 'EU 34',
                  selected: false,
                  onSelected: (value) {},
                ),
                TChoiceChips(
                  text: 'EU 36',
                  selected: false,
                  onSelected: (value) {},
                ),
                TChoiceChips(
                  text: 'EU 38',
                  selected: false,
                  onSelected: (value) {},
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
