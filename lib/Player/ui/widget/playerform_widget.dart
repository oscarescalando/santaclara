import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:santaclara/Player/model/playe_data.dart';
import 'package:santaclara/util/settings/data_constants.dart';

class PlayerFormWidget extends StatefulWidget {
  var isLoading = false;
  //Esta variable es para tener el context y poder invocar elementos
  final scaffolKey;
  final formKey = GlobalKey<FormState>();

  bool isAutoValidate = false;
  bool isEdit = false;
  int bookingId, id, countryId, playerId, indexId;
  String   fullName,  email;

  PlayerFormWidget(this.bookingId, this.scaffolKey, this.indexId, [this.fullName, this.email, this.countryId, this.id, this.isEdit]);

  @override
  _PlayerFormWidgetState createState() => _PlayerFormWidgetState();
}

class _PlayerFormWidgetState extends State<PlayerFormWidget> {
  var isLoading = false;
  //Esta variable es para tener el context y poder invocar elementos
  //final  scaffolKey;
  final formKey = GlobalKey<FormState>();
  bool isAutoValidate = false;
  TextEditingController _nameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();


  @override
  void initState() {
    super.initState();
    //print((widget.player != null) ? widget.player : '***');


  }

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? Center(
          child: CircularProgressIndicator(),
        )
        : ExpansionTile(
            title: Text(
              "Player ${widget.indexId}",
              style: TextStyle(
              fontSize: fontB2,
              fontWeight: FontWeight.bold
            ),
            ),
    );
  }
}
