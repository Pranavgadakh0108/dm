import 'package:dmboss/ui/add_bank_details.dart';
import 'package:dmboss/ui/fund_pending_requests.dart';
import 'package:dmboss/ui/menu/add_fund_screen.dart';
import 'package:dmboss/ui/menu/bid_history_screen.dart';
import 'package:dmboss/ui/menu/transaction_history_screen.dart';
import 'package:dmboss/ui/menu/winning_history_screen.dart';
import 'package:dmboss/ui/menu/withdraw_points.dart';
import 'package:dmboss/ui/withdraw_pending_requests.dart';
import 'package:flutter/material.dart';

final List<Map<String, dynamic>> games = [
  {
    "title": "KARNATAKA DAY",
    "numbers": "248-4*-***",
    "statusText": "Closed For Today",
    "statusColor": Colors.red,
    "buttonText": "Closed Now",
    "buttonColor": Colors.red,
    "openTime": "10:00 am",
    "closeTime": "11:00 am",
  },
  {
    "title": "SRIDEVI",
    "numbers": "***-**-***",
    "statusText": "Running For Today",
    "statusColor": Colors.green,
    "buttonText": "Play Now",
    "buttonColor": Colors.orange,
    "openTime": "11:35 am",
    "closeTime": "12:35 pm",
  },
  {
    "title": "TIME BAZAR",
    "numbers": "***-**-***",
    "statusText": "Running For Today",
    "statusColor": Colors.green,
    "buttonText": "Play Now",
    "buttonColor": Colors.orange,
    "openTime": "12:55 pm",
    "closeTime": "3:10 pm",
  },
  {
    "title": "MADHUR DAY",
    "numbers": "***-**-***",
    "statusText": "Running For Today",
    "statusColor": Colors.green,
    "buttonText": "Play Now",
    "buttonColor": Colors.orange,
    "openTime": "4:30 pm",
    "closeTime": "5:30 pm",
  },
  {
    "title": "KARNATAKA DAY",
    "numbers": "248-4*-***",
    "statusText": "Closed For Today",
    "statusColor": Colors.red,
    "buttonText": "Closed Now",
    "buttonColor": Colors.red,
    "openTime": "10:00 am",
    "closeTime": "11:00 am",
  },
  {
    "title": "SRIDEVI",
    "numbers": "***-**-***",
    "statusText": "Running For Today",
    "statusColor": Colors.green,
    "buttonText": "Play Now",
    "buttonColor": Colors.orange,
    "openTime": "11:35 am",
    "closeTime": "12:35 pm",
  },
  {
    "title": "TIME BAZAR",
    "numbers": "***-**-***",
    "statusText": "Running For Today",
    "statusColor": Colors.green,
    "buttonText": "Play Now",
    "buttonColor": Colors.orange,
    "openTime": "12:55 pm",
    "closeTime": "3:10 pm",
  },
  {
    "title": "MADHUR DAY",
    "numbers": "***-**-***",
    "statusText": "Running For Today",
    "statusColor": Colors.green,
    "buttonText": "Play Now",
    "buttonColor": Colors.orange,
    "openTime": "11:30 pm",
    "closeTime": "12:30 am",
  },
];

final List<String> charts = [
  "RAJDHANI NIGHT",
  "KALYAN NIGHT",
  "MILAN NIGHT",
  "SRIDEVI",
  "TIME BAZAR",
  "MADHUR DAY",
  "MILAN DAY",
  "RAJDHANI DAY",
  "SUPREME DAY",
  "KALYAN",
  "SRIDEVI NIGHT",
  "MADHUR NIGHT",
  "SUPREME NIGHT",
  "MAIN BAZAR",
  "KARNATAKA NIGHT",
  "KARNATAKA DAY",
];

final List<String> gameRates = [
  "Single Ank - 10 Ka 95",
  "Jodi - 10 Ka 950",
  "Single Patti - 10 Ka 1500",
  "Double Patti - 10 Ka 3000",
  "Tripple Patti - 10 Ka 9000",
  "Full Sangam - 10 Ka 100000",
  "Half Sangam - 10 Ka 13000",
  "Group Jodi - 10 Ka 950",
  "Panel Group - 10 Ka 1500",
  "Bulk Jodi - 10 Ka 950",
  "Bulk SP - 10 Ka 1500",
  "Bulk DP - 10 Ka 3000",
];

