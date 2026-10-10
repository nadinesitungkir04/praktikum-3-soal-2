
import 'package:flutter/material.dart';

import '../pages/login.dart';
import '../pages/booking.dart';
import '../pages/pembayaran.dart';

class AppRoutes {
  static const String login = '/';
  static const String booking = '/booking';
  static const String pembayaran = '/pembayaran';

  static Map<String, WidgetBuilder> daftarRoute() {
    return {
      login: (_) => const LoginPage(),
      booking: (_) => const BookingPage(),
      pembayaran: (_) => const PembayaranPage(),
    };
  }

  static Route<dynamic>? bentukRoute(RouteSettings settings) {
    return null;
  }

  static Route<dynamic> routeTidakDikenal(RouteSettings settings) {
    return MaterialPageRoute(
      builder: (_) => Scaffold(
        appBar: AppBar(title: const Text('Halaman Tidak Ditemukan')),
        body: const Center(
          child: Text('Halaman yang kamu cari tidak tersedia.'),
        ),
      ),
    );
  }
}
