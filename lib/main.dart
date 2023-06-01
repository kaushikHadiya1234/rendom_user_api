import 'dart:io';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rendom_user/Screen/Provider/user_provider.dart';
import 'package:rendom_user/Screen/View/home_screen.dart';
import 'package:rendom_user/utils/Myhttp.dart';
import 'package:sizer/sizer.dart';

void main() {
  HttpOverrides.global = MyHttpOverrides();

  runApp(
    Sizer(
      builder: (context, orientation, deviceType) =>  ChangeNotifierProvider(
        create: (context) => UserProvider(),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          routes: {
            '/': (context) => HomeScreen(),
          },
        ),
      ),
    ),
  );
}
