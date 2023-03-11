import 'package:ecommerce_app/services/services.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class RegisterScreen extends StatelessWidget {

  final emailTextController = TextEditingController();
  final passwordTextController = TextEditingController();
  final registerPageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        scrollDirection: Axis.vertical,
        children: [
          _FirstRegisterScreen(emailTextController: emailTextController, passwordTextController: passwordTextController),
          _SecondRegisterScreen(emailTextController: emailTextController, passwordTextController: passwordTextController, registerPageController: registerPageController,),
        ],
      )
   );
  }
}

class _FirstRegisterScreen extends StatelessWidget {
  const _FirstRegisterScreen({
    Key? key,
    required this.emailTextController,
    required this.passwordTextController,
  }) : super(key: key);

  final TextEditingController emailTextController;
  final TextEditingController passwordTextController;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.only(bottom: 50, left: 20, right: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SafeArea(
            bottom: false,
            child: Padding(
              padding: const EdgeInsets.only(top: 60.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Register',
                    style: Theme.of(context).textTheme.titleLarge
                  ),
                  SizedBox(height: 10,),
                  Text(
                    "Create an account and check the best technology products",
                    style: TextStyle(
                      fontSize: 17
                    )
                  ),
                ],
              ),
            ),
          ),

          SizedBox(height: 20,),

          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: TextFormField(
              keyboardType: TextInputType.text,
              cursorColor: Colors.orange,
              controller: emailTextController,
              decoration: InputDecoration(
                border: InputBorder.none,
                fillColor: Theme.of(context).cardColor,
                filled: true,
                suffixIcon: const Icon(EvaIcons.emailOutline),
                hintText: 'First name'
              ),
            ),
          ),

          const SizedBox(height: 20,),

          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: TextFormField(
              keyboardType: TextInputType.text,
              cursorColor: Colors.orange,
              controller: emailTextController,
              decoration: InputDecoration(
                border: InputBorder.none,
                fillColor: Theme.of(context).cardColor,
                filled: true,
                suffixIcon: const Icon(EvaIcons.emailOutline),
                hintText: 'Last name'
              ),
            ),
          ),

          const SizedBox(height: 20,),

          ClipRRect(
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

          const SizedBox(height: 20,),

          ClipRRect(
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

          const SizedBox(height: 20,),

        ],
      ),
    );
  }
}

class _SecondRegisterScreen extends StatelessWidget {
  const _SecondRegisterScreen({
    Key? key,
    required this.emailTextController,
    required this.passwordTextController, 
    required this.registerPageController,
  }) : super(key: key);

  final TextEditingController emailTextController;
  final TextEditingController passwordTextController;
  final PageController registerPageController;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.only(bottom: 50),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SafeArea(
            bottom: false,
            child: Container(
              margin: const EdgeInsets.only(left: 20, top: 30, bottom: 40),
              decoration: BoxDecoration(
                color: Theme.of(context).cardColor,
                borderRadius: BorderRadius.circular(10)
              ),
              child: IconButton(
                onPressed: () {
                  registerPageController.previousPage(duration: Duration(seconds: 1), curve: Curves.ease);
                },
                icon: Icon(
                  EvaIcons.arrowUpOutline
                ),
              )
            ),
          ),

          const SizedBox(height: 20,),

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
              child: const Text("Sign Up")
            )
          ),

        ],
      ),
    );
  }
}