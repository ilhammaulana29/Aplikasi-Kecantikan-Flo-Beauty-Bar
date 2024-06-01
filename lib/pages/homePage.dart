import 'package:aplikasi/pages/detail_produk.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<String> imagesCategori = [
    'images/body-care.png',
    'images/facial-care.png',
    'images/hair-care.png',
    'images/parfum.png',
    'images/hijab.png',
    'images/accesoris.png',
  ];

  final List<String> textsCategory = [
    'Body Care',
    'Facial Care',
    'Hair Care',
    'Parfum',
    'Hijab',
    'Accesoris',
  ];

  final List<String> images = [
    'images/camile.png',
    'images/cetaphil.png',
    'images/serum.png',
    'images/toner.png',
  ];

  final List<String> texts = [
    'Camile Body Scrub',
    'Cetaphil Body Wash',
    'Camile Facial Wash',
    'Camile Moisturizer',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
                  padding: const EdgeInsets.only(right: 8, left: 8, top: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(
                        Icons.line_axis,
                        size: 40,
                        color: Color(0xFFFFC7051A),
                      ),
                      Icon(
                        Icons.notifications,
                        size: 40,
                        color: Color(0xFFFFC7051A),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 28),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                    "One Step Closer to Reach your Skin Goals!",
                    style: TextStyle(
                      fontSize: 40,
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.bold,
                      color: Color(0xFFFF8B2833),
                    ),
                  ),
                ),
                SizedBox(height: 28),
                Padding(
                  padding:
                      const EdgeInsets.only(left: 10, right: 10, bottom: 10),
                  child: Container(
                    margin: EdgeInsets.only(top: 5, bottom: 20),
                    width: MediaQuery.of(context).size.width,
                    height: 50,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: TextFormField(
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Cari Produk",
                        hintStyle:
                            TextStyle(color: Colors.black.withOpacity(0.5)),
                        prefixIcon: Icon(Icons.search),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 28),
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
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'Lihat Semua',
                  style: TextStyle(
                    fontFamily: 'Roboto',
                    fontSize: 18,
                    color: Color(0xFFFFC7051A),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 10),
          GridView.builder(
            padding: EdgeInsets.only(left: 13, right: 13),
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio:
                  (MediaQuery.of(context).size.height - 50 - 25) / (4 * 240),
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
            ),
            itemCount: images.length,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DetailProduk(images[index]),
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
                          offset: Offset(0, 5))
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
                                        offset: Offset(0, 3)),
                                  ]),
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
                            images[index],
                            width: 200,
                            height: 200,
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        texts[index],
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontSize: 18,
                          fontFamily: 'Roboto',
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Row(
                            children: [
                              Icon(Icons.star, size: 20, color: Colors.yellow),
                              SizedBox(width: 5),
                              Text('4.5'),
                            ],
                          ),
                          Text(
                            '50.000',
                            style:
                                TextStyle(fontSize: 18, fontFamily: 'Roboto'),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
