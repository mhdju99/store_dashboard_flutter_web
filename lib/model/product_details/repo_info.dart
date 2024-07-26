import 'invoice.dart';
import 'supplier.dart';

class RepoInfo1 {
  String? id;
  int? lastAddQuantity;
  int? salesQuantity;
  // List<Invoice1>? invoice;
  String? productId;
  int? totalQuantity;
  int? currantQuantity;
  int? productInBox;
  int? numberOfBox;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;
  int? price;
  Supplier1? supplier;

  RepoInfo1({
    this.id,
    this.lastAddQuantity,
    this.salesQuantity,
    // this.invoice,
    this.productId,
    this.totalQuantity,
    this.currantQuantity,
    this.productInBox,
    this.numberOfBox,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.price,
    this.supplier,
  });

  factory RepoInfo1.fromJson(Map<String, dynamic> json) => RepoInfo1(
        id: json['_id'] as String?,
        lastAddQuantity: json['lastAddQuantity'] as int?,
        salesQuantity: json['salesQuantity'] as int?,
        // invoice: (json['invoice'] as List<dynamic>?)
            // ?.map((e) => Invoice.fromJson(e as Map<String, dynamic>))
            // .toList(),
        productId: json['productId'] as String?,
        totalQuantity: json['totalQuantity'] as int?,
        currantQuantity: json['currantQuantity'] as int?,
        productInBox: json['productInBox'] as int?,
        numberOfBox: json['numberOfBox'] as int?,
        createdAt: json['createdAt'] == null
            ? null
            : DateTime.parse(json['createdAt'] as String),
        updatedAt: json['updatedAt'] == null
            ? null
            : DateTime.parse(json['updatedAt'] as String),
        v: json['__v'] as int?,
        price: json['price'] as int?,
        supplier: json['supplier'] == null
            ? null
            : Supplier1.fromJson(json['supplier'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        '_id': id,
        'lastAddQuantity': lastAddQuantity,
        'salesQuantity': salesQuantity,
        'productId': productId,
        'totalQuantity': totalQuantity,
        'currantQuantity': currantQuantity,
        'productInBox': productInBox,
        'numberOfBox': numberOfBox,
        'createdAt': createdAt?.toIso8601String(),
        'updatedAt': updatedAt?.toIso8601String(),
        '__v': v,
        'price': price,
        'supplier': supplier?.toJson(),
        'id': id,
      };
}
