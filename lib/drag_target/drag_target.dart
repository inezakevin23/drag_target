import 'package:flutter/material.dart';

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('DragTarget presentation'),
        backgroundColor: Colors.blueAccent,
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // 1. THE DRAGGABLE DOG
          Center(
            child: Draggable<String>(
              data: 'dog',
              feedback: Material(
                color: Colors.transparent,
                child: Image.asset('assets/dog.jpg', height: 150),
              ),
              child: Image.asset('assets/dog.jpg', height: 150),
            ),
          ),

          const SizedBox(height: 50),

          // 2. THE DOG DRAG TARGET
          Center(
            child: DragTarget<String>(
              onWillAcceptWithDetails: (details) => details.data == 'dog',
              onAcceptWithDetails: (details) {},
              builder: (context, candidateData, rejectedData) {
                return Container(
                  height: 120,
                  width: 200,
                  color: Colors.grey,
                  child: const Center(
                    child: Text(
                      'Drop Dog Here!',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
