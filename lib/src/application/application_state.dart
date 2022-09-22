import 'package:flutter/material.dart';
import 'package:phonebook/src/model/api_response.dart';
import 'package:phonebook/src/model/contact.dart';

class ApplicationState extends ChangeNotifier {
  late List<Contact> contacts;
  bool isLogin = false;
  bool isLoading = false;

  ApplicationState() {
    contacts = fetchContacts();
  }

  List<Contact> fetchContacts() {
    return ResponseApi.fromJson(fakeApi).contacts;
    //Todo: get from backend
  }

  addConatct(Contact contact) {
    contacts.add(contact);
    //Todo: Add to backend
    notifyListeners();
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
    //Todo: Remove from backend
    notifyListeners();
  }

  updateContact(Contact contact) {
    var index = contacts.indexWhere(
      (element) => element.id == contact.id,
    );
    contacts[index] = contact;
    //Todo: Update to backend
    notifyListeners();
  }
}
