import 'package:cloud_firestore/cloud_firestore.dart';

class CategoryModel {
  String id;
  String name;
  String image;
  String parentId;
  bool isFeatured;

  CategoryModel(
      {required this.id,
      required this.name,
      required this.image,
      this.parentId = "",
      required this.isFeatured});

  // empty helper function
  static CategoryModel empty() =>
      CategoryModel(id: "", name: "", image: "", isFeatured: false);

  // convert model to json structure , so that you can store data in fitrebase
  Map<String, dynamic> toJson() {
    return {
      "Name": name,
      "Image": image,
      "ParentId": parentId,
      "isFeatured": isFeatured,
    }; //isFeatured
  }

  // map json oriented document snapshot from firebase to usermodel

  factory CategoryModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    if (document.data() != null) {
      final data = document.data()!;
      // map json record to model
      return CategoryModel(
        id: document.id,
        name: data["Name"] ?? "",
        image: data['Image'] ?? "",
        parentId: data['ParentId'] ?? "",
        isFeatured: data['isFeatured'] ?? false,
      );
    } else {
      return CategoryModel.empty();
    }
  }
}
