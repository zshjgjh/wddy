import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';

import '../../../../core/utilis/styles.dart';

import '../../../../generated/l10n.dart';
import '../../../core/widgets/build_app_bar.dart';

class CheckCodeView extends StatelessWidget {
  const CheckCodeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context, title: S.of(context).checkCode, isArrowExists: true,onPressed: (){ Navigator.of(context).pop();}),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 12.0,horizontal: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 20,

          ),
        ),
      ),
    );
  }
}