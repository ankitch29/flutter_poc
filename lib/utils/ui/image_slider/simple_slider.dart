import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_poc/utils/ui/image_slider/dot_indicator.dart';

class ImageSliderWidget extends StatefulWidget {
  final List<String> imageUrls;
  final BorderRadius imageBorderRadius;
  final double imageHeight;

  const ImageSliderWidget({
    Key? key,
    required this.imageUrls,
    required this.imageBorderRadius,
    this.imageHeight = 200.0,
  }) : super(key: key);

  @override
  ImageSliderWidgetState createState() {
    return ImageSliderWidgetState();
  }
}

class ImageSliderWidgetState extends State<ImageSliderWidget>
    with SingleTickerProviderStateMixin {
  List<Widget> _pages = [];

  final _pageController = PageController(initialPage: 0, keepPage: true);

  @override
  void initState() {
    super.initState();
    _pages = widget.imageUrls.map((url) {
      return _buildImagePageItem(url);
    }).toList();
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return _buildingImageSlider();
  }

  Widget _buildingImageSlider() {
    return Container(
      padding: const EdgeInsets.only(top: 5),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _buildPagerViewSlider(),
          SizedBox(height: MediaQuery.of(context).size.height / 12),
          _buildDotsIndicatorOverlay(),
        ],
      ),
    );
  }

  Widget _buildPagerViewSlider() {
    return SizedBox(
      height: widget.imageHeight,
      child: PageView.builder(
        controller: _pageController,
        itemCount: _pages.length,
        itemBuilder: (BuildContext context, int index) {
          return _pages[index % _pages.length];
        },
        onPageChanged: (int p) {
        },
      ),
    );
  }

  Widget _buildDotsIndicatorOverlay() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: DotsIndicator(
        _pageController,
        _pages.length,
        (int page) {
          _pageController.animateToPage(
            page,
            duration: const Duration(milliseconds: 300),
            curve: Curves.ease,
          );
        },
      ),
    );
  }

  Widget _buildImagePageItem(String imgUrl) {
    return ClipRRect(
      borderRadius: widget.imageBorderRadius,
      child: Padding(
        padding: const EdgeInsets.only(right: 1, left: 1),
        child: Image.asset(imgUrl,
            height: widget.imageHeight,
            width: widget.imageHeight,
            fit: BoxFit.fitHeight),
      ),
    );
  }
}
