import 'package:bloc/bloc.dart';
import 'package:muhannadwebsite/cubit/states.dart';
import 'package:muhannadwebsite/models_lists/skills_list.dart';
import 'package:url_launcher/url_launcher.dart';
import '../models_lists/images_of_life_list.dart';
import '../models_lists/links_list.dart';

class WebsiteCubit extends Cubit<WebsiteStates> {
  WebsiteCubit() : super(WebsiteInitialState());
  bool isDark = true;
  void changeThemeMode() {
    isDark = !isDark;
    emit(ChangeThemeModeState());
  }

  Future<void> launchInBrowser(Uri url) async {
    if (!await launchUrl(
      url,
      mode: LaunchMode.externalApplication,
    )) {
      throw Exception('Could not launch $url');
    }
  }

  List<bool> hoveringOnImagesOfLife = [];

  void changeOnHoverImagesOflifeVisibility(
      {required bool hover, required int index}) {
    hoveringOnImagesOfLife[index] = hover;
    print(hoveringOnImagesOfLife);
    emit(ChangeHoverVisibilityState());
  }

  List<bool> reSize = [];
  bool rowContainer = false;
  void changeSizeOnHover({required bool hover, required int index}) {
    reSize[index] = hover;
    rowContainer = hover;
    print(reSize);
    emit(ChangeSizeOnHoverState());
  }

  List<bool> hoveringOnSkills = [];
  void changeHoveringOnSkillText({required bool hover, required int index}) {
    hoveringOnSkills[index] = hover;
    print(hoveringOnSkills);
    emit(ChangeHoveringOnSkillTextState());
  }

  void fullBollsLists() {
    for (int i = 0; i <= linksList.length - 1; i++) {
      reSize.add(false);
    }
    for (int i = 0; i <= skillsList.length - 1; i++) {
      hoveringOnSkills.add(false);
    }
    for (int i = 0; i <= imagesOfLifeList.length - 1; i++) {
      hoveringOnImagesOfLife.add(false);
    }
    emit(FullListsState());
  }

  int clickedImageIndex = -1;
  void clickOnImage(int imageIndex) {
    clickedImageIndex = imageIndex;
    emit(ClickOnImageState());
  }
// late PdfController pdfController;
//   Future<void> loadPDF(BuildContext context) async {
//      pdfController = PdfController(
//       document: PdfDocument.openAsset('assets/files/Resume_Muhannad_Alsabbagh.pdf'),
//     );
//   }
}
