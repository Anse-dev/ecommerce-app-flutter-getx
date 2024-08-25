class Dimensions {
  final double width;
  final double height;
  final double depth;

  Dimensions({
    required this.width,
    required this.height,
    required this.depth,
  });

  factory Dimensions.fromMap(Map<String, dynamic> map) {
    return Dimensions(
      width: map['width'].toDouble(),
      height: map['height'].toDouble(),
      depth: map['depth'].toDouble(),
    );
  }

  factory Dimensions.fromJson(Map<String, dynamic> json) {
    return Dimensions.fromMap(json);
  }

  Map<String, dynamic> toMap() {
    return {
      'width': width,
      'height': height,
      'depth': depth,
    };
  }
}
