import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps/login_view/presentation/views/widgets/signin_view_body.dart';



import '../../../../core/utilis/services/fire_base/fire_auth_service.dart';

class SigninView extends StatelessWidget {
  const SigninView({super.key,});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SigninViewBody(),

    );
  }
}