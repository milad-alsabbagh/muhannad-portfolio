import 'package:flutter/material.dart';
import 'package:muhannadwebsite/services/decode_image.dart';

List<String> imagePath = [
  'assets/images/1.jpg',
  'assets/images/2.jpg',
  'assets/images/4.jpg'
];
List<String> encodingImages = List.generate(imagePath.length, (index) => '');
late String dockerMd;

Future<void> convertImage() async {
  for (int i = 0; i < imagePath.length; i++) {
    await ImageConverter.imageToBase64(imagePath[i]).then((value) {
      encodingImages[i] = value;
    }).then((value) {
      dockerMd = '''
<html>
	<head>
		<title>Example website</title>
		<meta charset="utf-8"/>
		<meta http-equiv="Content-type" content="text/html; charset=utf-8"/>
		<meta name="viewport" content="width=device-width, initial-scale=1"/>
      <style type="text/css">* {font-family: Inter;} body {padding: 2em;}</style>
	</head>
	<body>
		<div>
			<h1>Hello world!</h1>
			<p>This is a example website.</p>
            <!-- Hi! -->
			<p>
				<a href="https://tiagorangel.com/">Learn More</a>
			</p>
		</div>

  <img src="data:image/jpeg;base64, ${encodingImages[0]}" alt="Your Image" />

   <img src="data:image/jpeg;base64, ${encodingImages[1]}" alt="Your Image" />
<img src="data:image/jpeg;base64, ${encodingImages[2]}" alt="Your Image" />

</body>
</html>''';
    });
  }
}
