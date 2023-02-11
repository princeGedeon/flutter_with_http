import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:form_validator/form_validator.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tpcoursapi/screens/registerpage.dart';

import '../components/app_button_round.dart';
import '../components/app_inputv2.dart';
import '../components/app_text.dart';
import '../data/models/AuthenticatedUser.dart';
import '../data/services/users_service.dart';
import '../utils/app_func.dart';
import '../utils/constants.dart';
import 'homepage.dart';


class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late TextEditingController identifierController;
  late TextEditingController passController;
  bool isLoading=false;

  _login(email, password) async {
    setState(() {
      isLoading = true;
    });
    try {
      AuthenticatedUser authenticatedUser = await UserService.authentication({
        'strategy':'local',
        'email':email,
        'password': password
      });
      final prefs = await SharedPreferences.getInstance();
      prefs.setString(Constant.USERNAME_PREF_KEY, authenticatedUser.user!.username!);
      prefs.setString(Constant.EMAIL_PREF_KEY, authenticatedUser.user!.email!);
      prefs.setString(Constant.USER_ID_PREF_KEY, authenticatedUser.user!.id!);
      prefs.setString(Constant.TOKEN_PREF_KEY, authenticatedUser.accessToken!);
      identifierController.text = "";
      passController.text = "";
      Fluttertoast.showToast(msg: "Connexion effectuée avec succès");

navigateToNextPage(context, HomeScreen(),back: false);
     // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomeScreen()));
    } on DioError catch (e) {
      Map<String, dynamic> error = e.response?.data;
      if (error != null && error.containsKey('message')) {
        Fluttertoast.showToast(msg: error['message']);
      } else {
        Fluttertoast.showToast(msg: "Une erreur est survenue veuillez rééssayer");
      }
      print(e.response);
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    identifierController=TextEditingController();
    passController=TextEditingController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    identifierController.dispose();
    passController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            height: size.height,
            width: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: 15,vertical: 10),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
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
                AppText("Connexion",align: TextAlign.center,size: 18,weight: FontWeight.w600,),
                SizedBox(height: 15,),
                Container(child: connectForm(),padding: EdgeInsets.symmetric(vertical: 10),),
                SizedBox(height: 15,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    AppText("Avez-vous déja un compte?"),
                    TextButton(
                        onPressed: () {
                          print("Créer un compte");
                          navigateToNextPage(context, RegisterPage(),);
                        },
                        child: AppText(
                          "Créer un compte",
                          color: Colors.blue,
                        )),
                  ],
                ),
                SizedBox(height: 5,),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    AppText("Vous avez oublié votre mot de passe."),
                    TextButton(
                        onPressed: () {
                          print("Créer un compte");
                          //navigateToNextPage(context, PasswordChangePage(),);

                        },
                        child: AppText(
                          "Mot de passe oublié",
                          color: Colors.redAccent,
                        )),
                  ],
                ),


              ],
            ),
          ),
        ),
      ),
    );
  }

  Form connectForm(){
    return Form(child: Column(
      children: [
        AppInputv2(controller: identifierController,inputType: TextInputType.emailAddress, validationBuilder: ValidationBuilder(requiredMessage: "Veuillez entrez vos identifiants"),),
        SizedBox(height: 5,),
        AppInputv2(controller: passController, validationBuilder: ValidationBuilder(requiredMessage: "Veuillez entre votre mots de passe",)),

        SizedBox(height: 15,),
        AppButtonRound("Connexion",textColor: Colors.white,backgroundColor: Colors.greenAccent,onTap: () async{
          print(identifierController.text);
          print(passController.text);

          await _login(identifierController.text, passController.text);






          //navigateToNextPage(context, HomePage());
        })

      ],
    ));
  }

}
