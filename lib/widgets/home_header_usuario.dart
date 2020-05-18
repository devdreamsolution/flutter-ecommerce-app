//import 'package:badges/badges.dart';
import 'package:flutter/material.dart';

class HomeHeaderUsuario extends StatefulWidget with PreferredSizeWidget{
  HomeHeaderUsuario({Key key}) : super(key: key);
  @override
  _HomeHeaderUsuarioState createState() => _HomeHeaderUsuarioState();

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(100);
}

class _HomeHeaderUsuarioState extends State<HomeHeaderUsuario>{
    @override
    Widget build(BuildContext context) {
      return AppBar(
        title: Text('Usuario'),
      );
    }
}
