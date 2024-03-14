import 'package:apps_booking/detailCheckout.dart';
import 'package:apps_booking/detailPesanan.dart';
import 'package:apps_booking/globals.dart';
import 'package:apps_booking/home.dart';
import 'package:apps_booking/login.dart';
import 'package:apps_booking/splash.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/route_manager.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: primaryColor,
  ));
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'Poppins'),
      routes: {
        '/': (context) {
          return const SplashScreen();
        },
        '/login': (context) {
          return const LoginScreen();
        },
        '/home': (context) {
          return const HomeScreen();
        },
        '/detail-checkout': (context) {
          return const DetailCheckout();
        },
        '/detail-pesanan': (context) {
          return const DetailPesanan();
        }
      },
    );
  }
}
