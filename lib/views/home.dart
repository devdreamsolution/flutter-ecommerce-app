import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:multi_repuestos/constants/colors.dart';
import 'package:multi_repuestos/constants/styles.dart';
import 'package:multi_repuestos/widgets/home_categorias.dart';
import 'package:multi_repuestos/widgets/home_productos_categorias.dart';
import 'package:multi_repuestos/widgets/home_productos_recomendados.dart';

class Home extends StatefulWidget {
  Home({Key key }) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home>{
  //GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return Container(
      width: double.infinity,
      height: double.infinity,
      color: SColors.Fondo,
      child: ListView(
        shrinkWrap: true,
        children: <Widget>[
          CarouselSlider(
            options: CarouselOptions(
              aspectRatio: 2.0,
              enlargeCenterPage: true,
              //scrollDirection: Axis.vertical,
              autoPlay: true,
            ),
            items: imageSliders,
          ),
          // Padding(
          //   padding: const EdgeInsets.all(8.0),
          //   child: Text('Categorias', style: SStyles.SubTitulos,),
          // ),
          //listado de caregorias
          SizedBox(height: 8.0),
          HomeCategorias(),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('Top Categorias del Mes', style: SStyles.SubTitulos,),
          ),

          //listado de prductos
          HomeProductosCategorias(),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('Recomendaciones', style: SStyles.SubTitulos,),
          ),

          //listado de recomendaciones (productos)
          HomeProductosRecomendados(),

        ],
      )
    );
    
  }

}

final List imgList = [
    'https://multi-repuestos.com/wp-content/uploads/revslider/home_auto_parts/s4-300x300.jpg',
    'https://multi-repuestos.com/wp-content/uploads/revslider/home_auto_parts/s5-300x300.jpg'
];

final List<Widget> imageSliders = imgList.map((item) => Container(
  child: Container(
    margin: EdgeInsets.all(5.0),
    child: ClipRRect(
      borderRadius: BorderRadius.all(Radius.circular(5.0)),
      child: Stack(
        children: <Widget>[
          Image.network(item, fit: BoxFit.cover, width: 1000.0),
          Positioned(
            bottom: 0.0,
            left: 0.0,
            right: 0.0,
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color.fromARGB(200, 0, 0, 0),
                    Color.fromARGB(0, 0, 0, 0)
                  ],
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                ),
              ),
              padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
              child: Text(
                (imgList.indexOf(item) == 0)?'Dunlop Tires Faster':'Castrol Motor Oil',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      )
    ),
  ),
)).toList();