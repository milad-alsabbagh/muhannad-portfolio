import 'package:bloc/bloc.dart';
import 'package:muhannadwebsite/cubit/states.dart';
import 'package:muhannadwebsite/models/certificate_model.dart';
import 'package:muhannadwebsite/models/link_model.dart';
import 'package:url_launcher/link.dart';
import 'package:url_launcher/url_launcher.dart';

class WebsiteCubit extends Cubit<WebsiteStates> {

  WebsiteCubit():super(WebsiteInitialState());
  bool isDark=true;
  void changeThemeMode(){
    isDark=!isDark;
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

  List<bool> isHover=[
    false,
    false
  ];

  void changeHoverVisibility({required bool hover,required int index}){
    isHover[index]=hover;
    print(isHover);
    emit (ChangeHoverVisibilityState());
  }
  List<bool> reSize=[];
  bool rowContainer=false;
  void changeSizeOnHover({
    required bool hover,
    required int index
}){
    reSize[index]=hover;
    rowContainer=hover;
    print(reSize);
    emit(ChangeSizeOnHoverState());
  }
  List<bool>hoveringOnText=[];
  void changeHoveringOnText({required bool hover,required int index}){
    hoveringOnText[index]=hover;
    print(hoveringOnText);
    emit (ChangeHoveringOnTextState());
  }
  void fullBollLists(){
    for(int i =0;i<=certificates.length-1;i++){
      hoveringOnText.add(false);
    }
    for(int i =0;i<=links.length-1;i++){
      reSize.add(false);
    }
    emit(FullListsState());
  }

}