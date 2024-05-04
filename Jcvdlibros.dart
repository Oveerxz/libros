import 'dart:io';

class Libro {
  String titulo;
  String autor;
  double precio;
  int cantidadStock;

  Libro(this.titulo, this.autor, this.precio, this.cantidadStock);

  double comprar(int cantidadComprar) {
    if (cantidadComprar > cantidadStock) {
      print('No hay suficiente stock disponible.');
      return 0;
    } else {
      cantidadStock -= cantidadComprar;
      double precioTotal = cantidadComprar * precio;
      print(
          'Compra realizada. $cantidadComprar copias de "$titulo" han sido compradas.');
      print('Precio total: \$${precioTotal.toStringAsFixed(2)}');
      mostrarInformacion();
      return precioTotal;
    }
  }

  void mostrarInformacion() {
    print('Información del libro:');
    print('Título: $titulo');
    print('Autor: $autor');
    print('Precio: \$${precio.toStringAsFixed(2)}');
    print('Cantidad en stock: $cantidadStock');
  }
}

void main() {
  List<Libro> libros = [
    Libro('El Alquimista', 'Paulo Coelho', 15000, 50),
    Libro('Cien años de soledad', 'Gabriel Garcia Marquez', 20000, 30),
    Libro('Don Quijote de la Mancha', 'Miguel de Cervantes', 30000, 20),
    Libro('1984', 'George Orwell', 30000, 45)
  ];

  print('Libros disponibles:');
  for (int i = 0; i < libros.length; i++) {
    print('\nLibro ${i + 1}:');
    libros[i].mostrarInformacion();
  }

  double precioTotal = 0;
  print('\n¿Desea comprar algun libro? (Si/No)');
  String respuesta = stdin.readLineSync()!.toLowerCase();
  while (respuesta == 'si' || respuesta == 'si') {
    print(
        'Ingrese el numero del libro que desea comprar (1-${libros.length}):');
    int numLibro = int.parse(stdin.readLineSync()!);
    if (numLibro >= 1 && numLibro <= libros.length) {
      Libro libroSeleccionado = libros[numLibro - 1];
      print('Ingrese la cantidad de copias que desea comprar:');
      int cantidadComprar = int.parse(stdin.readLineSync()!);
      double precioCompra = libroSeleccionado.comprar(cantidadComprar);
      precioTotal += precioCompra;
    } else {
      print('Numero de libro invalido.');
    }

    print('\n¿Desea comprar algun otro libro? (Si/No)');
    respuesta = stdin.readLineSync()!.toLowerCase();
  }

  print(
      '\nEl precio total de su compra es: \$${precioTotal.toStringAsFixed(2)}');
  print('¿Desea realizar la compra por este valor? (Si/No)');
  String confirmacion = stdin.readLineSync()!.toLowerCase();
  if (confirmacion == 'si' || confirmacion == 'si') {
    print('Compra realizada. Gracias por su copmra!');
  } else {
    print('Compra cancelada. Esperamos volver a verte');
  }
}
