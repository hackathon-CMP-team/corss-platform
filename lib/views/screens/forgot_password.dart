import 'package:flutter/material.dart';
import 'package:flutter_cmp_developers/constants/constants.dart';
import '../widgets/frequently_used_widgets.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({
    super.key,
  });
  static const routeName = '/ForgetPassword';
  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  final _formKey = GlobalKey<FormState>();
  final _phoneNumberInput = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                'assets/images/forgetPassword.png',
              ),
              fit: BoxFit.cover,
            ),
          ),
          child: Form(
              key: _formKey,
              child: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.47,
                    ),
                    Text(
                      "Forget Password ?    ",
                      style: TextStyle(
                        fontSize: 20,
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                    const SizedBox(
                      height: 30, //MediaQuery.of(context).size.height * 0.47,
                    ),
                    //uniformSpacing(),
                    phoneNumberInput(
                      "Phone Number",
                      context,
                      _phoneNumberInput,
                    ),
                    const SizedBox(
                      height: 40, //MediaQuery.of(context).size.height * 0.47,
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pushNamed(
                          context,
                          "/SignInScreen",
                        );
                      },
                      child: Text(
                        "Back to Login",
                        style: TextStyle(
                          fontSize: 16,
                          color: textFieldTextColor,
                        ),
                      ),
                    ),
                    uniformSpacing(),
                    submit(),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.28,
                    )
                  ],
                ),
              )),
        ),
      ),
    );
  }

  Container submit() {
    return Container(
      width: MediaQuery.of(context).size.width * 0.76,
      height: 61,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          buttonRadius,
        ),
      ),
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.resolveWith<Color?>(
            (Set<MaterialState> states) {
              return Theme.of(context).primaryColor;
            },
          ),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
                buttonRadius,
              ),
              side: BorderSide(
                color: Theme.of(context).primaryColor,
              ),
            ),
          ),
        ),
        onPressed: () {
          setState(
            () {
              if (_formKey.currentState!.validate()) {
                Navigator.pushNamed(
                  context,
                  '/OneTimePassword',
                );
              }
            },
          );
        },
        child: Text(
          "SEND",
          style: TextStyle(
            fontSize: 20,
            color: buttonTextColor,
          ),
        ),
      ),
    );
  }
}
