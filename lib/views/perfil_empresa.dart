import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:multi_repuestos/constants/colors.dart';
import 'package:multi_repuestos/constants/styles.dart';

class PerfilEmpresa extends StatefulWidget {
    PerfilEmpresa({Key key }) : super(key: key);

    @override
    _PerfilEmpresaState createState() => _PerfilEmpresaState();
}

class _PerfilEmpresaState extends State<PerfilEmpresa>{
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
  // List<String> _locations = ['Todas SubCategorias', 'Accesorios', 'Alternadores', 'Arrancadores y sus Partes'];
  // String _selectedLocation = 'Todas SubCategorias';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(200),
        child: AppBar(
          leading: IconButton(
            icon: Icon(FontAwesomeIcons.chevronCircleLeft, color: Colors.white, size: 30,),
            onPressed: () => Navigator.of(context).pop(),
          ),
          flexibleSpace: Image.network("https://multi-repuestos.com/wp-content/uploads/2020/04/21368952_1458833077533594_1627172019082704591_o.jpg", fit: BoxFit.cover ),
          backgroundColor: Colors.transparent,
        ),
      ),
      body: Container(
        width: double.infinity,
        //height: double.infinity,
        color: SColors.Fondo,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
          child: Card(
            //shrinkWrap: true,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
              children: <Widget>[
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.fromLTRB(5, 5, 0, 5),
                      child: Container(
                        width: 90.0,
                        height: 90.0,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            fit: BoxFit.fill,
                            image: NetworkImage("https://multi-repuestos.com/wp-content/uploads/2020/04/LOGO-PYN-1.jpg")
                          )
                        )
                      ),
                    ),
                    Expanded(
                      child: Container(
                        alignment: Alignment.topRight,
                        //width: (MediaQuery.of(context).size.width / 2) + 40,
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(10, 3, 10, 0),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text('Repuestos Piedra y Navarro', style: SStyles.TituloEmpresa),
                              Padding(
                                padding: const EdgeInsets.only(top: 10),
                                child: Row(
                                  //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    ButtonTheme(
                                      height: 30.0,
                                      child: RaisedButton(
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(10.0),
                                        ),
                                        onPressed: () {},
                                        color: SColors.Botones,
                                        child: Row(
                                          children: <Widget>[
                                            Icon(FontAwesomeIcons.solidComments, size: 13, color: Colors.white),
                                            SizedBox(width: 3),
                                            Text('Chat', style: SStyles.EmpresaLinksFiltros),
                                          ]
                                        )
                                      ),
                                    ),
                                    SizedBox(width: 30),
                                    ButtonTheme(
                                      height: 30.0,
                                      child: FlatButton(
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(10.0),
                                        ),
                                        onPressed: () {},
                                        color: SColors.Botones,
                                        child: Row(
                                          children: <Widget>[
                                            Icon(FontAwesomeIcons.question, size: 13, color: Colors.white,),
                                            SizedBox(width: 3),
                                            Text('Consulta', style: SStyles.EmpresaLinksFiltros),
                                          ]
                                        )
                                      ),
                                    ),
                                  ]
                                ),
                              ),
                            ]
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(10, 30, 10, 0),
                  child: Row(
                    children: <Widget>[
                      Icon(FontAwesomeIcons.phone, size: 13, color: Colors.black),
                      SizedBox(width: 5),
                      Flexible(child: Text('2551-2322', )),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(10, 15, 10, 0),
                  child: Row(
                    children: <Widget>[
                      Icon(FontAwesomeIcons.envelopeOpen, size: 13, color: Colors.black),
                      SizedBox(width: 5),
                      Flexible(child: Text('reppiedraynavarro@gmail.com', )),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(10, 15, 10, 0),
                  child: Row(
                    children: <Widget>[
                      Icon(FontAwesomeIcons.mapMarkerAlt, size: 13, color: Colors.black),
                      SizedBox(width: 5),
                      Flexible(child: Text('Cartago, DE LA ESQUINA NOROESTE DE LA IGLESIA DE MARIA AUXILIADORA, 100 METROS OESTE Y 25 METROS NORTE, cartago, Costa Rica - 2343', )),
                    ],
                  ),
                ),
              ]
          ),
            ),
        )
      )
      )
    );
  }
}