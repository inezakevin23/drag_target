import 'package:flutter/material.dart';

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  String cowTargetText = "Drop Cow Here!";
  String dogTargetText = "Drop Dog Here!";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('DragTarget presenation'),
        backgroundColor: Colors.blueAccent,
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // 1. THE DRAGGABLE ITEMS
          Row(
            children: [
              Expanded(
                child: Draggable<String>(
                  data: 'cow',
                  feedback: Image.asset('assets/cow.jpg', height: 150),
                  child: Image.asset('assets/cow.jpg', height: 150),
                ),
              ),
              Expanded(
                child: Draggable<String>(
                  data: 'dog',
                  feedback: Image.asset('assets/dog.jpg', height: 150),
                  child: Image.asset('assets/dog.jpg', height: 150),
                ),
              ),
            ],
          ),
          const SizedBox(height: 50),

          // 2. THE DRAG TARGETS
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              // Cow Target
              DragTarget<String>(
                onWillAcceptWithDetails: (details) => details.data == 'cow',
                onAcceptWithDetails: (details) {
                  setState(() => cowTargetText = "Success: Cow Dropped!");
                },
                builder: (context, candidateData, rejectedData) => Container(
                  height: 100,
                  width: 150,
                  color: Colors.brown.shade100,
                  child: Center(child: Text(cowTargetText)),
                ),
              ),

              // Dog Target
              DragTarget<String>(
                onWillAcceptWithDetails: (details) => details.data == 'dog',
                onAcceptWithDetails: (details) {
                  setState(() => dogTargetText = "Success: Dog Dropped!");
                },
                builder: (context, candidateData, rejectedData) => Container(
                  height: 100,
                  width: 150,
                  color: Colors.amberAccent,
                  child: Center(child: Text(dogTargetText)),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
