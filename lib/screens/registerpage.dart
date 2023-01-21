import 'package:flutter/material.dart';

import 'package:form_validator/form_validator.dart';

import '../components/app_button_v2.dart';
import '../components/app_inputv2.dart';
import '../components/app_text.dart';
import '../utils/app_func.dart';
import '../utils/app_styles.dart';
import 'loginpage.dart';


class RegisterPage extends StatefulWidget {
  const RegisterPage({
    Key? key,
  }) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends  State<RegisterPage>{
  late TextEditingController nomController;
  late TextEditingController prenomController;
  late TextEditingController mailController;
  late TextEditingController pass1Controller;
  late TextEditingController pass2Controller;
  @override
  void initState() {
    super.initState();
    nomController = TextEditingController();
    prenomController = TextEditingController();
    mailController = TextEditingController();
    pass1Controller = TextEditingController();
    pass2Controller = TextEditingController();
  }

  @override
  void dispose() {
    nomController.dispose();
    prenomController.dispose();
    mailController.dispose();
    pass1Controller.dispose();
    pass2Controller.dispose();
    super.dispose();
  }

  bool isShown = false;
  final _formKey = GlobalKey<FormState>();
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(10),
                        margin: const EdgeInsets.symmetric(vertical: 10),
                        height: 150,
                        child: Image.asset("assets/img/logo.jpg"),
                      )
                    ],
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    height: 75,
                    child: AppText(
                      'Créer un compte',
                      weight: FontWeight.w600,
                      align: TextAlign.center,
                      size: 22,
                      color: getBlack(context),
                    ),
                  ),
                  Form(
                    key: _formKey,
                    child: Container(
                      padding: const EdgeInsets.only(bottom: 8),
                      child: Column(
                        children: [
                          AppInputv2(
                            controller: nomController,
                            validationBuilder: ValidationBuilder(),
                            label: "Nom",
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          AppInputv2(
                            controller: prenomController,
                            validationBuilder: ValidationBuilder(),
                            label: "Prénom",
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          AppInputv2(
                            controller: mailController,
                            validationBuilder: ValidationBuilder(),
                            label: "Adresse mail",
                            inputType: TextInputType.emailAddress,
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          AppInputv2(
                            controller: pass1Controller,
                            validationBuilder: ValidationBuilder(),
                            label: "Mot de passe",
                            isObscure: true,
                            maxlines: 1,
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          AppInputv2(
                            controller: pass2Controller,
                            validationBuilder: ValidationBuilder(),
                            label: "Confirmer le mot de pass",
                            isObscure: true,
                            maxlines: 1,
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [

                        AppButtonv2(
                          onTap: connection,
                          width: double.infinity,
                          height: 50,
                          child: isLoading
                              ? const CircularProgressIndicator(
                            color: Colors.white,
                          )
                              : const AppText(
                            'S\'enregistrer',
                            color: Colors.white,
                            align: TextAlign.center,
                          ),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const AppText("Vous avez déja un compte"),
                            TextButton(
                                onPressed: () {
                                  navigateToNextPage(context, LoginPage(),
                                      back: false);
                                },
                                child: AppText(
                                  "Connectez-vous",
                                  color: getPrimaryColor(context),
                                ))
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          )),
    );
  }

  void connection() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        isLoading = true;
      });
      print(mailController.text);
      print(pass1Controller.text);
      print(pass2Controller.text);
      print(nomController.text);

    } else {

    }
  }


}
