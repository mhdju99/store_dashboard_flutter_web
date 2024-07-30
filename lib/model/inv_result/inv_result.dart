// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'shelf_result.dart';

class InvResult {
  Map<String, dynamic>? finalInventory;
  double? execution_time;
  String? date;

   List<ShelfResult>? shelfResults;

  InvResult({
    // this.shelfResults
    this.finalInventory,
     this.execution_time,
     this.date,
    this.shelfResults,
  });

  factory InvResult.fromJson(Map<String, dynamic> json) => InvResult(
        finalInventory: json['final_inventory'],
        date: json["date"],
        execution_time: json["execution_time"],
        shelfResults: (json['shelf_results'] as List<dynamic>?)
            ?.map((e) => ShelfResult.fromJson(e as Map<String, dynamic>))
            .toList(),
      );
}