final List<Map<String, dynamic>> historyList = [
  {
    "date": "06 Aug 2025, 07:32 am",
    "method": "Razorpay",
    "points": 100,
    "status": "Your Request Approved & Fund Added Successfully !!! 😊",
  },
  {
    "date": "05 Aug 2025, 10:15 pm",
    "method": "UPI",
    "points": 200,
    "status": "Your Request Approved & Fund Added Successfully !!! 😊",
  },
  {
    "date": "05 Aug 2025, 10:15 pm",
    "method": "UPI",
    "points": 200,
    "status": "Your Request Approved & Fund Added Successfully !!! 😊",
  },
];

final List<Map<String, String>> timeTable = [
  {"game": "KARNATAKA DAY", "open": "10:00 am", "close": "11:00 am"},
  {"game": "SRIDEVI", "open": "11:35 am", "close": "12:35 pm"},
  {"game": "TIME BAZAR", "open": "12:55 pm", "close": "3:10 pm"},
  {"game": "MADHUR DAY", "open": "1:30 pm", "close": "2:30 pm"},
  {"game": "MILAN DAY", "open": "2:10 pm", "close": "4:10 pm"},
  {"game": "RAJDHANI DAY", "open": "3:05 pm", "close": "5:05 pm"},
  {"game": "SUPREME DAY", "open": "3:30 pm", "close": "5:30 pm"},
  {"game": "KALYAN", "open": "4:50 pm", "close": "6:50 pm"},
  {"game": "KARNATAKA NIGHT", "open": "6:30 pm", "close": "7:30 pm"},
  {"game": "SRIDEVI NIGHT", "open": "7:15 pm", "close": "8:15 pm"},
  {"game": "MADHUR NIGHT", "open": "8:30 pm", "close": "10:30 pm"},
  {"game": "SUPREME NIGHT", "open": "8:40 pm", "close": "10:40 pm"},
  {"game": "MILAN NIGHT", "open": "9.00 pm", "close": "11:00 pm"},
  {"game": "RAJDHANI NIGHT", "open": "9.25 pm", "close": "11:40 pm"},
  {"game": "KALYAN NIGHT", "open": "9:30 pm", "close": "11:30 pm"},
  {"game": "MAIN BAZAR", "open": "9:45 pm", "close": "11:55 pm"},
];

final List<Map<String, String>> items = [
  {
    "title": "HOW TO DEPOSIT",
    "url": "https://youtu.be/V8w-VvNAF7U?si=tlH2Hb7IGPvpPxRM",
  },
  {
    "title": "HOW TO WITHDRAW MONEY",
    "url": "https://youtu.be/kNw9SqRI-P8?si=n_xVcsuZ6oSqlMI5",
  },
  {
    "title": "HOW TO PLAY GAMES",
    "url": "https://youtu.be/sDNeg8GQi5s?si=ONypTyY0aZcK2j1Q",
  },
];

final List<String> menuItems = const [
  "Add Funds",
  "Add Bank Details",
  "Withdraw Funds",
  "Winning History",
  "Deposite Status",
  "Withdraw Status",
];

final List<IconData> menuIcons = const [
  Icons.account_balance_wallet_outlined,
  Icons.account_balance,
  Icons.arrow_circle_up_outlined,
  Icons.emoji_events_outlined,
  Icons.pending_actions_outlined,
  Icons.watch_later_outlined,
];

final List<Widget> walletScreens = [
  AddFundScreen(),
  AddBankDetails(),
  WithdrawPoints(),
  WinningHistoryScreen(),
  FundPendingRequests(),
  WithdrawPendingRequests(),
];

// final List<Map<String, dynamic>> gameList = const [
//   {"title": "Single Ank", "icon": Icons.casino},
//   {"title": "Jodi", "icon": Icons.casino_outlined},
//   {"title": "Single Patti", "icon": Icons.filter_1},
//   {"title": "Double Patti", "icon": Icons.filter_2},
//   {"title": "Tripple Patti", "icon": Icons.filter_3},
//   {"title": "Half Sangam", "icon": Icons.star_half},
//   {"title": "Full Sangam", "icon": Icons.star},
//   {"title": "Group Jodi", "icon": Icons.group},
//   {"title": "Panel Group", "icon": Icons.groups_3_rounded},
//   {"title": "Bulk Jodi", "icon": Icons.casino_outlined},
//   {"title": "Bulk SP", "icon": Icons.sports_bar},
//   {"title": "Bulk DP", "icon": Icons.sports_basketball},
// ];

