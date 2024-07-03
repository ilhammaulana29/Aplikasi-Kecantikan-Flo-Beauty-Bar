import 'package:flutter/material.dart';

class KategoriPage extends StatefulWidget {
  const KategoriPage({super.key});

  @override
  State<KategoriPage> createState() => _KategoriPageState();
}

class _KategoriPageState extends State<KategoriPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Kategori'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            // Action for back button
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Ayo Cari Produk Sesuai Kategori',
              style: TextStyle(
                color: Colors.red,
                fontSize: 18.0,
              ),
            ),
            const SizedBox(height: 20.0),
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 16.0,
                mainAxisSpacing: 16.0,
                children: const <Widget>[
                  CategoryItem(
                    icon: Icons.spa,
                    label: 'Body Care',
                  ),
                  CategoryItem(
                    icon: Icons.face,
                    label: 'Facial Care',
                  ),
                  CategoryItem(
                    icon: Icons.content_cut,
                    label: 'Hair Care',
                  ),
                  CategoryItem(
                    icon: Icons.local_mall,
                    label: 'Parfum',
                  ),
                  CategoryItem(
                    icon: Icons.woman,
                    label: 'Hijab',
                  ),
                  CategoryItem(
                    icon: Icons.watch,
                    label: 'Accesories',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CategoryItem extends StatelessWidget {
  final IconData icon;
  final String label;

  const CategoryItem({required this.icon, required this.label, super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2.0,
      child: InkWell(
        onTap: () {
          // Action when the category item is tapped
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(
              icon,
              size: 50.0,
              color: Colors.grey,
            ),
            const SizedBox(height: 10.0),
            Text(
              label,
              style: const TextStyle(fontSize: 16.0),
            ),
          ],
        ),
      ),
    );
  }
}
