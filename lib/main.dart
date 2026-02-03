import 'package:flutter/material.dart';
import 'package:flutter_flip_card_view/flutter_flip_card_view.dart';
import 'package:flutter_flip_card_view/src/flip_direction.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flip Card Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.yellow.shade500),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flip Card View'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  FlipDirection selectedDirection = FlipDirection.horizontal;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [

          // -------- Direction Selector --------
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ChoiceChip(
                label: Text("Horizontal"),
                selected: selectedDirection == FlipDirection.horizontal,
                onSelected: (val) {
                  setState(() {
                    selectedDirection = FlipDirection.horizontal;
                  });
                },
              ),
              const SizedBox(width: 12),
              ChoiceChip(
                label: Text("Vertical"),
                selected: selectedDirection == FlipDirection.vertical,
                onSelected: (val) {
                  setState(() {
                    selectedDirection = FlipDirection.vertical;
                  });
                },
              ),
            ],
          ),

          const SizedBox(height: 30),

          // -------- Flip Card --------
          Center(
            child: FlipCardView(
              direction: selectedDirection,
              front: Card(
                elevation: 10,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                child: SizedBox(
                  width: 220,
                  height: 300,
                  child: Center(
                    child: Text(
                      "FRONT",
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
              back: Card(
                elevation: 10,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                child: SizedBox(
                  width: 220,
                  height: 300,
                  child: Center(
                    child: Text(
                      "BACK",
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
