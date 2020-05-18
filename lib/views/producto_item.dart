import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:multi_repuestos/constants/colors.dart';
import 'package:multi_repuestos/constants/styles.dart';

import 'empresa.dart';

class ProductoItem extends StatefulWidget {
    ProductoItem({Key key, this.nombreProducto }) : super(key: key);
    String nombreProducto;

    @override
    _ProductoItemState createState() => _ProductoItemState();
}

class _ProductoItemState extends State<ProductoItem>{
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text('Detalles', style: SStyles.AppBarText),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Stack(
          children: <Widget>[
            Column(
            //crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.fromLTRB(15, 5, 15, 0),
                child: Card(
                  elevation: 2,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  child: Container(
                    child: Column(
                      children:<Widget>[
                        Row(
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.fromLTRB(5, 5, 0, 5),
                              child: Container(
                                width: 40.0,
                                height: 40.0,
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
                              child: Padding(
                                padding: const EdgeInsets.only(left:10),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text('Repuestos Piedra y Navarro'),
                                  ]
                                ),
                              )
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right:5),
                              child: RaisedButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Empresa()
                                    ),
                                  );
                                },
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(13.0),
                                  //side: BorderSide(color: Colors.red)
                                ),
                                child: const Text('tienda'),
                                color: SColors.LinkColor,
                                textColor: Colors.white,
                                elevation: 5,
                              ),
                            ),
                          ],
                        ),
                      ]
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(15, 5, 15, 0),
                child: Card(
                  elevation: 2,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  child: Container(
                    height: 350,
                    child: Hero(
                    tag: "DemoTag",
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
                              Text( "Nombre Producto" ),
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
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 25, 20, 0),
                child: Row(
                  children: <Widget>[
                    Flexible(child: Text('Descripcion del producto, texto descriptivo, que aparece en el sitio, algun texto agregar aca', ))
                  ],
                ),
              ),
            ]
          ),
          Positioned(
            bottom: 25.0, 
            child: Container(
              color: Colors.transparent,
              width: MediaQuery.of(context).size.width,
              height: 50,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                child: FlatButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  onPressed: () {},
                  color: Colors.black,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon( FontAwesomeIcons.solidComments, color: Colors.white, ),
                      SizedBox(width: 10),
                      Text('SOLICITAR', style: SStyles.BtnSolicitar),
                    ],
                  ),
                ),
              ),
            )
          ),
          ]
        ),
      ),
    );
  }
}