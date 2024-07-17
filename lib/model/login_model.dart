class LoginModel {
	String? email;
	String? password;

	LoginModel({this.email, this.password});

	factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
				email: json['email'] as String?,
				password: json['password'] as String?,
			);

}
