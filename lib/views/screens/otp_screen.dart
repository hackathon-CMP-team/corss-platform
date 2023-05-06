import 'package:flutter/material.dart';
import 'package:flutter_cmp_developers/constants/constants.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import '../widgets/frequently_used_widgets.dart';
import '../../controllers/create_account_controller.dart';

class OneTimePassword extends StatefulWidget {
  const OneTimePassword({
    super.key,
  });
  static const routeName = '/OneTimePassword';
  @override
  State<OneTimePassword> createState() => OneTimePasswordState();
}

class OneTimePasswordState extends State<OneTimePassword> {
  final _formKey = GlobalKey<FormState>();
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
                    height:MediaQuery.of(context).size.height * 0.47,
                  ),
                  Text(
                    "Enter Verification Code",
                    style: TextStyle(
                      fontSize: 20,
                      color: Theme.of(context).primaryColor,

                    ),
                  ),
                  const SizedBox(
                    height:30,
                  ),
                  SizedBox(
                     width: MediaQuery.of(context).size.width * 0.5,
                    // height: MediaQuery.of(context).size.height * 0.3,
                    child: PinCodeTextField(
                      keyboardType: TextInputType.number,
                      length: 6,
                      blinkWhenObscuring: true,
                      obscuringCharacter: '*',
                      // obscuringWidget: FlutterLogo(),
                      animationType: AnimationType.fade,
                      onChanged: (value) {
                        print(value);
                      },
                      validator: (value) {
                       if (value!.isEmpty && value.length < 6) {
                          return "Enter the verification code!";
                        } else {
                          return null;
                        }
                      },
                      pastedTextStyle: TextStyle(
                        color:  Theme.of(context).primaryColor,
                        fontWeight: FontWeight.bold,
                      ),
                      pinTheme: PinTheme(
                        fieldHeight: 30,
                        fieldWidth: 30,
                        shape: PinCodeFieldShape.circle,
                        selectedColor: Theme.of(context).primaryColor,
                        inactiveColor: Theme.of(context).primaryColor,
                        disabledColor: Theme.of(context).primaryColor,
                        activeColor: Theme.of(context).primaryColor, //Theme.of(context).primaryColor,
                        borderRadius: BorderRadius.circular(25),
                      ),
                      appContext: context,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "if you didn't receive a code! ",
                        style:
                            TextStyle(fontSize: 16, color: textFieldTextColor),
                      ),
                      TextButton(
                          onPressed: () {
                            resend();
                          },
                          child: Text(
                            "Resend",
                            style: TextStyle(
                                fontSize: 16,
                                color: Theme.of(context).primaryColor),
                          ))
                    ],
                  ),
                  const SizedBox(
                    height:40,
                  ),
                  //uniformSpacing(),
                  submit(),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.28,
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Container submit() {
    return Container(
      width: MediaQuery.of(context).size.width * 0.78,
      height: textFieldHeight,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(buttonRadius),
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
              side: BorderSide(color: Theme.of(context).primaryColor),
            ),
          ),
        ),
        onPressed: () {
          setState(
            () {
              if (_formKey.currentState!.validate()) {
                Navigator.pushNamed(context, '/NewPasswordCreate');
              }
            },
          );
        },
        child: Text(
          "Verify",
          style: TextStyle(
            fontSize: 20,
            color: buttonTextColor,
          ),
        ),
      ),
    );
  }
}
