int colorHexToColorInt(String color) {
  String auxColor = color.replaceAll('#', '0xff');
  int hexColor = int.parse(auxColor);
  return hexColor;
}
