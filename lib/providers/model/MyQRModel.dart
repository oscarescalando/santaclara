class MyQRModel {
  int id;
  String imgqr;
  String bookingid;
  String infobooking;
  int numberbooking;
  String datebooking;
  int player;

  MyQRModel({
    this.id,
    this.imgqr,
    this.bookingid,
    this.infobooking,
    this.numberbooking,
    this.datebooking,
    this.player,
  });

  factory MyQRModel.fromJson(Map<String, dynamic> json) => MyQRModel(
        id: json["id"],
        imgqr: json["imgqr"],
        infobooking: json["infobooking"],
        bookingid: json["bookingid"],
        numberbooking: json["numbrebooking"],
        datebooking: json["datebooking"],
        player: json["player"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "imgqr": imgqr,
        "infobooking": infobooking,
        "bookingid": bookingid,
        "numberbooking": numberbooking,
        "datebooking": datebooking,
        "player": player,
      };
}
