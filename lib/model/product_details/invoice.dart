class Invoice1 {
  String? id;
  String? productId;
  String? supplierId;
  int? numberOfBox;
  int? productInBox;
  int? quantity;
  int? price;
  int? totalPrice;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;

  Invoice1({
    this.id,
    this.productId,
    this.supplierId,
    this.numberOfBox,
    this.productInBox,
    this.quantity,
    this.price,
    this.totalPrice,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  factory Invoice1.fromJson(Map<String, dynamic> json) => Invoice1(
        id: json['_id'] as String?,
        productId: json['productId'] as String?,
        supplierId: json['supplierId'] as String?,
        numberOfBox: json['numberOfBox'] as int?,
        productInBox: json['productInBox'] as int?,
        quantity: json['quantity'] as int?,
        price: json['price'] as int?,
        totalPrice: json['totalPrice'] as int?,
        createdAt: json['createdAt'] == null
            ? null
            : DateTime.parse(json['createdAt'] as String),
        updatedAt: json['updatedAt'] == null
            ? null
            : DateTime.parse(json['updatedAt'] as String),
        v: json['__v'] as int?,
      );

  Map<String, dynamic> toJson() => {
        '_id': id,
        'productId': productId,
        'supplierId': supplierId,
        'numberOfBox': numberOfBox,
        'productInBox': productInBox,
        'quantity': quantity,
        'price': price,
        'totalPrice': totalPrice,
        'createdAt': createdAt?.toIso8601String(),
        'updatedAt': updatedAt?.toIso8601String(),
        '__v': v,
      };
}
