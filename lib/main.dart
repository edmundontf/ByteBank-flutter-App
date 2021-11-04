// ignore_for_file: prefer_const_constructors, unused_import, deprecated_member_use

//import 'package:bytebank/ListaTransferencias.dart';
import 'package:flutter/material.dart';

import 'HomePage.dart';

void main() => runApp(BytebankApp());

class BytebankApp extends StatelessWidget {
  const BytebankApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: FormularioTransferencia(),
      ),
    );
  }
}

class Transferencia {
  final double valor;
  final int numConta;

  Transferencia(this.valor, this.numConta);

  String toString() {
    return 'Transferencia{valor: $valor, numConta: $numConta}';
  }
}
