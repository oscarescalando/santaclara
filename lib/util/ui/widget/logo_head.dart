import 'package:flutter/material.dart';
import 'package:santaclara/util/settings/data_constants.dart';

class LogoHead extends StatelessWidget {
  String titulo;
  double extra_head;
  LogoHead({this.titulo, this.extra_head});
  @override
  Widget build(BuildContext context) {
    final double shortestSide = MediaQuery.of(context).size.shortestSide;
    final bool useMobileLayout = shortestSide < 600;
    double logo, head;
    logo = 150;
    head = 250;

    if (useMobileLayout) {
      logo = 80;
      head = 210;
    }
    return Stack(
      alignment: Alignment.center,
      children: <Widget>[
        Container(
          //color: new Color.fromRGBO(214, 74, 74, 1),
          height: head,
          width: double.infinity,
          child: CustomPaint(
            painter: _HeaderDiagonalPainter(),
          ),
        ),
        Image.asset(
          'assets/images/logo.png',
          height: logo,
          fit: BoxFit.contain,
          semanticLabel: 'Santa Clara',
        ),
        Positioned(
          bottom: 0 + this.extra_head,
          child: Text(this.titulo,
              style: TextStyle(
                fontSize: fontTitle,
                //letterSpacing: 0.1,
                color: grisFuentePPal,
                fontWeight: FontWeight.w400,
                fontFamily: fontBase, //Titulo en negritas
              ),
              textAlign: TextAlign.center),
        ),
      ],
      overflow: Overflow.visible,
    );
  }
}

class _HeaderDiagonalPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = new Paint();
    paint.color = grisSombra; //Color(0xffd64a4a); //Color(0xffE84F1C);
    paint.style = PaintingStyle.fill;
    paint.strokeWidth = 10;

    final path = new Path();

    path.moveTo(0, size.height);
    path.lineTo(size.width, 0);
    path.lineTo(0, 0);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

class LogoHeadBase extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final double shortestSide = MediaQuery.of(context).size.shortestSide;
    final bool useMobileLayout = shortestSide < 600;
    double logo, head;
    logo = 150;
    head = 250;

    if (useMobileLayout) {
      logo = 80;
      head = 210;
    }
    return Stack(alignment: Alignment.center, children: <Widget>[
      Image.asset(
        'assets/images/logo.png',
        height: logo,
        fit: BoxFit.contain,
        semanticLabel: 'Santa Clara',
      ),
    ]);
  }
}
