import 'package:flutter/material.dart';
import 'package:santaclara/util/settings/data_constants.dart';

class SliderTile extends StatelessWidget {
  String logoAssetPath, imageAssetPath, title, desc1, desc2;
  bool logoHead;
  bool condition = false;
  SliderTile(
      {this.logoAssetPath,
      this.imageAssetPath,
      this.title,
      this.desc1,
      this.desc2,
      this.logoHead});

  //const SliderTile({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double shortestSide = MediaQuery.of(context).size.shortestSide;
    final bool useMobileLayout = shortestSide < 600;

    final theme = ThemeLayout(isMobile: useMobileLayout);

    return Container(
        padding: EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              if (logoHead)
                Image.asset(
                  logoAssetPath,
                  height: theme.logoImage,
                  fit: BoxFit.contain,
                  semanticLabel: 'Santa Clara',
                ),
              if (logoHead)
                SizedBox(
                  height: theme.logoHeight,
                ),
              Image.asset(
                imageAssetPath,
                height: theme.backImage,
                fit: BoxFit.contain,
                semanticLabel: 'Santa Clara',
              ),
              SizedBox(
                height: theme.sizeBoxH2,
              ),
              Text(
                title,
                style: TextStyle(
                    fontSize: theme.fontH1,
                    color: grisFuentePPal,
                    fontWeight: FontWeight.w300 //Titulo en negritas
                    ),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: theme.sizeBoxH3,
              ),
              Text(
                desc1,
                style: TextStyle(
                    color: grisFuentePPal,
                    fontSize: theme.fontH2,
                    fontWeight: FontWeight.w100),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: theme.sizeBoxH3,
              ),
              Text(
                desc2,
                style: TextStyle(
                    color: grisFuentePPal,
                    fontSize: theme.fontH2,
                    fontWeight: FontWeight.w100),
                textAlign: TextAlign.center,
              ),
              if (!logoHead)
                SizedBox(
                  height: theme.sizeFooter,
                ),
              if (!logoHead)
                Image.asset(
                  logoAssetPath,
                  height: theme.logoImage,
                  fit: BoxFit.contain,
                  semanticLabel: 'Santa Clara',
                ),
              if (!logoHead)
                SizedBox(
                  height: theme.logoHeight,
                )
            ]));
  }
}
