import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';


import 'package:go_router/go_router.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';
import '../../../../core/utilis/styles.dart';

import '../../../../generated/l10n.dart';
import '../../../core/widgets/build_app_bar.dart';


class NewPasswordView extends StatelessWidget {
  const NewPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context, title: S.of(context).newPassword, isArrowExists: true,onPressed: (){ PersistentNavBarNavigator.pop(context);}),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 12.0,horizontal: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 30,

          ),
        ),
      ),
    );
  }


  }
