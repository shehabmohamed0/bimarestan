import 'package:flutter/material.dart';

class SurgeryBookingView extends StatelessWidget {
  const SurgeryBookingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Surgery Booking'),
        leading: const BackButton(
          color: Colors.white,
        ),
      ),
    );
  }
}
