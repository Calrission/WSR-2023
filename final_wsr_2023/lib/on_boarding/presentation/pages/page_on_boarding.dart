import 'package:final_wsr_2023/on_boarding/data/repository/on_boarding_repository.dart';
import 'package:final_wsr_2023/on_boarding/presentation/widgets/item_on_boarding.dart';
import 'package:final_wsr_2023/auth/presentation/pages/page_sign_up.dart';
import 'package:flutter/material.dart';

class OnBoardingPage extends StatefulWidget {
  const OnBoardingPage({super.key});

  @override
  State<OnBoardingPage> createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {

  final PageController pageController = PageController(initialPage: 0);
  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                controller: pageController,
                itemCount: onBoardingData.length,
                itemBuilder: (context, index) {
                  return ItemOnBoarding(model: onBoardingData[index]);
                },
                onPageChanged: (index){
                  setState(() {
                    currentPage = index;
                  });
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 22.0),
              child: (currentPage != onBoardingData.length - 1 ) ? panelButton() : getSignUpPanel(),
            ),
            SizedBox(height: (currentPage != onBoardingData.length - 1 ) ? 99 : 64)
          ],
        ),
      ),
    );
  }

  Column getSignUpPanel() {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          child: FilledButton(
            style: FilledButton.styleFrom(
              textStyle: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700
              )
            ),
            onPressed: (){
              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => const SignUpPage())
              );
            },
            child: const Text("Sign Up")
          ),
        ),
        const SizedBox(height: 20),
        RichText(text: const TextSpan(
          children: [
            TextSpan(text: "Already have an account?", style: TextStyle(color: Color(0xFFA7A7A7))),
            TextSpan(text: "Sign in", style: TextStyle(color: Color(0xFF0560FA), fontWeight: FontWeight.w500)),
          ]
        )),
      ],
    );
  }

  Row panelButton() {
    return Row(
      children: [
        Expanded(
          child: Align(
            alignment: Alignment.centerLeft,
            child: OutlinedButton(
                onPressed: () {
                  Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (context) => const SignUpPage())
                  );
                },
                child: const Text('Skip')
            ),
          ),
        ),
        Expanded(
          child: Align(
            alignment: Alignment.centerRight,
            child: FilledButton(
                onPressed: () {
                  setState(() {
                    pageController.nextPage(duration: const Duration(milliseconds: 200), curve: Curves.linear);
                  });
                },
                child: const Text('Next')
            ),
          ),
        ),
      ],
    );
  }

}
