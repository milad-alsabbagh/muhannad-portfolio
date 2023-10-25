import 'package:bloc/bloc.dart';
import 'package:muhannadwebsite/cubit/states.dart';
import 'package:muhannadwebsite/models_lists/hover_skills_list.dart';
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
  List<bool> hoverOnSkillCircleAvatar = [];

  void changeOnHoverImagesOflifeVisibility(
      {required bool hover, required int index}) {
    hoveringOnImagesOfLife[index] = hover;
    emit(ChangeHoverVisibilityState());
  }

  List<bool> reSize = [];
  bool rowContainer = false;
  void changeSizeOnHover({required bool hover, required int index}) {
    reSize[index] = hover;
    rowContainer = hover;
    emit(ChangeSizeOnHoverState());
  }

  void fullBollsLists() {
    for (int i = 0; i <= linksList.length - 1; i++) {
      reSize.add(false);
    }
    for (int i = 0; i <= imagesOfLifeList.length - 1; i++) {
      hoveringOnImagesOfLife.add(false);
    }
    for (int i = 0; i < hoverSkillsList.length; i++) {
      hoverOnSkillCircleAvatar.add(false);
    }
    emit(FullListsState());
  }

  int clickedImageIndex = -1;
  void clickOnImage(int imageIndex) {
    clickedImageIndex = imageIndex;
    emit(ClickOnImageState());
  }

  void hoverOnSkillAvatar(int index, bool isHover) {
    hoverOnSkillCircleAvatar[index] = isHover;
    emit(HoverOnSkillAvatar());
  }
// late PdfController pdfController;
//   Future<void> loadPDF(BuildContext context) async {
//      pdfController = PdfController(
//       document: PdfDocument.openAsset('assets/files/Resume_Muhannad_Alsabbagh.pdf'),
//     );
//   }
}
