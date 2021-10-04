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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Desconto"),
        centerTitle: true,
      ),
      body: Container(),
    );
  }
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
