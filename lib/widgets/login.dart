import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:multi_repuestos/constants/styles.dart';
import 'package:multi_repuestos/widgets/tab_navigator.dart';
import 'package:status_alert/status_alert.dart';

import '../constants/colors.dart';

class Login extends StatefulWidget {
  Login({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextStyle style = TextStyle(fontFamily: 'Monserrat', fontSize: 18.0);
  final _formKey = GlobalKey<FormState>();
  String _password;
  String _email;

  @override
  Widget build(BuildContext context) {

    // Se define el campo de texto para ingresar el correo electrónico
    final emailField = TextFormField(
      onSaved: (value) => _email = value,
      obscureText: false,
      style: style,
      //initialValue: Environment.localUsername(),
      decoration: InputDecoration(
        contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        hintText: "Su correo electrónico",
        hintStyle: TextStyle(fontWeight: FontWeight.normal, color: Colors.grey.shade400),
        fillColor: Colors.grey.shade100,
        focusColor: Colors.grey.shade100,
        hoverColor: Colors.grey.shade100,
        filled: true,
        prefixIcon: Icon(FontAwesomeIcons.solidEnvelope, size: 20),
        border:
        OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(32.0)
        ),
      ),
    );

    // Campo de texto para ingresar la contraseña
    final passwordField = TextFormField(
      onSaved: (value) => _password = value,
      obscureText: true,
      style: style,
      //initialValue: Environment.localPassword(),
      decoration: InputDecoration(
        contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        hintText: "Su contraseña",
        hintStyle: TextStyle(fontWeight: FontWeight.normal, color: Colors.grey.shade400),
        fillColor: Colors.grey.shade100,
        focusColor: Colors.grey.shade100,
        hoverColor: Colors.grey.shade100,
        filled: true,
        prefixIcon: Icon(
          FontAwesomeIcons.lock,
          size: 20,
        ),
        border:
        OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(32.0)
        ),
      ),
    );

    // Botón para Ingresar
    final loginButton = RaisedButton(
      color: SColors.Botones,
      padding: EdgeInsets.fromLTRB(50.0, 10.0, 50.0, 10.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30.0),
        side: BorderSide.none,
      ),
      child: Text(
        'Iniciar Sesión',
        textAlign: TextAlign.center,
        style: style.copyWith(
            color: Colors.white, fontWeight: FontWeight.bold
        ),
      ),
      onPressed:() async {
        final form = _formKey.currentState;
        //var imei = await ImeiPlugin.getImei( shouldShowRequestPermissionRationale: false );

        form.save();

        if (form.validate()) {
          if( _email == '' || _password == '' ){
            StatusAlert.show(
              context,
              duration: Duration(seconds: 2),
              title: 'Error',
              subtitle: 'El correo y la contraseña son obligatorias',
              //backgroundColor: Colors.red,
              configuration: IconConfiguration(icon: FontAwesomeIcons.exclamationTriangle),
            );
            // Alert(
            // context: context,
            // type: AlertType.warning,
            // title: Messages.TIT_ATENCION,
            // desc: Messages.ALERT_DEBE_INGRESAR_CORREO,
            // buttons: [
            //   DialogButton(
            //     child: Text(
            //         Messages.BTN_CERRAR,
            //         style: TextStyle(color: Colors.white, fontSize: 15),
            //         ),
            //       onPressed: () => Navigator.pop(context),
            //       width: 100,
            //     ),
            //   ],
            // ).show();
          return;
          } else {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => TabNavigator(numTab:2, logeado: true,)
              ),
            );
          }

          //verificar si hay internet
          // try {
          //   final result = await InternetAddress.lookup(Environment.lookupUrl);
          //   if (result.isNotEmpty && result[0] != null && result[0].rawAddress != null && result[0].rawAddress.isNotEmpty) {
          //     //print('hay internet');
          //   } else {
          //     //si no hay internet, muestro mensaje con el problema y salgo
          //     _alertNoConectado();
          //     return;
          //   }
          // } on SocketException catch (_) {
          //   _alertError(_.message);
          //   return;
          // }

          // showDialog(
          //   context: context,
          //   builder: (BuildContext context) {
          //     return Center(child: CircularProgressIndicator(),);
          //   });
          // LoginFilter filter = LoginFilter(
          //   deviceUniqueID: imei,
          //   deviceToken: "tokenmobile001",
          //   nombreUsuario: _email,
          //   claveUsuario: _password
          // );

          // // Se realizar el login
          // GenericWebservice().send(LoginService.all, json.encode(filter.toJson())).then((login) => {
          //   Provider.of<AuthService>(context).loginUser(login: login, context:context)
          // });

        } 
          
      },
    );

    // construimostodo para devolver
    return Scaffold(
      //backgroundColor: SColors.ShutColor.shade900,
      body:
      SingleChildScrollView(
        child:
        Center(
          child: Container(
            //color: SColors.ShutColor.shade900,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(18, 26, 18, 36),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text('Iniciar Sesión', style: SStyles.Titulo ),
                  SizedBox(height: 25.0),
                  Card(
                    elevation: 5.0,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0)
                    ),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(15.0, 25.0, 15.0, 15.0),
                      child: Form(
                        key: _formKey,
                        child: Column(
                          children: <Widget>[
                            emailField,
                            SizedBox(height: 45.0),
                            passwordField,
                            SizedBox(height: 35.0),
                            loginButton,
                            SizedBox(height: 25.0),

                            // FutureBuilder(
                            //   future: getVersionNumber(),
                            //   builder: (BuildContext context, AsyncSnapshot<String> snapshot) =>
                            //       Text(
                            //         snapshot.hasData ? snapshot.data : "Loading ...",
                            //         style: TextStyle(color: Colors.grey.shade300, fontWeight: FontWeight.bold),
                            //       ),
                            // ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }



  // _alertNoConectado(){
  //   return Alert(
  //     context: context,
  //     type: AlertType.error,
  //     title: "Error!",
  //     desc: "No tiene conexión a internet, favor conectar e intentar nuevamente.",
  //     buttons: [
  //       DialogButton(
  //         child: Text(
  //             "Cerrar",
  //             style: TextStyle(color: Colors.white, fontSize: 15),
  //             ),
  //           onPressed: () => Navigator.pop(context),
  //           width: 100,
  //         ),
  //       ],
  //     ).show();
  // }

  // _alertError(String error){
  //   return Alert(
  //     context: context,
  //     type: AlertType.error,
  //     title: "Error!",
  //     desc: error,
  //     buttons: [
  //       DialogButton(
  //         child: Text(
  //             "Cerrar",
  //             style: TextStyle(color: Colors.white, fontSize: 15),
  //             ),
  //           onPressed: () => Navigator.pop(context),
  //           width: 100,
  //         ),
  //       ],
  //     ).show();
  // }

}