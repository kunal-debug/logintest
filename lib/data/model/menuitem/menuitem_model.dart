class MenuItem {
  final String menuId;
  final String menuName;
  final String? parentMenuId;

  MenuItem({
    required this.menuId,
    required this.menuName,
    this.parentMenuId,
  });

  // Factory constructor to create a MenuItem from JSON
  factory MenuItem.fromJson(Map<String, dynamic> json) {
    return MenuItem(
      menuId: json['menu_id'],
      menuName: json['menu_name'],
      parentMenuId: json['parent_menu_id'],
    );
  }

  // Method to convert MenuItem to JSON
  Map<String, dynamic> toJson() {
    return {
      'menu_id': menuId,
      'menu_name': menuName,
      'parent_menu_id': parentMenuId,
    };
  }
}
