import 'package:flutter/cupertino.dart';
import 'package:trop_dart/ui/screens/list_beers/components/list_beers_body.dart';

class ListBeersScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: ListBeersBody(),
      ),
    );
  }
}
