
class ProductoDto {

  ProductoDto({
    this.idProducto, this.nombreProducto, this.imagenProducto
  });

  int idProducto;
  String nombreProducto;
  String imagenProducto;

   ProductoDto parse(Map<String, dynamic> json) {

    // Veo si vienen actividades
    

    // Oobtengo la mantencion
    return ProductoDto(
      idProducto : json['id'],
      nombreProducto : json['name'],
      imagenProducto : (json['images'].length > 0)?json['images'][0]['src']:'',
    ); 

  }

  ProductoDto.fromJson(Map<dynamic, dynamic> json) :
    idProducto = json['id'],
    nombreProducto = json['name'],
    imagenProducto = json['images'][0]['src'];

  Map<dynamic, dynamic> toJson() => {
    'id' : idProducto,
    'name' : nombreProducto,
    'images' : imagenProducto,
  };
  
}