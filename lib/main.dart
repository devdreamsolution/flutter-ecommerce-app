import 'package:flutter/material.dart';
import 'package:multi_repuestos/widgets/splash_screen.dart';
import 'package:multi_repuestos/widgets/tab_navigator.dart';
//funciones de llamada a apis
import 'package:multi_repuestos/constants/globals.dart' as globals;

import 'constants/colors.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  //int _segundosIniciarApp = 6;

  @override
  void initState() { 
    super.initState();
  }


  loadData() async { //apis
    //await Future.delayed(Duration(seconds: _segundosIniciarApp));
    await globals.menuEmpresas();
    await globals.topCategorias();
    await globals.topRecomendados();
    await globals.menuCategorias();
    await globals.productosBusqueda();
    return 'data';
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: SColors.Sbase.shade900,
        dividerColor: Colors.transparent,
         ),
      home: FutureBuilder(
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return SplashScreen();
          }
          return TabNavigator(numTab: 0,); //tab se encarga de mostrar la información
        },
        future: loadData(),
      ),
    );
  }
}