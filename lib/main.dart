import 'package:adv_re_exam/provider/Home_provider.dart';
import 'package:adv_re_exam/provider/cart_page_provider.dart';
import 'package:adv_re_exam/views/Home_page.dart';
import 'package:adv_re_exam/views/cart+page.dart';
import 'package:adv_re_exam/views/detail_page.dart';
import 'package:adv_re_exam/views/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ProductProvider(),),
        ChangeNotifierProvider(create: (context) => CartProvider(),),

      ],
      child:  MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          '/': (context)=> SplashScreen(),
          '/home': (context)=> home_page(),
          '/detail': (context)=> detailPage(),
          '/cart': (context)=> cartPage(),
        },
      ),
    );
  }
}
