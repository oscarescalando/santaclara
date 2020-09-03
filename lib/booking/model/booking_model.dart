// To parse this JSON data, do
// https://app.quicktype.io/
// final booking = bookingFromJson(jsonS

import 'dart:convert';

Booking bookingFromJson(String str) => Booking.fromJson(json.decode(str));

String bookingToJson(Booking data) => json.encode(data.toJson());

class Booking {
  Booking({
    this.status,
    this.statusCode,
    this.message,
    this.data,
  });

  String status;
  int statusCode;
  String message;
  List<Datum> data;

  factory Booking.fromJson(Map<String, dynamic> json) => Booking(
        status: json["status"],
        statusCode: json["status_code"],
        message: json["message"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "status_code": statusCode,
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Datum {
  Datum({
    this.id,
    this.number,
    this.bookingAt,
    this.startTime,
    this.starterPoint,
    this.userStatus,
    this.adminStatus,
    this.paid,
    this.urlConfirm,
    this.bookedBy,
    this.playersNumber,
    this.players,
  });

  int id;
  String number;
  DateTime bookingAt;
  String startTime;
  String starterPoint;
  String userStatus;
  String adminStatus;
  int paid;
  String urlConfirm;
  String bookedBy;
  int playersNumber;
  List<Player> players;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        number: json["number"],
        bookingAt: DateTime.parse(json["booking_at"]),
        startTime: json["start_time"],
        starterPoint: json["starter_point"],
        userStatus: json["user_status"],
        adminStatus: json["admin_status"],
        paid: json["paid"],
        urlConfirm: json["url_confirm"],
        bookedBy: json["booked_by"],
        playersNumber: json["players_number"],
        players:
            List<Player>.from(json["players"].map((x) => Player.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "number": number,
        "booking_at":
            "${bookingAt.year.toString().padLeft(4, '0')}-${bookingAt.month.toString().padLeft(2, '0')}-${bookingAt.day.toString().padLeft(2, '0')}",
        "start_time": startTime,
        "starter_point": starterPoint,
        "user_status": userStatus,
        "admin_status": adminStatus,
        "paid": paid,
        "url_confirm": urlConfirm,
        "booked_by": bookedBy,
        "players_number": playersNumber,
        "players": List<dynamic>.from(players.map((x) => x.toJson())),
      };
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
