import 'package:flutter/cupertino.dart';

class Commedy extends StatefulWidget {
  const Commedy({Key? key}) : super(key: key);

  @override
  State<Commedy> createState() => _CommedyState();
}

class _CommedyState extends State<Commedy> {
  @override
  Widget build(BuildContext context) {
    return  Center(
      child:Text("Commedy"),
    );
  }
}
