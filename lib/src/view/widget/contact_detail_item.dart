import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class ContactDetailItem extends StatelessWidget {
  final IconData icon;
  final String text;
  const ContactDetailItem({required this.icon, required this.text, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 30),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          children: [
            Icon(
              icon,
              size: 30,
            ),
            const SizedBox(
              width: 10,
            ),
            Text(
              text,
              style: TextStyle(fontSize: 20),
            )
          ],
        ),
      ),
    );
  }
}
