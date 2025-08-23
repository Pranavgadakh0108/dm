import 'package:dmboss/data/appdata.dart';
import 'package:dmboss/ui/game/game_list_screen.dart';
import 'package:dmboss/ui/my_wallet_screen.dart';
import 'package:dmboss/widgets/blinking_container.dart';
import 'package:dmboss/util/make_call.dart';
import 'package:dmboss/widgets/game_card.dart';
import 'package:dmboss/util/make_whatsapp_chat.dart';
import 'package:dmboss/widgets/market_close_popup.dart';
import 'package:dmboss/widgets/menu.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(236, 255, 255, 255),
      drawer: AppDrawer(username: 'Rudra 2', phoneNumber: '9763292525'),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        leading: Builder(
          builder: (context) => IconButton(
            icon: const Icon(Icons.menu, color: Colors.black, size: 30),
            onPressed: () => Scaffold.of(context).openDrawer(),
          ),
        ),
        title: Row(
          children: [
            ClipOval(
              child: Image.asset(
                "assets/images/dmbossLogo.png",
                height: 35,
                width: 35,
              ),
            ),
            const SizedBox(width: 4),
            const Text(
              "DM Boss",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black,
                fontSize: 18,
              ),
            ),
          ],
        ),
        actions: [
          IconButton(onPressed: (){}, icon: Icon(Icons.access_time, color: Colors.pink,)),
          IconButton(onPressed: (){}, icon: Icon(Icons.notifications_active, color: Colors.pinkAccent,)),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MyWalletScreen()),
              );
            },
            child: Row(
              children: [
                const Icon(Icons.wallet_outlined, color: Colors.black),
                const SizedBox(width: 4),
                const Text(
                  "24897",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(width: 12),
              ],
            ),
          ),
        ],
      ),

      body: SingleChildScrollView(
        child: Column(
          children: [
            // Advertisement section
            Column(
              children: [
                BlinkingTextContainer(),
                Image.asset(
                  "assets/images/advertise.jpeg",
                  fit: BoxFit.cover,
                  width: double.infinity,
                ),
                Container(
                  color: const Color.fromARGB(235, 238, 237, 237),
                  //padding: const EdgeInsets.symmetric(vertical: 10),
                  padding: EdgeInsets.symmetric(
                    vertical: MediaQuery.of(context).size.height * 0.01,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      GestureDetector(
                        onTap: () => makePhoneCall("+919888395353"),
                        child: Row(
                          children: const [
                            Icon(
                              FontAwesomeIcons.squarePhone,
                              size: 35,
                              color: Colors.lightBlue,
                            ),
                            SizedBox(width: 5),
                            Text(
                              "9888395353",
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 15,
                              ),
                            ),
                          ],
                        ),
                      ),
                      GestureDetector(
                        onTap: () => openWhatsApp("+919888195353"),
                        child: Row(
                          children: const [
                            Icon(
                              FontAwesomeIcons.squareWhatsapp,
                              size: 35,
                              color: Colors.green,
                            ),
                            SizedBox(width: 5),
                            Text(
                              "9888195353",
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 15,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),

            // Games List (Now non-scrollable)
            Column(
              children: games
                  .map(
                    (game) => GestureDetector(
                      onTap: () {
                        if (game["buttonText"] == "Closed Now") {
                          showMarketCloseDialog(context);
                        } else {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => GameListScreen(
                                title: game["title"],
                                openTime: game["openTime"],
                                closeTime: game["closeTime"],
                              ),
                            ),
                          );
                        }
                      },
                      child: GameCard(
                        title: game["title"],
                        numbers: game["numbers"],
                        statusText: game["statusText"],
                        statusColor: game["statusColor"],
                        buttonText: game["buttonText"],
                        buttonColor: game["buttonColor"],
                        openTime: game["openTime"],
                        closeTime: game["closeTime"],
                      ),
                    ),
                  )
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }
}
