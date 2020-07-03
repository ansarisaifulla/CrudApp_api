// To parse this JSON data, do
//     final model = modelFromJson(jsonString);
import 'dart:convert';

List<Model> modelFromJson(String str) => List<Model>.from(json.decode(str).map((x) => Model.fromJson(x)));

String modelToJson(List<Model> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Model {
    Model({
        this.id,
        this.name,
        this.email,
        this.mobile,
        this.password,
    });

    String id;
    String name;
    String email;
    String mobile;
    String password;

    factory Model.fromJson(Map<String, dynamic> json) => Model(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        mobile: json["mobile"],
        password: json["password"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": email,
        "mobile": mobile,
        "password": password,
    };
}
