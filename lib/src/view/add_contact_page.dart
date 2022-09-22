import 'dart:math';

import 'package:flutter/material.dart';
import 'package:phonebook/src/application/application_state.dart';
import 'package:phonebook/src/model/contact.dart';
import 'package:phonebook/src/view/widget/custom_form_field.dart';
import 'package:provider/provider.dart';

class AddContatctPage extends StatefulWidget {
  const AddContatctPage({super.key});

  static const routeName = '/contactForm';

  @override
  State<AddContatctPage> createState() => _AddContatctPageState();
}

class _AddContatctPageState extends State<AddContatctPage> {
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController _firstName,
      _lastName,
      _email,
      _phone,
      _notes,
      _picture;
  late final FocusNode _firstNameFocus,
      _lastNameFocus,
      _emailFocus,
      _phoneFocus,
      _noteFocus,
      _pictureFocus;

  @override
  void initState() {
    super.initState();
    _firstName = TextEditingController();
    _lastName = TextEditingController();
    _email = TextEditingController();
    _phone = TextEditingController();
    _notes = TextEditingController();
    _picture = TextEditingController();
    _firstNameFocus = FocusNode();
    _lastNameFocus = FocusNode();
    _emailFocus = FocusNode();
    _phoneFocus = FocusNode();
    _noteFocus = FocusNode();
    _pictureFocus = FocusNode();
  }

  @override
  void dispose() {
    _firstName.dispose();
    _lastName.dispose();
    _email.dispose();
    _phone.dispose();
    _notes.dispose();
    _picture.dispose();
    _firstNameFocus.dispose();
    _lastNameFocus.dispose();
    _emailFocus.dispose();
    _phoneFocus.dispose();
    _noteFocus.dispose();
    _pictureFocus.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Add Contact')),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  CustomFormFiled(
                    controller: _firstName,
                    label: 'First name',
                    hint: "Enter contact's first name",
                    icon: Icons.person,
                    focusNode: _firstNameFocus,
                    nextFocus: _lastNameFocus,
                    autoFocus: true,
                  ),
                  CustomFormFiled(
                    controller: _lastName,
                    label: 'Last name',
                    hint: "Enter contact's Last name",
                    icon: Icons.person,
                    focusNode: _lastNameFocus,
                    nextFocus: _emailFocus,
                  ),
                  CustomFormFiled(
                    controller: _email,
                    label: 'Email',
                    hint: "Enter contact's Email",
                    icon: Icons.email,
                    focusNode: _emailFocus,
                    nextFocus: _phoneFocus,
                    textInputType: TextInputType.emailAddress,
                  ),
                  CustomFormFiled(
                    controller: _phone,
                    label: 'Phone number',
                    hint: "Enter contact's phone number",
                    icon: Icons.phone,
                    focusNode: _phoneFocus,
                    nextFocus: _noteFocus,
                    textInputType: TextInputType.phone,
                  ),
                  CustomFormFiled(
                    controller: _notes,
                    label: 'Notes',
                    hint: "Enter note about contact",
                    icon: Icons.note,
                    focusNode: _noteFocus,
                    nextFocus: _pictureFocus,
                  ),
                  CustomFormFiled(
                    controller: _picture,
                    label: 'Photo',
                    hint: "Enter photo address of contact",
                    icon: Icons.photo,
                    focusNode: _pictureFocus,
                    required: false,
                    lastField: true,
                  ),
                ],
              ),
            )),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (() {
          if (_formKey.currentState!.validate()) {
            final contact = Contact(
                id: getRandomString(10),
                firstName: _firstName.text,
                lastName: _lastName.text,
                email: _email.text,
                notes: _notes.text,
                phone: _phone.text,
                picture: [_picture.text]);
            Provider.of<ApplicationState>(context, listen: false)
                .addConatct(contact);
            Navigator.pop(context);
          }
        }),
        child: const Icon(Icons.done),
      ),
    );
  }

  String getRandomString(int length) {
    const _chars =
        'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
    Random _rnd = Random();
    return String.fromCharCodes(Iterable.generate(
        length, (_) => _chars.codeUnitAt(_rnd.nextInt(_chars.length))));
  }
}
