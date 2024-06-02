import 'package:flutter/material.dart';
import 'package:psy_field/widgets/custom_text_field.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomTextField(),
            const SizedBox(height: 10),
            TextField(),
            const SizedBox(height: 10),

          ],
        ),
      ),
    );
  }
}
