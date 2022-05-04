import 'dart:ui';

enum DASHBOARD_MENU { dashboard, newData, message }

///All the const would be here
class Constants {
  static const keyName = 'key_name';
  static const enquiryInfoStr = 'Enquiry Information';
  static const enquiryInfoHint = 'Enter Your Pan Number';
}

class ColourConstants {
  static const Color primary = Color(0xFF00A6CA);
  static const Color textColour = Color(0xFF575757);
  static const Color textFieldBG = Color(0xFFF7F7F7);
  static const Color textFieldHint = Color(0xFF575757);
  static const Color nonHighlightedColor = Color(0xFFF2EFEF);
  static const Color accent = Color(0xFFFCD800);
  static const Color textDeclinedTitle = Color(0xFF5DBD1F);
  static const Color textDeclinedSubTitle = Color(0xFF646464);
  static const Color textAcceptTitled = Color(0xFFEB5D1E);
  static const Color progressPercentage = Color(0xFFFCAF47);
}

class NumberConstants {
  static const double kDefaultPadding = 20.0;
}
