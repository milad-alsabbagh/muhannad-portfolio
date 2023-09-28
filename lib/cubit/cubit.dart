import 'package:bloc/bloc.dart';
import 'package:muhannadwebsite/cubit/states.dart';
import 'package:muhannadwebsite/models_lists/skill_list.dart';
import 'package:url_launcher/url_launcher.dart';
import '../models_lists/certificates_list.dart';
import '../models_lists/links_list.dart';

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
  List<bool>hoveringOnCertificates=[];
  void changeHoveringOnCertificateText({required bool hover,required int index}){
    hoveringOnCertificates[index]=hover;
    print(hoveringOnCertificates);
    emit (ChangeHoveringOnCertificateTextState());
  }
  List<bool>hoveringOnSkills=[];
  void changeHoveringOnSkillText({required bool hover,required int index}){
    hoveringOnSkills[index]=hover;
    print(hoveringOnSkills);
    emit (ChangeHoveringOnSkillTextState());
  }
  void fullBollsLists(){
    for(int i =0;i<=certificatesList.length-1;i++){
      hoveringOnCertificates.add(false);
    }
    for(int i =0;i<=linksList.length-1;i++){
      reSize.add(false);
    }
    for(int i =0;i<=skillsList.length-1;i++){
      hoveringOnSkills.add(false);
    }
    emit(FullListsState());
  }

}