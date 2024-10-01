import 'package:flutter/material.dart';
import 'package:pertemuan3/router_flutter/side_menu.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('About JASON STORE'),
        backgroundColor: Colors.teal,
      ),
      drawer: const Sidemenu(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Header Image
            Container(
              height: 200,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('logo.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            
            // App Description
            Container(
              padding: const EdgeInsets.all(20),
              color: Colors.teal.shade50,
              child: const Column(
                children: [
                  Text(
                    'JASON STORE',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.teal,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Belanja online jadi lebih mudah, aman, dan menyenangkan!',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 16, color: Colors.teal),
                  ),
                ],
              ),
            ),

            // Main Features
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Fitur Unggulan:',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.teal,
                    ),
                  ),
                  const SizedBox(height: 15),
                  _buildFeatureItem(Icons.shopping_cart, 'Jual produk dengan mudah'),
                  _buildFeatureItem(Icons.search, 'Cari barang yang kamu butuhkan'),
                  _buildFeatureItem(Icons.payment, 'Pembayaran aman dan fleksibel'),
                  _buildFeatureItem(Icons.local_shipping, 'Pengiriman cepat dan terpercaya'),
                ],
              ),
            ),

            // Footer
            Container(
              padding: const EdgeInsets.all(20),
              color: Colors.teal,
              child: const Text(
                'Terima kasih telah memilih JASON STORE sebagai partner belanja online Anda!',
                style: TextStyle(color: Colors.white, fontSize: 16),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFeatureItem(IconData icon, String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          Icon(icon, color: Colors.teal, size: 30),
          const SizedBox(width: 15),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }
}
