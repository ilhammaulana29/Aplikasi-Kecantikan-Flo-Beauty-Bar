import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'detail_produk.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List _listData = [];

  Future<void> _getData() async {
    try {
      final response = await http
          .get(Uri.parse('http://192.168.88.254/flutterapi/read.php'));
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        setState(() {
          _listData = data;
        });
      } else {
        print('Server responded with status code: ${response.statusCode}');
      }
    } catch (e) {
      print('Error occurred: $e');
    }
  }

  @override
  void initState() {
    super.initState();
    _getData();
  }

  final List<String> imagesCategori = [
    'images/componens/body-care.png',
    'images/componens/facial-care.png',
    'images/componens/hair-care.png',
    'images/componens/parfum.png',
    'images/componens/hijab.png',
    'images/componens/accesoris.png',
  ];

  final List<String> textsCategory = [
    'Body Care',
    'Facial Care',
    'Hair Care',
    'Parfum',
    'Hijab',
    'Accesoris',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Color(0xFFFFB9C4),
        elevation: 0,
        title: Container(
          margin: EdgeInsets.only(top: 5, bottom: 5),
          width: double.infinity,
          height: 40,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(25),
          ),
          child: TextFormField(
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: "Cari Produk",
              hintStyle: TextStyle(color: Colors.black.withOpacity(0.5)),
              prefixIcon: Icon(Icons.search),
            ),
          ),
        ),
        actions: [
          Icon(
            Icons.notifications_none_outlined,
            size: 30,
            color: Color(0xFFFFC7051A),
          ),
          SizedBox(width: 10),
          Icon(
            Icons.chat_bubble_outline_rounded,
            size: 30,
            color: Color(0xFFFFC7051A),
          ),
          SizedBox(width: 10),
        ],
      ),
      body: ListView(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Color(0xFFFFB9C4),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30),
              ),
            ),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
                  child: Text(
                    "One Step Closer to Reach your Skin Goals!",
                    style: TextStyle(
                      fontSize: 30,
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.bold,
                      color: Color(0xFFFF8B2833),
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(height: 20),
              ],
            ),
          ),
          SizedBox(height: 20),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: List.generate(imagesCategori.length, (index) {
                return Container(
                  margin: EdgeInsets.all(13.0),
                  width: 100,
                  decoration: BoxDecoration(
                    color: Color(0xFFFFFE738A).withOpacity(.10),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      children: [
                        Image.asset(imagesCategori[index]),
                        SizedBox(height: 10),
                        Text(
                          textsCategory[index],
                          style: TextStyle(color: Colors.black),
                        ),
                      ],
                    ),
                  ),
                );
              }),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(13.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Rekomendasi',
                  style: TextStyle(
                    fontFamily: 'Roboto',
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'Lihat Semua',
                  style: TextStyle(
                    fontFamily: 'Roboto',
                    fontSize: 17,
                    color: Color(0xFFFFC7051A),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: GridView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: 0.7,
              ),
              itemCount: _listData.length,
              itemBuilder: (context, index) {
                final product = _listData[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailProduk(
                          images: [
                            'images/${product['gambar1']}' ??
                                'images/placeholder.png',
                            'images/${product['gambar2']}' ??
                                'images/placeholder.png',
                            'images/${product['gambar3']}' ??
                                'images/placeholder.png',
                          ],
                          title: product['nama_produk'] ?? 'No title',
                          price: product['harga_produk'] ?? 'No price',
                          description:
                              product['deskripsi_produk'] ?? 'No description',
                        ),
                      ),
                    );
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.10),
                          spreadRadius: 2,
                          blurRadius: 10,
                          offset: Offset(0, 5),
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        Align(
                          alignment: Alignment.topRight,
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              Container(
                                width: 20,
                                height: 20,
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
                                size: 15,
                              )
                            ],
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.all(2),
                            child: Image.asset(
                              'images/produks/${product['gambar_produk']}' ??
                                  'images/placeholder.png',
                              width: 200,
                              height: 200,
                            ),
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          product['nama_produk'] ?? 'No title',
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontSize: 15,
                            fontFamily: 'Roboto',
                          ),
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            product['harga_produk'] ?? 'No price',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              fontSize: 18,
                              fontFamily: 'Roboto',
                            ),
                          ),
                        ),
                        Row(
                          children: [
                            Icon(Icons.star, size: 20, color: Colors.yellow),
                            SizedBox(width: 5),
                            Text('4.5'),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
