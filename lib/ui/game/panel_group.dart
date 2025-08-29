// import 'package:dmboss/data/appdata.dart';
// import 'package:dmboss/widgets/add_button.dart';
// import 'package:dmboss/widgets/custom_textfield_screen1.dart';
// import 'package:dmboss/widgets/date_container.dart';
// import 'package:dmboss/widgets/submit_button.dart';
// import 'package:flutter/material.dart';

// class PanelGroup extends StatefulWidget {
//   final String title;
//   final String gameName;
//   const PanelGroup({super.key, required this.title, required this.gameName});

//   @override
//   State<PanelGroup> createState() => _PanelGroupState();
// }

// class _PanelGroupState extends State<PanelGroup> {
//   final TextEditingController _digitController = TextEditingController();
//   final TextEditingController _pointsController = TextEditingController();
//   final GlobalKey<FormState> _globalKey = GlobalKey();

//   bool _digitError = false;
//   bool _pointsError = false;

//   List<Map<String, String>> bids = [];

//   // New variables for dropdown functionality
//   final FocusNode _digitFocusNode = FocusNode();
//   final LayerLink _layerLink = LayerLink();
//   OverlayEntry? _overlayEntry;

//   List<String> _filteredNumbers = [];

//   @override
//   void initState() {
//     super.initState();
//     _digitController.addListener(_filterNumbers);
//     _digitFocusNode.addListener(_onFocusChange);
//     _filteredNumbers = panelGroup;
//   }

//   @override
//   void dispose() {
//     _digitController.removeListener(_filterNumbers);
//     _digitFocusNode.removeListener(_onFocusChange);
//     _digitFocusNode.dispose();
//     _removeOverlay();
//     super.dispose();
//   }

//   void _onFocusChange() {
//     if (_digitFocusNode.hasFocus && _digitController.text.isNotEmpty) {
//       _showDropdownOverlay();
//     } else {
//       _removeOverlay();
//     }
//   }

//   void _filterNumbers() {
//     final input = _digitController.text;
//     setState(() {
//       if (input.isEmpty) {
//         _filteredNumbers = panelGroup;
//       } else {
//         try {
//           _filteredNumbers = panelGroup.where((number) {
//             return number.toString().contains(input);
//           }).toList();
//         } catch (e) {
//           _filteredNumbers = [];
//         }
//       }
//     });

//     if (_digitFocusNode.hasFocus && _digitController.text.isNotEmpty) {
//       if (_overlayEntry == null) {
//         _showDropdownOverlay();
//       } else {
//         _overlayEntry!.markNeedsBuild();
//       }
//     } else {
//       _removeOverlay();
//     }
//   }

//   void _showDropdownOverlay() {
//     _removeOverlay();

//     _overlayEntry = OverlayEntry(
//       builder: (context) => Positioned(
//         width: MediaQuery.of(context).size.width * 0.5,
//         child: CompositedTransformFollower(
//           link: _layerLink,
//           showWhenUnlinked: false,
//           offset: const Offset(0, 40),
//           child: Material(
//             elevation: 4,
//             child: Container(
//               constraints: const BoxConstraints(maxHeight: 200),
//               decoration: BoxDecoration(
//                 color: Colors.white,
//                 border: Border.all(color: Colors.grey),
//               ),
//               child: ListView.builder(
//                 padding: EdgeInsets.zero,
//                 shrinkWrap: true,
//                 itemCount: _filteredNumbers.length,
//                 itemBuilder: (context, index) {
//                   final number = _filteredNumbers[index];
//                   return ListTile(
//                     title: Text(number.toString()),
//                     onTap: () {
//                       setState(() {
//                         _digitController.text = number.toString();
//                         _digitController.selection = TextSelection.fromPosition(
//                           TextPosition(offset: _digitController.text.length),
//                         );
//                       });
//                       _removeOverlay();
//                     },
//                   );
//                 },
//               ),
//             ),
//           ),
//         ),
//       ),
//     );

//     Overlay.of(context).insert(_overlayEntry!);
//   }

//   void _removeOverlay() {
//     if (_overlayEntry != null) {
//       _overlayEntry!.remove();
//       _overlayEntry = null;
//     }
//   }

