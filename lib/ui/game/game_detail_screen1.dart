// import 'package:dmboss/ui/game/widgets/add_button.dart';
// import 'package:dmboss/ui/game/widgets/custom_textfield_screen1.dart';
// import 'package:dmboss/ui/game/widgets/date_container.dart';
// import 'package:dmboss/ui/game/widgets/submit_button.dart';
// import 'package:flutter/material.dart';

// class GameDetailScreen1 extends StatefulWidget {
//   final String title;
//   final String gameName;

//   const GameDetailScreen1({
//     super.key,
//     required this.title,
//     required this.gameName,
//   });
//   @override
//   State<GameDetailScreen1> createState() => _GameDetailScreen1State();
// }

// class _GameDetailScreen1State extends State<GameDetailScreen1> {
//   final TextEditingController _digitController = TextEditingController();
//   final TextEditingController _pointsController = TextEditingController();

//   bool _digitError = false;
//   bool _pointsError = false;

//   List<Map<String, String>> bids = [];

//   void _addBid() {
//     setState(() {
//       _digitError = _digitController.text.isEmpty;
//       _pointsError = _pointsController.text.isEmpty;

//       if (!_digitError && !_pointsError) {
//         bids.add({
//           'digit': _digitController.text,
//           'points': _pointsController.text,
//           'type': 'OPEN',
//         });
//         _digitController.clear();
//         _pointsController.clear();
//       }
//     });
//   }

//   void _deleteBid(int index) {
//     setState(() {
//       bids.removeAt(index);
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         backgroundColor: Colors.orange,
//         title: Text(
//           widget.title,
//           style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
//         ),
//         leading: IconButton(
//           icon: const Icon(Icons.arrow_back_ios),
//           onPressed: () {
//             Navigator.pop(context);
//           },
//         ),
//         actions: [
//           Container(
//             margin: const EdgeInsets.all(10),
//             // padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
//             padding: EdgeInsets.symmetric(
//               horizontal: MediaQuery.of(context).size.width * 0.02,
//               vertical: MediaQuery.of(context).size.height * 0.006,
//             ),
//             decoration: BoxDecoration(
//               color: Colors.white,
//               borderRadius: BorderRadius.circular(30),
//             ),
//             child: Row(
//               children: const [
//                 Icon(Icons.wallet, color: Colors.black),
//                 SizedBox(width: 5),
//                 Text("24897", style: TextStyle(fontWeight: FontWeight.bold)),
//               ],
//             ),
//           ),
//         ],
//       ),
//       body: Padding(
//         // padding: const EdgeInsets.all(15),
//         padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.04),
//         child: Column(
//           children: [
//             // Date and Game Name
//             Row(
//               children: [
//                 Expanded(child: DateContainer()),
//                 const SizedBox(width: 10),
//                 Expanded(
//                   child: Container(
//                     padding: const EdgeInsets.all(12),
//                     decoration: BoxDecoration(
//                       border: Border.all(color: Colors.orange, width: 2),
//                       borderRadius: BorderRadius.circular(10),
//                     ),
//                     child: Center(
//                       child: Text(
//                         widget.gameName,
//                         style: const TextStyle(
//                           fontWeight: FontWeight.bold,
//                           fontSize: 14,
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//             const SizedBox(height: 15),

