import 'package:bimarestan/models/profile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'home_view_model2.dart';

class HomeView2 extends StatelessWidget {
  const HomeView2({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text('Home2'),
      ),
      body: Consumer<HomeViewModel2>(
        builder: (context, model, child) => Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: model.increment,
                  icon: const Icon(Icons.add),
                ),
                Text(
                  model.counter.toString(),
                ),
                IconButton(
                  onPressed: model.decrement,
                  icon: const Icon(Icons.remove),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
