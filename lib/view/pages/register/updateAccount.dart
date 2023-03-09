import 'package:flutter/material.dart';

import 'package:tm_course/controller/sign/shared_sign.dart';
import 'package:tm_course/view/pages/profilescreen.dart';
import 'package:tm_course/view/widgets/ButtonWidget.dart';
import 'package:tm_course/view/widgets/textformfield.dart';

class UpdateAccount extends StatefulWidget {
  const UpdateAccount({super.key});

  @override
  State<UpdateAccount> createState() => _UpdateAccountState();
}

class _UpdateAccountState extends State<UpdateAccount> {
  var nameController = TextEditingController();
  @override
  void initState() {
    nameController.text = username ?? '';
    super.initState();
  }

  var key = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          alignment: Alignment.center,
          child: SingleChildScrollView(
            child: Form(
              key: key,
              child: Column(
                children: [
                  CustomTextFormField(
                      title: 'Name',
                      icon: Icons.person,
                      controller: nameController,
                      hint: 'your Name',
                      validator: (e) {
                        if (e!.isEmpty) {
                          return 'Please Enter password';
                        } else {
                          return null;
                        }
                      }),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomButtom(
                      context: context,
                      title: 'Update Name',
                      onTap: () {
                        if (key.currentState!.validate()) {
                          setState(() {
                            username = nameController.text;
                            setUserName();
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const ProfileScreen()));
                          });
                        }
                      })
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
