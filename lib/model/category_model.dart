// ignore_for_file: public_member_api_docs, sort_constructors_first
class categoryData {
  String? categoryName;
  String? categoryid;
  String? categorydate;

  categoryData({this.categoryName, this.categoryid, this.categorydate});

//
  @override
  factory categoryData.fromJson(Map<String, dynamic> json) => categoryData(
        categoryName: json['name'] as String?,
        categoryid: json['_id'] as String?,
        categorydate: json['createdAt'] as String?,
      );
  tojson() {
    return {"name": categoryName, "id": categoryid, 'createdAt': categorydate};
  }
}
