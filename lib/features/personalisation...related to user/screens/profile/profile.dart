import 'package:flutter/material.dart';
import 'package:t_store/commmon/widgets/appbar/appbar.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TAppBar(
        title: Text("Profile"),
        showBackArrow: true,
      ),

      // body
      body: SingleChildScrollView(),
    );
  }
}
