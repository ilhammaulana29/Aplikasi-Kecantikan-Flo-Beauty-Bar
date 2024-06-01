import 'package:flutter/material.dart';

class DetailProduk extends StatefulWidget {
  // const DetailProduk({super.key});

  String img;
  DetailProduk(this.img);

  @override
  State<DetailProduk> createState() => _DetailProdukState();
}

class _DetailProdukState extends State<DetailProduk> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('Ilham'),
    );
  }
}
