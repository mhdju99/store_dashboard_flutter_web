class RepoInfo {
  final String id;
  final int lastAddQuantity;
  final int salesQuantity;
  final List<dynamic> invoice;
  final String productId;
  final int totalQuantity;
  final int currantQuantity;
  final int productInBox;
  final int numberOfBox;
  final String createdAts;
  final String updatedAt;
  final int? price;

  final int v;

  RepoInfo({
    required this.id,
    required this.price,
    required this.lastAddQuantity,
    required this.salesQuantity,
    required this.invoice,
    required this.productId,
    required this.totalQuantity,
    required this.currantQuantity,
    required this.productInBox,
    required this.numberOfBox,
    required this.createdAts,
    required this.updatedAt,
    required this.v,
  });

  factory RepoInfo.fromJson(Map<String, dynamic> json) {
    return RepoInfo(
        id: json['_id'],
        lastAddQuantity: json['lastAddQuantity'],
        salesQuantity: json['salesQuantity'],
        invoice: List<dynamic>.from(json['invoice']),
        productId: json['productId'],
        totalQuantity: json['totalQuantity'],
        currantQuantity: json['currantQuantity'],
        productInBox: json['productInBox'],
        numberOfBox: json['numberOfBox'],
        createdAts: json['createdAt'],
        updatedAt: json['updatedAt'],
        price: json['price'],
        v: json['__v']);
  }
}
