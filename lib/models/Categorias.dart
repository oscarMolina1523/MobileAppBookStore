class Categoria {
  final String descripcion;
  final bool estado;
  final String id;

  Categoria({required this.descripcion, required this.estado, required this.id});

  factory Categoria.fromJson(Map<String, dynamic> json) {
    return Categoria(
      descripcion: json['Descripcion'],
      estado: json['Estado'],
      id: json['Id'],
    );
  }
}