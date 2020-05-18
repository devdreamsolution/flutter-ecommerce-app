import 'dart:convert';

import 'package:multi_repuestos/constants/environment.dart';
import 'package:multi_repuestos/models/categorias_dto.dart';

import 'genericwebservice.dart';


class CategoriasService {
  
  static Resource<List<CategoriasDto>> get categorias {

    return Resource(
      url: Environment.wsSiteUrl(),
      controller: 'wc/v3',
      action: 'products/categories?parent=0&per_page=40',
      parse: (response) {
        final result = json.decode(utf8.decode(response.bodyBytes));
        //print(result);
        Iterable list = result;
        return list.map((model) => CategoriasDto().parse(model)).toList();
      }
    );
  }

  static Resource<List<CategoriasDto>> subcategorias(int idCategoria) {

    return Resource(
      url: Environment.wsSiteUrl(),
      controller: 'wc/v3',
      action: 'products/categories?parent='+idCategoria.toString()+'&per_page=40',
      parse: (response) {
        final result = json.decode(utf8.decode(response.bodyBytes));
        //print(result);
        Iterable list = result;
        return list.map((model) => CategoriasDto().parse(model)).toList();
      }
    );
  }
  

}