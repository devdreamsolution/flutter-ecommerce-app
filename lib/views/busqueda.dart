import 'package:flutter/material.dart';
import 'package:multi_repuestos/constants/styles.dart';
import 'package:multi_repuestos/views/producto_item.dart';
import 'package:multi_repuestos/widgets/home_header_tap.dart';

class Busqueda extends StatefulWidget {
    Busqueda({Key key, this.categoriaBusqueda, this.cajaBusqueda}) : super(key: key);
    int categoriaBusqueda;
    String cajaBusqueda;
    @override
    _BusquedaState createState() => _BusquedaState();
}

class _BusquedaState extends State<Busqueda>{
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    var productList = [
      {
        "name": "Producto1",
        "picture": "assets/productos/img1.jpg",
        "price": 60000
      },
      {
        "name": "Producto2",
        "picture": "assets/productos/img2.jpg",
        "price": 30000
      },
      {
        "name": "Producto3",
        "picture": "assets/productos/img2.jpg",
        "price": 30000
      }
    ];
    return Scaffold(
        key: _scaffoldKey,
        appBar: HomeHeaderTap(),
        body: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[ 
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('SubCategoria: '+widget.categoriaBusqueda.toString(), textAlign: TextAlign.left, style: SStyles.SubTitulos,),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('Busqueda: '+widget.cajaBusqueda, textAlign: TextAlign.left, style: SStyles.SubTitulos,),
          ),
          Flexible(
            child: GridView.builder(
              itemCount: productList.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2), 
              itemBuilder: (BuildContext context, int index){
                return Producto(
                  varNombre: productList[index]['name'],
                  varPicture: productList[index]['picture'],
                  varPrice: productList[index]['price'],
                  index: index,
                );
              }
            ),
          ),
        ]
      ),
    );
  }
}

class Producto extends StatelessWidget {
  final String varNombre;
  final String varPicture;
  final int varPrice;
  final int index;

  Producto({
    this.varNombre,
    this.varPicture,
    this.varPrice,
    this.index
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(15.0),
        child: Card(
          elevation: 2,
          child: Hero(
            tag: varNombre+index.toString(), 
            child: Material(
              child: InkWell(
                onTap: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ProductoItem(nombreProducto: varNombre)
                    ),
                  );
                },
                child: GridTile(
                  footer: Container(
                    color: Colors.white70,
                    child: ListTile(
                      leading: Text(varNombre),
                      title: Text( "\$"+varPrice.toString() ),
                    ),
                  ),
                  child: Image.asset(varPicture, fit: BoxFit.cover),
                ),
              ),
            )
          )
      ),
    );
  }
}