//   void _addBid() {
//     if (_globalKey.currentState!.validate()) {
//       setState(() {
//         _digitError = _digitController.text.isEmpty;
//         _pointsError = _pointsController.text.isEmpty;

//         if (!_digitError && !_pointsError) {
//           bids.add({
//             'digit': _digitController.text,
//             'points': _pointsController.text,
//             'type': 'OPEN',
//           });
//           _digitController.clear();
//           _pointsController.clear();
//           _removeOverlay();
//         }
//       });
//     }
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
//       body: LayoutBuilder(
//         builder: (context, constraints) {
//           return SingleChildScrollView(
//             child: ConstrainedBox(
//               constraints: BoxConstraints(minHeight: constraints.maxHeight),
//               child: Padding(
//                 padding: EdgeInsets.all(
//                   MediaQuery.of(context).size.width * 0.04,
//                 ),
//                 child: Column(
//                   mainAxisSize: MainAxisSize.min,
//                   children: [
//                     // Date and Game Name
//                     Row(
//                       children: [
//                         Expanded(child: DateContainer()),
//                         const SizedBox(width: 10),
//                         Expanded(
//                           child: Container(
//                             padding: const EdgeInsets.all(12),
//                             decoration: BoxDecoration(
//                               border: Border.all(
//                                 color: Colors.orange,
//                                 width: 2,
//                               ),
//                               borderRadius: BorderRadius.circular(10),
//                             ),
//                             child: Center(
//                               child: Text(
//                                 widget.gameName,
//                                 style: const TextStyle(
//                                   fontWeight: FontWeight.bold,
//                                   fontSize: 14,
//                                 ),
//                               ),
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                     const SizedBox(height: 15),

//                     // Bid Digits
//                     Form(
//                       key: _globalKey,
//                       child: Column(
//                         children: [
//                           Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: [
//                               SizedBox(width: 10),
//                               Text(
//                                 "Bid Digits: ",
//                                 style: TextStyle(fontWeight: FontWeight.w600),
//                               ),
//                               SizedBox(width: 50),
//                               Expanded(
//                                 child: CompositedTransformTarget(
//                                   link: _layerLink,
//                                   child: CustomTextfieldScreen1(
//                                     controller: _digitController,
//                                     focusNode: _digitFocusNode,
//                                     hintText: "Number",
//                                     onChanged: (value) {
//                                       // Limit input to single digit only
//                                       if (value.length > 3) {
//                                         _digitController.text = value[0];
//                                         _digitController.selection =
//                                             TextSelection.fromPosition(
//                                               TextPosition(offset: 1),
//                                             );
//                                       } else {
//                                         _digitController.text = value;
//                                       }
//                                     },
//                                     validator: (value) {
//                                       if (value == null || value.isEmpty || !panelGroup.contains(value)) {
//                                         return "Input don't have any family \njodi";
//                                       }
//                                       if (value.length > 3) {
//                                         return "Only two digit allowed";
//                                       }
//                                       return null;
//                                     },
//                                   ),
//                                 ),
//                               ),
//                             ],
//                           ),
//                           const SizedBox(height: 10),

//                           // Bid Points
//                           Row(
//                             children: [
//                               SizedBox(width: 10),
//                               Text(
//                                 "Bid Points: ",
//                                 style: TextStyle(fontWeight: FontWeight.w600),
//                               ),
//                               SizedBox(width: 47),
//                               Expanded(
//                                 child: CustomTextfieldScreen1(
//                                   controller: _pointsController,
//                                   hintText: "Point",
//                                   onChanged: (value) {
//                                     setState(() {
//                                       _pointsController.text = value;
//                                     });
//                                   },
//                                   validator: (value) {
//                                     if (value == null ||
//                                         value.isEmpty ||
//                                         int.parse(value) < 10 ||
//                                         int.parse(value) > 10000) {
//                                       return "Enter amount between \n10 - 10000";
//                                     }
//                                     return null;
//                                   },
//                                 ),
//                               ),
//                             ],
//                           ),

//                           const SizedBox(height: 15),