final List<Map<String, dynamic>> gameList = [
  {"id": 1, "title": "Single Ank", "icon": Icons.casino},
  {"id": 2, "title": "Jodi", "icon": Icons.casino_outlined},
  {"id": 3, "title": "Single Patti", "icon": Icons.filter_1},
  {"id": 4, "title": "Double Patti", "icon": Icons.filter_2},
  {"id": 5, "title": "Tripple Patti", "icon": Icons.filter_3},
  {"id": 6, "title": "Half Sangam", "icon": Icons.star_half},
  {"id": 7, "title": "Full Sangam", "icon": Icons.star},
  {"id": 8, "title": "Group Jodi", "icon": Icons.group},
  {"id": 9, "title": "Panel Group", "icon": Icons.groups_3_rounded},
  {"id": 10, "title": "Bulk Jodi", "icon": Icons.casino_outlined},
  {"id": 11, "title": "Bulk SP", "icon": Icons.sports_bar},
  {"id": 12, "title": "Bulk DP", "icon": Icons.sports_basketball},
];


final List<Bid> bidList = [
  Bid(
    date: "22/08/2025",
    market: "KARNATAKA DAY",
    openStatus: "OPEN",
    bet: 347,
    coin: 20,
    status: "Bid Placed Successfully. Wait for Result !!! ⏳",
  ),
  Bid(
    date: "22/08/2025",
    market: "KARNATAKA DAY",
    openStatus: "OPEN",
    bet: 689,
    coin: 20,
    status: "Bid Placed Successfully. Wait for Result !!! ⏳",
  ),
  Bid(
    date: "22/08/2025",
    market: "KARNATAKA DAY",
    openStatus: "OPEN",
    bet: 346,
    coin: 20,
    status: "Bid Placed Successfully. Wait for Result !!! ⏳",
  ),
  Bid(
    date: "22/08/2025",
    market: "KARNATAKA DAY",
    openStatus: "OPEN",
    bet: 238,
    coin: 20,
    status: "Bid Placed Successfully. Wait for Result !!! ⏳",
  ),
  Bid(
    date: "22/08/2025",
    market: "KARNATAKA DAY",
    openStatus: "OPEN",
    bet: 390,
    coin: 20,
    status: "Bid Placed Successfully. Wait for Result !!! ⏳",
  ),
  Bid(
    date: "22/08/2025",
    market: "KARNATAKA DAY",
    openStatus: "OPEN",
    bet: 470,
    coin: 20,
    status: "Bid Placed Successfully. Wait for Result !!! ⏳",
  ),
];

final List<Transaction> transactions = [
  Transaction(
    dateTime: "22 Aug 2025, 09:13 am",
    amount: -20,
    narration:
        "Bet Placed on singlepatti market name KARNATAKA_DAY_OPEN on number 347",
  ),
  Transaction(
    dateTime: "22 Aug 2025, 09:13 am",
    amount: -20,
    narration:
        "Bet Placed on singlepatti market name KARNATAKA_DAY_OPEN on number 689",
  ),
  Transaction(
    dateTime: "22 Aug 2025, 09:13 am",
    amount: -20,
    narration:
        "Bet Placed on singlepatti market name KARNATAKA_DAY_OPEN on number 346",
  ),
  Transaction(
    dateTime: "22 Aug 2025, 09:13 am",
    amount: -20,
    narration:
        "Bet Placed on singlepatti market name KARNATAKA_DAY_OPEN on number 238",
  ),
  Transaction(
    dateTime: "22 Aug 2025, 09:13 am",
    amount: -20,
    narration:
        "Bet Placed on singlepatti market name KARNATAKA_DAY_OPEN on number 390",
  ),
  Transaction(
    dateTime: "22 Aug 2025, 09:13 am",
    amount: -20,
    narration:
        "Bet Placed on singlepatti market name KARNATAKA_DAY_OPEN on number 238",
  ),
  Transaction(
    dateTime: "22 Aug 2025, 09:13 am",
    amount: -20,
    narration:
        "Bet Placed on singlepatti market name KARNATAKA_DAY_OPEN on number 390",
  ),
];

