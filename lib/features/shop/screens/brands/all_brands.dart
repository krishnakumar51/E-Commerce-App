import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store/commmon/widgets/appbar/appbar.dart';
import 'package:t_store/commmon/widgets/brand/store_barnd_card.dart';
import 'package:t_store/commmon/widgets/layouts/grid_layout.dart';
import 'package:t_store/commmon/widgets/texts/section_heading.dart';
import 'package:t_store/features/shop/screens/brands/brand_products.dart';
import 'package:t_store/utils/constants/sizes.dart';

class AllBrandsScreen extends StatelessWidget {
  const AllBrandsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const TAppBar(
          title: Text("Brand"),
          showBackArrow: true,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(TSizes.defaultSpace),
            child: Column(
              children: [
                const TSectionHeading(
                  title: "Brands",
                  showActionButton: false,
                ),
                const SizedBox(
                  height: TSizes.spaceBtwItems,
                ),
                TGridLayout(
                    itemCount: 10,
                    mainAxisExtent: 80,
                    itemBuilder: (context, index) => TBrandCard(
                          showBorder: true,
                          ontap: () => Get.to(() => const BrandProducts()),
                        ))
              ],
            ),
          ),
        ));
  }
}
