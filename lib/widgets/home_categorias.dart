import 'package:basic_utils/basic_utils.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:icons_helper/icons_helper.dart';
import 'package:multi_repuestos/constants/styles.dart';
import 'package:multi_repuestos/constants/globals.dart' as globals;

class HomeCategorias extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90.0,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          for(var item in globals.getMenuEmpresa ) Categoria(varTexto: item.tituloMenu, varIcono: getIconUsingPrefix(name: 'fa.'+item.iconoMenu)),
        ]
      ),
    );
  }
}

class Categoria extends StatelessWidget {
  final IconData varIcono;
  final String varTexto;

  Categoria({
    this.varIcono,
    this.varTexto
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(5, 2, 10, 15),
      child: Container(
        height: 80.0,
        width: 135.0,
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [ 
            BoxShadow(
              color: Color.fromRGBO(0, 0, 0, 0.2),
              blurRadius: 7.0,
              spreadRadius: 2.0,
              offset: Offset(
                3.0, // horizontal, move right 10
                3.0, // vertical, move down 10
              ),
            )
          ],
          borderRadius: BorderRadius.all( Radius.circular(8) ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Icon( varIcono ),
               Expanded(
                  child: Align(
                    alignment: FractionalOffset.bottomCenter,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(StringUtils.capitalize(varTexto), style: SStyles.CatHome,),
                        Icon(FontAwesomeIcons.arrowRight, size: 16,)
                      ],
                     )
                  ),
               ),
            ]
          ),
        ),
      )
    );
  }
}