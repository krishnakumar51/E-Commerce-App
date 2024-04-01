import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/commmon/widgets/appbar/appbar.dart';
import 'package:t_store/features/shop/screens/product_reviews/widgets/overall_rating.dart';
import 'package:t_store/features/shop/screens/product_reviews/widgets/rating_progress_indicator.dart';
import 'package:t_store/features/shop/screens/product_reviews/widgets/user_review_card.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/device/device_utilities.dart';

class ProductReviewsScreen extends StatelessWidget {
  const ProductReviewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: const TAppBar(
        title: Text("Reviews and Ratings"),
        showBackArrow: true,
      ),

      // body
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              const Text(
                  "Ratings and reviews are been verified by the people who purchased and used this product."),
              const SizedBox(
                height: TSizes.spaceBtwSections,
              ),

              // overall product ratings
              const TOverallProductRating(),
              const SizedBox(
                height: TSizes.spaceBtwSections,
              ),

              // user review list
              const TUserReviewCard(),
              const TUserReviewCard(),
              const TUserReviewCard(),
            ],
          ),
        ),
      ),
    );
  }
}
