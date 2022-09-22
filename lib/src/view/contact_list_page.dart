import 'package:flutter/material.dart';
import 'package:phonebook/src/application/application_state.dart';
import 'package:phonebook/src/view/add_contact_page.dart';
import 'package:provider/provider.dart';
import 'package:phonebook/src/view/widget/contact_item.dart';

class ContactListPage extends StatelessWidget {
  const ContactListPage({super.key});

  static const routeName = '/';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Phone Book')),
      body: Consumer<ApplicationState>(
        builder: (context, state, child) => ListView.builder(
            itemCount: state.contacts.length,
            itemBuilder: ((context, index) =>
                ContactItem(contact: state.contacts[index]))),
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
