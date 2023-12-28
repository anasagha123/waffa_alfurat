import 'package:flutter/material.dart';
import 'package:waffat_alfurat/components/mini_agent_card.dart';
import 'package:waffat_alfurat/components/my_drawer.dart';

class AgentsCorpScreen extends StatelessWidget {
  const AgentsCorpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      drawer: const MyDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 10,
            mainAxisSpacing: 20,
            childAspectRatio: 0.8,
          ),
          itemCount: 5,
          itemBuilder: (BuildContext context, int index) =>
              const MiniAgentCard(),
        ),
      ),
    );
  }
}
