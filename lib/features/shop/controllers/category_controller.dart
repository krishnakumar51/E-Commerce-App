import 'package:get/get.dart';
import 'package:t_store/data/repositories/categories/categories_repository.dart';
import 'package:t_store/features/shop/models/category_model.dart';
import 'package:t_store/utils/popups/loader.dart';

class CategoryController extends GetxController {
  static CategoryController get instace => Get.find();

  // vairables
  final isLoading = false.obs;
  RxList<CategoryModel> allCategories = <CategoryModel>[].obs;
  RxList<CategoryModel> featuredCategories = <CategoryModel>[].obs;
  final _categoryRepository = Get.put(CategoryRepository());

  @override
  void onInit() {
    fetchCategories();
    super.onInit();
  }

  // load category data
  Future<void> fetchCategories() async {
    try {
      // show loader while loading the categories
      isLoading.value = true;

      // fetch categories from datasource(firestore, api, anything)
      final categories = await _categoryRepository.getAllCategories();

      // update the categories list
      allCategories.assignAll(categories);

      // filter featured categories
      featuredCategories.assignAll(allCategories
          .where((category) => category.isFeatured && category.parentId.isEmpty)
          .take(6)
          .toList());
    } catch (e) {
      TLoaders.errorSnackbar(title: "Oh Snap!", message: e.toString());
    } finally {
      // remove loader
      isLoading.value = false;
    }
  }

  // load selected category data

  // get category/sub category products
}