final List<WinningHistory> winningHistory = [
  WinningHistory(
    dateTime: "22 Aug 2025, 09:13 am",
    amount: "+190",
    narration: "single MAIN_BAZAR_OPEN winning",
    winDigit: 5,
  ),
  WinningHistory(
    dateTime: "22 Aug 2025, 09:13 am",
    amount: "+190",
    narration: "single MAIN_BAZAR_OPEN winning",
    winDigit: 5,
  ),
  WinningHistory(
    dateTime: "22 Aug 2025, 09:13 am",
    amount: "+190",
    narration: "single MAIN_BAZAR_OPEN winning",
    winDigit: 5,
  ),
];

final List<WithdrawRequests> withdrawRequests = [
  WithdrawRequests(
    dateTime: "22 Aug 2025, 09:13 am",
    amount: "₹500",
    mode: "Mode: MANUAL",
    status: "Pending",
  ),
  WithdrawRequests(
    dateTime: "22 Aug 2025, 09:13 am",
    amount: "₹500",
    mode: "Mode: MANUAL",
    status: "Pending",
  ),
  WithdrawRequests(
    dateTime: "22 Aug 2025, 09:13 am",
    amount: "₹500",
    mode: "Mode: MANUAL",
    status: "Pending",
  ),
];

final RegExp emailRegex = RegExp(
  r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$",
);

final RegExp passwordRegExp = RegExp(
  r'^(?=.*[A-Z])(?=.*[a-z])(?=.*\d)(?=.*[!@#\$&*~]).{8,}$',
);

// Custom list of numbers (only single digits 0-9)
  final List<String> singleAnkNumbers = ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9"];

  // Custom list of numbers (only single digits 0-9)
  final List<String> jodiNumbers= [
  "00", "01", "02", "03", "04", "05", "06", "07", "08", "09",
  "10", "11", "12", "13", "14", "15", "16", "17", "18", "19",
  "20", "21", "22", "23", "24", "25", "26", "27", "28", "29",
  "30", "31", "32", "33", "34", "35", "36", "37", "38", "39",
  "40", "41", "42", "43", "44", "45", "46", "47", "48", "49",
  "50", "51", "52", "53", "54", "55", "56", "57", "58", "59",
  "60", "61", "62", "63", "64", "65", "66", "67", "68", "69",
  "70", "71", "72", "73", "74", "75", "76", "77", "78", "79",
  "80", "81", "82", "83", "84", "85", "86", "87", "88", "89",
  "90", "91", "92", "93", "94", "95", "96", "97", "98", "99",
];

final List<String> singlePattiNumbers = [
  "120", "130", "140", "150", "160", "170", "180", "190",
  "230", "240", "250", "260", "270", "280", "290",
  "340", "350", "360", "370", "380", "390",
  "450", "460", "470", "480", "490",
  "560", "570", "580", "590",
  "670", "680", "690",
  "780", "790",
  "890",

  "123", "124", "125", "126", "127", "128", "129",
  "134", "135", "136", "137", "138", "139",
  "145", "146", "147", "148", "149",
  "156", "157", "158", "159",
  "167", "168", "169",
  "178", "179",
  "189",

  "234", "235", "236", "237", "238", "239",
  "245", "246", "247", "248", "249",
  "256", "257", "258", "259",
  "267", "268", "269",
  "278", "279",
  "289",

  "345", "346", "347", "348", "349",
  "356", "357", "358", "359",
  "367", "368", "369",
  "378", "379",
  "389",

  "456", "457", "458", "459",
  "467", "468", "469",
  "478", "479",
  "489",

  "567", "568", "569",
  "578", "579",
  "589",

  "678", "679",
  "689",

  "789",
];

final List<String> doublePattiNumbers = [
  "100", "200", "300", "400", "500", "600", "700", "800",
  "112", "113", "114", "115", "116", "117", "118", "119", "110",
  "223", "224", "225", "226", "227", "228", "229", "220",
  "334", "335", "336", "337", "338", "339", "330",
  "445", "446", "447", "448", "449", "440",
  "556", "557", "558", "559", "550",
  "667", "668", "669", "660",
  "778", "779", "770",
  "889", "880",

 
  "122", "133", "144", "155", "166", "177", "188", "199",
  "233", "244", "255", "266", "277", "288", "299",
  "344", "355", "366", "377", "388", "399",
  "455", "466", "477", "488", "499",
  "566", "577", "588", "599",
  "677", "688", "699",
  "788", "799",
  "899", "900", "990"
];

