class UserModel{
  bool status;
  UserModel({required this.status});
  factory UserModel.Fromjson(Map<String,dynamic>json){
    return UserModel(status: json['status']);
  }
}