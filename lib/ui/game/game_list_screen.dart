// ignore_for_file: non_constant_identifier_names

import 'package:dmboss/data/appdata.dart';
import 'package:dmboss/ui/game/game_detail_screen1.dart';
import 'package:dmboss/ui/game/game_detail_screen2.dart';
import 'package:dmboss/ui/game/game_detail_screen3.dart';
import 'package:dmboss/widgets/game_list_card.dart';
import 'package:flutter/material.dart';

class GameListScreen extends StatelessWidget {
  final String title, openTime, closeTime;
  const GameListScreen({
    super.key,
    required this.title,
    required this.openTime,
    required this.closeTime,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: Text(
          title,
          style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 10),
            child: Center(
              child: Text(
                "$openTime - $closeTime ",
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
              ),
            ),
          ),
        ],
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3, // 3 items in a row
            crossAxisSpacing: 15,
            mainAxisSpacing: 15,
            childAspectRatio: 0.9,
          ),
          itemCount: gameList.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                if (gameList[index]['title'] == "Half Sangam" ||
                    gameList[index]['title'] == "Full Sangam") {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => GameDetailScreen2(
                        title: gameList[index]['title'],
                        gameName: title,
                      ),
                    ),
                  );
                } else if (gameList[index]['title'] == "Bulk Jodi" ||
                    gameList[index]['title'] == "Bulk SP" ||
                    gameList[index]['title'] == "Bulk DP") {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          GameDetailScreen3(title: gameList[index]['title']),
                    ),
                  );
                } else {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => GameDetailScreen1(
                        title: gameList[index]['title'],
                        gameName: title,
                      ),
                    ),
                  );
                }
              },
              child: GameListCard(
                title: gameList[index]["title"],
                icon: gameList[index]["icon"],
              ),
            );
          },
        ),
      ),
    );
  }
}
