import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String label;
  final String hint;
  final TextEditingController controller;
  final bool isObscure;
  final Function(String)? onChange;
  final Function()? onTapSuffix;

  const CustomTextField(
      {
      super.key,
      required this.label,
      required this.hint,
      required this.controller,
      this.isObscure = false,
      this.onTapSuffix,
      this.onChange
      }
  );

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: Theme.of(context).textTheme.titleMedium,
        ),
        const SizedBox(height: 8),
        TextField(
          obscureText: isObscure,
          style: Theme.of(context).textTheme.labelMedium,
          obscuringCharacter: "*",
          controller: controller,
          onChanged: onChange,
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(vertical: 14, horizontal: 10),
            hintText: hint,
            suffixIcon: (onTapSuffix != null)
                ? GestureDetector(
                    onTap: onTapSuffix,
                    child: Image.asset("assets/eye-slash.png"),
                  )
                : null,
          ),
        ),
      ],
    );
  }
}
