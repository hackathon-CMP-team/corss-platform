import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage(
              "assets/images/Home.png",
            ),
          )),
          child: Column(
            children: [
              // SizedBox(height: 16),
              // _buildHeader(context, 'Account', Icon(Icons.person)),
              _buildTile(context, '  Account', Icon(Icons.person)),
              // _buildTile(context, 'Change Password'),
              // _buildTile(context, 'Notification Preferences'),
              // SizedBox(height: 16),
              // _buildHeader(context, 'Preferences'),
              // _buildTile(context, 'Language'),
              // _buildTile(context, 'Theme'),
              // SizedBox(height: 16),
              // _buildHeader(context, 'Support'),
              // _buildTile(context, 'FAQ'),
              // _buildTile(context, 'Contact Us'),
            ],
          ),
        ),
      ),
    );
  }

  // Widget _buildHeader(BuildContext context, String title, Icon icon) {
  //   return Padding(
  //     padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
  //     child: Text(
  //       title,
  //       // style: Theme.of(context).textTheme.headline6,
  //     ),
  //   );
}

Widget _buildTile(BuildContext context, String title, Icon IconType) {
  return InkWell(
    onTap: () {},
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              IconType,
              Text(
                title,
                style: Theme.of(context).textTheme.bodyText1,
              ),
            ],
          ),
          Icon(
            Icons.arrow_forward_ios_rounded,
          ),
        ],
      ),
    ),
  );
}
