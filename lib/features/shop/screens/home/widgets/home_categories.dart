import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store/commmon/widgets/image_text_widgets/vertical_image_text.dart';
import 'package:t_store/commmon/widgets/shimmers/category_shimmers.dart';
import 'package:t_store/features/shop/controllers/category_controller.dart';
import 'package:t_store/features/shop/screens/sub-category/sub_categories.dart';

class THomeCategories extends StatelessWidget {
  const THomeCategories({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final categoryContorller = Get.put(CategoryController());

    return Obx(() {
      if (categoryContorller.isLoading.value) return const TCategoryShimmers();
      if (categoryContorller.featuredCategories.isEmpty) {
        return Center(
          child: Text(
            "No data found!",
            style: Theme.of(context)
                .textTheme
                .bodyMedium!
                .apply(color: Colors.white),
          ),
        );
      }

      return SizedBox(
        height: 80,
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: categoryContorller.featuredCategories.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (_, index) {
            final category = categoryContorller.featuredCategories[index];
            return TVerticalImageText(
              image: category.image,
              title: category.name,
              onTap: () => Get.to(() => const SubCategoriesScreen()),
            );
          },
        ),
      );
    });
  }
}
