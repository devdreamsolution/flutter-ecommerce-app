import 'package:flashy_tab_bar/flashy_tab_bar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:multi_repuestos/views/home.dart';
import 'package:multi_repuestos/views/productos.dart';
import 'package:multi_repuestos/views/usuario.dart';
import 'package:multi_repuestos/widgets/home_header_usuario.dart';
import 'package:multi_repuestos/widgets/home_header_usuario_draw.dart';

import 'home_header.dart';
import 'home_header_no.dart';
import 'home_header_tap.dart';

class TabNavigator extends StatefulWidget {

  TabNavigator({Key key, this.titulo, this.numTab=0, this.logeado=false }): super(key: key);

  //final LoginDto login;
  final String titulo;
  final int numTab;
  bool logeado;

  @override
  _TabNavigatorState createState() => _TabNavigatorState();
}

class _TabNavigatorState extends State<TabNavigator> {
  int _selectedIndex;

  @override
  void initState() {
    
    setState(() {
      _selectedIndex = widget.numTab;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //key: _scaffoldKey,
      appBar: headContainer(),
      drawer: drawerContainer(),
      body: bodyContainer(),
      bottomNavigationBar: FlashyTabBar(
          animationCurve: Curves.linear,
          selectedIndex: _selectedIndex,
          showElevation: true, // use this to remove appBar's elevation
          onItemSelected: (index) => setState(() {
            _selectedIndex = index;
          }),
          items: [
            FlashyTabBarItem(
              icon: Icon(FontAwesomeIcons.home),
              title: Text('Inicio'),
            ),
            FlashyTabBarItem(
              icon: Icon(FontAwesomeIcons.search),
              title: Text('Productos'),
            ),
            FlashyTabBarItem(
              icon: Icon(FontAwesomeIcons.user),
              title: Text('Usuario'),
            ),
          ],
        ),
    );
  }

    Widget bodyContainer() {
    //cuerpo variable depende del tab que seleccione
    //String slogan;
    switch (_selectedIndex) {
      case 0:
        return Home();
        break;
      case 1:
        return Productos();
        break;
      case 2:
        return Usuario(logeado: widget.logeado,);
        break;
      default:
        return Container();
        break;
    }
  }

  Widget headContainer() {
    //appbar variable, depende del tab seleccionado
    //String slogan;
    switch (_selectedIndex) {
      case 0:
        return HomeHeaderTap(); //appbar del home, es solo visual, ya que al hacer tap va a headBusqueda
        break;
      case 1:
        return HomeHeader(); //header normal, sin tap
        break;
      case 2: //headers de la vista de usuarios
        if( widget.logeado ){
          return HomeHeaderUsuario(); //si esta logeado le muestra distintas opciones con un drawer
        } else {
          return HomeHeaderNo(); //muestra un login si no esta logeado con un header normal
        }
        break;
      default:
        return Container();
        break;
    }
  }

  Widget drawerContainer(){ 
    //el drawer es variable, solo se muestra cuando esta en la vista de usuario logeado
    switch (_selectedIndex) {
      case 2:
        if( widget.logeado ){
          return HomeHeaderUsuarioDraw();
        } else {
          return null;
        }
        break;
      default:
        return null;
        break;
    }
  }
  
}