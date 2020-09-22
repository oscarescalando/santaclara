import 'dart:async';

import 'package:santaclara/providers/db_provider.dart';
import 'package:santaclara/providers/model/MyQRModel.dart';

class MyQRBloc {
  static final MyQRBloc _singlenton = new MyQRBloc._internal();

  factory MyQRBloc() {
    return _singlenton;
  }

  MyQRBloc._internal() {
    obtenerMyQR();
  }

  final _myqrController = StreamController<List<MyQRModel>>.broadcast();

  Stream<List<MyQRModel>> get myqrStream => _myqrController.stream;

  dispose() {
    _myqrController?.close();
  }

  agregarQR(MyQRModel myQR) async {
    await DBProvider.db.newBooking(myQR);
    obtenerMyQR();
  }

  obtenerMyQR() async {
    _myqrController.sink.add(await DBProvider.db.getAllMyQR());
  }

  buscarQR(int id) async {
    //_myqrController.stream.first(await DBProvider.db.getMyQRId(id));
  }
}
