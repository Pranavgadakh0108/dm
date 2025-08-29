import 'package:dmboss/app/myapp.dart';
import 'package:dmboss/provider/game_rate_provider.dart';
import 'package:dmboss/provider/login_user_provider.dart';
import 'package:dmboss/provider/mobile_exist_provider.dart';
import 'package:dmboss/provider/register_user_provider.dart';
import 'package:dmboss/provider/update_user_provider.dart';
import 'package:dmboss/provider/user_profile_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp( MultiProvider(providers: [
      ChangeNotifierProvider(create: (_)=> MobileCheckProvider()),
      ChangeNotifierProvider(create: (_)=> RegisterUserProvider()),
      ChangeNotifierProvider(create: (_)=> LoginUserProvider()),
      ChangeNotifierProvider(create: (_)=> UserProfileProvider()),
      ChangeNotifierProvider(create: (_)=> GameRateProvider()),
      ChangeNotifierProvider(create: (_)=> ProfileUpdateProvider())
      
    ],
    child: const MyApp(),));
}



