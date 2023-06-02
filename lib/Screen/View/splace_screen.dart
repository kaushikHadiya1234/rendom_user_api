import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class SplaceScreen extends StatefulWidget {
  const SplaceScreen({Key? key}) : super(key: key);

  @override
  State<SplaceScreen> createState() => _SplaceScreenState();
}

class _SplaceScreenState extends State<SplaceScreen> {
  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 3),() => Navigator.pushReplacementNamed(context, 'home'),);
    return SafeArea(
        child: Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/r.png',height: 40.h,width: 60.w,),
            Text('Random User',style: TextStyle(fontSize: 18.sp,fontWeight: FontWeight.bold),)
          ],
        ),
      ),
    ));
  }
}
