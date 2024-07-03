import 'package:flutter/material.dart';

class KeranjangPage extends StatelessWidget {
  const KeranjangPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back),
          color: Colors.red,
        ),
        title: const Text(
          'Keranjang',
          style: TextStyle(
            color: Colors.red,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            CartItem(
              title: 'Body Scrub',
              price: 'Rp39.000',
              image: 'images/produks/camile.jpeg', // Replace with your image path
              initialQuantity: 2,
              size: '80ml',
            ),

            CartItem(
              title: 'Serum',
              price: 'Rp89.700',
              image: 'images/produks/serum.jpeg', // Replace with your image path
              initialQuantity: 2,
              size: '15ml',
            ),

            CartItem(
              title: 'Facial Wash',
              price: 'Rp150.500',
              image: 'images/produks/makarizo.jpg', // Replace with your image path
              initialQuantity: 2,
              size: '500ml',
            ),

            CartItem(
              title: 'Parfum',
              price: 'Rp44.000',
              image: 'images/produks/toner.jpeg', // Replace with your image path
              initialQuantity: 2,
              size: '80ml',
            ),

          ],
        ),
      ),
    );
  }
}

class CartItem extends StatefulWidget {
  const CartItem({
    Key? key,
    required this.title,
    required this.price,
    required this.image,
    required this.initialQuantity,
    required this.size,
  }) : super(key: key);

  final String title;
  final String price;
  final String image;
  final int initialQuantity;
  final String size;

  @override
  _CartItemState createState() => _CartItemState();
}

class _CartItemState extends State<CartItem> {
  late int _quantity;

  @override
  void initState() {
    super.initState();
    _quantity = widget.initialQuantity;
  }

  void _incrementQuantity() {
    setState(() {
      _quantity++;
    });
  }

  void _decrementQuantity() {
    if (_quantity > 0) {
      setState(() {
        _quantity--;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        children: [
          Image.asset(
            widget.image,
            height: 80,
            width: 80,
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'Ukuran ${widget.size}',
                  style: const TextStyle(fontSize: 14),
                ),
                const SizedBox(height: 8),
                Text(
                  widget.price,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Colors.red,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 16),
          Column(
            children: [
              IconButton(
                onPressed: () {}, // Implement delete functionality
                icon: const Icon(Icons.delete_outline),
              ),
              Row(
                children: [
                  IconButton(
                    onPressed: _decrementQuantity,
                    icon: const Icon(Icons.remove_circle_outline),
                    color: Colors.red,
                  ),
                  Text(
                    _quantity.toString(),
                    style: const TextStyle(fontSize: 18),
                  ),
                  IconButton(
                    onPressed: _incrementQuantity,
                    icon: const Icon(Icons.add_circle_outline),
                    color: Colors.red,
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}