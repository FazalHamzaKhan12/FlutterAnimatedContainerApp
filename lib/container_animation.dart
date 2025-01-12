import 'dart:math';
import 'package:flutter/material.dart';

class ContainerAnimation extends StatefulWidget {
  const ContainerAnimation({Key? key}) : super(key: key);

  @override
  State<ContainerAnimation> createState() => _ContainerAnimationState();
}

class _ContainerAnimationState extends State<ContainerAnimation> {
  final random = Random();
  double boxHeight = 100;
  double boxWidth = 100;
  Color boxColor = Colors.yellow;
  BorderRadius borderRadius = BorderRadius.circular(8);

  void _randomizeContainer() {
    setState(() {
      boxWidth = random.nextDouble() * 250 + 50; // Width: 50-300
      boxHeight = random.nextDouble() * 250 + 50; // Height: 50-300
      boxColor = Color.fromRGBO(
        random.nextInt(256),
        random.nextInt(256),
        random.nextInt(256),
        1,
      );
      borderRadius = BorderRadius.circular(random.nextDouble() * 100); // Radius: 0-100
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Animated Container"),
        centerTitle: true,
      ),
      bottomNavigationBar: ElevatedButton.icon(
        onPressed: _randomizeContainer,
        icon: const Icon(Icons.refresh),
        label: const Text("Randomize"),
        style: ElevatedButton.styleFrom(padding: const EdgeInsets.all(16)),
      ),
      body: Center(
        child: AnimatedContainer(
          duration: const Duration(seconds: 1),
          curve: Curves.fastOutSlowIn,
          width: boxWidth,
          height: boxHeight,
          decoration: BoxDecoration(
            color: boxColor,
            borderRadius: borderRadius,
          ),
        ),
      ),
    );
  }
}
