import 'package:basic_utils/basic_utils.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:multi_repuestos/constants/styles.dart';
import 'package:multi_repuestos/constants/globals.dart' as globals;

class HomeProductosRecomendados extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left:10),
      child: GridView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemCount: globals.getTopRecomendado.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2), 
        itemBuilder: (BuildContext context, int index){
          return Producto(
            varNombre: StringUtils.capitalize(globals.getTopRecomendado[index].nombreProducto),
            varPicture: globals.getTopRecomendado[index].imagenProducto,
            varStock: true,
            index: index,
          );
        }
        ),
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
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Container(
        height: 350,
        child: Hero(
          tag: varNombre+index.toString(),
          child:  GridTile(
            footer: Container(
              height:60,
              color: Colors.white70,
              child: ListTile(
                //leading: Text('Valor:'),
                title: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text( varNombre ),
                    if(varStock)
                      Text( "Stock", style: SStyles.ProductoEstado ),
                  ],
                ),
              ),
            ),
            //child: Image.network(varPicture, fit: BoxFit.contain),
            child: CachedNetworkImage(
              imageUrl: varPicture,
              placeholder: (context, url) => SizedBox( height: 10, width: 10, child: CircularProgressIndicator()),
              errorWidget: (context, url, error) => Icon(FontAwesomeIcons.solidEyeSlash ),
            ),
          )
        ),
      ),
    );
  }
}