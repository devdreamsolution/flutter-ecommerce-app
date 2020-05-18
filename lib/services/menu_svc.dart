import 'dart:convert';

import 'package:multi_repuestos/constants/environment.dart';
import 'package:multi_repuestos/models/menu_dto.dart';

import 'genericwebservice.dart';


class MenuService {
  
  static Resource<List<MenuDto>> get obtener {

    return Resource(
      url: Environment.wsSiteUrl(),
      controller: 'menus/v1/menus',
      action: 'primary-menu',
      parse: (response) {
        final result = json.decode(utf8.decode(response.bodyBytes));
        //print(result);
        Iterable list = result['items'];
        return list.map((model) => MenuDto().parse(model)).toList();
      }
    );

  }

}