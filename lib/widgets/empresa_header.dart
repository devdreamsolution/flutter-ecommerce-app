import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:multi_repuestos/constants/colors.dart';
import 'package:multi_repuestos/constants/styles.dart';

class EmpresaHeader extends StatefulWidget implements PreferredSizeWidget{
  EmpresaHeader({Key key}) : super(key: key);
  @override
  _EmpresaHeaderState createState() => _EmpresaHeaderState();

  @override
  Size get preferredSize {
    return Size.fromHeight(60.0);
  }
}

class _EmpresaHeaderState extends State<EmpresaHeader>{
  final controllerCajaBusqueda = TextEditingController();

  @override
  Widget build(BuildContext context) {

    return AppBar(
      backgroundColor: SColors.Fondo,
      iconTheme: IconThemeData(
        color: Colors.black54, //change your color here
      ),
      elevation: 0.0,
      //centerTitle: false,
      titleSpacing: 0.0,
      title: Container(
        alignment: Alignment.centerRight,
        width: double.infinity,
        child: Theme(
          data: ThemeData(
            primaryColor: Colors.black54,
            accentColor: Colors.black54,
            hintColor: Colors.black54
          ),
          child: TextField(
            style: SStyles.TextInput,
            controller: controllerCajaBusqueda,
            autofocus: true,
            //keyboardType: TextInputType.number,
            //maxLength: 1, 
            textAlign: TextAlign.left,
            //focusNode: myFocusNode1,
            decoration: InputDecoration(
              counterText: '',
              hintText: '¿Que estas Buscando?',
              labelText: "",
              prefixIcon: Icon(Icons.search),
              //contentPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              contentPadding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
              filled: true,
              fillColor: Colors.transparent,
              focusColor: Colors.transparent,
              hoverColor: Colors.transparent,
              border: UnderlineInputBorder(
                borderSide: BorderSide(
                  color:  Colors.black54
                )
              )
            ),
            onChanged: (val){
            //   if( val != '' ){
            //     FocusScope.of(context).requestFocus(myFocusNode2);
            //   }
            },
          ),
        ),
        ),
      actions: <Widget>[
        IconButton(
          //icon: Icon(FontAwesomeIcons.shoppingBag),
          icon: Icon(FontAwesomeIcons.filter),
          onPressed: () {
            //_select(choices[0]);
          },
        ),
      ],
    );
  }
}