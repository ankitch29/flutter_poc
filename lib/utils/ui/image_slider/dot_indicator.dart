import 'package:flutter/material.dart';
import 'package:flutter_poc/utils/constants.dart';

class DotsIndicator extends AnimatedWidget {
  const DotsIndicator(this.controller, this.itemCount, this.onPageSelected,
      {Key? key})
      : super(listenable: controller, key: key);

  /// The PageController that this DotsIndicator is representing.
  final PageController controller;

  /// The number of items managed by the PageController
  final int itemCount;

  /// Called when a dot is tapped
  final ValueChanged<int> onPageSelected;

  // The base size of the dots
  static const double _kDotSize = 10.0;

  // The distance between the center of each dot
  static const double _kDotSpacing = 15.0;

  Widget _buildDot(int index) {
    return SizedBox(
      width: _kDotSpacing,
      child: Center(
        child: Material(
          color: index == (controller.page ?? 0)
              ? ColourConstants.primary
              : ColourConstants.nonHighlightedColor,
          type: MaterialType.circle,
          child: SizedBox(
            width: _kDotSize,
            height: _kDotSize,
            child: InkWell(
              onTap: () => onPageSelected(index),
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
      children: List<Widget>.generate(itemCount, _buildDot),
    );
  }
}
