library multi_respuestos.globals;

import 'package:multi_repuestos/models/categorias_dto.dart';
import 'package:multi_repuestos/models/menu_dto.dart';
import 'package:multi_repuestos/models/producto_dto.dart';
import 'package:multi_repuestos/services/categorias_svc.dart';
import 'package:multi_repuestos/services/genericwebservice.dart';
import 'package:multi_repuestos/services/menu_svc.dart';
import 'package:multi_repuestos/services/producto_svc.dart';

List<MenuDto> menuEmpresa;
List<ProductoDto> topCategoria;
List<ProductoDto> topRecomendado;
List<CategoriasDto> menuCategoria;
List<CategoriasDto> menuSubCategoria = List<CategoriasDto>();
List<ProductoDto> productoBusqueda;

Future<List<MenuDto>> menuEmpresas() async {
  menuEmpresa = await GenericWebservice().load(MenuService.obtener, auth: false);
  return menuEmpresa;
}

Future<List<ProductoDto>> topCategorias() async {
  topCategoria = await GenericWebservice().load(ProductoService.topCategorias);
  return topCategoria;
}

Future<List<ProductoDto>> topRecomendados() async {
  topRecomendado = await GenericWebservice().load(ProductoService.topRecomendados);
  return topRecomendado;
}

Future<List<CategoriasDto>> menuCategorias() async {
  menuCategoria = await GenericWebservice().load(CategoriasService.categorias);
  return menuCategoria;
}

Future<List<ProductoDto>> productosBusqueda() async {
  productoBusqueda = await GenericWebservice().load(ProductoService.busqueda());
  return productoBusqueda;
}

Future<List<CategoriasDto>> menuSubCategorias(int idCategoria ) async {
  if( idCategoria > 0 ){
    List<CategoriasDto> listadoSubCategorias = await GenericWebservice().load(CategoriasService.subcategorias(idCategoria));
    CategoriasDto todosSubCategoria = CategoriasDto(idCategoria: 0, nombreCategoria: 'Todas', padreCategoria: 0);
    menuSubCategoria = listadoSubCategorias;
    menuSubCategoria.insert(0, todosSubCategoria);
  } else {
    menuSubCategoria = List<CategoriasDto>();
    CategoriasDto todosSubCategoria = CategoriasDto(idCategoria: 0, nombreCategoria: 'Todas', padreCategoria: 0);
    menuSubCategoria.insert(0, todosSubCategoria);
  }
  
  return menuSubCategoria;
}

// getters

List<MenuDto> get getMenuEmpresa {
  return menuEmpresa;
}
List<ProductoDto> get getTopCategoria{
  return topCategoria;
}
List<ProductoDto> get getTopRecomendado{
  return topRecomendado;
}
List<CategoriasDto> get getMenuCategoria{
  return menuCategoria;
}
List<ProductoDto> get getProductoBusqueda{
  return productoBusqueda;
}
List<CategoriasDto> get getMenuSubCategoria{
  return menuSubCategoria;
}