//                           // Add Bid Button
//                           AddButton(data: "ADD BID", onPressed: _addBid),
//                           const SizedBox(height: 15),
//                         ],
//                       ),
//                     ),

//                     // Bid List Table
//                     Container(
//                       constraints: BoxConstraints(
//                         maxHeight: MediaQuery.of(context).size.height * 0.4,
//                       ),
//                       decoration: BoxDecoration(
//                         border: Border.all(color: Colors.orange, width: 2),
//                         borderRadius: BorderRadius.circular(10),
//                       ),
//                       child: Column(
//                         children: [
//                           Container(
//                             padding: const EdgeInsets.symmetric(
//                               vertical: 8,
//                               horizontal: 10,
//                             ),
//                             child: Padding(
//                               padding: const EdgeInsets.only(top: 8),
//                               child: Row(
//                                 mainAxisAlignment:
//                                     MainAxisAlignment.spaceBetween,
//                                 children: const [
//                                   Expanded(
//                                     child: Text(
//                                       "Digit",
//                                       textAlign: TextAlign.center,
//                                     ),
//                                   ),
//                                   Expanded(
//                                     child: Text(
//                                       "Amount",
//                                       textAlign: TextAlign.center,
//                                     ),
//                                   ),
//                                   Expanded(
//                                     child: Text(
//                                       "Game type",
//                                       textAlign: TextAlign.center,
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           ),
//                           Padding(
//                             padding: EdgeInsets.all(
//                               MediaQuery.of(context).size.width * 0.02,
//                             ),
//                             child: const Divider(
//                               height: 1,
//                               color: Colors.black,
//                             ),
//                           ),
//                           Expanded(
//                             child: ListView.builder(
//                               itemCount: bids.length,
//                               itemBuilder: (context, index) {
//                                 return Padding(
//                                   padding: const EdgeInsets.all(8.0),
//                                   child: Container(
//                                     decoration: BoxDecoration(
//                                       color: Colors.white,
//                                       borderRadius: BorderRadius.circular(10),
//                                       boxShadow: [
//                                         BoxShadow(
//                                           color: Colors.grey,
//                                           blurRadius: 0.5,
//                                           spreadRadius: 1,
//                                           offset: Offset(0, 1),
//                                         ),
//                                       ],
//                                     ),
//                                     child: ListTile(
//                                       title: Row(
//                                         children: [
//                                           Expanded(
//                                             child: Text(
//                                               bids[index]['digit']!,
//                                               textAlign: TextAlign.center,
//                                             ),
//                                           ),
//                                           Text('|'),
//                                           Expanded(
//                                             child: Text(
//                                               bids[index]['points']!,
//                                               textAlign: TextAlign.center,
//                                             ),
//                                           ),
//                                           Text('|'),
//                                           Expanded(
//                                             child: Row(
//                                               mainAxisAlignment:
//                                                   MainAxisAlignment.center,
//                                               children: [
//                                                 SizedBox(width: 5),
//                                                 Text(
//                                                   bids[index]['type']!,
//                                                   textAlign: TextAlign.center,
//                                                 ),
//                                                 const SizedBox(width: 8),
//                                                 GestureDetector(
//                                                   onTap: () =>
//                                                       _deleteBid(index),
//                                                   child: const Icon(
//                                                     Icons.delete,
//                                                     color: Colors.red,
//                                                     size: 20,
//                                                   ),
//                                                 ),
//                                               ],
//                                             ),
//                                           ),
//                                         ],
//                                       ),
//                                     ),
//                                   ),
//                                 );
//                               },
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),

//                     const SizedBox(height: 10),

//                     // Submit Button
//                     SubmitButton(data: "Submit", onPressed: () {}),
//                     SizedBox(height: 40),
//                   ],
//                 ),
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }

import 'package:dmboss/data/appdata.dart';
import 'package:dmboss/widgets/add_button.dart';
import 'package:dmboss/widgets/custom_textfield_screen1.dart';
import 'package:dmboss/widgets/date_container.dart';
import 'package:dmboss/widgets/submit_button.dart';
import 'package:flutter/material.dart';

