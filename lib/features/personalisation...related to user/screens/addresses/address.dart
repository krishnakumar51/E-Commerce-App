import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/commmon/widgets/appbar/appbar.dart';
import 'package:t_store/features/personalisation...related%20to%20user/screens/addresses/add_new_address.dart';
import 'package:t_store/features/personalisation...related%20to%20user/screens/addresses/widgets/single_user_address.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/constants/sizes.dart';

class UserAddressScreen extends StatelessWidget {
  const UserAddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: TColors.primary,
        onPressed: () => Get.to(() => const AddNewAddressScreen()),
        child: const Icon(
          Iconsax.add,
          color: TColors.white,
        ),
      ),
      appBar: const TAppBar(
        showBackArrow: true,
        title: Text(
          "Addresses",
        ),
      ),
      body: const SingleChildScrollView(
        padding: EdgeInsets.all(TSizes.defaultSpace),
        child: Column(
          children: [
            TSingleUserAddress(selected: true),
            TSingleUserAddress(selected: false),
            TSingleUserAddress(selected: false),
          ],
        ),
      ),
    );
  }
}
