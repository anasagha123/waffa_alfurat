import 'package:flutter/material.dart';
import 'package:waffat_alfurat/components/my_drawer.dart';

class AgentsCorpScreen extends StatelessWidget {
  const AgentsCorpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      drawer: MyDrawer(),
    );
  }
}
