import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:phonebook/src/application/application_state.dart';
import 'package:phonebook/src/view/add_contact_page.dart';
import 'package:phonebook/src/view/contact_detail_page.dart';
import 'package:phonebook/src/view/contact_list_page.dart';
import 'package:phonebook/src/view/edit_contact_page.dart';
import 'package:phonebook/src/view/login_page.dart';
import 'package:provider/provider.dart';
import 'package:hive/hive.dart';

void main() async {
  await Hive.initFlutter();
  await Hive.openBox('setting');
  runApp(ChangeNotifierProvider(
    create: (context) => ApplicationState(),
    child: const PhoneBookApp(),
  ));
}

class PhoneBookApp extends StatelessWidget {
  const PhoneBookApp({super.key});

  // This widget is the root of application.
  @override
  Widget build(BuildContext context) {
    var box = Hive.box('setting');
    return MaterialApp(
      title: 'Phone Book',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: box.get('login', defaultValue: false)
          ? ContactListPage.routeName
          : LoginPage.routeName,
      routes: {
        ContactListPage.routeName: ((context) => const ContactListPage()),
        ContatcDetailPage.routeName: (context) => const ContatcDetailPage(),
        AddContatctPage.routeName: (context) => const AddContatctPage(),
        EditContatctPage.routeName: (context) => const EditContatctPage(),
        LoginPage.routeName: (context) => const LoginPage()
      },
      // home: const ContactListPage(),
    );
  }
}
