import 'package:custom_check_box/custom_check_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:go_router/go_router.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../../../../generated/l10n.dart';
import '../../../core/utilis/app_routers.dart';
import '../../../core/widgets/build_app_bar.dart';
import '../manager/signup_cubit/signup_cubit.dart';

class SignupView extends StatefulWidget {
  const SignupView({super.key});

  @override
  State<SignupView> createState() => _SignupViewState();
}

class _SignupViewState extends State<SignupView> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final AutovalidateMode _autovalidateMode = AutovalidateMode.disabled;

  String? email;
  String? password;
  String? name;
  bool isChecked = false;
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(
        context,
        title: S.of(context).newAccount,
        isArrowExists: true,
        onPressed: () => Navigator.of(context).pop(),
      ),
      body: BlocListener<SignUpCubit, SignUpState>(
        listener: (context, state) {
          if (state is SignUpLoading) {
            setState(() => isLoading = true);
          } else if (state is SignUpFailure) {
            setState(() => isLoading = false);
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Center(child: Text(state.errorMessage)),
                backgroundColor: Colors.redAccent,
              ),
            );
          } else if (state is SignUpSuccess) {
            setState(() => isLoading = false);
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Center(child: Text(S.of(context).verifyemail)),
                backgroundColor: Colors.green,
                duration: const Duration(seconds: 2),
              ),
            );
            GoRouter.of(context).pushReplacement(AppRouters.kLoginView);
          }
        },
        child: ModalProgressHUD(
          inAsyncCall: isLoading,
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 12),
            child: Form(
              key: _formKey,
              autovalidateMode: _autovalidateMode,
              child: Column(

              ),
            ),
          ),
        ),
      ),
    );
  }

  void _onSignupPressed() {
    if (_formKey.currentState!.validate()) {
      if (isChecked) {
        _formKey.currentState!.save();
        BlocProvider.of<SignUpCubit>(context).createUserWithEmailAndPassword(
          email: email!,
          password: password!,
          name: name!,
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(S.of(context).agreeterms)),
        );
      }
    } else {
      setState(() {}); // To trigger UI rebuild if needed
    }
  }
}