class PanelGroup extends StatefulWidget {
  final String title;
  final String gameName;
  const PanelGroup({super.key, required this.title, required this.gameName});

  @override
  State<PanelGroup> createState() => _PanelGroupState();
}

class _PanelGroupState extends State<PanelGroup> {
  final TextEditingController _digitController = TextEditingController();
  final TextEditingController _pointsController = TextEditingController();
  final GlobalKey<FormState> _globalKey = GlobalKey();

  bool _digitError = false;
  bool _pointsError = false;

  List<Map<String, String>> bids = [];

  // New variables for dropdown functionality
  final FocusNode _digitFocusNode = FocusNode();
  final LayerLink _layerLink = LayerLink();
  OverlayEntry? _overlayEntry;

  List<String> _filteredNumbers = [];

  @override
  void initState() {
    super.initState();
    _digitController.addListener(_filterNumbers);
    _digitFocusNode.addListener(_onFocusChange);
    _filteredNumbers = panelGroup;
  }

  @override
  void dispose() {
    _digitController.removeListener(_filterNumbers);
    _digitFocusNode.removeListener(_onFocusChange);
    _digitFocusNode.dispose();
    _removeOverlay();
    super.dispose();
  }

  void _onFocusChange() {
    if (_digitFocusNode.hasFocus) {
      _showDropdownOverlay();
    } else {
      _removeOverlay();
    }
  }

  void _filterNumbers() {
    final input = _digitController.text;
    setState(() {
      if (input.isEmpty) {
        _filteredNumbers = panelGroup;
      } else {
        try {
          _filteredNumbers = panelGroup.where((number) {
            return number.toString().contains(input);
          }).toList();
        } catch (e) {
          _filteredNumbers = [];
        }
      }
    });

    if (_digitFocusNode.hasFocus) {
      if (_overlayEntry == null) {
        _showDropdownOverlay();
      } else {
        _overlayEntry!.markNeedsBuild();
      }
    } else {
      _removeOverlay();
    }
  }

  void _showDropdownOverlay() {
    _removeOverlay();

    final renderBox = context.findRenderObject() as RenderBox;
    final size = renderBox.size;

    _overlayEntry = OverlayEntry(
      builder: (context) => Positioned(
        width: MediaQuery.of(context).size.width * 0.5,
        child: CompositedTransformFollower(
          link: _layerLink,
          showWhenUnlinked: false,
          offset: const Offset(0, 40),
          child: Material(
            elevation: 4,
            child: Container(
              constraints: const BoxConstraints(maxHeight: 200),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.grey),
              ),
              child: _filteredNumbers.isEmpty
                  ? const Center(
                      child: Padding(
                        padding: EdgeInsets.all(16.0),
                        child: Text("No matching numbers"),
                      ),
                    )
                  : ListView.builder(
                      padding: EdgeInsets.zero,
                      shrinkWrap: true,
                      itemCount: _filteredNumbers.length,
                      itemBuilder: (context, index) {
                        final number = _filteredNumbers[index];
                        return ListTile(
                          title: Text(number.toString()),
                          onTap: () {
                            setState(() {
                              _digitController.text = number.toString();
                              _digitController.selection =
                                  TextSelection.fromPosition(
                                TextPosition(offset: _digitController.text.length),
                              );
                            });
                            _removeOverlay();
                            // Move focus to next field
                            FocusScope.of(context).nextFocus();
                          },
                        );
                      },
                    ),
            ),
          ),
        ),
      ),
    );

    Overlay.of(context).insert(_overlayEntry!);
  }

  void _removeOverlay() {
    if (_overlayEntry != null) {
      _overlayEntry!.remove();
      _overlayEntry = null;
    }
  }

// Helper function to apply cut to a digit based on position
String _applyCut(String digit, int position) {
  int num = int.parse(digit);
  
  // For cut positions, we need to apply a specific transformation
  // Based on your examples, it seems like:
  // Cut at first place: digit becomes (digit + 5) % 10
  // Cut at second place: digit becomes (digit + 5) % 10
  // Cut at third place: digit becomes (digit + 5) % 10
  
  // All cuts seem to follow the same pattern of adding 5
  int cutNum = (num + 5) % 10;
  return cutNum.toString();
}