final List<String> tripplePattiNumbers = ["000", "111", "222", "333", "444", "555", "666", "777", "888", "999"];

final List<String> panelGroup = [
  "100",
  "110", "112", "113", "114", "115", "116", "117", "118", "119",
  "120", "122", "123", "124", "125", "126", "127", "128", "129",
  "130", "133", "134", "135", "136", "137", "138", "139",
  "140", "144", "145", "146", "147", "148", "149",
  "150", "155", "156", "157", "158", "159",
  "160", "166", "167", "168", "169",
  "170", "177", "178", "179",
  "180", "188", "189",
  "190", "199",

  "220", "223", "224", "225", "226", "227", "228", "229",
  "230", "233", "234", "235", "236", "237", "238", "239",
  "240", "244", "245", "246", "247", "248", "249",
  "250", "255", "256", "257", "258", "259",
  "260", "266", "267", "268", "269",
  "270", "277", "278", "279",
  "280", "288", "289",
  "290", "299",

  "330", "334", "335", "336", "337", "338", "339",
  "340", "344", "345", "346", "347", "348", "349",
  "350", "355", "356", "357", "358", "359",
  "360", "366", "367", "368", "369",
  "370", "377", "378", "379",
  "380", "388", "389",
  "390", "399",

  "440", "445", "446", "447", "448", "449",
  "450", "455", "456", "457", "458", "459",
  "460", "466", "467", "468", "469",
  "470", "477", "478", "479",
  "480", "488", "489",
  "490", "499",

  "550", "556", "557", "558", "559",
  "560", "566", "567", "568", "569",
  "570", "577", "578", "579",
  "580", "588", "589",
  "590", "599",

  "660", "667", "668", "669",
  "670", "677", "678", "679",
  "680", "688", "689",
  "690", "699",

  "770", "778", "779",
  "780", "788", "789",
  "790", "799",

  "880", "889",
  "890", "899",

  "900", "990",

  "000", "111", "222", "333", "444", "555", "666", "777", "888", "999",
];

final List<String> halfSangam = [
  "120", "130", "140", "150", "160", "170", "180", "190",
  "230", "240", "250", "260", "270", "280", "290",
  "340", "350", "360", "370", "380", "390",
  "450", "460", "470", "480", "490",
  "560", "570", "580", "590",
  "670", "680", "690",
  "780", "790",
  "890",

  "123", "124", "125", "126", "127", "128", "129",
  "134", "135", "136", "137", "138", "139",
  "145", "146", "147", "148", "149",
  "156", "157", "158", "159",
  "167", "168", "169",
  "178", "179",
  "189",

  "234", "235", "236", "237", "238", "239",
  "245", "246", "247", "248", "249",
  "256", "257", "258", "259",
  "267", "268", "269",
  "278", "279",
  "289",

  "345", "346", "347", "348", "349",
  "356", "357", "358", "359",
  "367", "368", "369",
  "378", "379",
  "389",

  "456", "457", "458", "459",
  "467", "468", "469",
  "478", "479",
  "489",

  "567", "568", "569",
  "578", "579",
  "589",

  "678", "679",
  "689",

  "789", "100",
  "112", "113", "114", "115", "116", "117", "118", "119", "110",
  "223", "224", "225", "226", "227", "228", "229", "220",
  "334", "335", "336", "337", "338", "339", "330",
  "445", "446", "447", "448", "449", "440",
  "556", "557", "558", "559", "550",
  "667", "668", "669", "660",
  "778", "779", "770",
  "889", "880",

  "122", "133", "144", "155", "166", "177", "188", "199",
  "233", "244", "255", "266", "277", "288", "299",
  "344", "355", "366", "377", "388", "399",
  "455", "466", "477", "488", "499",
  "566", "577", "588", "599",
  "677", "688", "699",
  "788", "799",
  "899", "900", "990"
];


final String baseUrl ="https://api.myjiomatka.com/api/v1";

// final String baseUrl = "http://192.168.1.5:5002/api/v1";


