class AnimatedPhoto {
  final String imagePath;
  final String? text;
  final int index;
  final String location;

  AnimatedPhoto(
      {this.text,
      required this.imagePath,
      required this.index,
      required this.location});
}
