import 'package:budget_bites/SignInUp/signInPage.dart';
import 'package:budget_bites/shared/navigationBar.dart';
import 'package:budget_bites/themes/appColorTheme.dart';
import 'package:flutter/material.dart';
import 'package:budget_bites/themes/appTextTheme.dart';
import 'package:budget_bites/services/auth.dart';
import 'package:budget_bites/archived/test_page.dart';


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
              /*
              const SizedBox(height: 20),
              const Row(
                children: [
                  Icon(Icons.settings),
                  Text('  App Settings', style: TextStyle(fontSize: 24)),
                  Text('                                              '),
                  Icon(Icons.arrow_forward_ios_rounded)
                ]
                
              ,),
              */
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
                  onTap: () {Navigator.push(context, MaterialPageRoute(builder: (context) => const InfoPage()),);},
                  child: const Row(
                    children: [
                      Text('  Personal Information', style: TextStyle(fontSize: 24)),
                      Spacer(),
                      Icon(Icons.arrow_forward_ios_rounded)
                    ],
                  ),
              ),
              const SizedBox(height: 20),
              InkWell(
                  onTap: () {Navigator.push(context, MaterialPageRoute(builder: (context) => const emailPage()),);},
                  child: const Row(
                    children: [
                      Text('  Email', style: TextStyle(fontSize: 24)),
                      Spacer(),
                      Icon(Icons.arrow_forward_ios_rounded)
                    ],
                  ),
              ),
              const SizedBox(height: 20),
              InkWell(
                  onTap: () {Navigator.push(context, MaterialPageRoute(builder: (context) => const passwordPage()),);},
                  child: const Row(
                    children: [
                      Text('  Password', style: TextStyle(fontSize: 24)),
                      Spacer(),
                      Icon(Icons.arrow_forward_ios_rounded)
                    ],
                  ),
              ),
            ]
          ,)
       ),
    );
  }
}

class passwordPage extends StatelessWidget {
  const passwordPage({ Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Password',
          style: appTextTheme.accountPageTitle,
        ),
      ),

      body: Builder(
          builder: (context) => Column(
            children: [
              const Row(children: [
                Text("  New Password:", style: TextStyle(fontSize: 20)),
                ]
              ,),
              const SizedBox(height: 5),
              const TextField(
                decoration: InputDecoration(
                  hintText: '  Add', // Placeholder text
                  border: OutlineInputBorder(), // Border around the text field
                ),
              ),
              const SizedBox(height: 20),
              const Row(children: [
                Text("  Confirm New Password:", style: TextStyle(fontSize: 20)),
                ]
              ,),
              const SizedBox(height: 5),
              const TextField(
                decoration: InputDecoration(
                  hintText: '  Add', // Placeholder text
                  border: OutlineInputBorder(), // Border around the text field
                ),
              ),
              Row(children: [
                ElevatedButton(onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context) => const passwordPage()),);}, child: const Text('Cancel')),
                ElevatedButton(onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context) => const passwordPage()),);}, child: const Text('Save Changes')),
              ]
              ,)
            ]
          ,)
       ),
    );
  }
}



class InfoPage extends StatefulWidget {
  const InfoPage({Key? key}) : super(key: key);

  @override
  _InfoPageState createState() => _InfoPageState();
}

class _InfoPageState extends State<InfoPage> {
  Color _buttonColor = Colors.blue;
  Color _buttonColor2 = Colors.grey;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Personal Info',
          style: appTextTheme.accountPageTitle,
        ),
      ),

      body: Builder(
          builder: (context) => Column(
            children: [
              const Text('Profile'),
              const Divider(
                color: Colors.black, // Set the color of the line
                thickness: 1, // Set the thickness of the line
                height: 20, // Set the vertical space above and below the line
              ),
              const Text('First Name'),
              const TextField(
                decoration: InputDecoration(
                  hintText: '  Add', // Placeholder text
                  border: OutlineInputBorder(), // Border around the text field
                ),
              ),
              const SizedBox(height: 20),
              const Text('Last Name'),
              const TextField(
                decoration: InputDecoration(
                  hintText: '  Add', // Placeholder text
                  border: OutlineInputBorder(), // Border around the text field
                ),
              ),
              Row(children: [
                ElevatedButton(onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context) => const passwordPage()),);}, child: const Text('Cancel')),
                ElevatedButton(onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context) => const passwordPage()),);}, child: const Text('Save Changes')),
              ]
              ,),
              const Text('Measurements'),
              const Divider(
                color: Colors.black, // Set the color of the line
                thickness: 1, // Set the thickness of the line
                height: 20, // Set the vertical space above and below the line
              ),
              Row(children: [
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                    // Change button color permanently
                    if (_buttonColor2 == Colors.blue){
                      _buttonColor2 = Colors.grey;
                      _buttonColor = Colors.blue;
                    }else{
                    _buttonColor2 = Colors.blue;
                    _buttonColor = Colors.grey;
                    }
                    });
                    }, 
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(_buttonColor2), // Change background color
                    shape: MaterialStateProperty.all<OutlinedBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10), // Adjust border radius
                      ),
                    ),
                    minimumSize: MaterialStateProperty.all<Size>(
                      const Size(150, 50), // Change width and height
                    ),
      // You can also adjust the width and height properties here
                  ),
                  child: const Text('Metric'),
                ),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                    // Change button color permanently
                    if (_buttonColor == Colors.blue){
                      _buttonColor = Colors.grey;
                      _buttonColor2 = Colors.blue;
                    }else{
                    _buttonColor = Colors.blue;
                    _buttonColor2 = Colors.grey;
                    }
                    });
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(_buttonColor),
                    shape: MaterialStateProperty.all<OutlinedBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10), // Adjust border radius
                      ),
                    ),
                    minimumSize: MaterialStateProperty.all<Size>(
                      const Size(150, 50), // Change width and height
                    ),
                  ),
                  child: const Text('Imperial (US)'),
                ),
                
              ]
              ,),
            ]
          ,)
       ),
    );
  }
}

class emailPage extends StatelessWidget {
  const emailPage({ Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Email',
          style: appTextTheme.accountPageTitle,
        ),
      ),

      body: Builder(
            builder: (context) => Column(
              children: [
                const Text("  Current Email: "),
                const TextField(
                  decoration: InputDecoration(
                    hintText: '  test@gmail.com', // Placeholder text
                    border: OutlineInputBorder(), // Border around the text field
                  ),
                ),
                const SizedBox(height: 40),
                const Text("  Change Email: "),
                const TextField(
                  decoration: InputDecoration(
                    hintText: '  Add', // Placeholder text
                    border: OutlineInputBorder(), // Border around the text field
                  ),
                ),
                const SizedBox(height: 20),
                const Text("  Confirm Email: "),
                const TextField(
                  decoration: InputDecoration(
                    hintText: '  Add', // Placeholder text
                    border: OutlineInputBorder(), // Border around the text field
                  ),
                ),
                Row(children: [
                ElevatedButton(onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context) => const TestPage()),);}, child: const Text('Cancel')),
                ElevatedButton(onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context) => const passwordPage()),);}, child: const Text('Save Changes')),
              ]
              ,),
              ]
            ),
        
      )

    );
  }
}