//             // Bid Digits
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 SizedBox(width: 10),
//                 Text(
//                   "Bid Digits: ",
//                   style: TextStyle(fontWeight: FontWeight.w600),
//                 ),
//                 SizedBox(width: 50),
//                 Expanded(
//                   child: CustomTextfieldScreen1(
//                     controller: _digitController,
//                     hintText: "Enter Digit",
//                     suffixIcon: _digitError
//                         ? Builder(
//                             builder: (context) {
//                               final GlobalKey<TooltipState> tooltipKey =
//                                   GlobalKey<TooltipState>();
//                               return Tooltip(
//                                 key: tooltipKey,
//                                 message: "Please Enter Digit",
//                                 triggerMode: TooltipTriggerMode
//                                     .manual, // Disable automatic triggers
//                                 child: IconButton(
//                                   onPressed: () {
//                                     tooltipKey.currentState
//                                         ?.ensureTooltipVisible();
//                                     // Hide after 2 seconds
//                                     Future.delayed(
//                                       const Duration(seconds: 2),
//                                       () {
//                                         if (tooltipKey.currentState?.mounted ??
//                                             false) {
//                                           tooltipKey.currentState?.deactivate();
//                                         }
//                                       },
//                                     );
//                                   },
//                                   icon: const Icon(
//                                     Icons.error,
//                                     color: Colors.red,
//                                   ),
//                                 ),
//                               );
//                             },
//                           )
//                         : null,
//                   ),
//                 ),
//               ],
//             ),
//             const SizedBox(height: 10),

//             // Bid Points
//             Row(
//               children: [
//                 SizedBox(width: 10),
//                 Text(
//                   "Bid Points: ",
//                   style: TextStyle(fontWeight: FontWeight.w600),
//                 ),
//                 SizedBox(width: 47),
//                 Expanded(
//                   child: CustomTextfieldScreen1(
//                     controller: _pointsController,
//                     hintText: "Enter Amount",
//                     suffixIcon: _pointsError
//                         ? Builder(
//                             builder: (context) {
//                               final GlobalKey<TooltipState> tooltipKey =
//                                   GlobalKey<TooltipState>();
//                               return Tooltip(
//                                 key: tooltipKey,
//                                 message: "Please Enter Amount",
//                                 triggerMode: TooltipTriggerMode
//                                     .manual, // Disable automatic triggers
//                                 child: IconButton(
//                                   onPressed: () {
//                                     tooltipKey.currentState
//                                         ?.ensureTooltipVisible();
//                                     // Hide after 2 seconds
//                                     Future.delayed(
//                                       const Duration(seconds: 2),
//                                       () {
//                                         if (tooltipKey.currentState?.mounted ??
//                                             false) {
//                                           tooltipKey.currentState?.deactivate();
//                                         }
//                                       },
//                                     );
//                                   },
//                                   icon: const Icon(
//                                     Icons.error,
//                                     color: Colors.red,
//                                   ),
//                                 ),
//                               );
//                             },
//                           )
//                         : null,
//                   ),
//                 ),
//               ],
//             ),

//             const SizedBox(height: 15),

//             // Add Bid Button
//             AddButton(data: "ADD BID", onPressed: _addBid),
//             const SizedBox(height: 15),

//             // Bid List Table
//             Expanded(
//               child: Container(
//                 decoration: BoxDecoration(
//                   border: Border.all(color: Colors.orange, width: 2),
//                   borderRadius: BorderRadius.circular(10),
//                 ),
//                 child: Column(
//                   children: [
//                     Container(
//                       padding: const EdgeInsets.symmetric(
//                         vertical: 8,
//                         horizontal: 10,
//                       ),
//                       child: Padding(
//                         padding: const EdgeInsets.only(top: 8),
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: const [
//                             Expanded(
//                               child: Text("Digit", textAlign: TextAlign.center),
//                             ),
//                             Expanded(
//                               child: Text(
//                                 "Amount",
//                                 textAlign: TextAlign.center,
//                               ),
//                             ),
//                             Expanded(
//                               child: Text(
//                                 "Game type",
//                                 textAlign: TextAlign.center,
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                     Padding(
//                       // padding: const EdgeInsets.all(8.0),
//                       padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.02),
//                       child: const Divider(height: 1, color: Colors.black),
//                     ),
//                     Expanded(
//                       child: ListView.builder(
//                         itemCount: bids.length,
//                         itemBuilder: (context, index) {
//                           return Padding(
//                             padding: const EdgeInsets.all(8.0),
//                             child: Container(
//                               decoration: BoxDecoration(
//                                 color: Colors.white,
//                                 borderRadius: BorderRadius.circular(10),
//                                 boxShadow: [
//                                   BoxShadow(
//                                     color: Colors.grey,
//                                     blurRadius: 0.5,
//                                     spreadRadius: 1,
//                                     offset: Offset(0, 1),
//                                   ),
//                                 ],
//                               ),
//                               child: ListTile(
//                                 title: Row(
//                                   children: [
//                                     Expanded(
//                                       child: Text(
//                                         bids[index]['digit']!,
//                                         textAlign: TextAlign.center,
//                                       ),
//                                     ),
//                                     Text('|'),
//                                     Expanded(
//                                       child: Text(
//                                         bids[index]['points']!,
//                                         textAlign: TextAlign.center,
//                                       ),
//                                     ),
//                                     Text('|'),
//                                     Expanded(
//                                       child: Row(
//                                         mainAxisAlignment:
//                                             MainAxisAlignment.center,
//                                         children: [
//                                           SizedBox(width: 5),
//                                           Text(
//                                             bids[index]['type']!,
//                                             textAlign: TextAlign.center,
//                                           ),
//                                           const SizedBox(width: 8),
//                                           GestureDetector(
//                                             onTap: () => _deleteBid(index),
//                                             child: const Icon(
//                                               Icons.delete,
//                                               color: Colors.red,
//                                               size: 20,
//                                             ),
//                                           ),
//                                         ],
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                             ),
//                           );
//                         },
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),

