import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/commmon/widgets/appbar/appbar.dart';
import 'package:t_store/commmon/widgets/cutom_shapes/containers/primary_header_container.dart';
import 'package:t_store/commmon/widgets/list_tiles/settings_menu_tile.dart';
import 'package:t_store/commmon/widgets/list_tiles/user_profile_tile.dart';
import 'package:t_store/commmon/widgets/texts/section_heading.dart';
import 'package:t_store/features/personalisation...related%20to%20user/screens/addresses/address.dart';
import 'package:t_store/features/personalisation...related%20to%20user/screens/profile/profile.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/constants/sizes.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            // header
            TPrimaryHeaderContainer(
              child: Column(
                children: [
                  // App bar
                  TAppBar(
                    title: Text(
                      "Account",
                      style: Theme.of(context)
                          .textTheme
                          .headlineMedium!
                          .apply(color: TColors.white),
                    ),
                  ),
                  const SizedBox(
                    height: TSizes.spaceBtwSections,
                  ),

                  // user profile card
                  TUserProfileTile(
                    onPressed: () => Get.to(() => const ProfileScreen()),
                  ),
                  const SizedBox(
                    height: TSizes.spaceBtwSections,
                  ),
                ],
              ),
            ),

            // body

            Padding(
              padding: const EdgeInsets.all(TSizes.defaultSpace),
              child: Column(
                children: [
                  // account settings
                  const TSectionHeading(
                    title: "Account Settings",
                    showActionButton: false,
                  ),
                  const SizedBox(
                    height: TSizes.spaceBtwItems,
                  ),

                  TSettingsMenuTile(
                    icon: Iconsax.safe_home,
                    title: "My Address",
                    subtitle: "Set shoping delivery address",
                    onTap: () => Get.to(() => const UserAddressScreen()),
                  ),
                  TSettingsMenuTile(
                    icon: Iconsax.shopping_cart,
                    title: "My Cart",
                    subtitle: "Add, remove products and move to checkout",
                    onTap: () {},
                  ),
                  TSettingsMenuTile(
                    icon: Iconsax.bag_tick,
                    title: "My Orders",
                    subtitle: "In-progress and Completed Orders",
                    onTap: () {},
                  ),
                  TSettingsMenuTile(
                    icon: Iconsax.bank,
                    title: "Bank Account",
                    subtitle: "Withdraw balance to registered bank account",
                    onTap: () {},
                  ),
                  TSettingsMenuTile(
                    icon: Iconsax.discount_shape,
                    title: "My Coupons",
                    subtitle: "List of all the Discounted Coupons",
                    onTap: () {},
                  ),
                  TSettingsMenuTile(
                    icon: Iconsax.notification,
                    title: "Notifications",
                    subtitle: "Set any kind of notification message",
                    onTap: () {},
                  ),
                  TSettingsMenuTile(
                    icon: Iconsax.notification,
                    title: "Account privacy",
                    subtitle: "Manage data usage and connected accounts",
                    onTap: () {},
                  ),

                  // app settings
                  const SizedBox(
                    height: TSizes.spaceBtwSections,
                  ),
                  const TSectionHeading(
                    title: "App Settings",
                    showActionButton: false,
                  ),
                  const SizedBox(
                    height: TSizes.spaceBtwItems,
                  ),

                  TSettingsMenuTile(
                    icon: Iconsax.document_upload,
                    title: "Load Data",
                    subtitle: "Upload data to your cloud Firebase",
                    onTap: () {},
                  ),
                  TSettingsMenuTile(
                    icon: Iconsax.location,
                    title: "Geo-location",
                    subtitle: "Set recommendation based on location",
                    trailing: Switch(value: true, onChanged: (value) {}),
                  ),
                  TSettingsMenuTile(
                    icon: Iconsax.security_user,
                    title: "Safe mode",
                    subtitle: "Search result is safe for all ages",
                    trailing: Switch(value: false, onChanged: (value) {}),
                  ),
                  TSettingsMenuTile(
                    icon: Iconsax.image,
                    title: "HD Image Quality",
                    subtitle: "Set iamge quality to be seen",
                    trailing: Switch(value: false, onChanged: (value) {}),
                  ),

                  // log out button
                  const SizedBox(
                    height: TSizes.spaceBtwSections,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: OutlinedButton(
                      onPressed: () {},
                      child: const Text("Logout"),
                    ),
                  ),
                  const SizedBox(
                    height: TSizes.spaceBtwItems * 2.5,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
