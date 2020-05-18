import 'package:flutter/material.dart';
import 'package:multi_repuestos/constants/styles.dart';
import 'package:multi_repuestos/views/producto_item.dart';

class HomeProductosCategorias extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var productList = [
      {
        "name": "Producto6",
        "picture": "assets/productos/img1.jpg",
        "price": 60000
      },
      {
        "name": "Producto7",
        "picture": "assets/productos/img2.jpg",
        "price": 30000
      },
      {
        "name": "Producto8",
        "picture": "assets/productos/img2.jpg",
        "price": 30000
      },
      {
        "name": "Producto9",
        "picture": "assets/productos/img1.jpg",
        "price": 28700
      }
    ];
    return Padding(
      padding: const EdgeInsets.only(left:10),
      child: GridView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
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
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: InkWell(
        onTap: (){
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ProductoItem(nombreProducto: varNombre)
            ),
          );
        },
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
                      Text( "Stock", style: SStyles.ProductoEstado ),
                    ],
                  ),
                ),
              ),
              child: Image.asset("assets/productos/img1.jpg", fit: BoxFit.contain),
            )
          ),
        ),
      ),
    );
    // return ClipRRect(
    //   borderRadius: BorderRadius.circular(15.0),
    //     child: Card(
    //       elevation: 2,
    //       child: Hero(
    //         tag: varNombre, 
    //         child: Material(
    //           child: InkWell(
    //             onTap: (){
    //               Navigator.push(
    //                 context,
    //                 MaterialPageRoute(
    //                     builder: (context) => ProductoItem(nombreProducto: varNombre)
    //                 ),
    //               );
    //             },
    //             child: GridTile(
    //               footer: Container(
    //                 height: 50,
    //                 color: Colors.white70,
    //                 // child: ListTile(
    //                 //   leading: Text(varNombre),
    //                 //   title: Text( "\$"+varPrice.toString() ),
    //                 // ),
    //                 child: Row(
    //                   children: <Widget>[
    //                     Expanded(
    //                       child: Text(varNombre),
    //                     ),
    //                     Text("\$"+varPrice.toString())
    //                   ],
    //                 ),
    //               ),
    //               child: Image.asset(varPicture, fit: BoxFit.cover),
    //             ),
    //           ),
    //         )
    //       )
    //   ),
    // );
  }
}