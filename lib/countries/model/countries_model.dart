class Countries {
  List<Country> items = new List();

  Countries.fronJsonList(List<dynamic> jsonList) {
    if (jsonList == null) return;
    for (var item in jsonList) {
      final country = new Country.fromJsonMap(item);
      items.add(country);
    }
  }
}

class Country {
  Country({
    this.id,
    this.name,
    this.isoCodeCca2,
  });

  String id;
  String name;
  String isoCodeCca2;

  Country.fromJsonMap(Map<String, dynamic> json) {
    id = json["id"];
    name = json["name"];
    isoCodeCca2 = json["iso_code_cca2"];
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "iso_code_cca2": isoCodeCca2,
      };
}
