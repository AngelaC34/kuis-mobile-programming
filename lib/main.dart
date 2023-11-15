import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    CarouselOptions carouselOptions = CarouselOptions(
      height: 200,
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
        print('Page changed to index $index, reason: $reason');
      },
      scrollDirection: Axis.horizontal,
    );

    List<String> carouselImageUrls = [
      "https://lelogama.go-jek.com/post_featured_image/promo-dua-mingguan-januari-20201.jpg",
      "https://lelogama.go-jek.com/post_featured_image/promo-supermarket-header-maret.jpg",
      "https://img.inews.co.id/media/600/files/inews_new/2023/06/19/19_JUN___PROMO_JUJUR.png",
    ];

    List<Map<String, dynamic>> gridViewData = [
      {"image": "https://www.static-src.com/wcsstore/Indraprastha/images/catalog/full//107/MTA-3874976/fanta_medan---fanta-strawberry-can-minuman-ringan--330-ml-_full02.jpg", "text": "Product 1"},
      {"image": "https://media.monotaro.id/mid01/full/Perlengkapan%20Dapur%20%26%20Horeka/Minuman/Teh/Teh%20Pucuk%20Harum%20Teh%20Melati/P101548036-1.jpg", "text": "Product 2"},
      {"image": "https://media.monotaro.id/mid01/full/Perlengkapan%20Dapur%20%26%20Horeka/Minuman/Minuman%20Ringan/Pocari%20Sweat%20Minuman%20Isotonik%20PET/feP101574554-2.jpg", "text": "Product 3"},
      {"image": "https://www.static-src.com/wcsstore/Indraprastha/images/catalog/full//85/MTA-20300149/sprite_sprite-slim-can--250-ml-_full01.jpg", "text": "Product 4"},
      {"image": "https://www.static-src.com/wcsstore/Indraprastha/images/catalog/full//93/MTA-1904438/bear-brand_nestle-bear-brand-minuman-susu--30-pcs-_full02.jpg", "text": "Product 5"},
      {"image": "https://miro.medium.com/v2/resize:fit:1400/1*ih1XhLZ9dI9Vm9rblqAkMw.jpeg", "text": "Product 6"},
    ];

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Godrej"),
          backgroundColor: Colors.red,
          shadowColor: Colors.yellow,
          actions: [
            IconButton(
              icon: Icon(Icons.search),
              onPressed: () {
                print("Search button pressed");
              },
            ),
            IconButton(
              icon: Icon(Icons.shopping_basket),
              onPressed: () {
                print("Basket button pressed");
              },
            ),
          ],
        ),
        body: Column(
          children: [
             SafeArea(
            child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
            CircleAvatar(
              radius: 50.0,
              backgroundColor: Colors.white,
              backgroundImage: NetworkImage(
                  'https://upload.wikimedia.org/wikipedia/commons/thumb/9/97/Godrej_Logo.svg/597px-Godrej_Logo.svg.png'),
            ),
            Text("Godrej"),
            Text("5.441 Pengikut"),
            ElevatedButton.icon(
              onPressed: () {},
              icon: Icon(
                Icons.download,
                size: 24.0,
              ),
              label: Text('Mengikuti'),
            ),
            
          ]),
        )),
            CarouselSlider(
              items: carouselImageUrls.map((imageUrl) {
                return Container(
                  color: Colors.blue,
                  child: Center(
                    child: Image.network(
                      imageUrl,
                      fit: BoxFit.cover,
                      height: double.infinity,
                      width: double.infinity,
                    ),
                  ),
                );
              }).toList(),
              options: carouselOptions,
            ),
            Text(
              'Semua Produk',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                children: List.generate(gridViewData.length, (index) {
                  return Column(
                    children: [
                      Image.network(
                        gridViewData[index]["image"],
                        height: 100,
                        width: 100,
                        fit: BoxFit.cover,
                      ),
                      Text(
                        gridViewData[index]["text"],
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
                    ],
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
