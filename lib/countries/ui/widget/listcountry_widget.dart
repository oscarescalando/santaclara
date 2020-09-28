import 'package:flutter/material.dart';
import 'package:santaclara/countries/providers/countries_provider.dart';

class ListCountries extends StatefulWidget {
  ListCountries({Key key}) : super(key: key);

  @override
  _ListCountriesState createState() => _ListCountriesState();
}

class _ListCountriesState extends State<ListCountries> {
  final _countries = new CountriesProvider();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _countries.cargarData(),
      builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
        if (snapshot.hasData) {
          List<ListItem> _dropdownItems;
          List<DropdownMenuItem<ListItem>> _dropdownMenuItems;
          ListItem _selectedItem;
          print('**********************');
          print(snapshot.data.length);
          for (int i = 1; i <= snapshot.data.length; i++) {
            if (int.parse(snapshot.data[i].id) > 0) {
              _dropdownItems.add(ListItem(
                  int.parse(snapshot.data[i].id), snapshot.data[i].name));
            }
          }

          _dropdownMenuItems = buildDropDownMenuItems(_dropdownItems);
          _selectedItem = _dropdownMenuItems[0].value;

          return Flexible(
            child: DropdownButtonHideUnderline(
              child: DropdownButton(
                  value: _selectedItem,
                  items: _dropdownMenuItems,
                  onChanged: (value) {
                    setState(() {
                      _selectedItem = value;
                    });
                  }),
            ),
          );
        } else {
          return Container(
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
      },
    );
  }

  List<DropdownMenuItem<ListItem>> buildDropDownMenuItems(List listItems) {
    List<DropdownMenuItem<ListItem>> items = List();
    for (ListItem listItem in listItems) {
      items.add(
        DropdownMenuItem(
          child: Text(listItem.name),
          value: listItem,
        ),
      );
    }
    return items;
  }
}

class ListItem {
  int value;
  String name;
  ListItem(this.value, this.name);
}
