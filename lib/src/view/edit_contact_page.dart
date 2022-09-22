import 'package:flutter/material.dart';
import 'package:phonebook/src/application/application_state.dart';
import 'package:phonebook/src/model/contact.dart';
import 'package:phonebook/src/view/widget/custom_form_field.dart';
import 'package:provider/provider.dart';

class EditContatctPage extends StatefulWidget {
  const EditContatctPage({super.key});

  static const routeName = '/editContact';

  @override
  State<EditContatctPage> createState() => _EditContatctPageState();
}

class _EditContatctPageState extends State<EditContatctPage> {
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
    final id = ModalRoute.of(context)!.settings.arguments as String;
    Contact contact =
        Provider.of<ApplicationState>(context, listen: false).getContact(id);
    _firstName.text = contact.firstName;
    _lastName.text = contact.lastName;
    _email.text = contact.email;
    _phone.text = contact.phone;
    _notes.text = contact.notes;
    _picture.text = contact.picture[0];
    return Scaffold(
      appBar: AppBar(title: const Text('Edit Contact')),
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
            contact.firstName = _firstName.text;
            contact.lastName = _lastName.text;
            contact.email = _email.text;
            contact.notes = _notes.text;
            contact.phone = _phone.text;
            contact.picture[0] = _picture.text;
            Provider.of<ApplicationState>(context, listen: false)
                .updateContact(contact);
            Navigator.pop(context);
          }
        }),
        child: const Icon(Icons.done),
      ),
    );
  }
}
