import 'package:flutter/material.dart';

class Social {
  int? id;
  String? text;
  Social({this.id, this.text});
}

Widget getSocial(Social social) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Text('${social.text}'),
  );
}
