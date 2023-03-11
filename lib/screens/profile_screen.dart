import 'package:ecommerce_app/services/services.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final themeService = Provider.of<AppTheme>(context);
    final authService = Provider.of<AuthService>(context);

    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 35.0, horizontal: 20),
              child: Text(
                'Profile',
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ),
          ),

          ListTile(
            leading: Icon(EvaIcons.personOutline),
            title: Text("${authService.user.firstName} ${authService.user.lastName}"),
            contentPadding: EdgeInsets.symmetric(horizontal: 20),
          ),

          ListTile(
            leading: Icon(EvaIcons.creditCardOutline),
            title: Text('Purchases'),
            contentPadding: EdgeInsets.symmetric(horizontal: 20),
            trailing: Icon(EvaIcons.arrowIosForwardOutline),
          ),

          ListTile(
            leading: Icon(EvaIcons.moonOutline),
            title: Text('Dark mode'),
            contentPadding: EdgeInsets.symmetric(horizontal: 20),
            trailing: Switch.adaptive(
              activeColor: Colors.orange[700],
              value: themeService.isDarkMode, 
              onChanged: (value) => themeService.isDarkMode = value,
            ),
          ),

          ListTile(
            leading: Icon(EvaIcons.logOutOutline),
            title: Text('Log Out'),
            contentPadding: EdgeInsets.symmetric(horizontal: 20),
            trailing: Icon(EvaIcons.arrowIosForwardOutline),
            onTap: () {
              showCupertinoDialog(
                context: context, 
                builder: (context) => CupertinoAlertDialog(
                title:  Text("Log Out"),
                content:  Text("You sure you would like to close your session?"),
                actions: <Widget>[
                  CupertinoDialogAction(
                    isDefaultAction: true,
                    child: Text("Yes"),
                    onPressed: () async {
                        await authService.logOut();
                        Navigator.of(context).pushNamed('login');
                    },
                  ),
                  CupertinoDialogAction(
                    child: Text("No"),
                    onPressed: () => Navigator.of(context).pop(),
                  )
                ],
              ),
            );
              
             
            },
          ),
          
        ],
      ),
   );
  }
}