import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:glocery_app/provider/dark_theme_provider.dart';
import 'package:provider/provider.dart';

import '../widgets/text_widget.dart';

class UserScreen extends StatefulWidget {
  const UserScreen({Key? key}) : super(key: key);

  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  final TextEditingController _addressTextController =
      TextEditingController(text: "");

  @override
  void dispose() {
    // TODO: implement dispose
    _addressTextController.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    final themeState = Provider.of<DarkThemeProvider>(context);
    final Color color = themeState.getDarkTheme ? Colors.white : Colors.black;
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 50,
                ),
                RichText(
                  text: TextSpan(
                      text: "Hi,   ",
                      style: const TextStyle(
                        color: Colors.cyan,
                        fontSize: 27,
                        fontWeight: FontWeight.bold,
                      ),
                      children: <TextSpan>[
                        TextSpan(
                            text: "MyName",
                            style: TextStyle(
                              color: color,
                              fontSize: 25,
                              fontWeight: FontWeight.w600,
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                print("My name is pressed");
                              }),
                      ]),
                ),
                const SizedBox(
                  height: 5,
                ),
                TextWidget(
                  text: "Email@gmail.com",
                  color: color,
                  textSize: 17,
                ),
                const SizedBox(
                  height: 20,
                ),
                const Divider(
                  thickness: 2,
                ),
                const SizedBox(
                  height: 20,
                ),
                _listTiles(
                  title: "Address",
                  subtitle: "My subtitle",
                  icon: IconlyLight.profile,
                  onPressed: () async {
                    await _showAddressDialog();
                  },
                  color: color,
                ),
                SizedBox(
                  height: 10,
                ),
                _listTiles(
                  title: "Orders",
                  icon: IconlyLight.bag,
                  onPressed: () {},
                  color: color,
                ),
                SizedBox(
                  height: 10,
                ),
                _listTiles(
                  title: "Wishlist",
                  icon: IconlyLight.heart,
                  onPressed: () {},
                  color: color,
                ),
                SizedBox(
                  height: 10,
                ),
                _listTiles(
                  title: "Viewed",
                  icon: IconlyLight.show,
                  onPressed: () {},
                  color: color,
                ),
                SizedBox(
                  height: 10,
                ),
                _listTiles(
                  title: "Forget password",
                  icon: IconlyLight.unlock,
                  onPressed: () {},
                  color: color,
                ),
                SizedBox(
                  height: 10,
                ),
                SwitchListTile(
                  title: TextWidget(
                    text: themeState.getDarkTheme ? "Dark mode" : "Light mode",
                    color: color,
                    textSize: 20,
                  ),
                  secondary: Icon(themeState.getDarkTheme
                      ? Icons.dark_mode_outlined
                      : Icons.light_mode_outlined),
                  onChanged: (bool value) {
                    setState(() {
                      themeState.setDarkTheme = value;
                    });
                  },
                  value: themeState.getDarkTheme,
                ),
                SizedBox(
                  height: 20,
                ),
                _listTiles(
                  title: "Logout",
                  icon: IconlyLight.logout,
                  onPressed: () {
                    _showLogoutDialog();
                  },
                  color: color,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _showLogoutDialog() async {
    await showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Row(
              children: [
                Image.asset(
                  "assets/images/warning-sign.png",
                  height: 40,
                  width: 40,
                  fit: BoxFit.fill,
                ),
                SizedBox(
                  width: 10,
                ),
                Text("Sign Out")
              ],
            ),
            content: Text("Do you want to sign out?"),
            actions: [
              ElevatedButton(
                onPressed: () {
                  if (Navigator.canPop(context)) {
                    Navigator.pop(context);
                  }
                },
                child: TextWidget(
                  color: Colors.white,
                  text: "Cancel",
                  textSize: 18,
                ),
              ),
              ElevatedButton(
                onPressed: () {},
                child: TextWidget(
                  color: Colors.white,
                  text: "Yes",
                  textSize: 18,
                ),
              ),
            ],
          );
        });
  }

  Future<void> _showAddressDialog() async {
    await showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text("Update Address"),
            content: TextField(
              // onChanged: (value) {
              //   print(
              //       '_addressTextController.text ${_addressTextController.text}');
              // },
              controller: _addressTextController,
              maxLines: 5,
              decoration: InputDecoration(hintText: "Your address"),
            ),
            actions: [
              TextButton(onPressed: () {}, child: Text("Update")),
            ],
          );
        });
  }

  Widget _listTiles({
    required String title,
    String? subtitle,
    required IconData icon,
    required Function onPressed,
    required Color color,
  }) {
    return ListTile(
      title: TextWidget(
        text: title,
        color: color,
        textSize: 22,
        // isTitle: true,
      ),
      subtitle: TextWidget(
        text: subtitle == null ? "" : subtitle,
        color: color,
        textSize: 18,
      ),
      leading: Icon(icon),
      trailing: const Icon(IconlyLight.arrowRight2),
      onTap: () {
        onPressed();
      },
    );
  }
}
