class LoginResponsModel {
  String? token;


  LoginResponsModel({this.token});

  factory LoginResponsModel.fromJson(Map<String, dynamic> json) => LoginResponsModel(
        token: json['token'] as String?,
        
      );
}