// Function to generate levels based on the selected digit
// Function to generate levels based on the selected digit
List<Map<String, String>> _generateLevels(String digit, String points) {
  List<Map<String, String>> levels = [];
  
  if (digit.length != 3) {
    return levels;
  }
  
  // Extract individual digits
  String first = digit[0];
  String second = digit[1];
  String third = digit[2];
  
  // Check if first digit is less than 5
  int firstDigit = int.parse(first);
  
  if (firstDigit < 5) {
    // Logic for numbers with first digit less than 5 (left side)
    
    // Level 1: Original
    levels.add({
      'digit': '$first$second$third',
      'points': points,
      // 'type': 'LEVEL 1',
      'type': 'OPEN'
    });
    
    // Level 2: second number switch at first place, first number cut at second place, third number cut at third place
    levels.add({
      'digit': '$second${_applyCut(first, 2)}${_applyCut(third, 3)}',
      'points': points,
      // 'type': 'LEVEL 2',
      'type': 'OPEN'
    });
    
    // Level 3: third number switch to first, first number cut at second place, second number cut at 3rd place
    levels.add({
      'digit': '$third${_applyCut(first, 2)}${_applyCut(second, 3)}',
      'points': points,
      // 'type': 'LEVEL 3',
      'type': 'OPEN'
    });
    
    // Level 4: first number as it is, second cut at second place, third cut at third place
    levels.add({
      'digit': '$first${_applyCut(second, 2)}${_applyCut(third, 3)}',
      'points': points,
      // 'type': 'LEVEL 4',
      'type': 'OPEN'
    });
    
    // Level 5: first number cut at first place, second cut at second place, third cut at third place
    levels.add({
      'digit': '${_applyCut(first, 1)}${_applyCut(second, 2)}${_applyCut(third, 3)}',
      'points': points,
      // 'type': 'LEVEL 5',
      'type': 'OPEN'
    });
    
    // Level 6: second number at first place, third number at second place, first number cut at last place
    levels.add({
      'digit': '$second$third${_applyCut(first, 3)}',
      'points': points,
      // 'type': 'LEVEL 6',
      'type': 'OPEN'
    });
    
    // Level 7: first number at first place, third number at second place, second number cut at 3rd place
    levels.add({
      'digit': '$first$third${_applyCut(second, 3)}',
      'points': points,
      // 'type': 'LEVEL 7',
      'type': 'OPEN'
    });
    
    // Level 8: first number as it is, second number as it is, third number cut at third place
    levels.add({
      'digit': '$first$second${_applyCut(third, 3)}',
      'points': points,
      // 'type': 'LEVEL 8',
      'type': 'OPEN'
    });
  } else {
  // Logic for numbers with first digit greater than or equal to 5 (right side)
  
  // Level 1: Original
  levels.add({
    'digit': '$first$second$third',
    'points': points,
    // 'type': 'LEVEL 1',
    'type': 'OPEN'
  });
  
  // Level 2: second number cut at first place, first number at second place, third number at third place
  levels.add({
    'digit': '${_applyCut(second, 1)}$first$third',
    'points': points,
    // 'type': 'LEVEL 2',
    'type': 'OPEN'
  });
  
  // Level 3: second cut and first place, third cut second place, first number at last place
  levels.add({
    'digit': '${_applyCut(second, 1)}${_applyCut(third, 2)}$first',
    'points': points,
    // 'type': 'LEVEL 3',
    'type': 'OPEN'
  });
  
  // Level 4: third number cut switch to first, first number switch second place, second number switch 3rd place
  // CORRECTED: Should be third number cut at first, first number at second, second number at third
  levels.add({
    'digit': '${_applyCut(third, 1)}$first$second',
    'points': points,
    // 'type': 'LEVEL 4',
    'type': 'OPEN'
  });
  
  // Level 5: first cut at first, third cut at second place, second number at third place
  levels.add({
    'digit': '${_applyCut(first, 1)}${_applyCut(third, 2)}$second',
    'points': points,
    // 'type': 'LEVEL 5',
    'type': 'OPEN'
  });
  
  // Level 6: first cut at first, Second number as it is, third number as it is
  levels.add({
    'digit': '${_applyCut(first, 1)}$second$third',
    'points': points,
    // 'type': 'LEVEL 6',
    'type': 'OPEN'
  });
  
  // Level 7: first cut at first, Second cut at second, third number as it is
  levels.add({
    'digit': '${_applyCut(first, 1)}${_applyCut(second, 2)}$third',
    'points': points,
    // 'type': 'LEVEL 7',
    'type': 'OPEN'
  });
  
  // Level 8: first cut at first, Second cut at second, third cut at third
  levels.add({
    'digit': '${_applyCut(first, 1)}${_applyCut(second, 2)}${_applyCut(third, 3)}',
    'points': points,
    // 'type': 'LEVEL 8',
    'type': 'OPEN'
  });
}
  
  return levels;
} void _addBid() {
    if (_globalKey.currentState!.validate()) {
      setState(() {
        _digitError = _digitController.text.isEmpty;
        _pointsError = _pointsController.text.isEmpty;

        if (!_digitError && !_pointsError) {
          // Generate all 7 levels for the selected digit
          List<Map<String, String>> levels = _generateLevels(
            _digitController.text,
            _pointsController.text
          );
          
          // Add all levels to bids
          bids.addAll(levels);
          
          _digitController.clear();
          _pointsController.clear();
          _removeOverlay();
        }
      });
    }
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
                padding: EdgeInsets.all(
                  MediaQuery.of(context).size.width * 0.04,
                ),
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
                              border: Border.all(
                                color: Colors.orange,
                                width: 2,
                              ),
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
                    Form(
                      key: _globalKey,
                      child: Column(
                        children: [
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
                                child: CompositedTransformTarget(
                                  link: _layerLink,
                                  child: GestureDetector(
                                    onTap: () {
                                      // Request focus and show dropdown when text field is tapped
                                      FocusScope.of(context).requestFocus(_digitFocusNode);
                                      _showDropdownOverlay();
                                    },
                                    child: CustomTextfieldScreen1(
                                      controller: _digitController,
                                      focusNode: _digitFocusNode,
                                      hintText: "Number",
                                      onChanged: (value) {
                                        // Limit input to 3 digits only
                                        if (value.length > 3) {
                                          _digitController.text = value.substring(0, 3);
                                          _digitController.selection =
                                              TextSelection.fromPosition(
                                            TextPosition(offset: 3),
                                          );
                                        } else {
                                          _digitController.text = value;
                                        }
                                      },
                                      validator: (value) {
                                        if (value == null || value.isEmpty || value.length != 3) {
                                          return "Please enter a 3-digit number";
                                        }
                                        return null;
                                      },
                                    ),
                                  ),
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
                                  hintText: "Point",
                                  onChanged: (value) {
                                    setState(() {
                                      _pointsController.text = value;
                                    });
                                  },
                                  validator: (value) {
                                    if (value == null ||
                                        value.isEmpty ||
                                        int.parse(value) < 10 ||
                                        int.parse(value) > 10000) {
                                      return "Enter amount between \n10 - 10000";
                                    }
                                    return null;
                                  },
                                ),
                              ),
                            ],
                          ),

                          const SizedBox(height: 15),

                          // Add Bid Button
                          AddButton(data: "ADD BID", onPressed: _addBid),
                          const SizedBox(height: 15),
                        ],
                      ),
                    ),

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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: const [
                                  Expanded(
                                    child: Text(
                                      "Digit",
                                      textAlign: TextAlign.center,
                                    ),
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
                            padding: EdgeInsets.all(
                              MediaQuery.of(context).size.width * 0.02,
                            ),
                            child: const Divider(
                              height: 1,
                              color: Colors.black,
                            ),
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
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                SizedBox(width: 5),
                                                Text(
                                                  bids[index]['type']!,
                                                  textAlign: TextAlign.center,
                                                ),
                                                const SizedBox(width: 8),
                                                GestureDetector(
                                                  onTap: () =>
                                                      _deleteBid(index),
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