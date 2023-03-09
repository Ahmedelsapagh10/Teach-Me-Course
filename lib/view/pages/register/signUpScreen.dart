import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:tm_course/controller/sign/signUpCubit.dart';
import 'package:tm_course/controller/sign/signUpState.dart';
import 'package:tm_course/view/pages/register/signInScreen.dart';

import '../../../controller/shared_preferences.dart';
import '../../../controller/sign/shared_sign.dart';
import '../../../controller/sign/signFacebook.dart';
import '../../../controller/sign/signGoogle.dart';
import '../../../controller/theme/cubit/themeCubit.dart';
import '../../../controller/theme/cubit/themeState.dart';
import '../../widgets/ButtonWidget.dart';
import '../../widgets/signWith.dart';
import '../../widgets/textformfield.dart';
import '../homescreen.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  var key = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    bool isLoading = false;

    return BlocConsumer<SignUpCubit, SignUpState>(listener: (context, state) {
      if (state is LoadingSignUpState) {
        isLoading = true;
      }
      if (state is SucessSignUpState) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text(
            'Welcome To Teach Me Course App',
          ),
          backgroundColor: Colors.blueGrey,
        ));
        isLoading = false;
      }
      if (state is FailedSignUpState) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(state.errMessage),
          backgroundColor: Colors.blueGrey.shade800,
        ));
        isLoading = false;
      }
    }, builder: (context, state) {
      var controller = BlocProvider.of<SignUpCubit>(context);
      return SafeArea(
        child: ModalProgressHUD(
          inAsyncCall: isLoading,
          child: Scaffold(
            body: Container(
              decoration: const BoxDecoration(
                color: Color(0xffE8F9FD),
              ),
              alignment: Alignment.center,
              width: width,
              child: SingleChildScrollView(
                child: Form(
                  key: key,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      BlocBuilder<ThemeCubit, ThemeState>(
                          builder: (context, state) {
                        return ThemeCubit.isDart
                            ? Image.asset(
                                'assets/images/l1.png',
                                width: width / 2,
                              )
                            : Image.asset(
                                'assets/images/l1w.png',
                                width: width / 2,
                              );
                      }),
                      const SizedBox(
                        height: 10,
                      ),
                      CustomTextFormField(
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please Enter Name';
                            } else {
                              return null;
                            }
                          },
                          controller: controller.nameSignUpController,
                          title: 'Name',
                          icon: Icons.person,
                          hint: 'Enter Your Name'),
                      CustomTextFormField(
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please Enter Email';
                          } else {
                            return null;
                          }
                        },
                        controller: controller.emailSignUpController,
                        title: 'Email',
                        icon: Icons.email,
                        hint: 'Enter Your Email',
                      ),
                      CustomTextFormField(
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please Enter password';
                            } else {
                              return null;
                            }
                          },
                          controller: controller.passSignUpController,
                          title: 'Password',
                          suffixWidget: true,
                          icon: Icons.lock,
                          isPass: true,
                          hint: 'Enter Your Password'),
                      const SizedBox(
                        height: 10,
                      ),
                      CustomButtom(
                          context: context,
                          title: 'SIGN UP',
                          onTap: () {
                            if (key.currentState!.validate()) {
                              controller.signUpMethod(context);

                              ///mode Home
                            }
                          }),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          BlocBuilder<ThemeCubit, ThemeState>(
                              builder: (context, state) {
                            return ThemeCubit.isDart
                                ? const Text(
                                    'Didn\'t hava account?',
                                    style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 16,
                                    ),
                                  )
                                : const Text(
                                    'Didn\'t hava account?',
                                    style: TextStyle(
                                      color: Colors.white54,
                                      fontSize: 16,
                                    ),
                                  );
                          }),
                          InkWell(
                            onTap: () {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const SignInScreen()),
                              );
                            },
                            child: const Text(
                              ' SIGN IN',
                              style: TextStyle(
                                color: Colors.blueGrey,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      BlocBuilder<ThemeCubit, ThemeState>(
                          builder: (context, state) {
                        return ThemeCubit.isDart
                            ? const Text(
                                '- OR -',
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 16,
                                ),
                              )
                            : const Text(
                                '- OR -',
                                style: TextStyle(
                                  color: Colors.white54,
                                  fontSize: 16,
                                ),
                              );
                      }),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 2),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                              child: SignWidget(
                                bottomleft: 8,
                                topleft: 8,
                                bottomright: 0,
                                topright: 0,
                                context: context,
                                title: 'GOOGLE',
                                image: 'assets/images/g.png',
                                onTap: () async {
                                  await signInWithGoogle().then((value) async {
                                    debugPrint(value.user!.email);
                                    debugPrint(value.user!.displayName);
                                    username = value.user!.displayName;
                                    user = value.user!.email;
                                    await setUserName();
                                    await setEmail();
                                    await setStartedScreen();
                                    // ignore: use_build_context_synchronously
                                    Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const HomeScreen()));
                                  });
                                },
                              ),
                            ),
                            const VerticalDivider(
                              color: Colors.black,
                              width: 2,
                            ),
                            Expanded(
                              child: SignWidget(
                                bottomleft: 0,
                                topleft: 0,
                                bottomright: 8,
                                topright: 8,
                                context: context,
                                title: 'FACEBOOK',
                                image: 'assets/images/f.png',
                                onTap: () async {
                                  // await signInWithFacebook()
                                  //     .then((value) async {
                                  //   debugPrint(value.user!.email);
                                  //   debugPrint(value.user!.displayName);
                                  //   username = value.user!.displayName;
                                  //   user = value.user!.email;
                                  //   await setUserName();
                                  //   await setEmail();
                                  //   await setStartedScreen();
                                  //   // ignore: use_build_context_synchronously
                                  //   Navigator.pushReplacement(
                                  //       context,
                                  //       MaterialPageRoute(
                                  //           builder: (context) =>
                                  //               const HomeScreen()));
                                  // });
                                },
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      );
    });
  }
}
