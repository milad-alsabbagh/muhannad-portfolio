import 'dart:convert';
import 'package:flutter/services.dart';

class ImageConverter {
  // Method to convert an image to a base64-encoded string
  static Future<String> imageToBase64(String imagePath) async {
    ByteData bytes = await rootBundle.load(imagePath);
    List<int> byteList = bytes.buffer.asUint8List();
    return base64Encode(byteList);
  }
}
