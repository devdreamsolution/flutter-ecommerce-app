import 'package:flutter/material.dart';
import 'package:multi_repuestos/widgets/login.dart';
import 'package:multi_repuestos/widgets/panel_usuario.dart';
// import 'package:multi_repuestos/views/productos.dart';

// import 'home_contenido.dart';

class Usuario extends StatefulWidget {
  Usuario({Key key, this.logeado=false }) : super(key: key);
  bool logeado;

  @override
  _UsuarioState createState() => _UsuarioState();
}

class _UsuarioState extends State<Usuario>{
  // int _selectedIndex = 2;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topCenter,
      width: double.infinity,
      height: double.infinity,
      child: (widget.logeado)?PanelUsuario():Login(),
    );
  }

  // Widget bodyContainer() {
  //   //Color selectedColor = tabItems[selectedPos].circleColor;
  //   //String slogan;
  //   switch (_selectedIndex) {
  //     case 0:
  //       return HomeContenido();
  //       break;
  //     case 1:
  //       return Productos();
  //       break;
  //     default:
  //       return Usuario();
  //       break;
  //   }
  // }

}