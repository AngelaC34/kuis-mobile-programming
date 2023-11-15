import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    CarouselOptions carouselOptions = CarouselOptions(
      height: 400,
      aspectRatio: 16 / 9,
      viewportFraction: 0.8,
      initialPage: 0,
      enableInfiniteScroll: true,
      reverse: false,
      autoPlay: true,
      autoPlayInterval: Duration(seconds: 3),
      autoPlayAnimationDuration: Duration(milliseconds: 800),
      autoPlayCurve: Curves.fastOutSlowIn,
      enlargeCenterPage: true,
      enlargeFactor: 0.3,
      onPageChanged: (index, reason) {
        // Callback function when page changes
        print('Page changed to index $index, reason: $reason');
      },
      scrollDirection: Axis.horizontal,
    );

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Godrej"),
          backgroundColor: Colors.red,
          shadowColor: Colors.yellow,
        ),
        body: Column(
          children: [
            CarouselSlider(
              items: List.generate(6, (index) {
                // Replace this with your carousel item widget
                return Container(
                  color: Colors.blue,
                  child: Center(
                    child: 
                      Text(
                      'Carousel Item $index',
                      style: TextStyle(fontSize: 20),
                    ),
                      
                    
                  ),
                );
              }),
              options: carouselOptions,
            ),
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                children: List.generate(6, (index) {
                  return Column(
                    children: [Text(
                      'Item $index',
                      style: Theme.of(context).textTheme.headline6,
                    ),
                    ElevatedButton.icon(
                      onPressed: () {},
                      icon: Icon(
                        Icons.download,
                        size: 24.0,
                      ),
                      label: Text('+ Keranjang'),
                    ),
                    ]
                  );
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
