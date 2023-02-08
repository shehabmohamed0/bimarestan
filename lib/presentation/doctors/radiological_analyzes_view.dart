import 'package:flutter/material.dart';

class RadiologicalAnalyzesView extends StatelessWidget {
  const RadiologicalAnalyzesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Radiological Analyzes'),
        leading: const BackButton(
          color: Colors.white,
        ),
      ),
    );
  }
}
