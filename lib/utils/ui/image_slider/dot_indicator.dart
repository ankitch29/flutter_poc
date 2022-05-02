import 'package:flutter/material.dart';
import 'package:flutter_poc/utils/constants.dart';
import 'package:flutter_poc/utils/ui/image_slider/dot_indicator_controller.dart';

class DotsIndicator extends AnimatedWidget {
  final _dotIndicatorController = DocIndicatorController();

  DotsIndicator(PageController controller, int itemCount,
      ValueChanged<int> onPageSelected,
      {Key? key})
      : super(listenable: controller, key: key) {
    _dotIndicatorController.controller = controller;
    _dotIndicatorController.itemCount = itemCount;
    _dotIndicatorController.onPageSelected = onPageSelected;
  }

  Widget _buildDot(int index) {
    return SizedBox(
      width: _dotIndicatorController.kDotSpacing,
      child: Center(
        child: Material(
          color: index == (_dotIndicatorController.controller.page ?? 0)
              ? ColourConstants.primary
              : ColourConstants.nonHighlightedColor,
          type: MaterialType.circle,
          child: SizedBox(
            width: _dotIndicatorController.kDotSize,
            height: _dotIndicatorController.kDotSize,
            child: InkWell(
              onTap: () => _dotIndicatorController.onPageSelected(index),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List<Widget>.generate(_dotIndicatorController.itemCount, _buildDot),
    );
  }
}
