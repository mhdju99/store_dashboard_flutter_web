import 'shelf_result.dart';

class InvResult {
  Map? finalInventory;
  List<ShelfResult>? shelfResults;

  InvResult({this.finalInventory, this.shelfResults});

  factory InvResult.fromJson(Map<String, dynamic> json) => InvResult(
        finalInventory: json['final_inventory'],
         
        shelfResults: (json['shelf_results'] as List<dynamic>?)
            ?.map((e) => ShelfResult.fromJson(e as Map<String, dynamic>))
            .toList(),
      );


}
