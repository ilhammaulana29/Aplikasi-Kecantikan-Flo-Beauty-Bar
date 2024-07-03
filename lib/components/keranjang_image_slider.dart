import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';

class KeranjangImageSlider extends StatefulWidget {
  final List<String> images;

  const KeranjangImageSlider({Key? key, required this.images}) : super(key: key);

  @override
  State<KeranjangImageSlider> createState() => _KeranjangImageSliderState();
}

class _KeranjangImageSliderState extends State<KeranjangImageSlider> {
  @override
  Widget build(BuildContext context) {
    return ImageSlideshow(
      indicatorColor: Color(0xFFFFC7051A),
      indicatorBackgroundColor: Color(0xFFFFB8B8B8),
      height: 300,
      autoPlayInterval: 5000,
      isLoop: true,
      children: widget.images
          .map((image) => Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.network(image),
              ))
          .toList(),
    );
  }
}
