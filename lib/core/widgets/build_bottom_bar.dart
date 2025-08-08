import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';
import 'package:stylish_bottom_bar/stylish_bottom_bar.dart';


import '../../generated/l10n.dart';
import '../utilis/styles.dart';

class buildBottomBar extends StatelessWidget {
  const buildBottomBar({
    super.key,
    required this.tabProvider,
  });

  final TabControllerProvider tabProvider;

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      controller: tabProvider.controller,
      screens: const [

      ],
      items: [
        //PersistentBottomNavBarItem(
        //  title: S.of(context).homeview,
        //    textStyle: Styles.regular16,
         //   icon: const Icon(Icons.home),
        //    activeColorPrimary: Styles.primaryColor,
        //    inactiveColorPrimary: Colors.grey,
       //     activeColorSecondary: Colors.white
      //  ),

      ],
      animationSettings: const NavBarAnimationSettings(
        navBarItemAnimation: ItemAnimationSettings(
          // Navigation Bar's items animation properties.
          duration: Duration(milliseconds: 400),
          curve: Curves.ease,
        ),
      ),

      navBarStyle: NavBarStyle.style7,
    );
  }
}

class TabControllerProvider with ChangeNotifier {
  PersistentTabController controller = PersistentTabController(initialIndex: 0);

  void jumpToTab(int index) {
    controller.jumpToTab(index);
    notifyListeners();
  }
}
