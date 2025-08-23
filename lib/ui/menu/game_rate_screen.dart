import 'package:dmboss/data/appdata.dart';
import 'package:flutter/material.dart';

class GameRateScreen extends StatelessWidget {
  const GameRateScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.orange,
        elevation: 3,
        title: const Text(
          "Game Rate",
          style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: ListView.builder(
        //padding: EdgeInsets.only(top: 15, left: 30, right: 30, bottom: 60),
        padding: EdgeInsets.only(
          top: MediaQuery.of(context).size.height * 0.02,
          left: MediaQuery.of(context).size.width * 0.075,
          right: MediaQuery.of(context).size.width * 0.075,
          bottom: MediaQuery.of(context).size.height * 0.075,
        ),
        itemCount: gameRates.length,
        itemBuilder: (context, index) {
          return Container(
            margin: EdgeInsets.symmetric(vertical: 6),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 6,
                  spreadRadius: 3,
                  offset: Offset(0, 3),
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Center(
                child: Text(
                  gameRates[index],
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