//             const SizedBox(height: 10),

//             // Submit Button
//             SubmitButton(data: "Submit", onPressed: () {}),
//             SizedBox(height: 40),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:dmboss/widgets/add_button.dart';
import 'package:dmboss/widgets/custom_textfield_screen1.dart';
import 'package:dmboss/widgets/date_container.dart';
import 'package:dmboss/widgets/submit_button.dart';
import 'package:flutter/material.dart';

class GameDetailScreen1 extends StatefulWidget {
  final String title;
  final String gameName;

  const GameDetailScreen1({
    super.key,
    required this.title,
    required this.gameName,
  });
  @override
  State<GameDetailScreen1> createState() => _GameDetailScreen1State();
}

class _GameDetailScreen1State extends State<GameDetailScreen1> {
  final TextEditingController _digitController = TextEditingController();
  final TextEditingController _pointsController = TextEditingController();

  bool _digitError = false;
  bool _pointsError = false;

  List<Map<String, String>> bids = [];

  void _addBid() {
    setState(() {
      _digitError = _digitController.text.isEmpty;
      _pointsError = _pointsController.text.isEmpty;

      if (!_digitError && !_pointsError) {
        bids.add({
          'digit': _digitController.text,
          'points': _pointsController.text,
          'type': 'OPEN',
        });
        _digitController.clear();
        _pointsController.clear();
      }
    });
  }

