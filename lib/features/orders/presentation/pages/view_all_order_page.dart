import 'package:flutter/material.dart';

class ViewAllOrderPage extends StatelessWidget {
  const ViewAllOrderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('All Orders')),
      body: const Center(child: Text('All Orders')),
    );
  }
}
