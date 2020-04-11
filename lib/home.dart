import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String _textKey = "Informe acima o seu peso e altura para calcular o IMC";
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController pesoController = TextEditingController();
  TextEditingController alturaController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Calcule o seu IMC"),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.refresh),
              onPressed: () {
                resetValues();
              })
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(30.0, 0, 30.0, 0),
        child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                SizedBox(
                  height: 30,
                ),
                Icon(
                  Icons.people,
                  size: 60.0,
                  color: Colors.blue,
                ),
                SizedBox(
                  height: 30,
                ),
                buildTextFormFieldPeso(),
                SizedBox(
                  height: 30,
                ),
                buildTextFormFieldAltura(),
                SizedBox(
                  height: 50,
                ),
                buildRaisedButtonCalcular(),
                SizedBox(
                  height: 30,
                ),
                buildTextResult()
              ],
            )),
      ),
    );
  }

  buildTextFormFieldPeso() {
    return TextFormField(
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
          labelText: "Digite o seu peso",
          labelStyle: TextStyle(color: Colors.blue, fontSize: 30.0),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25.0),
            borderSide: BorderSide()
          ),
          ),
      controller: pesoController,
      validator: (value) {
        if (value.isEmpty) {
          return "Informe o seu peso";
        }
        return null;
      },
    );
  }

  buildTextFormFieldAltura() {
    return TextFormField(
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
          labelText: "Digite a sua altura",
          labelStyle: TextStyle(color: Colors.blue, fontSize: 30.0),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25.0),
            borderSide: BorderSide()
          )
          
          ),
      controller: alturaController,
      validator: (value) {
        if (value.isEmpty) {
          return "Informe a sua altura";
        }
        return null;
      },
    );
  }

  buildRaisedButtonCalcular() {
    return Container(
      height: 60.0,
      child: RaisedButton(
        onPressed: () {
          if (_formKey.currentState.validate()) {
            calcular();
          }
        },
        color: Colors.blue,
        textColor: Colors.white,
        child: Text(
          "Calcular",
          style: TextStyle(fontSize: 30.0),
        ),
      ),
    );
  }

  buildTextResult() {
    return Text(
      _textKey,
      style: TextStyle(color: Colors.blue, fontSize: 20.0),
    );
  }

  calcular() {
    setState(() {
      double peso = double.parse(pesoController.text);
      double altura = double.parse(alturaController.text) / 100.0;
      double imc = peso / (altura * altura);

      if (imc < 10.0) {
        return _textKey =
            "Seu imc é (${imc.toStringAsFixed(3)})\n\n Desnutrição grau V";
      } else if (imc == 10.0 && imc <= 12.9) {
        return _textKey =
            "Seu imc é (${imc.toStringAsFixed(3)})\n\n Desnutrição grau IV";
      } else if (imc == 13.0 && imc <= 15.9) {
        return _textKey =
            "Seu imc é (${imc.toStringAsFixed(3)})\n\n Desnutrição grau III";
      } else if (imc == 16.0 && imc <= 16.9) {
        return _textKey =
            "Seu imc é (${imc.toStringAsFixed(3)})\n\n Desnutrição grau II";
      } else if (imc == 17.0 && imc <= 18.4) {
        return _textKey =
            "Seu imc é (${imc.toStringAsFixed(3)})\n\n Desnutrição grau I";
      } else if (imc == 18.5 && imc <= 24.9) {
        return _textKey = "Seu imc é (${imc.toStringAsFixed(3)})\n\n Normal";
      } else if (imc == 25.0 && imc <= 29.9) {
        return _textKey =
            "Seu imc é (${imc.toStringAsFixed(3)})\n\n Pré Obesidade";
      } else if (imc == 30.0 && imc <= 34.5) {
        return _textKey =
            "Seu imc é (${imc.toStringAsFixed(3)})\n\n Obesidade grau I";
      } else if (imc == 35.0 && imc <= 39.9) {
        return _textKey =
            "Seu imc é (${imc.toStringAsFixed(3)})\n\n Obesidade grau II";
      } else if (imc > 40.0) {
        return _textKey =
            "Seu imc é (${imc.toStringAsFixed(3)})\n\n Obesidade grau III";
      }
      return _textKey =
          "Desculpe! Ocorreu um erro digite novamente seu peso e altura para calcularmos o seu imc";
    });
  }

  void resetValues() {
    _textKey = "Informe os seus dados";
    pesoController.text = "";
    alturaController.text = "";
  }
}
