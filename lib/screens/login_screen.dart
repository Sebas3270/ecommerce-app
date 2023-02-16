import 'package:ecommerce_app/services/services.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class LogInScreen extends StatelessWidget {

  final emailTextController = TextEditingController();
  final passwordTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          SafeArea(
            child: Padding(
              padding: const EdgeInsets.only(top: 60.0, left: 20, right: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Log In',
                    style: Theme.of(context).textTheme.titleLarge
                  ),
                  SizedBox(height: 10,),
                  Text(
                    "Welcome back!, many offers are waiting for you!",
                    style: TextStyle(
                      fontSize: 17
                    )
                  ),
                ],
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: TextFormField(
                keyboardType: TextInputType.emailAddress,
                cursorColor: Colors.orange,
                controller: emailTextController,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  fillColor: Theme.of(context).cardColor,
                  filled: true,
                  suffixIcon: const Icon(EvaIcons.emailOutline),
                  hintText: 'Email'
                ),
              ),
            ),
          ),

          const SizedBox(height: 20,),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: TextFormField(
                obscureText: true,
                cursorColor: Colors.orange,
                controller: passwordTextController,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  fillColor: Theme.of(context).cardColor,
                  filled: true,
                  suffixIcon: const Icon(EvaIcons.lockOutline),
                  hintText: 'Password'
                ),
              ),
            ),
          ),

          const SizedBox(height: 20,),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0)),
                  minimumSize: const Size(double.infinity, 40), //////// HERE
                ),
              onPressed: () async {
                 final authService = Provider.of<AuthService>(context, listen: false);
                 final auth = await authService.login(
                    emailTextController.text.trim(),
                    passwordTextController.text.trim()
                  );

                  if(auth){
                    Navigator.of(context).pushNamed('main');
                  }else{

                  }
              },
              child: const Text("Sign In")
            )
          ),

        ],
      )
   );
  }
}