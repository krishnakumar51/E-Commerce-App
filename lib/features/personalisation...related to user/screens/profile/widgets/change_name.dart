import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/commmon/widgets/appbar/appbar.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/constants/text_strings.dart';
import 'package:t_store/utils/validators/validation.dart';

class ChangeNameScreen extends StatelessWidget {
  const ChangeNameScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // final controller =
    return Scaffold(
        appBar: TAppBar(
          showBackArrow: true,
          title: Text(
            "Change Name",
            style: Theme.of(context).textTheme.headlineSmall,
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // headings
              Text(
                "Use real name for easy verification. This name will appear in many pages.",
                style: Theme.of(context).textTheme.labelMedium,
              ),

              const SizedBox(
                height: TSizes.spaceBtwSections,
              ),

              // text feild and bvuttons
              Form(
                // key: ,
                child: Column(
                  children: [
                    TextFormField(
                      // controller: ,
                      validator: (value) =>
                          TValidator.validateEmptyText("First Name", value),
                      expands: false,
                      decoration: const InputDecoration(
                          labelText: TTexts.firstName,
                          prefixIcon: Icon(Iconsax.user)),
                    ),
                    const SizedBox(
                      height: TSizes.spaceBtwInputFields,
                    ),
                    TextFormField(
                      // controller: ,
                      validator: (value) =>
                          TValidator.validateEmptyText("Last Name", value),
                      expands: false,
                      decoration: const InputDecoration(
                          labelText: TTexts.lastName,
                          prefixIcon: Icon(Iconsax.user)),
                    ),
                  ],
                ),
              ),

              const SizedBox(
                height: TSizes.spaceBtwSections,
              ),

              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {},
                  child: const Text("Save"),
                ),
              )
            ],
          ),
        ));
  }
}
