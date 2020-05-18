import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:multi_repuestos/constants/styles.dart';
import 'package:multi_repuestos/views/producto_item.dart';
import 'package:multi_repuestos/constants/globals.dart' as globals;

class Productos extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[ 
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text('Productos', textAlign: TextAlign.left, style: SStyles.SubTitulos,),
        ),
        Flexible(
          child: GridView.builder(
            itemCount: globals.productoBusqueda.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2), 
            itemBuilder: (BuildContext context, int index){
              return Producto(
                varNombre: globals.productoBusqueda[index].nombreProducto,
                varPicture: globals.productoBusqueda[index].imagenProducto,
                varStock: true,
                index: index,
              );
            }
          ),
        ),
      ]
    );
  }
}

class Producto extends StatelessWidget {
  final String varNombre;
  final String varPicture;
  final bool varStock;
  final int index;

  Producto({
    this.varNombre,
    this.varPicture,
    this.varStock,
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
                    child:  Padding(
                      padding: const EdgeInsets.only(left:5),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(varNombre), 
                          if(varStock)
                          Text( "Stock", style: SStyles.ProductoEstado ),
                        ],
                      ),
                    ),
                  ),
                  //child: Image.asset(varPicture, fit: BoxFit.cover),
                  child: CachedNetworkImage(
                    imageUrl: varPicture,
                    placeholder: (context, url) => SizedBox( height: 10, width: 10, child: CircularProgressIndicator()),
                    errorWidget: (context, url, error) => Icon(FontAwesomeIcons.solidEyeSlash ),
                  ),
                ),
              ),
            )
          )
      ),
    );
  }
}