import 'package:email_validator/email_validator.dart';
import 'package:extended_masked_text/extended_masked_text.dart';
import 'package:final_wsr_2023/auth/data/repository/supabase.dart';
import 'package:final_wsr_2023/auth/presentation/widgets/CustomTextField.dart';
import 'package:final_wsr_2023/core/widgets/dialogs.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  var fullName = TextEditingController();
  var email = TextEditingController();
  var phoneNumber = MaskedTextController(mask: "+0(000)000-00-00");
  var password = TextEditingController();
  var confirmPassword = TextEditingController();

  var obscurePassword = true;
  var obscureConfirmPassword = true;

  var policy = false;
  var enableButton = false;

  void isValid(){
    setState(() {
      enableButton = fullName.text.isNotEmpty && phoneNumber.text.isNotEmpty
          && email.text.isNotEmpty && password.text.isNotEmpty && confirmPassword.text.isNotEmpty
          && policy && phoneNumber.text.length == 16;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 78),
              Text(
                "Create an account",
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: 8),
              Text(
                "Complete the sign up process to get started",
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const SizedBox(height: 33),
              CustomTextField(
                  label: "Full name",
                  hint: "Ivanov Ivan",
                  controller: fullName,
                  onChange: (newText){
                    isValid();
                  },
              ),
              const SizedBox(height: 24),
              CustomTextField(
                label: "Phone Number",
                hint: "+7(999)999-99-99",
                controller: phoneNumber,
                onChange: (newText){
                  if (newText == "+") {
                    setState(() {
                      phoneNumber.clear();
                    });
                  }
                  isValid();
                },
              ),
              const SizedBox(height: 24),
              CustomTextField(
                  label: "Email Address",
                  hint: "***********@mail.com",
                  onChange: (newText){
                    isValid();
                  },
                  controller: email),
              const SizedBox(height: 24),
              CustomTextField(
                label: "Password",
                hint: "***********",
                controller: password,
                isObscure: obscurePassword,
                onChange: (newText){
                  isValid();
                },
                onTapSuffix: () {
                  setState(() {
                    obscurePassword = !obscurePassword;
                  });
                },
              ),
              const SizedBox(height: 24),
              CustomTextField(
                label: "Confirm Password",
                hint: "***********",
                controller: confirmPassword,
                isObscure: obscureConfirmPassword,
                onChange: (newText){
                  isValid();
                },
                onTapSuffix: () {
                  setState(() {
                    obscureConfirmPassword = !obscureConfirmPassword;
                  });
                },
              ),
              const SizedBox(height: 37),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 18,
                    height: 18,
                    child: Checkbox(
                        value: policy,
                        onChanged: (newValue) {
                          setState(() {
                            policy = newValue!;
                          });
                          isValid();
                        }),
                  ),
                  const SizedBox(width: 11),
                  Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(right: 69),
                        child: RichText(
                          textAlign: TextAlign.center,
                          text: const TextSpan(children: [
                            TextSpan(
                                text: "By ticking this box, you agree to our",
                                style: TextStyle(color: Color(0xFFA7A7A7))),
                            TextSpan(
                                text: " Terms and conditions and private policy",
                                style: TextStyle(color: Color(0xFFEBBC2E))),
                          ], style: TextStyle(fontSize: 12)),
                        ),
                  ))
                ],
              ),
              const SizedBox(height: 64),
              SizedBox(
                  width: double.infinity,
                  child: FilledButton(
                    onPressed: (enableButton) ? () async {
                      if (password.text != confirmPassword.text){
                        showErrorDialog(context, "Пароли не совпадают");
                        return;
                      }
                      if (!EmailValidator.validate(email.text)){
                        showErrorDialog(context, "Почта не корректна");
                        return;
                      }
                      showLoading(context);
                      await signUp(
                          fullname: fullName.text,
                          phone: phoneNumber.text,
                          email: email.text,
                          password: password.text,
                          onResponse: (User user){
                            setState(() {
                              Navigator.pop(context); // или Navigator.of(context).push....
                            });
                          },
                          onError: (String error){
                            Navigator.pop(context);
                            showErrorDialog(context, error);
                          }
                      );
                    } : null,
                    child: Text("Sign Up", style: Theme.of(context).textTheme.labelLarge),
                  )
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                child: RichText(textAlign: TextAlign.center, text: TextSpan(
                  children: [
                    TextSpan(text: "Already have an account?", style: Theme.of(context).textTheme.titleMedium!.copyWith(fontWeight: FontWeight.normal)),
                    TextSpan(text: "Sign in", style: Theme.of(context).textTheme.headlineLarge!.copyWith(fontSize: 14, fontWeight: FontWeight.normal)),
                  ]
                )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
