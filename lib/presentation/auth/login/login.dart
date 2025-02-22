import 'package:evently_c13_offline/core/assets_manager.dart';
import 'package:evently_c13_offline/core/colors_manager.dart';
import 'package:evently_c13_offline/core/dialog_utils.dart';
import 'package:evently_c13_offline/core/email_validation.dart';
import 'package:evently_c13_offline/core/firebase_error_codes.dart';
import 'package:evently_c13_offline/core/routes_manager/routes.dart';
import 'package:evently_c13_offline/core/widgets/custom_elvated_button.dart';
import 'package:evently_c13_offline/core/widgets/custom_text_button.dart';
import 'package:evently_c13_offline/core/widgets/custom_text_form_field.dart';
import 'package:evently_c13_offline/firebase_helpers/firestore/firestore_helpers.dart';
import 'package:evently_c13_offline/model/user_DM.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late TextEditingController emailController;
  late TextEditingController passwordController;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool secure = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    emailController = TextEditingController();
    passwordController = TextEditingController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                        if (input == null || input
                            .trim()
                            .isEmpty) {
                          return 'Plz, enter email';
                        }
                        // bad scenario
                        if (!isValidEmail(input)) {
                          return 'Email bad format';
                        }
                        return null;
                      },
                      hintText: AppLocalizations.of(context)!.email,
                      prefixIcon: Icon(
                        Icons.email,
                        color: Theme
                            .of(context)
                            .colorScheme
                            .secondary,
                      ),
                      controller: emailController),
                  const SizedBox(
                    height: 16,
                  ),
                  CustomTextFormField(
                    validator: (input) {
                      if (input == null || input
                          .trim()
                          .isEmpty) {
                        return 'Plz, enter password';
                      }
                      if (input.length < 6) {
                        return 'Password at least 6 characters';
                      }
                    },
                    hintText: AppLocalizations.of(context)!.password,
                    prefixIcon: Icon(
                      Icons.lock,
                      color: Theme
                          .of(context)
                          .colorScheme
                          .secondary,
                    ),
                    isObscure: secure,
                    suffixIcon: IconButton(
                      onPressed: () {
                        secure = !secure;
                        setState(() {});
                      },
                      icon: Icon(
                        secure ? Icons.visibility_off : Icons.visibility,
                        color: Theme
                            .of(context)
                            .colorScheme
                            .secondary,
                      ),
                    ),
                    controller: passwordController,
                  ),
                  Container(
                      alignment: Alignment.centerRight,
                      child: CustomTextButton(
                          onPress: () {},
                          textButton: AppLocalizations.of(context)!
                              .forget_password)),
                  SizedBox(
                      width: MediaQuery
                          .sizeOf(context)
                          .width,
                      height: 56,
                      child: CustomElevatedButton(
                          onPress: login,
                          buttonText: AppLocalizations.of(context)!.login)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Don’t Have Account ?",
                        style: Theme
                            .of(context)
                            .textTheme
                            .bodySmall,
                      ),
                      CustomTextButton(
                          onPress: () {
                            Navigator.pushNamed(context, Routes.register);
                          },
                          textButton: AppLocalizations.of(context)!
                              .create_account)
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  InkWell(
                    onTap: () {},
                    child: Container(
                      alignment: Alignment.center,
                      padding: EdgeInsets.symmetric(vertical: 16),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(
                              color: ColorsManager.primary, width: 2)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(AssetsManager.googleIcon),
                          SizedBox(
                            width: 4,
                          ),
                          Text(AppLocalizations.of(context)!.login_by_google,
                              style: Theme
                                  .of(context)
                                  .textTheme
                                  .bodyMedium),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void login() async {
    // check fields is valid
    // login
    if (formKey.currentState?.validate() == false) return;

    // login user

    try {
      DialogUtils.showLoadingDialog(context, loadingMessage: "wait...");
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailController.text, password: passwordController.text);

      UserDM.currentUser =
          await FireStoreHelpers.readUSerFromFireStore(credential.user!.uid);
      // print("Logged User Name : ${user?.userName}");
      DialogUtils.hideDialog(context);
      DialogUtils.showMessageDialog(
        context,
        content: "User Logged in successfully",
        posActionTitle: "Ok",
        posAction: () {
          Navigator.pushReplacementNamed(context, Routes.mainLayOut);
        },
      );
    } on FirebaseAuthException catch (e) {
      DialogUtils.hideDialog(context);
      if (e.code == FirebaseErrorCodes.invalidCredential) {
        DialogUtils.showMessageDialog(
          context,
          content: "Wrong email or password",
          negActionTitle: "try again",
        );
      }
    } catch (e) {
      DialogUtils.hideDialog(context);
      DialogUtils.showMessageDialog(context,
          content: "${e.toString()}", posActionTitle: "Ok");
    }
  }
}
