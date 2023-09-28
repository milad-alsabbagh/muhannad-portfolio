import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_switch/flutter_switch.dart';

import '../../../cubit/cubit.dart';
class ModeSwitcher extends StatelessWidget {
  const ModeSwitcher({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    WebsiteCubit cubit(context)=>BlocProvider.of(context);
    return FlutterSwitch(
      value: cubit(context).isDark,
      onToggle: (bool value) {
        cubit(context).changeThemeMode();
      },
      width: 50,
      height: 25,
      padding: 1,
      activeColor: const Color(0xFF6750A4).withOpacity(0.4),
      inactiveColor: const Color(0xFF6750A4).withOpacity(0.4),
      activeToggleColor: Colors.black,
      inactiveToggleColor: Colors.white,
      activeIcon: const Icon(Icons.dark_mode,color: Colors.white,),
      inactiveIcon: const Icon(Icons.light_mode_sharp,color: Colors.amber,),
    );
  }
}