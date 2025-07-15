import 'package:flutter/material.dart';
import 'package:blood/Component/My_text_form_field.dart';
import 'package:blood/Component/myButton.dart';

class Reset_Password extends StatefulWidget {
  const Reset_Password({super.key});

  @override
  State<Reset_Password> createState() => _Reset_PasswordState();
}

class _Reset_PasswordState extends State<Reset_Password> {
  GlobalKey<FormState> formstate = new GlobalKey<FormState>();
  var my_phone;
  Send() {
    if (formstate.currentState!.validate()) {
      formstate.currentState!.save();
    } else {
      print("not valid");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset("images/5.png"),
          SizedBox(height: 80),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Form(
                key: formstate,
                child: Column(
                  children: [
                    MyTextFormField(
                      name: "Email",
                      icon: Icons.email,
                      obscure_Text: false,
                      Save: (value) {
                        my_phone = value;
                      },
                      Valide: (value) {
                        if (value!.length > 100) {
                          return "Email can't to be large than 100 letter";
                        } else if (value.length < 10) {
                          return "Email can't to be less 10 letter";
                        } else {
                          return null;
                        }
                      },
                    ),
                    SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Container(
                        width: double.infinity,
                        alignment: Alignment.center,
                        child: Text(
                          "Your password reset will be send in your registered email address.",
                          textAlign: TextAlign.center,
                          style:
                              TextStyle(fontSize: 20, color: Color(0XFF7E7E7E)),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    myButton(
                        background_Color: Theme.of(context).primaryColor,
                        font_Size: 22,
                        function: () {
                          //Send();
                          Navigator.of(context).pushNamed("VerifyScreen");
                        },
                        name: "Send",
                        text_color: Colors.white,
                        padding_horizontal: 80),
                  ],
                )),
          ),
        ],
      ),
    );
  }
}
