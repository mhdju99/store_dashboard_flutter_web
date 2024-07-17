// ignore_for_file: public_member_api_docs, sort_constructors_first
class SuplayerData {
  String? suplayerName;
  String? suplayerID;
  String? suplayerCountres;
  String? suplayerEmail;
  String? suplayerDescription;
  String? suplayerPhoneNumber;
  SuplayerData({
    this.suplayerName,
    this.suplayerID,
    this.suplayerCountres,
    this.suplayerEmail,
    this.suplayerDescription,
    this.suplayerPhoneNumber,
  });

//
  @override
  factory SuplayerData.fromJson(Map<String, dynamic> json) => SuplayerData(
        suplayerName: json['name'] as String?,
        suplayerCountres: json['counters'] as String?,
        suplayerEmail: json['email'] as String?,
        suplayerDescription: json['supplierDescription'] as String?,
        suplayerPhoneNumber: json['phone'] as String?,
        suplayerID: json['_id'] as String?,
      );
  tojson() {
    return {
      "name": suplayerName,
      "email": suplayerEmail,
      "phone": suplayerPhoneNumber,
      "counters": suplayerCountres,
      "supplierDescription": suplayerDescription,
    };
  }
}
