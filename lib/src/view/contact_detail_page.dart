import 'package:flutter/material.dart';
import 'package:phonebook/src/application/application_state.dart';
import 'package:phonebook/src/model/contact.dart';
import 'package:phonebook/src/view/edit_contact_page.dart';
import 'package:phonebook/src/view/widget/contact_avatar.dart';
import 'package:phonebook/src/view/widget/contact_detail_item.dart';
import 'package:provider/provider.dart';

class ContatcDetailPage extends StatelessWidget {
  const ContatcDetailPage({super.key});

  static const routeName = '/contactDetail';

  @override
  Widget build(BuildContext context) {
    final id = ModalRoute.of(context)!.settings.arguments as String;
    return Scaffold(
      appBar: AppBar(title: const Text('Contact Detail')),
      body: Consumer<ApplicationState>(builder: (context, state, _) {
        final contact = state.getContact(id);
        return Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            Hero(
                tag: contact.id ?? '12',
                child: ContactAvatar(url: contact.picture)),
            ContactDetailItem(
                icon: Icons.person,
                text: '${contact.firstName} ${contact.lastName}'),
            ContactDetailItem(icon: Icons.phone, text: contact.phone),
            ContactDetailItem(icon: Icons.email, text: contact.email),
            ContactDetailItem(icon: Icons.note, text: contact.notes),
            // ContactDetailItem(icon: Icons.photo, text: contact.picture[0]),
            const SizedBox(
              height: 100,
            ),
            SizedBox(
              width: 150,
              height: 50,
              child: TextButton.icon(
                  style: TextButton.styleFrom(
                      foregroundColor: Colors.red,
                      backgroundColor: Colors.red[50]),
                  onPressed: () {
                    showAlertDialog(context, contact);
                  },
                  icon: const Icon(
                    Icons.delete,
                  ),
                  label: const Text(
                    'Delete',
                    style: TextStyle(fontSize: 15),
                  )),
            )
          ],
        );
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: (() {
          Navigator.pushNamed(context, EditContatctPage.routeName,
              arguments: id);
        }),
        child: const Icon(Icons.edit),
      ),
    );
  }

  showAlertDialog(BuildContext context, Contact contact) {
    // set up the buttons
    Widget cancelButton = TextButton(
      child: const Text("No"),
      onPressed: () {
        Navigator.pop(context, false);
      },
    );
    Widget continueButton = TextButton(
      child: const Text("Yes"),
      onPressed: () {
        Navigator.pop(context, true);
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: const Text("Delete alert"),
      content: const Text("Are you sure to delete this contact permenantly?"),
      actions: [
        cancelButton,
        continueButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    ).then((delete) {
      if (delete) {
        Provider.of<ApplicationState>(context, listen: false)
            .removeContact(contact);
        Navigator.pop(context);
      }
    });
  }
}
