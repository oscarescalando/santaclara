import 'package:flutter/material.dart';

class AppBarPrincipal extends PreferredSize {
  @override
  Size get preferredSize => Size.fromHeight(50);
  Color backColor;
  AppBarPrincipal({
    Key key,
    this.backColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      title: new Text("SANTA CLARA"),
      backgroundColor: this.backColor,
    );
  }
}
