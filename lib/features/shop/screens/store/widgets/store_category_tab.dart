import 'package:flutter/material.dart';
import 'package:t_store/commmon/widgets/brand/brand_showcase.dart';
import 'package:t_store/commmon/widgets/layouts/grid_layout.dart';
import 'package:t_store/commmon/widgets/products/product_cards/product_card_vertical.dart';
import 'package:t_store/commmon/widgets/texts/section_heading.dart';
import 'package:t_store/features/shop/models/category_model.dart';
import 'package:t_store/utils/constants/image_strings.dart';
import 'package:t_store/utils/constants/sizes.dart';

class TCategoryTab extends StatelessWidget {
  const TCategoryTab({
    super.key,
    required this.category,
  });

  final CategoryModel category;

  @override
  Widget build(BuildContext context) {
    return ListView(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        children: [
          Padding(
            padding: const EdgeInsets.all(TSizes.defaultSpace),
            child: Column(
              // brands
              children: [
                // brands
                const TbrandShowcase(
                  images: [
                    TImages.productImage1,
                    TImages.productImage2,
                    TImages.productImage3
                  ],
                ),
                const TbrandShowcase(
                  images: [
                    TImages.productImage1,
                    TImages.productImage2,
                    TImages.productImage3
                  ],
                ),
                const SizedBox(
                  height: TSizes.spaceBtwItems,
                ),

                // products

                TSectionHeading(
                  title: "You might like",
                  onPressed: () {},
                ),
                const SizedBox(
                  height: TSizes.spaceBtwItems,
                ),

                TGridLayout(
                    itemCount: 6,
                    itemBuilder: (_, index) => const TProductCardvertical()),
                const SizedBox(
                  height: TSizes.spaceBtwItems,
                ),
              ],
            ),
          ),
        ]);
  }
}
