import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:go_router/go_router.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../../../../../core/utilis/styles.dart';

import '../../../../../generated/l10n.dart';

import '../../../../core/utilis/app_routers.dart';
import '../../../../core/widgets/build_app_bar.dart';
import '../../manager/singin_cubit/signin_cubit.dart';
import 'custom_signin_button.dart';

class SigninViewBody extends StatefulWidget {
  const SigninViewBody({super.key});

  @override
  State<SigninViewBody> createState() => _SigninViewBodyState();
}

class _SigninViewBodyState extends State<SigninViewBody> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final AutovalidateMode _autovalidateMode = AutovalidateMode.disabled;

  String? email;
  String? password;
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(
        context,
        title: S.of(context).login,
        isArrowExists: true,
        onPressed: () => Navigator.of(context).pop(),
      ),
      body: BlocListener<SigninCubit, SigninState>(
        listener: (context, state) {
          if (state is SigninLoading) {
            setState(() => isLoading = true);
          } else if (state is SigninFailure) {
            setState(() => isLoading = false);
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Center(child: Text(state.errorMessage)),
                backgroundColor: Colors.redAccent,
              ),
            );
          } else if (state is SigninSuccess) {
            setState(() => isLoading = false);
            GoRouter.of(context).pushReplacement(AppRouters.kHomeView);
          }
        },
        child: ModalProgressHUD(
          inAsyncCall: isLoading,
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(12),
            child: Form(
              key: _formKey,
              autovalidateMode: _autovalidateMode,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,

              ),
            ),
          ),
        ),
      ),
    );
  }

  void _onLoginPressed() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      BlocProvider.of<SigninCubit>(context).signinWithEmailAndPassword(
        email: email!,
        password: password!,
      );
    } else {
      setState(() {
        // trigger UI update for validation
      });
    }
  }

}
