
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'models/booking_model.dart';
import 'navigation/app_routes.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => BookingModel(),
      child: const SipgarApp(),
    ),
  );
}

class SipgarApp extends StatelessWidget {
  const SipgarApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'SIPGAR',
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.green,
      ),
      initialRoute: AppRoutes.login,
      routes: AppRoutes.daftarRoute(),
      onGenerateRoute: AppRoutes.bentukRoute,
      onUnknownRoute: AppRoutes.routeTidakDikenal,
    );
  }
}
