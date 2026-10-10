
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/booking_model.dart';
import '../navigation/app_routes.dart';

class PembayaranPage extends StatelessWidget {
  const PembayaranPage({super.key});

  @override
  Widget build(BuildContext context) {
    final booking = context.watch<BookingModel>();

    return Scaffold(
      appBar: AppBar(title: const Text('Pembayaran')),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          const Icon(
            Icons.receipt_long,
            size: 75,
            color: Colors.green,
          ),
          const SizedBox(height: 16),
          const Text(
            'Ringkasan Pembayaran',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 24),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(18),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Detail Pesanan',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Divider(height: 24),
                  const Text('Layanan'),
                  Text(
                    booking.namaLayanan.isEmpty
                        ? 'Belum ada booking'
                        : booking.namaLayanan,
                    style: const TextStyle(fontSize: 16),
                  ),
                  const SizedBox(height: 16),
                  const Text('Jumlah booking'),
                  Text(
                    '${booking.jumlahBooking}',
                    style: const TextStyle(fontSize: 16),
                  ),
                  const SizedBox(height: 16),
                  const Text('Harga per booking'),
                  Text('Rp${booking.hargaLayanan}'),
                  const Divider(height: 32),
                  const Text(
                    'Total Pembayaran',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    'Rp${booking.totalPembayaran}',
                    style: const TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.green,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 20),
          FilledButton.icon(
            onPressed: booking.jumlahBooking == 0
                ? null
                : () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text(
                          'Simulasi pembayaran berhasil dilakukan.',
                        ),
                      ),
                    );
                    context.read<BookingModel>().resetBooking();
                    Navigator.pushNamedAndRemoveUntil(
                      context,
                      AppRoutes.login,
                      (route) => false,
                    );
                  },
            icon: const Icon(Icons.check_circle_outline),
            label: const Text('Konfirmasi Pembayaran'),
          ),
          const SizedBox(height: 8),
          OutlinedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('Kembali ke Booking'),
          ),
        ],
      ),
    );
  }
}
