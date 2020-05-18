import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:multi_repuestos/constants/environment.dart';

class Resource<T> {
  final String url;
  final String controller;
  final String action;
  T Function(Response response) parse;

  Resource({this.url, this.controller, this.action, this.parse});
}

class GenericWebservice {

  Future<T> load<T>(Resource<T> resource, {bool auth=true}) async {
    
    String basicAuth = 'Bearer '+ Environment.tokenAPI;
    final String service = resource.url + '/' + resource.controller + '/' + resource.action;

    var response;
    if( auth ){
      response = await http.get(
        service,
        headers: {'Authorization': basicAuth}
      );
    } else {
      response = await http.get(
        service
      );
    }

    if(response.statusCode == 200) {
      return resource.parse(response);
    } else {
      throw Exception('Failed to load data!');
    }
  }

  Future<T> send<T>(Resource<T> resource, String jsonData) async {

    final String service = resource.url + '/' + resource.controller + '/' + resource.action;

    final Map headers = <String, String>{
      'Content-type' : 'application/json', 
      'Accept': 'application/json',
    };

    final response = await http.post(
      service, 
      body: jsonData, 
      headers: headers
    );

    if(response.statusCode == 200) {
      return resource.parse(response);
    } else {
      return Future.error("Servicio no disponible");
      //throw Exception('Failed to post data!');
    }
  }

}