  void _deleteBid(int index) {
    setState(() {
      bids.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: Text(
          widget.title,
          style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          Container(
            margin: const EdgeInsets.all(10),
            padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width * 0.02,
              vertical: MediaQuery.of(context).size.height * 0.006,
            ),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(30),
            ),
            child: Row(
              children: const [
                Icon(Icons.wallet, color: Colors.black),
                SizedBox(width: 5),
                Text("24897", style: TextStyle(fontWeight: FontWeight.bold)),
              ],
            ),
          ),
        ],
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(minHeight: constraints.maxHeight),
              child: Padding(
                padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.04),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // Date and Game Name
                    Row(
                      children: [
                        Expanded(child: DateContainer()),
                        const SizedBox(width: 10),
                        Expanded(
                          child: Container(
                            padding: const EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.orange, width: 2),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Center(
                              child: Text(
                                widget.gameName,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 15),

                    // Bid Digits
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(width: 10),
                        Text(
                          "Bid Digits: ",
                          style: TextStyle(fontWeight: FontWeight.w600),
                        ),
                        SizedBox(width: 50),
                        Expanded(
                          child: CustomTextfieldScreen1(
                            controller: _digitController,
                            hintText: "Enter Digit",
                            suffixIcon: _digitError
                                ? Builder(
                                    builder: (context) {
                                      final GlobalKey<TooltipState> tooltipKey =
                                          GlobalKey<TooltipState>();
                                      return Tooltip(
                                        key: tooltipKey,
                                        message: "Please Enter Digit",
                                        triggerMode: TooltipTriggerMode.manual,
                                        child: IconButton(
                                          onPressed: () {
                                            tooltipKey.currentState?.ensureTooltipVisible();
                                            Future.delayed(
                                              const Duration(seconds: 2),
                                              () {
                                                if (tooltipKey.currentState?.mounted ?? false) {
                                                  tooltipKey.currentState?.deactivate();
                                                }
                                              },
                                            );
                                          },
                                          icon: const Icon(
                                            Icons.error,
                                            color: Colors.red,
                                          ),
                                        ),
                                      );
                                    },
                                  )
                                : null,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),

                    // Bid Points
                    Row(
                      children: [
                        SizedBox(width: 10),
                        Text(
                          "Bid Points: ",
                          style: TextStyle(fontWeight: FontWeight.w600),
                        ),
                        SizedBox(width: 47),
                        Expanded(
                          child: CustomTextfieldScreen1(
                            controller: _pointsController,
                            hintText: "Enter Amount",
                            suffixIcon: _pointsError
                                ? Builder(
                                    builder: (context) {
                                      final GlobalKey<TooltipState> tooltipKey =
                                          GlobalKey<TooltipState>();
                                      return Tooltip(
                                        key: tooltipKey,
                                        message: "Please Enter Amount",
                                        triggerMode: TooltipTriggerMode.manual,
                                        child: IconButton(
                                          onPressed: () {
                                            tooltipKey.currentState?.ensureTooltipVisible();
                                            Future.delayed(
                                              const Duration(seconds: 2),
                                              () {
                                                if (tooltipKey.currentState?.mounted ?? false) {
                                                  tooltipKey.currentState?.deactivate();
                                                }
                                              },
                                            );
                                          },
                                          icon: const Icon(
                                            Icons.error,
                                            color: Colors.red,
                                          ),
                                        ),
                                      );
                                    },
                                  )
                                : null,
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 15),

                    // Add Bid Button
                    AddButton(data: "ADD BID", onPressed: _addBid),
                    const SizedBox(height: 15),

                    // Bid List Table
                    Container(
                      constraints: BoxConstraints(
                        maxHeight: MediaQuery.of(context).size.height * 0.4,
                      ),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.orange, width: 2),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(
                              vertical: 8,
                              horizontal: 10,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(top: 8),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: const [
                                  Expanded(
                                    child: Text("Digit", textAlign: TextAlign.center),
                                  ),
                                  Expanded(
                                    child: Text(
                                      "Amount",
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  Expanded(
                                    child: Text(
                                      "Game type",
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.02),
                            child: const Divider(height: 1, color: Colors.black),
                          ),
                          Expanded(
                            child: ListView.builder(
                              itemCount: bids.length,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(10),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.grey,
                                          blurRadius: 0.5,
                                          spreadRadius: 1,
                                          offset: Offset(0, 1),
                                        ),
                                      ],
                                    ),
                                    child: ListTile(
                                      title: Row(
                                        children: [
                                          Expanded(
                                            child: Text(
                                              bids[index]['digit']!,
                                              textAlign: TextAlign.center,
                                            ),
                                          ),
                                          Text('|'),
                                          Expanded(
                                            child: Text(
                                              bids[index]['points']!,
                                              textAlign: TextAlign.center,
                                            ),
                                          ),
                                          Text('|'),
                                          Expanded(
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children: [
                                                SizedBox(width: 5),
                                                Text(
                                                  bids[index]['type']!,
                                                  textAlign: TextAlign.center,
                                                ),
                                                const SizedBox(width: 8),
                                                GestureDetector(
                                                  onTap: () => _deleteBid(index),
                                                  child: const Icon(
                                                    Icons.delete,
                                                    color: Colors.red,
                                                    size: 20,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 10),

                    // Submit Button
                    SubmitButton(data: "Submit", onPressed: () {}),
                    SizedBox(height: 40),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}