import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../providers/log_provider.dart';
import '../authentication/login_phone_page.dart';

class MyDrawer extends StatefulWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  _MyDrawerState createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  late final String? myPhone;
  late final String? myUid;

  @override
  void initState() {
    final FirebaseAuth auth = FirebaseAuth.instance;
    User? user = auth.currentUser;
    myPhone = user?.phoneNumber;
    myUid = user?.uid;
    const LogProvider('📱').log(myPhone!);
    const LogProvider('🔒').log(myUid!);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          UserAccountsDrawerHeader(
            accountName: Text('ID: $myUid'),
            accountEmail: Text('Số điện thoại: $myPhone'),
            currentAccountPicture: CircleAvatar(
              backgroundColor: Colors.white,
              child: Icon(Icons.person),
            ),
          ),
          const ListTile(
            title: Text('Chỉnh sửa thông tin cá nhân'),
            leading: Icon(Icons.edit),
          ),
          const Divider(),
          const ListTile(
            title: Text('Phản ánh'),
            leading: Icon(Icons.chat_bubble),
          ),
          const Divider(),
          ListTile(
            title: const Text('Đăng xuất'),
            leading: const Icon(Icons.logout),
            onTap: () {
              FirebaseAuth.instance.signOut();
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (_) => const LoginPhonePage()));
            },
          ),
          const Divider(),
        ],
      ),
    );
  }
}
