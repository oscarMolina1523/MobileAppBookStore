class Productos{
  final String descripcion;

  final String? url;

  double precio;

  Productos(
    {
      required this.descripcion,
      this.url, 
      required this.precio,
    }
  );
}

