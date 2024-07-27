
class ShelfResult {
  String? date;
  String? shelf;
  String? resultImage;

  ShelfResult({this.date, this.shelf, this.resultImage, });

  factory ShelfResult.fromJson(Map<String, dynamic> json) => ShelfResult(
        date: json['date'] as String?,
        shelf: json['shelf'] as String?,
        resultImage: json['result_image'] as String?,
     
      );


}
