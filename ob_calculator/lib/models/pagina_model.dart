import 'package:flutter/material.dart';

class Pagina {
  final Icon? iconoPagina;
  final String nombrePagina;
  final StatefulWidget pathPagina;
  final String? subtitulo;
  Pagina(
      {required this.nombrePagina,
      required this.subtitulo,
      required this.iconoPagina,
      required this.pathPagina});
}
