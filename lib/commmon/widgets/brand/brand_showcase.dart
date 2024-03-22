import 'package:flutter/material.dart';
import 'package:t_store/commmon/widgets/brand/store_barnd_card.dart';
import 'package:t_store/commmon/widgets/cutom_shapes/containers/rounded_container.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/helpers/helper_functions.dart';

class TbrandShowcase extends StatelessWidget {
  const TbrandShowcase({
    super.key,
    required this.images,
  });

  final List<String> images;

  @override
  Widget build(BuildContext context) {
    return TRoundedContainer(
      showBorder: true,
      borderColor: TColors.darkGrey,
      backgroundColor: Colors.transparent,
      margin: const EdgeInsets.only(bottom: TSizes.spaceBtwItems),
      padding: const EdgeInsets.all(TSizes.md),
      child: Column(
        children: [
          // brand with product count
          const TBrandCard(
            showBorder: false,
          ),

          const SizedBox(
            height: TSizes.spaceBtwItems,
          ),

          //brand top 3 product images
          Row(
            children: (images
                .map((image) => brandTopProductImage(image, context))
                .toList()),
          )
        ],
      ),
    );
  }

  Widget brandTopProductImage(String image, context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Expanded(
      child: TRoundedContainer(
        height: 100,
        backgroundColor: dark ? TColors.darkerGrey : TColors.light,
        margin: const EdgeInsets.only(right: TSizes.sm),
        padding: const EdgeInsets.all(TSizes.md),
        child: Image(
          image: AssetImage(image),
        ),
      ),
    );
  }
}
