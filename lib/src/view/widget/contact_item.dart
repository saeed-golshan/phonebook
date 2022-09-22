import 'package:flutter/material.dart';
import 'package:phonebook/src/model/contact.dart';
import 'package:phonebook/src/view/contact_detail_page.dart';
import 'package:phonebook/src/view/widget/contact_avatar.dart';

class ContactItem extends StatelessWidget {
  final Contact contact;
  const ContactItem({required this.contact, super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      child: ListTile(
        leading: ContactAvatar(url: contact.picture[0]),
        title: Text('${contact.firstName} ${contact.lastName}'),
        subtitle: Text(contact.phone),
        onTap: () => Navigator.pushNamed(context, ContatcDetailPage.routeName,
            arguments: contact.id),
      ),
    );
  }
}
