import 'package:bytebank/components/editor.dart';
import 'package:bytebank/models/saldo.dart';
import 'package:bytebank/models/transferencia.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

const _tituloAppBar = 'Criando Transferência';

const _rotuloCampoValor = 'Valor';
const _dicaCampoValor = '0.00';

const _rotuloCampoNumeroConta = 'Número da conta';
const _dicaCampoNumeroConta = '0000';

const _textoBotaoConfirmar = 'Confirmar';

class FormularioDeposito extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return FormularioDepositoState();
  }
}

class FormularioDepositoState extends State<FormularioDeposito> {
  final TextEditingController _controladorCampoNumeroConta =
      TextEditingController();
  final TextEditingController? _controladorCampoValor = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(_tituloAppBar),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Editor(
                controlador: _controladorCampoNumeroConta,
                dica: _dicaCampoNumeroConta,
                rotulo: _rotuloCampoNumeroConta,
              ),
              Editor(
                dica: _dicaCampoValor,
                controlador: _controladorCampoValor,
                rotulo: _rotuloCampoValor,
                icone: Icons.monetization_on,
              ),
              ElevatedButton(
                child: Text(_textoBotaoConfirmar),
                onPressed: () => _criaTransferencia(context),
              ),
            ],
          ),
        ));
  }

  void _criaTransferencia(BuildContext context) {
    //final int numeroConta = int.parse(_controladorCampoNumeroConta.text ?? '0');
    final double valor = double.parse(_controladorCampoValor!.text ?? '0.0');
    // if (numeroConta != null && valor != null) {
    //   final transferenciaCriada = Transferencia(valor, numeroConta);
    //   Navigator.pop(context, transferenciaCriada);
    // }
    final depositoValido = _validaDeposito(valor);

    if(depositoValido){
      _atualizaEstado(context, valor);

      Navigator.pop(context); 
    }

  }

  _validaDeposito(valor){
    final _campoPreenchido = valor != null;
    return _campoPreenchido;
  }

  _atualizaEstado(context, valor){

    Provider.of<Saldo>(context, listen: false).adiciona(valor);

  }


}
