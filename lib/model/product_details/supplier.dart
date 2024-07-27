class Supplier1 {
  String? id;
  String? email;

  String? suplayerName;

  Supplier1({
    this.id,
    this.email,
    this.suplayerName,
  });

  factory Supplier1.fromJson(Map<String, dynamic> json) => Supplier1(
        id: json['_id'] as String?,
        email: json['email'] as String?,
        suplayerName: json['name'] as String?,
      );

  Map<String, dynamic> toJson() => {
        '_id': id,
        'email': email,
      };
}
