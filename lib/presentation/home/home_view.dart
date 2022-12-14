import 'package:flutter/material.dart';

import '../../models/profile.dart';
import '../../router/routes.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        leading: const BackButton(color: Colors.white),
      ),
      body: Column(
        children: [
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pushNamed(
                '${Routes.home}2',
                arguments: Profile(id: '2', name: 'asdd'),
              );
            },
            child: const Text('View 1'),
          ),
          const Card(
            child: Padding(
              padding: EdgeInsets.all(24),
              child: Text('data'),
            ),
          ),
        ],
      ),
    );
  }
}
