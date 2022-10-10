class Vaccine {
  int? id;
  String? name;
  String? description;
  int? startYear;
  int? finalYear;

  Vaccine(
      {this.id, this.name, this.startYear, this.finalYear, this.description});

  Vaccine.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    startYear = json['startYear'];
    finalYear = json['finishYear'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['startYear'] = startYear;
    data['finalYear'] = finalYear;
    data['description'] = description;
    return data;
  }
}
