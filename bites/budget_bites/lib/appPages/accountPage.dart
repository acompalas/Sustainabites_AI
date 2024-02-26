import 'package:budget_bites/SignInUp/signInPage.dart';
import 'package:budget_bites/shared/navigationBar.dart';
import 'package:budget_bites/themes/appColorTheme.dart';
import 'package:flutter/material.dart';
import 'package:budget_bites/themes/appTextTheme.dart';
import 'package:budget_bites/services/auth.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Account',
          style: appTextTheme.accountPageTitle,
        ),
        automaticallyImplyLeading: false, //Disable back arrow
      ),

      //bottomNavigationBar: BottomNavBar(),

      //InkWell(
      body: Builder(
          builder: (context) => Column(
            children: [
              const SizedBox(height: 20),
              InkWell(
                  onTap: () {Navigator.push(context, MaterialPageRoute(builder: (context) => const AboutScreen()),);},
                  child: const Row(
                    children: [
                      Icon(Icons.person),
                      Text('  Manage Account', style: TextStyle(fontSize: 24)),
                      Text('                                   '),
                      Icon(Icons.arrow_forward_ios_rounded)
                    ],
                  ),
              ),
              const SizedBox(height: 20),
              const Row(
                children: [
                  Icon(Icons.shield),
                  Text('  Privacy Settings', style: TextStyle(fontSize: 24)),
                  Text('                                     '),
                  Icon(Icons.arrow_forward_ios_rounded)
                ]
              ,),
              const SizedBox(height: 20),
              const Row(
                children: [
                  Icon(Icons.notifications),
                  Text('  Notifications', style: TextStyle(fontSize: 24)),
                  Text('                                              '),
                  Icon(Icons.arrow_forward_ios_rounded)
                ]
              ,),
              const SizedBox(height: 20),
              const Row(
                children: [
                  Icon(Icons.settings),
                  Text('  App Settings', style: TextStyle(fontSize: 24)),
                  Text('                                              '),
                  Icon(Icons.arrow_forward_ios_rounded)
                ]
              ,),
              const SizedBox(height: 20),
              const Row(
                children: [
                  Icon(Icons.info),
                  Text('  About Us', style: TextStyle(fontSize: 24)),
                  Text('                                                        '),
                  Icon(Icons.arrow_forward_ios_rounded)
                ]
              ,),
              const SizedBox(height: 20),
              const Row(
                children: [
                  Icon(Icons.question_mark),
                  Text('  Help and Support', style: TextStyle(fontSize: 24)),
                  Text('                                '),
                  Icon(Icons.arrow_forward_ios_rounded)
                ]
              ,),
              const SizedBox(height: 20),
              InkWell(
              onTap: () {
                // Call the sign-out function from your authentication service
                AuthService().signOut();
                Navigator.push(context, MaterialPageRoute(builder: (context) => signInPage()),);
              },
              child: const Row(
                children: [
                  Icon(Icons.logout),
                  Text('  Log Out', style: TextStyle(fontSize: 24)),
                ]
              ),
          )]
          ,)
      ),
    );
  }
}

class AboutScreen extends StatelessWidget {
  const AboutScreen({ Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Management',
          style: appTextTheme.accountPageTitle,
        ),
      ),
      //bottomNavigationBar: BottomNavBar(),
      
      body: Builder(
          builder: (context) => Column(
            children: [
              const SizedBox(height: 20),
              InkWell(
                  onTap: () {Navigator.push(context, MaterialPageRoute(builder: (context) => const AboutScreen()),);},
                  child: const Row(
                    children: [
                      Text('  Personal Information', style: TextStyle(fontSize: 24)),
                      Spacer(),
                      Icon(Icons.arrow_forward_ios_rounded)
                    ],
                  ),
              ),
              const SizedBox(height: 20),
            ]
          ,)
       ),
    );
  }
}