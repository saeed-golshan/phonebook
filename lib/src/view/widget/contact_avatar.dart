import 'package:flutter/material.dart';

class ContactAvatar extends StatelessWidget {
  final String url;
  const ContactAvatar({required this.url, super.key});

  @override
  Widget build(BuildContext context) {
    final hasPisture = url.contains('http');
    return CircleAvatar(
        radius: 30,
        backgroundColor: Colors.transparent,
        backgroundImage:
            // const AssetImage('assets/img/noProfile.png') as ImageProvider);
            hasPisture
                ? NetworkImage(url)
                : const AssetImage('assets/img/noProfile.png')
                    as ImageProvider);
  }
}
