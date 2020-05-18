
class CategoriasDto {

  CategoriasDto({
    this.idCategoria, this.nombreCategoria, this.padreCategoria
  });

  int idCategoria;
  String nombreCategoria;
  int padreCategoria;

   CategoriasDto parse(Map<String, dynamic> json) {

    // Veo si vienen actividades
    

    // Oobtengo la mantencion
    return CategoriasDto(
      idCategoria : json['id'],
      nombreCategoria : json['name'],
      padreCategoria : json['parent'],
    ); 

  }

  CategoriasDto.fromJson(Map<dynamic, dynamic> json) :
    idCategoria = json['id'],
    nombreCategoria = json['name'],
    padreCategoria = json['parent'];

  Map<dynamic, dynamic> toJson() => {
    'id' : idCategoria,
    'name' : nombreCategoria,
    'parent' : padreCategoria,
  };
  
}