// To parse this JSON data, do
//
//     final player = playerFromJson(jsonString);

import 'dart:convert';

Player playerFromJson(String str) => Player.fromJson(json.decode(str));

String playerToJson(Player data) => json.encode(data.toJson());

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

  factory Player.fromJson(Map<String, dynamic> json) => Player(
        id: json["id"],
        fullName: json["full_name"],
        email: json["email"],
        countryId: json["country_id"],
        bookingId: json["booking_id"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "full_name": fullName,
        "email": email,
        "country_id": countryId,
        "booking_id": bookingId,
      };
}
