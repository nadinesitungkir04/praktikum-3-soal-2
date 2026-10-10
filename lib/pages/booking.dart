
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/booking_model.dart';
import '../navigation/app_routes.dart';

class BookingPage extends StatefulWidget {
  const BookingPage({super.key});

  @override
  State<BookingPage> createState() => _BookingPageState();
}

class _BookingPageState extends State<BookingPage> {
  String layananDipilih = 'Paket Wisata';

  @override
  Widget build(BuildContext context) {
    final booking = context.watch<BookingModel>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Booking Wisata'),
        actions: [
          IconButton(
            tooltip: 'Keluar',
            icon: const Icon(Icons.logout),
            onPressed: () {
              context.read<BookingModel>().resetBooking();
              Navigator.pushNamedAndRemoveUntil(
                context,
                AppRoutes.login,
                (route) => false,
              );
            },
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          const Icon(
            Icons.luggage_outlined,
            size: 70,
            color: Colors.green,
          ),
          const SizedBox(height: 12),
          const Text(
            'Pesan Layanan Wisata',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 24),
          DropdownButtonFormField<String>(
            value: layananDipilih,
            decoration: const InputDecoration(
              labelText: 'Pilih layanan',
              border: OutlineInputBorder(),
            ),
            items: const [
              DropdownMenuItem(
                value: 'Paket Wisata',
                child: Text('Paket Wisata'),
              ),
              DropdownMenuItem(
                value: 'Tiket Wisata',
                child: Text('Tiket Wisata'),
              ),
              DropdownMenuItem(
                value: 'Penginapan',
                child: Text('Penginapan'),
              ),
              DropdownMenuItem(
                value: 'Tour Guide',
                child: Text('Tour Guide'),
              ),
            ],
            onChanged: (value) {
              if (value != null) {
                setState(() {
                  layananDipilih = value;
                });
              }
            },
          ),
          const SizedBox(height: 16),
          Card(
            child: ListTile(
              leading: const Icon(Icons.payments, color: Colors.green),
              title: const Text('Harga per booking'),
              subtitle: Text('Rp${booking.daftarHarga[layananDipilih]}'),
            ),
          ),
          const SizedBox(height: 16),
          FilledButton.icon(
            onPressed: () {
              context.read<BookingModel>().tambahBooking(layananDipilih);
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Booking berhasil ditambahkan.')),
              );
            },
            icon: const Icon(Icons.add),
            label: const Text('Tambah Booking'),
          ),
          OutlinedButton.icon(
            onPressed: () {
              context.read<BookingModel>().resetBooking();
            },
            icon: const Icon(Icons.refresh),
            label: const Text('Reset Booking'),
          ),
          const SizedBox(height: 24),
          Card(
            color: Colors.green.withValues(alpha: 0.08),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Ringkasan Booking',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    'Layanan terakhir: ${booking.namaLayanan.isEmpty ? "-" : booking.namaLayanan}',
                  ),
                  Text('Jumlah booking: ${booking.jumlahBooking}'),
                  Text(
                    'Total pembayaran: Rp${booking.totalPembayaran}',
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),
          FilledButton(
            onPressed: booking.jumlahBooking == 0
                ? null
                : () {
                    Navigator.pushNamed(context, AppRoutes.pembayaran);
                  },
            child: const Text('Lanjut ke Pembayaran'),
          ),
        ],
      ),
    );
  }
}
