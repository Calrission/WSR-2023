import 'package:final_wsr_2023/on_boarding/data/models/on_boarding_model.dart';
import 'package:flutter/material.dart';

class ItemOnBoarding extends StatelessWidget {
  final OnBoardingModel model;
  const ItemOnBoarding({super.key, required this.model});


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 133),
        Image.asset(model.image),
        const SizedBox(height: 48),
        Text(
            model.title,
            style: Theme.of(context).textTheme.headlineLarge,
            textAlign: TextAlign.center
        ),
        const SizedBox(height: 10),
        Text(
            model.text,
            style: Theme.of(context).textTheme.headlineMedium,
            textAlign: TextAlign.center
        ),
      ],
    );
  }
}