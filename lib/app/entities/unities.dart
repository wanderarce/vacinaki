class Unities {
  int? id;
  String? name;
  String? address;
  double? latitude;
  double? longitude;
  String? phone;

  Unities(
      {this.id,
      this.name,
      this.address,
      this.latitude,
      this.longitude,
      this.phone});

  Unities.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    address = json['address'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    phone = json['phone'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['address'] = address;
    data['latitude'] = latitude;
    data['longitude'] = longitude;
    data['phone'] = phone;
    return data;
  }
}
