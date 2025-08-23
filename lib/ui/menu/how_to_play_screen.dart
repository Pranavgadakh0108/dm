import 'package:dmboss/data/appdata.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class HowToPlayScreen extends StatelessWidget {
  const HowToPlayScreen({super.key});

  Future<void> _launchUrl(String url) async {
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      throw Exception('Could not launch $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.orange,
        elevation: 3,
        title: const Text(
          "How To Play",
          style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        //padding: const EdgeInsets.all(12.0),
        padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.03),
        child: SingleChildScrollView(
          child: Column(
            children: items.map((item) {
              return GestureDetector(
                onTap: () => _launchUrl(item['url']!),
                child: Container(
                  margin: const EdgeInsets.symmetric(vertical: 15),
                  padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey,
                        blurRadius: 6,
                        spreadRadius: 1,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      Container(
                        width: 45,
                        height: 45,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          gradient: LinearGradient(
                            colors: [Colors.redAccent, Colors.red],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                        ),
                        child: const Icon(Icons.play_arrow, color: Colors.white, size: 32),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Text(
                          item['title']!,
                          style: const TextStyle(
                            color: Color.fromARGB(209, 20, 88, 144),
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}