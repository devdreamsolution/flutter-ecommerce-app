import 'dart:convert';

import 'package:multi_repuestos/constants/environment.dart';
import 'package:multi_repuestos/models/producto_dto.dart';

import 'genericwebservice.dart';


class ProductoService {
  
  static Resource<List<ProductoDto>> get topCategorias {

    return Resource(
      url: Environment.wsSiteUrl(),
      controller: 'wc/v3',
      action: 'products?filter[meta_key]=total_sales&per_page=4',
      parse: (response) {
        final result = json.decode(utf8.decode(response.bodyBytes));
        //print(result);
        Iterable list = result;
        return list.map((model) => ProductoDto().parse(model)).toList();
      }
    );

  }

  static Resource<List<ProductoDto>> get topRecomendados {

    return Resource(
      url: Environment.wsSiteUrl(),
      controller: 'wc/v3',
      action: 'products?filter[meta_key]=total_sales&per_page=4',
      parse: (response) {
        final result = json.decode(utf8.decode(response.bodyBytes));
        //print(result);
        Iterable list = result;
        return list.map((model) => ProductoDto().parse(model)).toList();
      }
    );
  }

  static Resource<List<ProductoDto>> busqueda({String prod=''}) {

    return Resource(
      url: Environment.wsSiteUrl(),
      controller: 'wc/v2',
      action: 'products',
      parse: (response) {
        final result = json.decode(utf8.decode(response.bodyBytes));
        //print(result);
        Iterable list = result;
        return list.map((model) => ProductoDto().parse(model)).toList();
      }
    );
  }

}