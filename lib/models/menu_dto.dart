
class MenuDto {

  MenuDto({
    this.idMenu, this.tituloMenu, this.iconoMenu
  });

  int idMenu;
  String tituloMenu;
  String iconoMenu;

   MenuDto parse(Map<String, dynamic> json) {

    // Veo si vienen actividades
    

    // Oobtengo la mantencion
    return MenuDto(
      idMenu : json['ID'],
      tituloMenu : json['title'],
      iconoMenu : json['attr_title'],
    ); 

  }

  MenuDto.fromJson(Map<dynamic, dynamic> json) :
    idMenu = json['ID'],
    tituloMenu = json['title'],
    iconoMenu = json['attr_title'];

  Map<dynamic, dynamic> toJson() => {
    'ID' : idMenu,
    'title' : tituloMenu,
    'attr_title' : iconoMenu,
  };
  
}