import 'package:flutter/material.dart';

main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Desconto',
      home: MyApp(),
    ));

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var initValueController = TextEditingController();
  var discountController = TextEditingController();
  var percentualController = TextEditingController();
  double result = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Desconto"),
        centerTitle: true,
      ),
      body: Container(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Divider(),
              Text(
                result.toString(),
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30.0,
                ),
              ),
              Divider(),
              buildTextField('Valor inicial', initValueController),
              Divider(),
              buildTextField('Desconto', discountController),
              Divider(),
              buildTextField('Inteiro/decimal', percentualController),
              Divider(),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    result = calcularDesconto(
                        double.parse(initValueController.text),
                        double.parse(discountController.text),
                        int.tryParse(percentualController.text));
                  });
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20.0),
                  child: Text(
                    'Calcular',
                    style: TextStyle(fontSize: 20.0),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

Widget buildTextField(String label, TextEditingController controller) {
  return TextFormField(
    controller: controller,
    decoration: InputDecoration(
      labelText: label,
      labelStyle: TextStyle(color: Colors.blue),
      border: OutlineInputBorder(),
    ),
    style: TextStyle(color: Colors.blue, fontSize: 25.0),
    keyboardType: TextInputType.numberWithOptions(decimal: true)
  );
}

double calcularDesconto(double initValue, double discount, int percentual) {
  if (discount <= 0) {
    throw ArgumentError("O desconto deve ser maior que zero!");
  }
  if (initValue <= 0) {
    throw ArgumentError("O valor inicial deve ser maior que zero!");
  }
  if (percentual != 0) {
    return initValue - (initValue * discount / 100);
  }

  return initValue - discount;
}
