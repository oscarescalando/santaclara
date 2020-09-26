class Players {
  List<Player> items = new List();

  Players();

  Players.fronJsonList(List<dynamic> jsonList) {
    if (jsonList == null) return;
    for (var item in jsonList) {
      final player = new Player.fromJsonMap(item);
      items.add(player);
    }
  }
}

class Player {
  Player({
    this.id,
    this.fullName,
    this.email,
    this.countryId,
    this.bookingId,
  });

  int id;
  String fullName;
  String email;
  int countryId;
  int bookingId;

  Player.fromJsonMap(Map<String, dynamic> json) {
    id = json["id"];
    fullName = json["full_name"];
    email = json["email"];
    countryId = json["country_id"];
    bookingId = json["booking_id"];
  }
}
