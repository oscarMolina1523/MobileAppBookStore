class Productos{
  final String descripcion;
  final String categoria;
  final String url;
  double precio;

  Productos(
    {
      required this.descripcion,
      required this.categoria,
      required this.url, 
      required this.precio,
    }
  );

  factory Productos.fromJson(Map<String, dynamic> json) {
    return Productos(
      descripcion: json['DescripcionProducto'],
      url: json['UrlProducto'],
      precio: json['PrecioProducto'],
    );
  }
}
