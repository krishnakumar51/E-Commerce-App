import 'package:flutter/material.dart';
import 'package:t_store/commmon/widgets/image_text_widgets/vertical_image_text.dart';
import 'package:t_store/utils/constants/image_strings.dart';

class THomeCategories extends StatelessWidget {
  const THomeCategories({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: 8,
        scrollDirection: Axis.horizontal,
        itemBuilder: (_, index) {
          return const TVerticalImageText(
            image: TImages.shoeIcon,
            title: 'Shoes',
          );
        },
      ),
    );
  }
}
