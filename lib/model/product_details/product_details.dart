import 'brand.dart';
import 'repo_info.dart';

class ProductDetails {
  String? id;
  String? title;
  Brand1? brand;

  RepoInfo1? repoInfo;

  ProductDetails({
    this.title,
    this.id,
    this.brand,
    this.repoInfo,
  });

  factory ProductDetails.fromJson(Map<String, dynamic> json) {
    return ProductDetails(
      id: json['_id'] as String?,
      title: json['title'] as String?,
      brand: json['brand'] == null
          ? null
          : Brand1.fromJson(json['brand'] as Map<String, dynamic>),
      
      repoInfo: json['repoInfo'] == null
          ? null
          : RepoInfo1.fromJson(json['repoInfo'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() => {
        '_id': id,
        'title': title,
        'brand': brand?.toJson(),
        'repoInfo': repoInfo?.toJson(),
        'id': id,
      };
}
