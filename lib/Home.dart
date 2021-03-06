import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController _controllerAlcool = TextEditingController();
  TextEditingController _controllerGasoline = TextEditingController();
  String _textoResultado = " ";

  void _calcular() {
    double precoAlcool = double.tryParse(_controllerAlcool.text);
    double precoGasoline = double.tryParse(_controllerGasoline.text);

    if (precoAlcool == null || precoGasoline == null) {
      setState(() {
        _textoResultado = "Numero Invalido, digite números maiores que zero";
      });
    } else {
      if ((precoAlcool / precoGasoline) >= 0.7) {
        setState(() {
          _textoResultado = "Melhor abastecer com gasolina";
        });
      } else {
        setState(() {
          _textoResultado = "Melhor Abastecer com Alcool";
        });
      }
      _limparCampos();
    }
  }

  void _limparCampos(){
    _controllerGasoline.text = " ";
    _controllerAlcool.text = " ";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Alcool ou Gasolina"),
        backgroundColor: Colors.blue,
      ),
      body: Container(
          child: SingleChildScrollView(
        padding: EdgeInsets.all(32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            //Padding Image
            Padding(
                padding: EdgeInsets.only(bottom: 32),
                child: Image.asset("Images/logo.png")),

            //Pagging Frase
            Padding(
              padding: EdgeInsets.only(bottom: 10),
              child: Text(
                "Saiba Qual a melhor maneira de abastecimento para seu carro",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            //TextField Gasolina
            TextField(
              keyboardType: TextInputType.number,
              decoration:
                  InputDecoration(labelText: "Preço do Alcool, ex:1.59"),
              style: TextStyle(
                fontSize: 22,
              ),
              controller: _controllerAlcool,
            ),

            //TextField Alcool
            TextField(
              keyboardType: TextInputType.number,
              decoration:
                  InputDecoration(labelText: "Preço do Gasolina, ex:1.59"),
              style: TextStyle(
                fontSize: 22,
              ),
              controller: _controllerGasoline,
            ),

            //Botão "Calcular"
            Padding(
              padding: EdgeInsets.only(top: 10),
              // ignore: deprecated_member_use
              child: RaisedButton(
                  color: Colors.blue,
                  textColor: Colors.white,
                  padding: EdgeInsets.all(15),
                  child: Text("Calcular",
                      style: TextStyle(
                        fontSize: 20,
                      )),
                  onPressed: _calcular),
            ),

            Padding(
              padding: EdgeInsets.only(top: 20),
              child: Text(_textoResultado,
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            )
          ],
        ),
      )),
    );
  }
}
