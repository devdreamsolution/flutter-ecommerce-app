import 'package:basic_utils/basic_utils.dart';
import 'package:flutter/material.dart';
import 'package:multi_repuestos/constants/colors.dart';
import 'package:multi_repuestos/constants/styles.dart';
import 'package:multi_repuestos/models/categorias_dto.dart';
import 'package:multi_repuestos/views/busqueda.dart';
import 'package:multi_repuestos/constants/globals.dart' as globals;

import 'home_header.dart';

class BusquedaBar extends StatefulWidget {
    BusquedaBar({Key key, this.letraBusqueda, this.topBusqueda}) : super(key: key);
    String letraBusqueda;
    TextEditingController topBusqueda;
    @override
    _BusquedaState createState() => _BusquedaState();
}

class _BusquedaState extends State<BusquedaBar>{
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
  int _selectCat = 0;
  int _selectSubCat = 0;

  @override
  void initState() { 
    super.initState();
    subCategorias(0);
  }

  subCategorias(idCategoria) async {
    await globals.menuSubCategorias(idCategoria);
  }

  @override
  Widget build(BuildContext context) {

    CategoriasDto todosCategoria = CategoriasDto(idCategoria: 0, nombreCategoria: 'Todos', padreCategoria: 0);
    List<CategoriasDto> listadoCategorias = globals.menuCategoria;
    listadoCategorias.insert(0, todosCategoria);

    return Scaffold(
      key: _scaffoldKey,
      appBar: HomeHeader(letraBusqueda: widget.letraBusqueda, controllerCajaBusqueda: widget.topBusqueda,),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(10, 15, 10, 0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text('Categoria', textAlign: TextAlign.left, style: SStyles.SubTitulos,),
              DropdownButton(
                isExpanded: true,
                //hint: Text('Please choose a location'),
                style: SStyles.ListaBusqueda,
                value: _selectCat,
                onChanged: (idCat) {
                  print("cambia la catengoria:::");
                  print(idCat);
                  setState(() {
                    _selectCat = idCat;
                    subCategorias(idCat);
                  });
                },
                items: listadoCategorias.map(( cat) {
                  print( cat.idCategoria );
                  return DropdownMenuItem(
                    child: Text( StringUtils.capitalize(cat.nombreCategoria) + ' ' ),
                    value: cat.idCategoria,
                  );
                }).toList(),
              ),
              Text('SubCategoria', textAlign: TextAlign.left, style: SStyles.SubTitulos,),
              DropdownButton(
                isExpanded: true,
                //hint: Text('Please choose a location'),
                style: SStyles.ListaBusqueda,
                value: _selectSubCat,
                onChanged: (newValue) {
                  setState(() {
                    _selectSubCat = newValue;
                  });
                },
                items: globals.getMenuSubCategoria.map(( subCat) {
                  return DropdownMenuItem(
                    child: Text( StringUtils.capitalize(subCat.nombreCategoria) + ' ' ),
                    value: subCat.idCategoria,
                  );
                }).toList(),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 40),
                child: ButtonTheme(
                  minWidth: double.infinity,
                  height: 45.0,
                  child: RaisedButton(
                    onPressed: _buscar,
                    child: Text('BUSCAR', style: SStyles.BotonRegistro),
                    color: SColors.LinkColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(8.0),
                      //side: BorderSide(color: Colors.red)
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _buscar(){
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => Busqueda(categoriaBusqueda: _selectCat, cajaBusqueda: widget.topBusqueda.text,)
      ),
    );
  }

}
