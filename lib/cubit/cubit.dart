import 'package:bloc/bloc.dart';
import 'package:muhannadwebsite/cubit/states.dart';
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
  List<bool> reSize=[false,false,false];
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

}