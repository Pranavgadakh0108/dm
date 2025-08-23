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
    "openTime": "1:30 pm",
    "closeTime": "2:30 pm",
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
    "openTime": "1:30 pm",
    "closeTime": "2:30 pm",
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

final List<Map<String, dynamic>> gameList = const [
  {"title": "Single Ank", "icon": Icons.casino},
  {"title": "Jodi", "icon": Icons.casino_outlined},
  {"title": "Single Patti", "icon": Icons.filter_1},
  {"title": "Double Patti", "icon": Icons.filter_2},
  {"title": "Tripple Patti", "icon": Icons.filter_3},
  {"title": "Half Sangam", "icon": Icons.star_half},
  {"title": "Full Sangam", "icon": Icons.star},
  {"title": "Group Jodi", "icon": Icons.group},
  {"title": "Panel Group", "icon": Icons.groups_3_rounded},
  {"title": "Bulk Jodi", "icon": Icons.casino_outlined},
  {"title": "Bulk SP", "icon": Icons.sports_bar},
  {"title": "Bulk DP", "icon": Icons.sports_basketball},
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
