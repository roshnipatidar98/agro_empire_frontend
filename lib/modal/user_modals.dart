
class User {
   String? parentId;
   String? name;
   String? mobileNo;
   String? userId;
   String? email;
   String? password;

   User(
       {this.parentId,
          this.name,
          this.mobileNo,
          this.userId,
          this.email,
          this.password});

   User.fromJson(Map<String, dynamic> json) {
      parentId = json['_parentId'];
      name = json['_name'];
      mobileNo = json['_mobileNo'];
      userId = json['_userId'];
      email = json['_email'];
      password = json['_password'];
   }

   Map<String, dynamic> toJson() {
      final Map<String, dynamic> data =  Map<String, dynamic>();
      data['_parentId'] = parentId;
      data['_name'] = name;
      data['_mobileNo'] = mobileNo;
      data['_userId'] = userId;
      data['_email'] = email;
      data['_password'] = password;
      return data;
   }
}


