//import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:multi_repuestos/constants/styles.dart';

import 'busqueda_bar.dart';

class HomeHeaderTap extends StatefulWidget with PreferredSizeWidget{
    HomeHeaderTap({Key key}) : super(key: key);
    @override
    _HomeHeaderState createState() => _HomeHeaderState();

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(100);
}

class _HomeHeaderState extends State<HomeHeaderTap> {
  final myController = TextEditingController();

    @override
    Widget build(BuildContext context) {
      return PreferredSize(
          preferredSize: Size.fromHeight(100),
          child: AppBar( 
            //title: Text("MultiRepuestos", style: SStyles.AppBarText,),
            title: Center(child: Image(image: AssetImage('assets/images/appbar_logo2.png'), height: 50 )),
            actions: <Widget>[
              Padding(
                padding: const EdgeInsets.only(right: 12),
                child: IconButton(
                  //icon: Icon(FontAwesomeIcons.shoppingBag),
                  icon: Icon(FontAwesomeIcons.industry),
                  onPressed: () {
                    //_select(choices[0]);
                  },
                ),
              ),
            ],
            flexibleSpace: Positioned(
              bottom: 10,
              child: Container(
                width: MediaQuery.of(context).size.width, 
                child: 
                    Padding(
                      padding: const EdgeInsets.fromLTRB(25, 0, 25, 0),
                      child: SizedBox(
                        height: 33,
                        child: TextField(
                          style: SStyles.TextInput,
                          controller: myController,
                          //keyboardType: TextInputType.number,
                          //maxLength: 1,
                          textAlign: TextAlign.left,
                          //focusNode: myFocusNode1,
                          decoration: InputDecoration(
                            counterText: '',
                            hintText: '¿Que estas Buscando?',
                            prefixIcon: Icon(Icons.search, size: 20),
                            //suffixIcon: Icon(Icons.list),
                            //contentPadding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                            contentPadding: const EdgeInsets.fromLTRB(0, 12, 0, 0),
                            //contentPadding: EdgeInsets.zero,
                            filled: true,
                            isDense: true,
                            fillColor: Colors.white,
                            focusColor: Colors.white,
                            hoverColor: Colors.white,
                            enabledBorder: OutlineInputBorder(
                              // width: 0.0 produces a thin "hairline" border
                              borderSide: BorderSide(color: Colors.transparent, width: 0.0),
                              borderRadius: BorderRadius.all(Radius.circular(8)),
                            ),
                            focusedBorder: OutlineInputBorder(
                              // width: 0.0 produces a thin "hairline" border
                              borderSide: BorderSide(color: Colors.transparent, width: 0.0),
                              borderRadius:BorderRadius.all(Radius.circular(8)),
                            ),
                            border: InputBorder.none
                          ),
                          onChanged: (val){
                            if( val != '' ){
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => BusquedaBar(letraBusqueda: val, topBusqueda: myController,)
                                ),
                            );
                            }
                          },
                        ),
                      ),
                      // DropdownButton(
                      //   //hint: Text('Please choose a location'),
                        
                      //   value: _selectedLocation,
                      //   onChanged: (newValue) {
                      //     setState(() {
                      //       _selectedLocation = newValue;
                      //     });
                      //   },
                      //   items: _locations.map((location) {
                      //     return DropdownMenuItem(
                      //       child: new Text(location),
                      //       value: location,
                      //     );
                      //   }).toList(),
                      // ),
                      // IconButton(
                      //   icon: Icon(Icons.list),
                      //   onPressed: () {
                      //     // do something
                      //   },
                      // ),
                    ),
                  //],
                )
              //)
            ),
          ),
      );
    }
}