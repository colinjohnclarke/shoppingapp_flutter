import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_essentials/widgets/text_widget.dart';

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
    _addressTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(4.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: RichText(
                    text: const TextSpan(
                        text: "Hi,  ",
                        style: TextStyle(
                          color: Colors.cyan,
                          fontSize: 27,
                          fontWeight: FontWeight.bold,
                        ),
                        children: <TextSpan>[
                      TextSpan(
                        text: "My name",
                        style: TextStyle(fontWeight: FontWeight.w600),
                      ),
                    ])),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextWidget(
                    text: "123@gmail.com", color: Colors.blue, textSize: 23),
              ),
              SizedBox(height: 20),
              Divider(
                thickness: 2,
              ),
              SizedBox(height: 20),
              const ListTile(),
              _listTiles(
                  title: "Address",
                  icon: Icons.person_2_outlined,
                  onPressed: () async {
                    await _showAddressDialog();
                  }),
              _listTiles(title: "Orders", icon: Icons.list, onPressed: () {}),
              _listTiles(
                  title: "Wishlist",
                  icon: Icons.heart_broken,
                  onPressed: () {}),
              _listTiles(
                  title: "Viewed", icon: Icons.view_agenda, onPressed: () {}),
              _listTiles(
                  title: "Forget Password", icon: Icons.lock, onPressed: () {}),
              _listTiles(
                  title: "Logout",
                  icon: Icons.logout_outlined,
                  onPressed: () {
                    _showLogoutDialog();
                  }),
              Divider(
                thickness: 2,
              ),
            ],
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
            content: const Text('Do you want to sign out?'),
            actions: [
              Center(
                child: Image(image: AssetImage(
                  "assets/images/warning-sign.png"
                ), height: 200, width: 200,),
              ),
              TextButton(
                  onPressed: () {
                    if(Navigator.canPop(context)) {
                      Navigator.pop(context);
                    }
                  },
                  child: TextWidget(
                    color: Colors.cyan,
                    text: "Cancel",
                    textSize: 18,
                  )),
              TextButton(
                  onPressed: () {},
                  child: TextWidget(
                    color: Colors.red,
                    text: "Ok",
                    textSize: 18,
                  )),
            ],
            title: Row(
              children: [
                const Text('Sign Out'),
              ],
            ),
          );
        });
  }

  Future<void> _showAddressDialog() async {
    await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Update'),
          content: TextField(
            onChanged: (value) {
              print(
                  '_addressTextController.text ${_addressTextController.text}');
              // _addressTextController.text;
            },
            controller: _addressTextController,
            decoration: InputDecoration(hintText: "your Address"),
          ),
          actions: [
            TextButton(onPressed: () {}, child: Text('update')),
          ],
        );
      },
    );
  }

  Widget _listTiles(
      {required String title,
      String? subtitle,
      required IconData icon,
      required Function onPressed}) {
    return ListTile(
      title: TextWidget(
        text: title,
        color: Colors.black,
        textSize: 18,
        isTitle: true,
      ),
      subtitle: TextWidget(
        text: subtitle == null ? "" : subtitle,
        color: Colors.black,
        textSize: 15,
      ),
      leading: Icon(icon),
      trailing: const Icon(Icons.arrow_forward_ios),
      onTap: () {
        onPressed();
      },
    );
  }
}
