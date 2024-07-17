// ignore_for_file: public_member_api_docs, sort_constructors_first
class categoryData {
  String? categoryName;
  String? categoryid;
 
  categoryData({
    this.categoryName,
    this.categoryid,
  
  });

//
  @override
  factory categoryData.fromJson(Map<String, dynamic> json) => categoryData(
        categoryName: json['name'] as String?,
        categoryid: json['email'] as String?,
   
      );
  tojson() {
    return {
      "name": categoryName,
      "id": categoryid,
      
    };
  }
}
