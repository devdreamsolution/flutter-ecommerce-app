
import 'package:flutter/material.dart';

class PanelUsuario extends StatefulWidget {
  PanelUsuario({Key key }) : super(key: key);

  @override
  _PanelUsuarioState createState() => _PanelUsuarioState();
}

class _PanelUsuarioState extends State<PanelUsuario> {

  @override
  Widget build(BuildContext context) {

    // construimostodo para devolver
    return SingleChildScrollView(
      child: Center(
        child: Container(
          //color: SColors.ShutColor.shade900,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(18, 26, 18, 36),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text('Aun no tienes pedidos'),
                //SizedBox(height: 25.0),
              ],
            ),
          ),
        ),
      ),
    );
  }
}