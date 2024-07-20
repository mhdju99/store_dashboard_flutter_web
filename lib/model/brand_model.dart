// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:store_dashbord/constants/end_points.dart';

class BarndData {
  String? BrandName;
  String? BrandId;
  String? Image;

  BarndData({
    this.BrandName,
    this.BrandId,
    this.Image,
  });

//
  @override
  factory BarndData.fromJson(Map<String, dynamic> json) => BarndData(
        BrandName: json['name'] as String?,
        BrandId: json['_id'] as String?,
        Image: json['image'].replaceAll("localhost",EndPoints.ip) as String?,
      );
  tojson() {
    return {
      "name": BrandName,
      "id": BrandId,
    };
  }
}
