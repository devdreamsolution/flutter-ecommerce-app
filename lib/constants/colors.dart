import 'package:flutter/material.dart';

abstract class SColors {

  static const Sbase = MaterialColor(0xFFd0011b, {
    50:Color.fromRGBO (208, 1, 27, .05),
    100:Color.fromRGBO(208, 1, 27, .2),
    200:Color.fromRGBO(208, 1, 27, .3),
    300:Color.fromRGBO(208, 1, 27, .4),
    400:Color.fromRGBO(208, 1, 27, .5),
    500:Color.fromRGBO(208, 1, 27, .6),
    600:Color.fromRGBO(208, 1, 27, .7),
    700:Color.fromRGBO(208, 1, 27, .8),
    800:Color.fromRGBO(208, 1, 27, .9),
    900:Color.fromRGBO(208, 1, 27, 1),

  });

  //static const Splash = Color(0xFFFF0020);
  static const Splash = Colors.white;
  static const BadgeCesta = Color(0xFF0066CC);
  static const LinkColor = Color(0xFF0066CC);
  static const Fondo = Color(0xFFF9F9F9);
  static const EmpresaFiltro = Color(0xFFFA8437);
  static const Botones = Color(0xFFE32117);

}