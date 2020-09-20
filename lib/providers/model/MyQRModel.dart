class MyQRModel {
  int id;
  String imgqr;
  String booking_id;
  String info_booking;
  int number_booking;
  String datebooking;
  int player;

  MyQRModel({
    this.id,
    this.imgqr,
    this.booking_id,
    this.info_booking,
    this.number_booking,
    this.datebooking,
    this.player,
  });

  factory MyQRModel.fromJson(Map<String, dynamic> json) => MyQRModel(
        id: json["id"],
        imgqr: json["imgqr"],
        info_booking: json["info_booking"],
        booking_id: json["booking_id"],
        number_booking: json["numbre_booking"],
        datebooking: json["datebooking"],
        player: json["player"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "imgqr": imgqr,
        "info_booking": info_booking,
        "booking_id": booking_id,
        "number_booking": number_booking,
        "datebooking": datebooking,
        "player": player,
      };
}
