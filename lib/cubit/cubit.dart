import 'package:bloc/bloc.dart';
import 'package:muhannadwebsite/cubit/states.dart';

class WebsiteCubit extends Cubit<WebsiteStates> {

  WebsiteCubit():super(WebsiteInitialState());
  bool isDark=true;
  void changeThemeMode(){
    isDark=!isDark;
    emit(ChangeThemeModeState());
  }
}