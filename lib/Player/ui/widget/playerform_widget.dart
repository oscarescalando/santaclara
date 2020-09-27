import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:santaclara/Player/model/playes_model.dart';

import 'package:santaclara/util/settings/data_constants.dart';
import 'package:santaclara/Player/provider/players_provider.dart';

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
  final _playersProvider = new PlayersProvider();

  String _fullName, _email;

  @override
  void initState() {
    super.initState();

    if(widget.fullName!=null) {
      _nameController.text = widget.fullName;
    }

    if(widget.email!=null){
      _emailController.text = widget.email;
    }
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
        children: <Widget>[
          Container(
              padding: const EdgeInsets.only(left:15.0,right: 10.0),
              child:
              Form(
                //guardamos el key del form para poder llamar el form
                  key: formKey,
                  autovalidate: isAutoValidate,

                  child: Column(
                    children: <Widget>[
                      //if(isEditing==true)

                      TextFormField(
                        controller: _nameController,
                        decoration: const InputDecoration(labelText: 'Name', labelStyle: TextStyle(
                            fontSize: fontB2,
                            fontWeight: FontWeight.w300 //Titulo en negritas
                        ), ),
                        keyboardType: TextInputType.text,
                        validator: (value){
                          if(value.isEmpty) {
                            return 'Please enter some text';
                          }
                          return null;
                        },
                        onSaved: (value) => _fullName = value,
                      ),
                      TextFormField(
                        controller: _emailController,
                        decoration: const InputDecoration(labelText: 'Email', labelStyle: TextStyle(
                            fontSize: fontB2,
                            fontWeight: FontWeight.w300 //Titulo en negritas
                        ),),
                        keyboardType: TextInputType.emailAddress,
                        validator: (value){
                          Pattern pattern =   r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                          RegExp regex = new RegExp(pattern);
                          if(!regex.hasMatch(value)) return 'Not Valid Email';
                          else
                            return null;
                        },
                        onSaved: (value) => _email = value,

                      ),
                      SizedBox(height: 15.0,),

                      Align(
                          alignment: Alignment.centerRight,
                          child:  RaisedButton(
                              child: Text('Send'),
                              onPressed: () async {
                                if (formKey.currentState.validate()){
                                  formKey.currentState.save();
                                  setState(() {
                                    isLoading = true;
                                  });

                                  bool result=false;
                                  int _id;

                                  print(widget.isEdit);

                                  bool _edit = false;

                                  if (widget.isEdit != null) {
                                    _edit = widget.isEdit;
                                  }

                                  if(_edit) {
                                    mostrarSnackBar('edit');
                                    print('Edit');
                                    _id = widget.id;

                                    final player = Player(
                                      id: _id,
                                      fullName: _nameController.text,
                                      email: _emailController.text,
                                      countryId: 63,
                                      bookingId: widget.bookingId,
                                    );

                                    //result = await _playersProvider.getEditPlayer(player);
                                    setState(() {
                                      isLoading = false;
                                    });
                                  } else {
                                    print('New');
                                    mostrarSnackBar('new');
                                    _id = 0;

                                    final player = Player(
                                      id: _id,
                                      fullName: _nameController.text,
                                      email: _emailController.text,
                                      countryId: 63,
                                      bookingId: widget.bookingId,
                                    );

                                    result = await _playersProvider.getNewPlayer(player);
                                    setState(() {
                                      isLoading = false;
                                    });
                                    if(result) {
                                      mostrarSnackBar('ok');
                                    } else {
                                      //mostrarSnackBar('error');
                                    }
                                  }

                                  //print(_id);



                                }
                              }

                          )
                      ),
                      /*
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          if(widget.isEdit==true)
                              IconButton(
                                icon: Icon(Icons.delete),
                                color: Colors.grey,
                                tooltip: 'Delete',
                                iconSize: 20,
                                onPressed: () {
                                  //deletePlayer();
                                },
                              ),
                          Align(
                              alignment: Alignment.centerRight,
                              child:  RaisedButton(
                                  child: Text('Send'),
                                  onPressed: () async {
                                    if (formKey.currentState.validate()){ }
                                  }


                              )
                          ),
                        ],
                      ),*/


                    ],
                  )

              )
          )
        ]
    );
  }

  void validateImputs(){
    if (formKey.currentState.validate()){
      formKey.currentState.save();
      if(widget.isEdit) {
        mostrarSnackBar('Editing');
      } else {
        mostrarSnackBar('Create');
      }
    } else {
      print('error');
    }
  }

  void mostrarSnackBar(String op){
    String _info = 'New player';
    if(op=='edit'){
      _info = 'Update player ';
    } else {
      if(op=='ok') {
        _info = 'Successfully registered';
      }
    }
    final snackbar = SnackBar(
      content: Text("$_info: $_email , $_fullName "),
    );

    widget.scaffolKey.currentState.showSnackBar(snackbar);
  }

}
