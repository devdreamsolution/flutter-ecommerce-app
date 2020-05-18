//import 'package:badges/badges.dart';
import 'package:flutter/material.dart';

class HomeHeaderNo extends StatefulWidget with PreferredSizeWidget{
    HomeHeaderNo({Key key}) : super(key: key);
    @override
    _HomeHeaderNoState createState() => _HomeHeaderNoState();

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(100);
}

class _HomeHeaderNoState extends State<HomeHeaderNo>{
    @override
    Widget build(BuildContext context) {
      //TextEditingController _controller = TextEditingController(text: widget.letraBusqueda);

      return PreferredSize(
          preferredSize: Size.fromHeight(100),
          child: AppBar( 
            //title: Text("MultiRepuestos", style: SStyles.AppBarText,),
            title: Center(child: Image(image: AssetImage('assets/images/appbar_logo2.png'), height: 50 )),
            actions: <Widget>[
              // Padding(
              //   padding: const EdgeInsets.only(right: 12),
              //   child: IconButton(
              //     //icon: Icon(FontAwesomeIcons.shoppingBag),
              //     icon: Badge(
              //       badgeContent: Text('0', style: SStyles.BadgeCesta,),
              //       child: Icon(FontAwesomeIcons.shoppingBag),
              //       showBadge: true,
              //       badgeColor: SColors.BadgeCesta,
              //     ),
              //     onPressed: () {
              //       //_select(choices[0]);
              //     },
              //   ),
              // ),
            ],
          ),
      );
    }
}