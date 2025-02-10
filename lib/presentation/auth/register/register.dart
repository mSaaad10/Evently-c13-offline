import 'package:evently_c13_offline/core/assets_manager.dart';
import 'package:evently_c13_offline/core/dialog_utils.dart';
import 'package:evently_c13_offline/core/email_validation.dart';
import 'package:evently_c13_offline/core/firebase_error_codes.dart';
import 'package:evently_c13_offline/core/routes_manager/routes.dart';
import 'package:evently_c13_offline/core/string_manager.dart';
import 'package:evently_c13_offline/core/widgets/custom_elvated_button.dart';
import 'package:evently_c13_offline/firebase_helpers/firestore/firestore_helpers.dart';
import 'package:evently_c13_offline/model/user_DM.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../../core/widgets/custom_text_button.dart';
import '../../../core/widgets/custom_text_form_field.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  late TextEditingController emailController;
  late TextEditingController passwordController;
  late TextEditingController rePasswordController;
  late TextEditingController nameController;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool securePassword = true;
  bool securePasswordConfirmation = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    rePasswordController = TextEditingController();
    nameController = TextEditingController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
    rePasswordController.dispose();
    nameController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Register'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
        ),
        child: SafeArea(
          child: Form(
            key: formKey,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Image.asset(AssetsManager.logo),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomTextFormField(
                      validator: (input) {
                        // bad scenario
                        if (input == null || input.trim().isEmpty) {
                          return 'Plz, enter name';
                        }
                        // bad scenario
                        if (input.length < 2) {
                          return "User name should be at least 4 characters";
                        }
                        return null;
                      },
                      hintText: "Name",
                      prefixIcon: Icon(Icons.person),
                      controller: nameController),
                  const SizedBox(
                    height: 16,
                  ),
                  CustomTextFormField(
                      validator: (input) {
                        // bad scenario
                        if (input == null || input.trim().isEmpty) {
                          return 'Plz, enter email';
                        }
                        // bad scenario
                        if (!isValidEmail(input)) {
                          return 'Email bad format';
                        }
                        return null;
                      },
                      hintText: "Email",
                      prefixIcon: Icon(Icons.email),
                      controller: emailController),
                  const SizedBox(
                    height: 16,
                  ),
                  CustomTextFormField(
                    validator: (input) {
                      if (input == null || input.trim().isEmpty) {
                        return 'Plz, enter password';
                      }
                      if (input.length < 6) {
                        return 'Password at least 6 characters';
                      }
                    },
                    hintText: "Password",
                    prefixIcon: Icon(Icons.lock),
                    isObscure: securePassword,
                    suffixIcon: IconButton(
                      onPressed: () {
                        securePassword = !securePassword;
                        setState(() {});
                      },
                      icon: Icon(securePassword
                          ? Icons.visibility_off
                          : Icons.visibility),
                    ),
                    controller: passwordController,
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  CustomTextFormField(
                    validator: (input) {
                      if (input == null || input.trim().isEmpty) {
                        return 'Plz, enter re password';
                      }
                      if (input != passwordController.text) {
                        return "Password doesn't match";
                      }
                    },
                    hintText: "Re Password",
                    prefixIcon: Icon(Icons.lock),
                    isObscure: securePasswordConfirmation,
                    suffixIcon: IconButton(
                      onPressed: () {
                        securePasswordConfirmation =
                            !securePasswordConfirmation;
                        setState(() {});
                      },
                      icon: Icon(securePasswordConfirmation
                          ? Icons.visibility_off
                          : Icons.visibility),
                    ),
                    controller: rePasswordController,
                  ),
                  SizedBox(
                    height: 20,
                  ),

                  SizedBox(
                      width: MediaQuery.sizeOf(context).width,
                      height: 56,
                      child: CustomElevatedButton(
                          onPress: register, buttonText: "Create Account")),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Already Have Account ?",
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                      CustomTextButton(
                          onPress: () {
                            Navigator.pushReplacementNamed(
                                context, Routes.login);
                          },
                          textButton: "Login")
                    ],
                  ),
                  // const SizedBox(
                  //   height: 20,
                  // ),
                  // InkWell(
                  //   onTap: () {},
                  //   child: Container(
                  //     alignment: Alignment.center,
                  //     padding: EdgeInsets.symmetric(vertical: 16),
                  //     decoration: BoxDecoration(
                  //         borderRadius: BorderRadius.circular(16),
                  //         border: Border.all(
                  //             color: ColorsManager.primary, width: 2)),
                  //     child: Row(
                  //       mainAxisAlignment: MainAxisAlignment.center,
                  //       children: [
                  //         Image.asset(AssetsManager.googleIcon),
                  //         SizedBox(
                  //           width: 4,
                  //         ),
                  //         Text('Login With Google',
                  //             style: Theme.of(context).textTheme.bodyMedium),
                  //       ],
                  //     ),
                  //   ),
                  // ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void register() async {
    // check fields is valid
    // login
    if (formKey.currentState?.validate() == false) return;

    // login user

    try {
      DialogUtils.showLoadingDialog(context,
          loadingMessage: StringsManager.wait);
      UserCredential credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );
      await createUser(credential.user!.uid);
      DialogUtils.hideDialog(context);
      DialogUtils.showMessageDialog(context,
          content: StringsManager.userRegisteredSuccessfully,
          posActionTitle: "Ok", posAction: () {
        Navigator.pushReplacementNamed(context, Routes.login);
      });
    } on FirebaseAuthException catch (ex) {
      DialogUtils.hideDialog(context);
      if (ex.code == FirebaseErrorCodes.weakPassword) {
        DialogUtils.showMessageDialog(
          context,
          title: "Error Occurred",
          content: "The password provided is too weak.",
          negActionTitle: "try again",
        );
      } else if (ex.code == FirebaseErrorCodes.emailInUse) {
        DialogUtils.showMessageDialog(
          context,
          title: "Error Occurred",
          content: "Email already exist",
          negActionTitle: "try again",
        );
      }
    } catch (e) {
      DialogUtils.hideDialog(context);
      DialogUtils.showMessageDialog(
        context,
        title: "Error Occurred",
        content: "${e.toString()}",
        negActionTitle: "try again",
      );
    }
  }

  Future<void> createUser(String userId) {
    UserDM userDM = UserDM(
        id: userId, userName: nameController.text, email: emailController.text);
    UserDM.currentUser = userDM;

    return FireStoreHelpers.addUserToFireStore(userDM);
  }
}
