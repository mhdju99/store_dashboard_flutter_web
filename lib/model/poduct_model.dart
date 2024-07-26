import 'package:store_dashbord/constants/end_points.dart';
import 'package:store_dashbord/model/repo_mode.dart';

class ProductData {
  final String id;
  final String title;
  final String slug;
  final String description;
  final List<String>? colors;
  final List<String> images;
  final String imageCovered;
  final Category category;
  final List<dynamic>? subCategory;
  final String? brand;
  final int? ratingsAverage;
  final int? ratingsQuantity;
  final int v;
  final RepoInfo repoInfo;

  ProductData({
    required this.id,
    required this.title,
    required this.slug,
    required this.description,
    required this.colors,
    required this.images,
    required this.imageCovered,
    required this.category,
    required this.subCategory,
    required this.brand,
    required this.ratingsAverage,
    required this.ratingsQuantity,
    required this.v,
    required this.repoInfo,
  });

  factory ProductData.fromJson(Map<String, dynamic> json) {
    return ProductData(
      id: json['_id'],
      title: json['title'],
      slug: json['slug'],
      description: json['description'],
      colors: List<String>.from(json['colors']),
      images: List<String>.from(json['images']),
      imageCovered: json['imageCovered'].replaceAll("localhost", EndPoints.ip),
      category: Category.fromJson(json['category']),
      subCategory: List<dynamic>.from(json['subCategory']),
      brand: json['brand'],
      ratingsAverage: json['ratingsAverage'],
      ratingsQuantity: json['ratingsQuantity'],
      v: json['__v'],
      repoInfo: RepoInfo.fromJson(json['repoInfo']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'title': title,
      'slug': slug,
      'description': description,
      'colors': colors,
      'images': images,
      'imageCovered': imageCovered,
      'category': category.toJson(),
      'subCategory': subCategory,
      'brand': brand,
      'ratingsAverage': ratingsAverage,
      'ratingsQuantity': ratingsQuantity,
      '__v': v,
      // 'repoInfo': repoInfo.toJson(),
    };
  }

  ProductData copyWith({
    String? id,
    String? title,
    String? slug,
    String? description,
    List<String>? colors,
    List<String>? images,
    String? imageCovered,
    Category? category,
    List<dynamic>? subCategory,
    String? brand,
    int? ratingsAverage,
    int? ratingsQuantity,
    int? v,
    RepoInfo? repoInfo,
  }) {
    return ProductData(
      id: id ?? this.id,
      title: title ?? this.title,
      slug: slug ?? this.slug,
      description: description ?? this.description,
      colors: colors ?? this.colors,
      images: images ?? this.images,
      imageCovered: imageCovered ?? this.imageCovered,
      category: category ?? this.category,
      subCategory: subCategory ?? this.subCategory,
      brand: brand ?? this.brand,
      ratingsAverage: ratingsAverage ?? this.ratingsAverage,
      ratingsQuantity: ratingsQuantity ?? this.ratingsQuantity,
      v: v ?? this.v,
      repoInfo: repoInfo ?? this.repoInfo,
    );
  }
}

class Category {
  final String id;
  final String name;

  Category({
    required this.id,
    required this.name,
  });

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      id: json['_id'],
      name: json['name'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'name': name,
    };
  }
}
