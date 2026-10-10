
import 'package:flutter/material.dart';

class BookingModel extends ChangeNotifier {
  String namaLayanan = '';
  int jumlahBooking = 0;

  final Map<String, int> daftarHarga = {
    'Paket Wisata': 150000,
    'Tiket Wisata': 50000,
    'Penginapan': 250000,
    'Tour Guide': 100000,
  };

  int get hargaLayanan => daftarHarga[namaLayanan] ?? 0;

  int get totalPembayaran => hargaLayanan * jumlahBooking;

  void tambahBooking(String layanan) {
    namaLayanan = layanan;
    jumlahBooking++;
    notifyListeners();
  }

  void resetBooking() {
    namaLayanan = '';
    jumlahBooking = 0;
    notifyListeners();
  }
}
