import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';

class CarouselPage extends StatefulWidget {

  @override
  State createState() => _CarouselPageState();
}

class _CarouselPageState extends State<CarouselPage> {

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Center(
        child: new SizedBox(
            height: 150.0,
            width: 300.0,
            child: new Carousel(
              images: [
                new NetworkImage('https://cdn-images-1.medium.com/max/2000/1*GqdzzfB_BHorv7V2NV7Jgg.jpeg'),
                new NetworkImage('https://cdn-images-1.medium.com/max/2000/1*wnIEgP1gNMrK5gZU7QS0-A.jpeg'),
//                new ExactAssetImage("assets/images/LaunchImage.jpg")
              ],
            )
        ),
      ),
    );
  }
}