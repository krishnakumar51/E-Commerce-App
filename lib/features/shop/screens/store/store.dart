import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store/commmon/widgets/appbar/appbar.dart';
import 'package:t_store/commmon/widgets/appbar/tabbar.dart';
import 'package:t_store/commmon/widgets/cutom_shapes/containers/search_container.dart';
import 'package:t_store/commmon/widgets/layouts/grid_layout.dart';
import 'package:t_store/commmon/widgets/products/products_cart/cart_menu_icon.dart';
import 'package:t_store/commmon/widgets/texts/section_heading.dart';
import 'package:t_store/commmon/widgets/brand/store_barnd_card.dart';
import 'package:t_store/features/shop/screens/brands/all_brands.dart';
import 'package:t_store/features/shop/screens/brands/brand_products.dart';
import 'package:t_store/features/shop/screens/store/widgets/store_category_tab.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/helpers/helper_functions.dart';

class StoreScreen extends StatelessWidget {
  const StoreScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);

    return DefaultTabController(
      length: 6,
      child: Scaffold(
        appBar: TAppBar(
          title: Text(
            "Store",
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          actions: [
            TCartCounterIcon(
              iconColor: dark ? TColors.white : TColors.black,
              onPressed: () {},
            ),
          ],
        ),
        body: NestedScrollView(
          headerSliverBuilder: (_, innnerBoxIsScrolled) {
            return [
              SliverAppBar(
                pinned: true,
                floating: true,
                automaticallyImplyLeading: false,
                backgroundColor: dark ? TColors.black : TColors.white,
                expandedHeight: 440,
                flexibleSpace: Padding(
                  padding: const EdgeInsets.all(TSizes.defaultSpace),
                  child: ListView(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    children: [
                      // Search bar
                      const SizedBox(
                        height: TSizes.spaceBtwItems,
                      ),
                      const TSearchContainer(
                        text: "",
                        showBorder: true,
                        showBackground: false,
                        padding: EdgeInsets.zero,
                      ),
                      const SizedBox(
                        height: TSizes.spaceBtwSections,
                      ),

                      // Featured brands
                      TSectionHeading(
                        title: "Featured Brands",
                        onPressed: () => Get.to(() => const AllBrandsScreen()),
                      ),
                      const SizedBox(
                        height: TSizes.spaceBtwItems / 1.5,
                      ),

                      TGridLayout(
                          itemCount: 4,
                          mainAxisExtent: 90,
                          itemBuilder: (_, index) {
                            return TBrandCard(
                              showBorder: true,
                              ontap: () => Get.to(() => const BrandProducts()),
                            );
                          })
                    ],
                  ),
                ),
                bottom: const TTabBar(
                  tabs: [
                    Tab(
                      child: Text("Sports"),
                    ),
                    Tab(
                      child: Text("Furniture"),
                    ),
                    Tab(
                      child: Text("Electornics"),
                    ),
                    Tab(
                      child: Text("Clothes"),
                    ),
                    Tab(
                      child: Text("Cosmetics"),
                    ),
                    Tab(
                      child: Text("Miscellaneous"),
                    ),
                  ],
                ),
              )
            ];
          },
          body: const TabBarView(children: [
            // as many types as there in tab bar
            TCategoryTab(),
            TCategoryTab(),
            TCategoryTab(),
            TCategoryTab(),
            TCategoryTab(),
            TCategoryTab(),
          ]),
        ),
      ),
    );
  }
}
