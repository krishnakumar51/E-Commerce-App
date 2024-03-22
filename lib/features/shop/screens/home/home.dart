import 'package:flutter/material.dart';
import 'package:t_store/commmon/widgets/cutom_shapes/containers/primary_header_container.dart';
import 'package:t_store/commmon/widgets/cutom_shapes/containers/search_container.dart';
import 'package:t_store/commmon/widgets/layouts/grid_layout.dart';
import 'package:t_store/commmon/widgets/products/product_cards/product_card_vertical.dart';
import 'package:t_store/commmon/widgets/texts/section_heading.dart';
import 'package:t_store/features/shop/screens/home/widgets/home_app_bar.dart';
import 'package:t_store/features/shop/screens/home/widgets/home_categories.dart';
import 'package:t_store/features/shop/screens/home/widgets/promo_slider.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/constants/image_strings.dart';
import 'package:t_store/utils/constants/sizes.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Header
            const TPrimaryHeaderContainer(
              child: Column(
                children: [
                  THomeAppBar(),
                  SizedBox(
                    height: TSizes.spaceBtwSections,
                  ),
                  TSearchContainer(
                    text: "Search in Store",
                  ),
                  SizedBox(
                    height: TSizes.spaceBtwSections,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: TSizes.defaultSpace),
                    child: Column(
                      children: [
                        TSectionHeading(
                          title: 'Popular Categories',
                          showActionButton: false,
                          textColor: TColors.white,
                        ),
                        SizedBox(
                          height: TSizes.spaceBtwItems,
                        ),
                        THomeCategories()
                      ],
                    ),
                  ),
                  SizedBox(
                    height: TSizes.spaceBtwSections,
                  ),
                ],
              ),
            ),

            //               Body                  //

            Padding(
                padding: const EdgeInsets.all(TSizes.defaultSpace),
                child: Column(
                  children: [
                    const TPromoSlider(
                      banners: [
                        TImages.banner1,
                        TImages.banner2,
                        TImages.banner3,
                        TImages.banner4,
                        TImages.banner5,
                        TImages.banner6,
                        TImages.banner7
                      ],
                    ),
                    const SizedBox(
                      height: TSizes.spaceBtwSections,
                    ),
                    const TSectionHeading(
                      title: 'Popular Categories',
                      showActionButton: false,
                      textColor: TColors.black,
                    ),
                    const SizedBox(
                      height: TSizes.spaceBtwItems,
                    ),
                    TGridLayout(
                      itemCount: 6,
                      itemBuilder: (_, index) => const TProductCardvertical(),
                    ),
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
