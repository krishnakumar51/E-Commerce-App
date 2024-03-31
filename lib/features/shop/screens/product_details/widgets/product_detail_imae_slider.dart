import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/commmon/widgets/appbar/appbar.dart';
import 'package:t_store/commmon/widgets/cutom_shapes/curved_edges/curved_edges_widget.dart';
import 'package:t_store/commmon/widgets/icons/circular_icon.dart';
import 'package:t_store/commmon/widgets/images/rounded_images.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/constants/image_strings.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/helpers/helper_functions.dart';

class TProductImageSlider extends StatelessWidget {
  const TProductImageSlider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);

    return TCustomEdgeWidget(
      child: Container(
        color: dark ? TColors.darkerGrey : TColors.light,
        child: Stack(children: [
          const SizedBox(
            height: 400,
            child: Padding(
              padding: EdgeInsets.all(TSizes.productImageRadius * 2),
              child: Center(
                  child: Image(image: AssetImage(TImages.productImage5))),
            ),
          ),

          Positioned(
            right: 0,
            bottom: 25,
            left: TSizes.defaultSpace,
            child: SizedBox(
              height: 80,
              child: ListView.separated(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  physics: const AlwaysScrollableScrollPhysics(),
                  separatorBuilder: (_, __) => const SizedBox(
                        width: TSizes.spaceBtwItems,
                      ),
                  itemCount: 6,
                  itemBuilder: (_, index) => TRoundedImage(
                      width: 80,
                      backgroundColor: dark ? TColors.dark : TColors.white,
                      border: Border.all(color: TColors.primary),
                      padding: const EdgeInsets.all(TSizes.sm),
                      imgUrl: TImages.productImage3)),
            ),
          ),
          // app bar icnos
          const TAppBar(
            showBackArrow: true,
            actions: [
              TCircularIcon(
                icon: Iconsax.heart5,
                color: Colors.red,
              )
            ],
          ),
        ]),
      ),
    );
  }
}
