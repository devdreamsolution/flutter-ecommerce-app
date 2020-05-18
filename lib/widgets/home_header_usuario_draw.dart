//import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeHeaderUsuarioDraw extends StatefulWidget{
  HomeHeaderUsuarioDraw({Key key}) : super(key: key);
  @override
  _HomeHeaderUsuarioDrawState createState() => _HomeHeaderUsuarioDrawState();
}

class _HomeHeaderUsuarioDrawState extends State<HomeHeaderUsuarioDraw>{
    @override
    Widget build(BuildContext context) {
      return Drawer(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(15, 5, 0, 0),
          child: ListView(
            children: <Widget> [
              DrawerHeader(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      width: 80.0,
                      height: 80.0,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          fit: BoxFit.fill,
                          image: NetworkImage("https://via.placeholder.com/150")
                        )
                      )
                    ),
                    SizedBox(height: 15.0),
                    Text('Hola!'),
                    Text('Nombre de Usuario'),
                  ],
                ),
              ),
              ListTile(
                title: Row(
                  children: <Widget>[
                    Icon(FontAwesomeIcons.box, size: 15),
                    SizedBox(width: 10.0),
                    Text('Pedidos'),
                  ],
                ),
                onTap: () {},
              ),
              ListTile(
                title: Row(
                  children: <Widget>[
                    Icon(FontAwesomeIcons.comments, size: 15),
                    SizedBox(width: 10.0),
                    Text('Recuadro de Chat'),
                  ],
                ),
                onTap: () {},
              ),
              ListTile(
                title: Row(
                  children: <Widget>[
                    Icon(FontAwesomeIcons.question, size: 15),
                    SizedBox(width: 10.0),
                    Text('Consultas'),
                  ],
                ),
                onTap: () {},
              ),
              Divider(),
              ListTile(
                title: Text('Salir'),
                onTap: () {},
              ),
            ],
          ),
        )
      );
    }
}
