import 'package:app/widgets/app_drawer.dart';
import 'package:flutter/material.dart';

class DesignSystem extends StatelessWidget {
  const DesignSystem({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      drawer: const AppDrawer(),
      body: Container(
        child: const Column(
          children: [Text('Titulo 1')],
        ),
      ),
    );
  }
}
