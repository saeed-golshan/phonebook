import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:phonebook/src/application/application_state.dart';
import 'package:phonebook/src/view/add_contact_page.dart';
import 'package:phonebook/src/view/login_page.dart';
import 'package:provider/provider.dart';
import 'package:phonebook/src/view/widget/contact_item.dart';

class ContactListPage extends StatelessWidget {
  const ContactListPage({super.key});

  static const routeName = '/';

  @override
  Widget build(BuildContext context) {
    var box = Hive.box('Setting');
    return Scaffold(
      appBar: AppBar(
        title: const Text('Phone Book'),
        actions: [
          IconButton(
              onPressed: (() {
                box.put('login', false);
                Navigator.pushNamedAndRemoveUntil(
                    context, LoginPage.routeName, (route) => false);
              }),
              icon: const Icon(Icons.logout))
        ],
      ),
      body: Consumer<ApplicationState>(
        builder: (context, state, _) {
          if (state.isLoading == true) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return ListView.builder(
                itemCount: state.contacts.length,
                itemBuilder: ((context, index) =>
                    ContactItem(contact: state.contacts[index])));
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (() {
          Navigator.pushNamed(context, AddContatctPage.routeName);
        }),
        child: const Icon(Icons.add),
      ),
    );
  }
}
