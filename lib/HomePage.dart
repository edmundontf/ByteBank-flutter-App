// ignore_for_file: deprecated_member_use, prefer_const_constructors, unused_import, file_names, unused_field

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
          Editor(_controladorCampoNumeroConta, 'Numero da Conta', '000'),
          Padding(
            padding: EdgeInsets.fromLTRB(16, 16, 16, 0),
            child: TextField(
              controller: _controladorCampoValor,
              style: TextStyle(
                fontSize: 24,
              ),
              decoration: InputDecoration(
                icon: Icon(Icons.monetization_on, color: Colors.green),
                labelText: 'Valor',
                hintText: '0000',
              ),
              keyboardType: TextInputType.number,
            ),
          ),
          RaisedButton(
            child: Text('Confirmar'),
            color: Colors.green.shade700,
            onPressed: () {
              final int? numeroConta =
                  int.tryParse(_controladorCampoNumeroConta.text);
              final double? valor =
                  double.tryParse(_controladorCampoValor.text);
              if (numeroConta != null && valor != null) {
                final transferenciaCriada = Transferencia(valor, numeroConta);
                Scaffold.of(context).showSnackBar(
                  SnackBar(
                    content: Text('$transferenciaCriada'),
                  ),
                );
              }
            },
          ),
        ],
      ),
    );
  }
}

class Editor extends StatelessWidget {
  final TextEditingController _controlador;
  final String _rotulo;
  final String _dica;
  final String _rotuloValor = "Valor";
  final String _dicaValor = "000";

  Editor(this._controlador, this._rotulo, this._dica);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(16, 16, 16, 0),
      child: TextField(
        controller: _controlador,
        style: TextStyle(
          fontSize: 24,
        ),
        decoration: InputDecoration(
          icon: Icon(Icons.credit_card, color: Colors.green),
          labelText: _rotulo,
          hintText: _dica,
        ),
        keyboardType: TextInputType.number,
      ),
    );
  }
}
