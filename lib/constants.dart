import 'package:flutter/material.dart';

MaterialColor primaryColor = const MaterialColor(
  0xFF482482,
  <int, Color>{
    50: Color(0xFF482482),
    100: Color(0xFF482482),
    200: Color(0xFF482482),
    300: Color(0xFF482482),
    400: Color(0xFF482482),
    500: Color(0xFF482482),
    600: Color(0xFF482482),
    700: Color(0xFF482482),
    800: Color(0xFF482482),
    900: Color(0xFF482482),
  },
);

BoxShadow boxShadow1 = BoxShadow(
  color: const Color(0xFF5F9DE7).withOpacity(0.3),
  blurRadius: 30,
  offset: const Offset(0, 5),
);

BoxShadow boxShadow2 = const BoxShadow(
  color: Color(0xFFFFFFFF),
  blurRadius: 16,
  offset: Offset(-4, -2),
);

Duration animationDuration = const Duration(milliseconds: 200);
ThemeDesign design = ThemeDesign(
  dark: ThemeColors(
    primary: const Color(0xFFFAAB1B),
    secondary: const Color(0xFF945439),
    background: const Color(0xFF212426),
    background2: const Color(0xFF373a3c),
    textcolor: const Color(0xFFF9D3B4),
    text2color: const Color(0xFF000000),
    bodyColor: const Color(0xFFA6AAB4),
    fieldColor: const Color(0xFFE2E3E0),
    gradient: const LinearGradient(
      begin: Alignment.centerRight,
      end: Alignment.centerLeft,
      colors: <Color>[
        Color(0xFF945439),
        Color(0xFFD9896A),
      ],
    ),
    gradient2: const LinearGradient(
      begin: Alignment.centerRight,
      end: Alignment.centerLeft,
      colors: <Color>[
        Color(0xFF945439),
        Color(0xFFD9896A),
      ],
    ),
  ),
  light: ThemeColors(
    primary: const Color(0xFFFFC93E),
    secondary: const Color(0xFF4B3B32),
    background: const Color(0xFFE5E6E3),
    background2: const Color(0xFFFFFFFF),
    textcolor: const Color(0xFF002336),
    text2color: const Color(0xFFFFFFFF),
    bodyColor: const Color(0xFFA6AAB4),
    fieldColor: const Color(0xFFE2E3E0),
    gradient: const LinearGradient(
      begin: Alignment.centerLeft,
      end: Alignment.centerRight,
      colors: <Color>[
        Color(0xFFFFC93E),
        Color(0xFFEBAA03),
      ],
    ),
    gradient2: const LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: <Color>[
        Color(0xFF4B3B32),
        Color(0xFF4B3B32),
      ],
    ),
  ),
);

class ThemeDesign {
  ThemeDesign({
    required this.dark,
    required this.light,
  });
  final ThemeColors dark;
  final ThemeColors light;
}

class ThemeColors {
  ThemeColors({
    required this.primary,
    required this.secondary,
    required this.background,
    required this.background2,
    required this.textcolor,
    required this.text2color,
    required this.bodyColor,
    required this.gradient,
    required this.gradient2,
    required this.fieldColor,
  });
  final Color primary;
  final Color secondary;
  final Color background;
  final Color background2;
  final Color textcolor;
  final Color text2color;
  final Color bodyColor;
  final LinearGradient gradient;
  final LinearGradient gradient2;
  final Color fieldColor;
}

List lightMapStyle = [];
List darkMapStyle = [
  {
    "elementType": "geometry",
    "stylers": [
      {"color": "#242f3e"}
    ]
  },
  {
    "elementType": "labels.text.fill",
    "stylers": [
      {"color": "#746855"}
    ]
  },
  {
    "elementType": "labels.text.stroke",
    "stylers": [
      {"color": "#242f3e"}
    ]
  },
  {
    "featureType": "administrative.locality",
    "elementType": "labels.text.fill",
    "stylers": [
      {"color": "#d59563"}
    ]
  },
  {
    "featureType": "poi",
    "elementType": "labels.text.fill",
    "stylers": [
      {"color": "#d59563"}
    ]
  },
  {
    "featureType": "poi.park",
    "elementType": "geometry",
    "stylers": [
      {"color": "#263c3f"}
    ]
  },
  {
    "featureType": "poi.park",
    "elementType": "labels.text.fill",
    "stylers": [
      {"color": "#6b9a76"}
    ]
  },
  {
    "featureType": "road",
    "elementType": "geometry",
    "stylers": [
      {"color": "#38414e"}
    ]
  },
  {
    "featureType": "road",
    "elementType": "geometry.stroke",
    "stylers": [
      {"color": "#212a37"}
    ]
  },
  {
    "featureType": "road",
    "elementType": "labels.text.fill",
    "stylers": [
      {"color": "#9ca5b3"}
    ]
  },
  {
    "featureType": "road.highway",
    "elementType": "geometry",
    "stylers": [
      {"color": "#746855"}
    ]
  },
  {
    "featureType": "road.highway",
    "elementType": "geometry.stroke",
    "stylers": [
      {"color": "#1f2835"}
    ]
  },
  {
    "featureType": "road.highway",
    "elementType": "labels.text.fill",
    "stylers": [
      {"color": "#f3d19c"}
    ]
  },
  {
    "featureType": "transit",
    "elementType": "geometry",
    "stylers": [
      {"color": "#2f3948"}
    ]
  },
  {
    "featureType": "transit.station",
    "elementType": "labels.text.fill",
    "stylers": [
      {"color": "#d59563"}
    ]
  },
  {
    "featureType": "water",
    "elementType": "geometry",
    "stylers": [
      {"color": "#17263c"}
    ]
  },
  {
    "featureType": "water",
    "elementType": "labels.text.fill",
    "stylers": [
      {"color": "#515c6d"}
    ]
  },
  {
    "featureType": "water",
    "elementType": "labels.text.stroke",
    "stylers": [
      {"color": "#17263c"}
    ]
  }
];
