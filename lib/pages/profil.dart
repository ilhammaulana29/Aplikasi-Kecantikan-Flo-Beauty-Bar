import 'package:flutter/material.dart';

class ProfilPage extends StatefulWidget {
  const ProfilPage({super.key});

  @override
  State<ProfilPage> createState() => _ProfilPageState();
}

class _ProfilPageState extends State<ProfilPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink,
        title: const Text('Profil'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              color: Colors.pink,
              padding: const EdgeInsets.all(20),
              child: Column(
                children: const [
                  CircleAvatar(
                    radius: 50,
                    backgroundColor: Colors.white,
                    child: Icon(Icons.person, size: 50, color: Colors.pink),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Ilham Maulana',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ],
              ),
            ),
            ListTile(
              title: const Text('Pesanan Saya'),
              trailing: TextButton(
                onPressed: () {},
                child: const Text('Lihat Riwayat Pesanan'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const OrderStatusWidget(title: 'Belum Bayar', icon: Icons.payment),
                  const OrderStatusWidget(title: 'Dikemas', icon: Icons.local_shipping),
                  const OrderStatusWidget(title: 'Dikirim', icon: Icons.airport_shuttle),
                  Stack(
                    children: [
                      const OrderStatusWidget(title: 'Ulasan', icon: Icons.rate_review),
                      Positioned(
                        right: 0,
                        child: CircleAvatar(
                          radius: 10,
                          backgroundColor: Colors.red,
                          child: const Text(
                            '3',
                            style: TextStyle(color: Colors.white, fontSize: 12),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const ListTile(
              leading: Icon(Icons.favorite),
              title: Text('Wishlist'),
            ),
            const ListTile(
              leading: Icon(Icons.history),
              title: Text('Terakhir Dilihat'),
            ),
            const ListTile(
              leading: Icon(Icons.settings),
              title: Text('Pengaturan Akun'),
            ),
          ],
        ),
      ),
    );
  }
}

class OrderStatusWidget extends StatelessWidget {
  final String title;
  final IconData icon;

  const OrderStatusWidget({required this.title, required this.icon, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(icon, size: 40, color: Colors.pink),
        const SizedBox(height: 5),
        Text(title),
      ],
    );
  }
}
