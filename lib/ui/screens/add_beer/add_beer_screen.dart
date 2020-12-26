import 'package:flutter/cupertino.dart';
import 'package:trop_dart/ui/screens/add_beer/components/add_beer_body.dart';

class AddBeerScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding:
            const EdgeInsetsDirectional.only(top: 20.0, start: 20.0, end: 20.0),
        child: AddBeerBody(),
      ),
    );
  }
}
