import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/commmon/widgets/appbar/appbar.dart';
import 'package:t_store/commmon/widgets/cutom_shapes/containers/circular_container.dart';
import 'package:t_store/commmon/widgets/cutom_shapes/curved_edges/curved_edges_widget.dart';
import 'package:t_store/commmon/widgets/icons/circular_icon.dart';
import 'package:t_store/commmon/widgets/images/rounded_images.dart';
import 'package:t_store/features/shop/screens/product_details/widgets/product_detail_imae_slider.dart';
import 'package:t_store/features/shop/screens/product_details/widgets/product_meta_data.dart';
import 'package:t_store/features/shop/screens/product_details/widgets/rating_and_share.dart';
import 'package:t_store/utils/constants/image_strings.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/helpers/helper_functions.dart';

class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);

    return const Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            // prdocy image slider

            TProductImageSlider(),

            // product details
            Padding(
              padding: EdgeInsets.only(
                  right: TSizes.defaultSpace,
                  left: TSizes.defaultSpace,
                  bottom: TSizes.defaultSpace),
              child: Column(
                children: [
                  // rating and share button
                  TRatingAndShare(),

                  //  Price title , stock and brand

                  TProductMetaData()

                //   Attributtes





                //   Checkout button
                //    description
                //   Reviews
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
