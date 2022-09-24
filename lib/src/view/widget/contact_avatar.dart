import 'package:flutter/material.dart';

class ContactAvatar extends StatelessWidget {
  final List<String>? url;
  const ContactAvatar({required this.url, super.key});

  @override
  Widget build(BuildContext context) {
    final hasPisture = (url!.isNotEmpty && url![0].contains('http'));
    return CircleAvatar(
        radius: 30,
        backgroundColor: Colors.transparent,
        backgroundImage:
            // const AssetImage('assets/img/noProfile.png') as ImageProvider);
            hasPisture
                ? NetworkImage(url![0])
                : const AssetImage('assets/img/noProfile.png')
                    as ImageProvider);
  }
}
