class LinkModel{
  final Uri uri;
  final String imagePath;
  final int index;
  LinkModel({required this.index,required this.uri,required this.imagePath});
}
int currentIndex=-1;
List<LinkModel> links =[
  LinkModel( index :++currentIndex,uri: Uri.parse('https://web.facebook.com/mohannad.alsabbagh'), imagePath: 'assets/images/facebooklogo.png'),
  LinkModel( index:++currentIndex,uri: Uri.parse('https://www.linkedin.com/in/muhannad-al-sabbagh-843b08198/'),imagePath: 'assets/images/linkedIn.png'),
  LinkModel( index:++currentIndex,uri: Uri.parse('https://github.com/muhannad-hash'), imagePath: 'assets/images/gitHub.png'),
];
