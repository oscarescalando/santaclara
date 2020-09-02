import 'package:flutter/material.dart';
import 'package:santaclara/onboarding/providers/slider_provider.dart';
import 'package:santaclara/util/settings/data_constants.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentIndex = 0;
  PageController pageController = new PageController(initialPage: 0);

  Widget pageIndexIndicator(bool isCurrentPAge) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 2.0),
      height: isCurrentPAge ? 10.0 : 6.0,
      width: isCurrentPAge ? 10.0 : 6.0,
      decoration: BoxDecoration(
        color: isCurrentPAge ? Colors.grey : Colors.green[300],
        borderRadius: BorderRadius.circular(12),
      ),
    );
  }

  @override
  void initState() {
    //TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Santa Clara 1'),
        ),
        backgroundColor: grisFondo,
        body: PageView.builder(
          controller: pageController,
          itemCount: countSilder,
          onPageChanged: (val) {
            setState(() {
              currentIndex = val;
            });
          },
        ));
  }

  Widget _lista() {
    return FutureBuilder(
      future: sliderProvider.cargarData(),
      //initialData: [],
      builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
        return ListView(
          children: _listaItems(snapshot.data, context),
        );
      },
    );
  }

  List<Widget> _listaItems(List<dynamic> data, BuildContext context) {
    final List<Widget> opciones = [];

    data.forEach((opt) {
      //   final widgetTemp = ListTile(
      //     title: Text(opt['texto']),
      //     leading: getIcon(opt['icon']),
      //     trailing: Icon(Icons.keyboard_arrow_right, color: Colors.blue),
      //     onTap: () {
      //       Navigator.pushNamed(context, opt['ruta']);
      //     },
      //   );

      //   opciones..add(widgetTemp)..add(Divider());
    });
    // return opciones;
  }
}
