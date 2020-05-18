import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:multi_repuestos/constants/colors.dart';
import 'package:multi_repuestos/constants/styles.dart';
import 'package:multi_repuestos/views/perfil_empresa.dart';
import 'package:multi_repuestos/widgets/empresa_header.dart';
import 'package:multi_repuestos/widgets/home_productos_categorias.dart';

class Empresa extends StatefulWidget {
    Empresa({Key key }) : super(key: key);

    @override
    _EmpresaState createState() => _EmpresaState();
}

class _EmpresaState extends State<Empresa>{
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
  List<String> _locations = ['Todas SubCategorias', 'Accesorios', 'Alternadores', 'Arrancadores y sus Partes'];
  String _selectedLocation = 'Todas SubCategorias';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: EmpresaHeader(),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: SColors.Fondo,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
          child: ListView(
            shrinkWrap: true,
            children: <Widget>[
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Card(
                    elevation: 2,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12.0),
                      child: Container(
                        height: 120,
                        width: (MediaQuery.of(context).size.width / 2) - 68,
                        child: Image.network("https://multi-repuestos.com/wp-content/uploads/2020/04/21368952_1458833077533594_1627172019082704591_o.jpg", fit: BoxFit.cover )                  
                      ),
                    ),
                  ),
                  Container(
                    alignment: Alignment.topRight,
                    width: (MediaQuery.of(context).size.width / 2) + 40,
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
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                ButtonTheme(
                                  height: 30.0,
                                  child: RaisedButton(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                    onPressed: () {},
                                    color: Color(0xFFE32117),
                                    child: Row(
                                      children: <Widget>[
                                        Icon(FontAwesomeIcons.solidComments, size: 13, color: Colors.white),
                                        SizedBox(width: 3),
                                        Text('Chat', style: SStyles.EmpresaLinksFiltros),
                                      ]
                                    )
                                  ),
                                ),
                                ButtonTheme(
                                  height: 30.0,
                                  child: FlatButton(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                    onPressed: () {},
                                    color: Color(0xFFE32117),
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
                ],
              ),
              ButtonTheme(
                height: 30.0,
                minWidth: double.infinity,
                child: FlatButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => PerfilEmpresa()
                      ),
                    );
                  },
                  color: Color(0xFF555555),
                  child: Text('Ver Empresa', style: SStyles.EmpresaLinksFiltros),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 5),
                child: DropdownButton(
                  isExpanded: true,
                  //hint: Text('Please choose a location'),
                  style: SStyles.ListaBusqueda,
                  value: _selectedLocation,
                  onChanged: (newValue) {
                    setState(() {
                      _selectedLocation = newValue;
                    });
                  },
                  items: _locations.map((location) {
                    return DropdownMenuItem(
                      child: Text(location),
                      value: location,
                    );
                  }).toList(),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('Productos', style: SStyles.SubTitulos,),
              ),
              //listado de prductos
              HomeProductosCategorias(),
            ]
          ),
        )
      )
    );
  }
}