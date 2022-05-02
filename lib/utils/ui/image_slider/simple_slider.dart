import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_poc/utils/ui/image_slider/dot_indicator.dart';
import 'package:flutter_poc/utils/ui/image_slider/simple_slider_controller.dart';

class ImageSliderWidget extends StatefulWidget {
  final simpleSliderController = SimpleSliderController();

  ImageSliderWidget({
    Key? key,
    required List<String> imageUrls,
    double imageHeight = 200.0,
  }) : super(key: key) {
    simpleSliderController.imageHeight = imageHeight;
    simpleSliderController.imageUrls = imageUrls;
  }

  @override
  ImageSliderWidgetState createState() {
    return ImageSliderWidgetState();
  }
}

class ImageSliderWidgetState extends State<ImageSliderWidget>
    with SingleTickerProviderStateMixin {
  late SimpleSliderController simpleSliderController;

  @override
  void initState() {
    super.initState();
    simpleSliderController = widget.simpleSliderController;
    simpleSliderController.pages = simpleSliderController.imageUrls.map((url) {
      return _buildImagePageItem(url);
    }).toList();
  }

  @override
  void dispose() {
    super.dispose();
    simpleSliderController.pageController.dispose();
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
          SizedBox(height: MediaQuery.of(context).size.height / 13),
          _buildDotsIndicatorOverlay(),
        ],
      ),
    );
  }

  Widget _buildPagerViewSlider() {
    return Expanded(
      child: PageView.builder(
        controller: simpleSliderController.pageController,
        itemCount: simpleSliderController.pages.length,
        itemBuilder: (BuildContext context, int index) {
          return simpleSliderController
              .pages[index % simpleSliderController.pages.length];
        },
        onPageChanged: (int p) {},
      ),
    );
  }

  Widget _buildDotsIndicatorOverlay() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: DotsIndicator(
        simpleSliderController.pageController,
        simpleSliderController.pages.length,
        (int page) {
          simpleSliderController.pageController.animateToPage(
            page,
            duration: const Duration(milliseconds: 300),
            curve: Curves.ease,
          );
        },
      ),
    );
  }

  Widget _buildImagePageItem(String imgUrl) {
    print(simpleSliderController.imageHeight);
    return Padding(
      padding: const EdgeInsets.only(right: 1, left: 1),
      child: Image.asset(imgUrl,
          height: simpleSliderController.imageHeight,
          width: simpleSliderController.imageHeight,
          fit: BoxFit.fitHeight),
    );
  }
}
