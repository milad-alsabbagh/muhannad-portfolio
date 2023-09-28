import '../models/link_model.dart';

int currentIndex=-1;
List<LinkModel> linksList =[
  LinkModel( index :++currentIndex,uri: Uri.parse('https://web.facebook.com/mohannad.alsabbagh'), imagePath: 'assets/images/facebooklogo.png'),
  LinkModel( index:++currentIndex,uri: Uri.parse('https://www.linkedin.com/in/muhannad-al-sabbagh-843b08198/'),imagePath: 'assets/images/linkedIn.png'),
  LinkModel( index:++currentIndex,uri: Uri.parse('https://github.com/muhannad-hash'), imagePath: 'assets/images/gitHub.png'),
];
//make sure the index in any object is ++currentIndex
//here you can add links to your website that appear in home page
//inside links list just add comma , to the end of line and copy and paste
//any LinkModel object after that you can change the link where you want to lead
// the user inside Uri.parse and change the image in imagePath variable