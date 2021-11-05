// ignore_for_file: deprecated_member_use, prefer_const_constructors, unused_import, file_names, unused_field, dead_code

import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:bytebank/main.dart';

class FormularioTransferencia extends StatelessWidget {
  final TextEditingController _controladorCampoNumeroConta =
      TextEditingController();
  final TextEditingController _controladorCampoValor = TextEditingController();

  FormularioTransferencia({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Criando transfêrencia'),
        backgroundColor: Colors.green.shade900,
      ),
      body: Column(
        // ignore: prefer_const_literals_to_create_immutables
        children: <Widget>[
          Editor(
              controlador: _controladorCampoNumeroConta,
              rotulo: 'Numero da Conta',
              dica: '0000.0000.0000.0000',
              icone: Icons.credit_card),
          Editor(
              controlador: _controladorCampoValor,
              rotulo: 'Valor',
              dica: '20.0000,00',
              icone: Icons.monetization_on),
          RaisedButton(
            child: Text('Confirmar'),
            color: Colors.green.shade700,
            onPressed: () => _criaTransferencia(),
          ),
        ],
      ),
    );
  }

  void _criaTransferencia() {
    final double? numeroConta =
        double.tryParse(_controladorCampoNumeroConta.text);
    final int? valor = int.tryParse(_controladorCampoValor.text);
    if (numeroConta != null && valor != null) {
      final transferenciaCriada = Transferencia(numeroConta, valor);
      debugPrint('$transferenciaCriada');
    }
  }
}

class Editor extends StatelessWidget {
  final TextEditingController? controlador;
  final String? rotulo;
  final String? dica;
  final IconData? icone;

  Editor({
    @required this.controlador,
    @required this.rotulo,
    @required this.dica,
    @required this.icone,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(16, 16, 16, 0),
      child: TextField(
        controller: controlador,
        style: TextStyle(
          fontSize: 24,
        ),
        decoration: InputDecoration(
          icon: Icon(
            icone,
            color: Colors.green,
          ),
          labelText: rotulo,
          hintText: dica,
        ),
        keyboardType: TextInputType.number,
      ),
    );
  }
}
