
class BaseModel {

  String code = "";

  BaseModel.fromJson(Map<String, dynamic> content) {

    code = content["code"] as String ?? "";
  }
}