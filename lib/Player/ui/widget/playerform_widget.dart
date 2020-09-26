import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:santaclara/util/settings/data_constants.dart';

class PlayerFormWidget extends StatefulWidget {
  var isLoading = false;
  //Esta variable es para tener el context y poder invocar elementos
  final scaffolKey;
  final formKey = GlobalKey<FormState>();

  bool isAutoValidate = false;

  int bookingId, id, countryId, playerId, indexId;

  String fullName, email;
  PlayerFormWidget(this.bookingId, this.scaffolKey, this.indexId);

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
