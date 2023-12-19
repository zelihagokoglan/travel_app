// class Users {
//   String id;
//   final String fullName;
//   final String userName;
//   final String email;
//   final String password;

//   Users(
//       {required this.fullName,
//       required this.userName,
//       required this.email,
//       required this.password,
//       this.id = ""});
// //-------------------------------------
//   Map<String, dynamic> toJson() {
//     return {
//       "id": id,
//       "fullName": fullName,
//       "userNamw": userName,
//       "email": email,
//       "password": password,
//     };
//   }
//   //-------------------------------------

//   factory Users.fromJson(Map<String, dynamic> json) {
//     return Users(
//       id: json["id"],
//       fullName: json["fullName"],
//       userName: json["userName"],
//       email: json["email"],
//       password: json["password"],
//     );
//   }
// }
