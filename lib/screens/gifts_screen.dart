import 'package:flutter/material.dart';
import 'package:waffat_alfurat/components/my_drawer.dart';

class GiftsScreen extends StatelessWidget {
  const GiftsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      drawer: const MyDrawer(),
    );
  }
}
