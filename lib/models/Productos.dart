class Productos {
  final String descripcionProducto;
  final String idCategoria;
  final String id;
  final String? url;

  Productos(
      {required this.descripcionProducto,
      required this.idCategoria,
      required this.id,}): url = imagenesProductos[id];

  factory Productos.fromJson(Map<String, dynamic> json) {
    return Productos(
      descripcionProducto: json['DescripcionProducto'] as String,
      idCategoria: json['IdCategoria'] as String,
      id: json['Id'] as String,
    );
  }

  // Mapa de IDs de productos a sus respectivas URLs de imagen
  static final Map<String, String> imagenesProductos = {
    "fed10621-ce6c-4947-bd5b-0aabf7520ddf": "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRIJBoXEWLvkgc_bXqL1IBj5aVYquZxJIZPgw&s",
    "e2219428-27e2-4726-b0a1-11d8e9a59aa7": "https://walmartni.vtexassets.com/arquivos/ids/258007/Cuaderno-de-resortes-Pen-Gear-80-hojas-rayadas-Modelo-ID11833-2-21900.jpg?v=638089188323070000",
    "951b4ec4-68cd-4532-9b67-132d53e024af": "https://actelgrup.com/wp-content/uploads/2022/03/Actualidad_cat_oct21.png",
    "4bc82d26-3d36-4601-b6df-14b50c34d77b": "https://www.planetadelibros.com/usuaris/libros/fotos/335/original/portada_la-psicologia-del-dinero_morgan-housel_202211080819.jpg",
    "4aa96200-ffe0-4743-a085-1cfdf0ad9684": "https://s1.significados.com/foto/historia-del-arte-og.jpg?class=ogImageWide",
    "3fa85f64-5717-4562-b3fc-2c963f66afa7": "https://images.cdn1.buscalibre.com/fit-in/360x360/f4/04/f404b97e418c7c2b034b3459593245cf.jpg",
    "21757193-3723-4ac5-af0b-3237955e6a7e": "https://andreaga.com/wp-content/uploads/2017/11/materiales.png",
    "bf38274e-98e2-4197-8b5b-38e91ddaab2e": "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR9VNW7q9YRhTUYPPy9JLalQsYNeu1Ddhoc_Q&s",
    "c7eb6def-1f29-457b-b7e2-3d1a84cb155f": "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSN3MtrTAQW_kx6RWOhazx8_5gsAW1x7d3ibQ&s",
    "830a91f2-672a-45d4-8493-43d0b638ebbf": "https://http2.mlstatic.com/D_NQ_NP_640200-MLU71517988099_092023-O.webp",
    "830a91f3-672a-45d4-8493-43d0b638ebbf": "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRCNbbVCqIt3f4oQcsNk9FR1NdESsOtXWPKRg&s",
    "830a91f3-672b-45d4-8493-43d0b638ebbf": "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRBcRzXFsIejMFewWEx36rJUe7eGX1ua7-b3g&s",
    "e3930419-42fe-4784-930a-4dad96023b71": "https://www.comunidadbaratz.com/wp-content/uploads/La-Guerra-de-los-mundos.jpg",
    "87deeb4e-be37-474b-9ff9-5736b9088afc": "https://www.hola.com/horizon/original_aspect_ratio/e3d17acc42ec-los-dioses-del-norte-la-leyenda-del-bosque-de-jara-santamar-a-montena-.jpg",
    "691087f2-ceb0-4c40-ba25-596bce345c5e": "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT-WxpUKddT69bpfB5ZAyZ0WWlTb69Nvdimfg&s",
    "944d066c-93de-4091-9e27-5b99370a530d": "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRqFNqsBnkkow5ZqOU-ht96q0LqczhjwjXTGQ&s",
    "dc542f15-63f3-448d-bc28-5d50715665d5": "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ8NAtzVJBQtjqICEBIZNySlcLaOJYmRHYPfg&s",
    "ab8e0ff4-b32e-4ac3-ac8c-682f2019115c": "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQi18m9ZKA0dufkdKc2FMIUfmYsm-wlubTBHg&s",
    "93bc01fa-6eb8-4c6d-9f00-78e1ad1b9811":
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR0ofawrP9R3o8AsgDQgAlR0Xpg9hxkIrl86g&s",
    "cd24186d-93a3-4dc7-b78f-81c4b4c279b7": "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQtkz6mKNmo_FObD9qa6Nq8uxy1Oc29hwjIRg&s",
    "1f025397-d6f1-44a4-86ed-8bf59ae6e8e0": "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRAcZd2uEAqtzpzg7h1TFYrHNa85pqWoDPOiA&s",
    "971b708d-9598-473f-b01d-8c8cb304cab5": "https://viajes.nationalgeographic.com.es/medio/2023/08/18/viajes-national-geographic-282-ok_662d7560_282_230818093331_1280x1690.jpg",
    "b3b75331-d929-4c5b-83f7-8f8fa05ca33d": "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSGCWEVyQJzw9GjezcvhPtw_HPhJw8butTsRA&s",
    "793c4254-97b8-44e6-a5ad-92088f535402": "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTWoISNG64Ifv9WfcJvk33e1mQRHa-3ktqIGg&s",
    "76c1ced8-1d29-4a66-b05f-92f695a92907": "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRtagmsCwDBOAaqlgnX8_NxMeiKm_IOcap_TQ&s",
    "84ddd6a3-d4b8-4 cd1-91bd-95ec00f8f27d": "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRzFiCkCF84yakjUzNxj1zYOFUoIp9culU4Zg&s",
    "0a91affb-0d39-402f-a8e8-9bc3f460b9f5": "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTafA44OiKcNie0QoA9KDLxjBQrniU_vU_IvQ&s",
    "7a8802fe-170f-42f4-87ea-a8fd2fb89f8f": "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTXGE-_gPoiFlN3pYwCitthkf6QboifJvm7Jw&s",
    "900ea6a8-328e-4731-bbf4-a9249a800675": "https://www.plaintextures.com/resources/thumbnails/textures/walls/plain/white/texture_white_3816/texture_white_3816_1_thumbnail.jpg",
    "a45aefac-3009-400d-99c0-a9c99374dd96":
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRZw6ooccW-GpH161q1NrOGy4wEntPxoOdOtA&s",
    "edcf0168-78bf-4618-b035-ac61c0be6886": "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR4Vb6if2dGS1YyUxvdjRlelbEsj6YNSgSICA&s",
    "0250dff9-bda6-4bc9-8aac-afbf1fada5a2": "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQeT4nxAHzQ5zbirbxBVVHZG3n-qszFkgplNA&s",
    "abd25b5b-ff62-4483-9b28-bfb40a0fd957": "https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEibz2rmHmMvcQcPRX1yN4H8Say0zyrCNk4Q9-mr_5N3N6BBqj8S0UGT1mjRZL9F8jHLd2phULkU8L1GoOQuJehcyzDFY7K5JdEul1x5MKZOo9Qf7kYiA4oxPpfgbMHo5Am7AmzbC7YcCwU/s1600/aventura.jpg",
    "1cd4660a-f200-4e90-824c-c073b071cbe0": "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTFBrZhtojUFE9RkdNdDXsFe_z7VqB75P4btQ&s",
    "62c13620-cbcb-49b6-b37b-c0a46bf30473": "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRVWvVSqkVLE6Pf-EPhtB2dkWLlv6GuBRq5qw&s",
    "cc8d5486-2bbe-4cc8-908e-c44faeff2391":
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRdybTRMoc__PL4e1leog1-DzE-ZtMjlgJ6BA&s",
    "e6fd2097-edd8-4b97-9fd2-cbb7c6cd74db":
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSpxfqn33ytREaMdWOSRPqMwKZ7W-xHyyI6JQ&s",
    "91a08654-8dce-4faf-b3df-d8f6cfb49901": "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTpm_rYe5_oqUFDzFq_xHdijbKEEC0ZJR09Wg&s",
    "c7b6aca2-88bd-4d10-b47e-e2d00f60a2f9": "https://www.artel.cl/wp-content/uploads/2022/04/pintar-con-lapices-de-colores-como-un-profesional.jpg",
    "92dac35d-7987-41c9-9a69-e7e614ebcc3a":
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSnjMhoYwmJTXvnejO-IrW2_XGxJ1NnthZGfA&s",
    "41d256eb-189d-419f-bae5-ea3114df0814":
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRlLHTjnS6rEGXuS0vtWaKepffkMm6k1f-AAw&s",
    "3a7cf0ac-ec9c-4d08-b3a2-eccb0877e23e":
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTJ1Kbxqg1EBED4EolBEV96YO2LEXLqpxXDfw&s",
    "31f26b70-c0b0-4d3f-821e-f002ffd91d7a": "https://i5.walmartimages.com/asr/6e16762d-4591-47a5-b09a-2f913a116451.a69138e19e58785193111e4940a7bcad.jpeg",
    "ed74bb9d-9ab1-4a9f-b9ba-f790dbc8b120": "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSNPj8KnKxosAWhP0F0Rnz4ZZF7io6pUo7Y6w&s",
    "9e432ff5-9053-4c02-b092-fb4840512663": "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSmF3cNXqNUGnq9L2zmdJ1RUhFCLYVCCLAr_A&s",
    "89687ffe-6ad6-4228-a308-fbfb8e3528a9": "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSgdtr_nNVKPC8OSq5txioVtXGLhTNeaget3w&s",
    "f489da6d-2639-42a1-a907-fd3b83d2b090":
        "https://next-ideas-4u.s3.us-east-2.amazonaws.com/blog/formas-de-iniciar-un-negocio-a-partir-de-dos-ideas-de-emprendimientos-originales-8.jpg",
  };

  double obtenerPrecio() {
    switch (idCategoria) {
      case '64ce7c6e-ec42-4875-9c75-146bdae03d34': // Guías de Viaje
        return 70.0;
      case 'f12e99eb-5da0-40c0-bca5-1ab541bd3166': // Novelas Gráficas
        return 90.0;
      case '59981af5-dd87-4feb-a022-28c4efa3f954': // Papelería
        return 60.0;
      case '3fa85f64-5717-4562-b3fc-2c963f66afa6': // Cuadernos
        return 50.0;
      case '6d4fdd01-8c8e-4883-9e24-31080de222d1': // Juegos de Mesa
        return 100.0;
      case '4ab6a671-2013-40e9-b69f-38b85af172e8': // Libros de Ciencia
        return 80.0;
      case '73d01d2e-a508-4779-a750-4517618f3850': // Lapiceros
        return 10.0;
      case '5d593d78-f0c1-437c-b025-4b76c3623acb': // Lápiz de colores
        return 15.0;
      case 'e6348268-d928-4253-8552-4ee1e998f56d': // Libros de Autoayuda
        return 75.0;
      case '33d5dadb-d285-4024-ae98-55952c42f490': // Libros de Historia
        return 85.0;
      case '388298cf-0fbe-4ef3-9dd7-588b067b1109': // Libros de Cocina
        return 65.0;
      case 'f963c523-d1fa-4582-98ab-5b1bc2594637': // Libros de Negocios
        return 95.0;
      case '4f120954-f306-45dd-bb43-5ef698b565d9': // Mochilas
        return 120.0;
      case '99904c30-de92-46b0-b4ac-7a0c3bb41d30': // Libros de Ficción
        return 70.0;
      case 'e90bf4bf-6662-49b3-8f1a-7e8ca576a2cb': // Calendarios
        return 25.0;
      case '3667f5e2-9c1c-420f-8c69-8e03a036382e': // Libros de Psicología
        return 80.0;
      case 'a29ae868-2dc2-437b-ab03-8f66f992ae3f': // Libros de Texto
        return 90.0;
      case 'c25d302f-d87e-4959-b08f-945730439e58': // Cómics
        return 40.0;
      case '8f77c6df-6105-4a91-9a21-9e3188a6e343': // Libros de Fantasía
        return 75.0;
      case 'abc8d216-6f86-424b-acfe-9e3fe46125e5': // Material de Arte
        return 55.0;
      case '065899ab-2613-4b2d-8b6c-a52ab472f853': // Literatura Infantil
        return 30.0;
      case '51c82a45-2fa5-4239-8fc4-ad1bc2c6eaef': // Cartulina
        return 20.0;
      case 'e18a3ca1-f836-4ea2-b0e5-c59e1df14625': // Hojas
        return 5.0;
      case 'bd0f7d85-5597-446c-8ced-d84ced9f9de8': // Libros de No Ficción
        return 85.0;
      case '6ee5fbb6-1c79-4778-b2f0-dcbb884f0fd3': // Accesorios de Oficina
        return 15.0;
      case '4b746182-dca6-482b-b5fb-ead1f711edbc': // Revistas
        return 30.0;
      default:
        return 0.0;
    }
  }
}
