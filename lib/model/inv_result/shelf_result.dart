
class ShelfResult {
 Map<String, dynamic>? objects;
  String? shelf;
  String? resultImage;

  ShelfResult({this.objects, this.shelf, this.resultImage, });

  factory ShelfResult.fromJson(Map<String, dynamic> json) => ShelfResult(
        objects: json["objects"],
        shelf: json['shelf'] as String?,
        resultImage: json['result_image'] as String?,
     
      );


}
