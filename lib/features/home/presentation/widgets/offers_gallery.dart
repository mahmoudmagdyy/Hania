import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../../../../core/widgets/diff_img.dart';

class OffersGallery extends StatelessWidget {
  const OffersGallery({super.key});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;

    var pageIndexNotifier = ValueNotifier<int>(0);
    return SizedBox(
      // padding: const EdgeInsets.all(8),
      height: screenHeight * 0.2821,
      child: Container(
        padding: const EdgeInsets.all(8),
        width: double.infinity,
        decoration: const BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Color.fromRGBO(60, 128, 209, .09),
              blurRadius: 19.0,
              offset: Offset(0, 12),
              blurStyle: BlurStyle.normal,
            ),
          ],
        ),
        child: CarouselSlider(
          items: [
            "https://images.pexels.com/photos/19647394/pexels-photo-19647394/free-photo-of-couple-at-a-cafe.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2",
            "https://images.pexels.com/photos/4109084/pexels-photo-4109084.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2",
          ].map((offer) {
            return Builder(
              builder: (BuildContext context) {
                return GestureDetector(
                  child: DiffImage(
                    image: offer,
                    height: double.infinity,
                    width: double.infinity,
                  ),
                );
              },
            );
          }).toList(),
          options: CarouselOptions(
            viewportFraction: 1.0,
            padEnds: true,
            enableInfiniteScroll: true,
            autoPlay: true,
            autoPlayInterval: const Duration(seconds: 3),
            autoPlayAnimationDuration: const Duration(milliseconds: 800),
            onPageChanged: (val, _) {
              pageIndexNotifier.value = val;
            },
          ),
        ),
      ),
    );
  }
}
