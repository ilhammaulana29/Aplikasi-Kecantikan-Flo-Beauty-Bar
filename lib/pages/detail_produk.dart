import 'package:flutter/material.dart';
import 'package:aplikasi/components/keranjang_image_slider.dart';

class DetailProduk extends StatefulWidget {
  final List<String> images;
  final String title;
  final String price;
  final String description;

  DetailProduk({
    required this.images,
    required this.title,
    required this.price,
    required this.description,
  });

  @override
  State<DetailProduk> createState() => _DetailProdukState();
}

class _DetailProdukState extends State<DetailProduk> {
  int _itemCount = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.only(
              left: 10,
              right: 15,
              top: 20,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  icon: Icon(Icons.arrow_back),
                  color: Color(0xFFFFC7051A),
                  iconSize: 40,
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                      width: 30,
                      height: 30,
                      decoration: BoxDecoration(
                        color: Color(0xFFFFB8B8B8),
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: Color(0xFFFFB8B8B8),
                            spreadRadius: 2,
                            blurRadius: 7,
                            offset: Offset(0, 3),
                          ),
                        ],
                      ),
                    ),
                    Icon(
                      Icons.favorite,
                      color: Colors.white,
                      size: 20,
                    )
                  ],
                ),
              ],
            ),
          ),
          Stack(
            children: [
              Center(
                child: KeranjangImageSlider(images: widget.images),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(left: 13, right: 13),
            child: Text(
              widget.title,
              style: TextStyle(
                fontFamily: 'Roboto',
                fontSize: 30,
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 13, right: 13),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  widget.price,
                  style: TextStyle(
                    fontFamily: 'Roboto',
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 13, right: 13),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 25,
                  height: 25,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Color(0xFFFFB8B8B8),
                        spreadRadius: 2,
                        blurRadius: 7,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Center(
                    child: IconButton(
                      icon: Icon(Icons.remove),
                      color: Color(0xFFFFC7051A),
                      iconSize: 10,
                      onPressed: () {
                        setState(() {
                          if (_itemCount > 1) {
                            _itemCount--;
                          }
                        });
                      },
                    ),
                  ),
                ),
                SizedBox(width: 10),
                Text(
                  _itemCount.toString(),
                  style: TextStyle(fontSize: 20),
                ),
                SizedBox(width: 10),
                Container(
                  width: 25,
                  height: 25,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Color(0xFFFFB8B8B8),
                        spreadRadius: 2,
                        blurRadius: 7,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Center(
                    child: IconButton(
                      icon: Icon(Icons.add),
                      color: Color(0xFFFFC7051A),
                      iconSize: 10,
                      onPressed: () {
                        setState(() {
                          _itemCount++;
                        });
                      },
                    ),
                  ),
                ),
                SizedBox(width: 20),
                Container(
                  height: 45,
                  width: 200,
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      backgroundColor: Color(0xFFFFC7051A),
                      shadowColor: Colors.black,
                      elevation: 3,
                    ),
                    child: Text(
                      "Tambah Keranjang",
                      style: TextStyle(
                        fontSize: 10,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 18),
          Padding(
            padding: const EdgeInsets.only(left: 13, right: 13),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Deskripsi',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontFamily: 'Roboto',
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  widget.description,
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                    fontFamily: 'Roboto',
                    fontSize: 18,
                    color: Colors.black.withOpacity(0.50),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
