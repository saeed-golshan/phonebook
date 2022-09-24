import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:phonebook/src/model/api_response.dart';
import 'package:phonebook/src/model/contact.dart';
import 'package:http/http.dart' as http;

class ApplicationState extends ChangeNotifier {
  List<Contact> contacts = [];
  bool isLoading = true;
  final header = {
    'accept': 'application/json',
    'x-endpoint-key': '38444aae02c84851969f93e5d0e6eb37'
  };

  ApplicationState() {
    // contacts = fetchContacts();
    _getContacts();
  }

  _getContacts() async {
    await http
        .get(Uri.parse('https://api.restpoint.io/api/contacts'),
            headers: header)
        .then((value) {
      if (value.statusCode == 200) {
        contacts = ResponseApi.fromJson(jsonDecode(value.body)).contacts;
        // return allContact;
      }
    });

    isLoading = false;
    notifyListeners();
  }

  addConatct(Contact contact) {
    contacts.add(contact);
    _postContact(contact);
    notifyListeners();
  }

  _postContact(Contact contact) async {
    await http.post(Uri.parse('https://api.restpoint.io/api/contacts'),
        headers: header, body: jsonEncode(contact.toJson()));
  }

  getContact(String id) {
    final index = contacts.indexWhere((element) => element.id == id);
    if (index == -1) {
      return Contact(
          firstName: '',
          lastName: '',
          email: '',
          notes: '',
          phone: '',
          picture: ['']);
    }
    return contacts[index];
  }

  removeContact(Contact contact) {
    contacts.remove(contact);
    _deleteContact(contact);
    notifyListeners();
  }

  _deleteContact(Contact contact) async {
    await http
        .delete(
          Uri.parse('https://api.restpoint.io/api/contacts/${contact.id}'),
          headers: header,
        )
        .then((value) => print(value.body));
  }

  updateContact(Contact contact) {
    var index = contacts.indexWhere(
      (element) => element.id == contact.id,
    );
    contacts[index] = contact;
    _putContact(contact);
    notifyListeners();
  }

  _putContact(Contact contact) async {
    await http.put(
        Uri.parse('https://api.restpoint.io/api/contacts/${contact.id}'),
        headers: header,
        body: jsonEncode(contact.toJson()));
  }
}
