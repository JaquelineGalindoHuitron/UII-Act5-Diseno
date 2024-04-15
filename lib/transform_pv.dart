import 'dart:math';

import 'package:flutter/material.dart';

class TransformPageView extends StatefulWidget {
  const TransformPageView({Key? key}) : super(key: key);

  @override
  _TransformPageViewState createState() => _TransformPageViewState();
}

class _TransformPageViewState extends State<TransformPageView> {
  final _controller = PageController(viewportFraction: 0.6);
  double _currentPage = 0.0;

  void _listener() {
    setState(() {
      _currentPage = _controller.page!;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller.addListener(_listener);
  }

  @override
  void dispose() {
    _controller.removeListener(_listener);
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double _opty;
    List<String> images = [
      'https://raw.githubusercontent.com/JaquelineGalindoHuitron/Img_FlutterFlow__IOS_6J/main/UII%20Act1%20Dise%C3%B1o%201%20Flutlab%20App%20Container%20Boxdecoration/img1.jpg',
      'https://raw.githubusercontent.com/JaquelineGalindoHuitron/Img_FlutterFlow__IOS_6J/main/UII%20Act1%20Dise%C3%B1o%201%20Flutlab%20App%20Container%20Boxdecoration/img2.jpg',
      'https://raw.githubusercontent.com/JaquelineGalindoHuitron/Img_FlutterFlow__IOS_6J/main/Act%2013%20GridView%20Flutter%20Flow/img7.jpg',
      'https://raw.githubusercontent.com/JaquelineGalindoHuitron/Img_FlutterFlow__IOS_6J/main/Act%2013%20GridView%20Flutter%20Flow/img14.jpg',
      'https://raw.githubusercontent.com/JaquelineGalindoHuitron/Img_FlutterFlow__IOS_6J/main/Act%2013%20GridView%20Flutter%20Flow/img12.jpg',
      'https://raw.githubusercontent.com/JaquelineGalindoHuitron/Img_FlutterFlow__IOS_6J/main/Act%2013%20GridView%20Flutter%20Flow/img13.jpg'
    ];
    return Center(
      child: SizedBox(
        height: 450.0,
        child: PageView.builder(
          controller: _controller,
          itemCount: images.length,
          itemBuilder: (_, i) {
            if (i == _currentPage) {
              _opty = 1;
              return Transform.scale(
                scale: 1.3,
                child: _pageImages(images[i], _opty),
              );
            } else if (i < _currentPage) {
              _opty = max(1 - (_currentPage - i), 0.5);
              return Transform.scale(
                scale: max(1.3 - (_currentPage - i), 0.8),
                child: _pageImages(images[i], _opty),
              );
            } else {
              _opty = max(1 - (i - _currentPage), 0.5);
              return Transform.scale(
                scale: max(1.3 - (i - _currentPage), 0.8),
                child: _pageImages(images[i], _opty),
              );
            }
          },
        ),
      ),
    );
  }
}

_pageImages(String images, double opty) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 80.0, horizontal: 18.0),
    child: Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(25.0),
          image: DecorationImage(
              image: NetworkImage(images),
              fit: BoxFit.fitHeight,
              opacity: opty)),
    ),
  );
}
