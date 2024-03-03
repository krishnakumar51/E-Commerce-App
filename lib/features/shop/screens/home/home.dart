import 'package:flutter/material.dart';
import 'package:t_store/commmon/widgets/appbar/appbar.dart';
import 'package:t_store/commmon/widgets/cutom_shapes/curved_edges/primary_header_container.dart';
import 'package:t_store/commmon/widgets/products_cart/cart_menu_icon.dart';
import 'package:t_store/features/shop/screens/home/widgets/home_app_bar.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/constants/text_strings.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            TPrimaryHeaderContainer(
              child: Column(
                children: [
                  THomeAppBar(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
