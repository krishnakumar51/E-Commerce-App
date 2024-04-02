import 'package:flutter/material.dart';
import 'package:t_store/commmon/widgets/appbar/appbar.dart';
import 'package:t_store/features/shop/screens/product_reviews/widgets/overall_rating.dart';
import 'package:t_store/features/shop/screens/product_reviews/widgets/user_review_card.dart';
import 'package:t_store/utils/constants/sizes.dart';

class ProductReviewsScreen extends StatelessWidget {
  const ProductReviewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: TAppBar(
        title: Text("Reviews and Ratings"),
        showBackArrow: true,
      ),

      // body
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              Text(
                  "Ratings and reviews are been verified by the people who purchased and used this product."),
              SizedBox(
                height: TSizes.spaceBtwSections,
              ),

              // overall product ratings
              TOverallProductRating(),
              SizedBox(
                height: TSizes.spaceBtwSections,
              ),

              // user review list
              TUserReviewCard(),
              TUserReviewCard(),
              TUserReviewCard(),
            ],
          ),
        ),
      ),
    );
  }
}
