import 'package:event_pass/model/global_data.dart';
import 'package:event_pass/view/home_page_with_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class MyBehavior extends ScrollBehavior {
  @override
  Widget buildOverscrollIndicator(
      BuildContext context, Widget child, ScrollableDetails details) {
    return child;
  }
}

Widget skipButton(String text, BuildContext context) {
  
  //ini();
  return TextButton(
    onPressed: () {
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (BuildContext context) {
        return const HomePageWithData();
      }));
    },
    child: Text(
      text,
      textAlign: TextAlign.end,
      style: TextStyle(
          fontSize: 14,
          color: myBlue,
          decoration: TextDecoration.combine([TextDecoration.underline])),
    ),
  );
}

Widget onboardingPage(
    Widget picture, String message, String skipText, BuildContext context) {
  return Container(
    padding: EdgeInsets.fromLTRB(36, 36, 36, 80),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        picture,
        Container(
          padding: EdgeInsets.symmetric(horizontal: 18),
          child: Text(
            message,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 22),
          ),
        ),
        Container(
          //padding: EdgeInsets.only(right: 36),
          child: skipButton(skipText, context),
        )
      ],
    ),
  );
}

Scaffold OnboardingScreen(BuildContext context) {
  PageController onboardingController = PageController();
  final Widget firstPicture = SvgPicture.asset(
      'assets/images/onboarding_page1.svg',
      semanticsLabel: 'firstPicture');
  final Widget secondPicture = SvgPicture.asset(
      'assets/images/onboarding_page2.svg',
      semanticsLabel: 'secondPicture');
  final Widget thirdPicture = SvgPicture.asset(
      'assets/images/onboarding_page3.svg',
      semanticsLabel: 'thirdPicture');
  var body = [
    onboardingPage(
        firstPicture,
        "Créez vos tickets virtuels de façon simple et sécurisée",
        "Passer",
        context),
    onboardingPage(
        secondPicture,
        "Envoyez-les facilement à vos invités ou enregistrez-les dans votre galerie",
        "Passer",
        context),
    onboardingPage(
        thirdPicture,
        "Gérez l'entrée à vos événements simplement en scannant les codes de vos invitations",
        "Démarrer",
        context)
  ];
  return Scaffold(
    backgroundColor: myWhite,
    body: Container(
        child: ScrollConfiguration(
      behavior: MyBehavior(),
      child: PageView(
        controller: onboardingController,
        children: body,
      ),
    )),
    bottomSheet: Container(
      height: 80,
      child: Center(
        child: SmoothPageIndicator(
          controller: onboardingController,
          count: 3,
          onDotClicked: (index) {
            onboardingController.jumpToPage(index);
          },
          effect: SlideEffect(
              activeDotColor: myBlue,
              dotHeight: 9,
              dotWidth: 9,
              spacing: 50,
              paintStyle: PaintingStyle.stroke),
        ),
      ),
    ),
  );
}
