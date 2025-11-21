import 'package:flutter/material.dart';
import 'pages/cart_home_page.dart';

void main() {
  runApp(const FlowCashApp());
}

class FlowCashApp extends StatelessWidget {
  const FlowCashApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FlowCash - Aplikasi Kasir',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const CartHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
