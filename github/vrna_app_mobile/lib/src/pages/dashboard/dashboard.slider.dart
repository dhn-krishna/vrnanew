import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class CustomSlider extends StatefulWidget {
  final Stream<dynamic> bannerdata;
  const CustomSlider({Key key, this.bannerdata});
  @override
  _CustomSliderApp createState() => _CustomSliderApp();
}

class _CustomSliderApp extends State<CustomSlider> {
  int _currentIndex = 0;

  // List cardList = [Item1(), Item2(), Item3(), Item4()];

  List<T> map<T>(List list, Function handler) {
    List<T> result = [];
    for (var i = 0; i < list.length; i++) {
      result.add(handler(i, list[i]));
    }
    return result;
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return StreamBuilder<dynamic>(
        stream: widget.bannerdata,
        initialData: "",
        builder: (context, snapshot) {
          List cardList = [];
          if (snapshot.data != null && snapshot.data != '') {
            cardList = snapshot.data.data;
          }
          return Container(
              child: Column(
            children: <Widget>[
              CarouselSlider(
                options: CarouselOptions(
                  height: 200.0,
                  autoPlay: true,
                  autoPlayInterval: Duration(seconds: 3),
                  autoPlayAnimationDuration: Duration(milliseconds: 800),
                  autoPlayCurve: Curves.fastOutSlowIn,
                  viewportFraction: 1.0,
                  // pauseAutoPlayOnTouch: Duration(seconds: 10),
                  aspectRatio: 2.0,
                  // onPageChanged: (index) {
                  //   setState(() {
                  //     _currentIndex = index;
                  //   });
                  // }
                ),
                items: cardList.map((card) {
                  return Builder(builder: (BuildContext context) {
                    return Container(
                      height: size.height * 0.30,
                      width: size.width,
                      child: Card(
                        color: Colors.blueAccent,
                        child: Container(
                          child: Image.network(card.moviebannerurl,
                              fit: BoxFit.cover),
                        ),
                      ),
                    );
                  });
                }).toList(),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: map<Widget>(cardList, (index, url) {
                  return Container(
                    width: 10.0,
                    height: 10.0,
                    margin:
                        EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color:
                          _currentIndex == index ? Colors.yellow : Colors.grey,
                    ),
                  );
                }),
              ),
            ],
          ));
        });
  }
}

// class Item1 extends StatelessWidget {
//   const Item1({Key key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child: Image.asset('assets/images/movie3.jpg', fit: BoxFit.cover),
//     );
//   }
// }

// class Item2 extends StatelessWidget {
//   const Item2({Key key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child: Image.asset('assets/images/movie2.jpg', fit: BoxFit.cover),
//     );
//   }
// }

// class Item3 extends StatelessWidget {
//   const Item3({Key key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child: Image.asset('assets/images/movie4.jpg', fit: BoxFit.cover),
//     );
//   }
// }

// class Item4 extends StatelessWidget {
//   const Item4({Key key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child: Image.asset('assets/images/movie1.jpg', fit: BoxFit.cover),
//     );
//   }
// }

// class Item4 extends StatelessWidget {
//   const Item4({Key key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: <Widget>[
//           Text("Data",
//               style: TextStyle(
//                   color: Colors.white,
//                   fontSize: 22.0,
//                   fontWeight: FontWeight.bold)),
//           Text("Data",
//               style: TextStyle(
//                   color: Colors.white,
//                   fontSize: 17.0,
//                   fontWeight: FontWeight.w600)),
//         ],
//       ),
//     );
//   }
// }