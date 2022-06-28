/// id : 1
/// label : "load_connect_commission"
/// value : "20"
/// pre : "%"
/// description : "Load's connect commission before paying rider per order"
/// created_at : "2022-05-16T22:57:44.000000Z"
/// updated_at : "2022-05-16T22:57:44.000000Z"

class SystemConfigModel {
  SystemConfigModel({
      this.id, 
      this.label, 
      this.value, 
      this.pre, 
      this.description, 
      this.createdAt, 
      this.updatedAt,});

  SystemConfigModel.fromJson(dynamic json) {
    id = json['id'];
    label = json['label'];
    value = json['value'];
    pre = json['pre'];
    description = json['description'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }
  int? id;
  String? label;
  String? value;
  String? pre;
  String? description;
  String? createdAt;
  String? updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['label'] = label;
    map['value'] = value;
    map['pre'] = pre;
    map['description'] = description;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    return map;
  }

}