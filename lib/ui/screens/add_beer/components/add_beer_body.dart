import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:trop_dart/ui/resources/app_colors.dart';
import 'package:trop_dart/ui/screens/add_beer/components/add_beer_bottom_button.dart';
import 'package:trop_dart/ui/screens/shared/bloc/app_bloc.dart';
import 'package:trop_dart/ui/screens/shared/components/textfield.dart';

String concatLatitudeLongitude(double latitude, double longitude) {
  if (latitude != null && longitude != null) {
    return '$latitude - $longitude';
  } else {
    return 'My position';
  }
}

class AddBeerBody extends StatefulWidget {
  @override
  _AddBeerBodyState createState() => _AddBeerBodyState();
}

class _AddBeerBodyState extends State<AddBeerBody> {
  TextEditingController controller;
  Position position;

  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permantly denied, we cannot request permissions.');
    }

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission != LocationPermission.whileInUse &&
          permission != LocationPermission.always) {
        return Future.error(
            'Location permissions are denied (actual value: $permission).');
      }
    }

    return await Geolocator.getCurrentPosition();
  }

  @override
  void initState() {
    super.initState();
    controller = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
          child: Column(
            children: <Widget>[
              CustomTextfield(
                controller: controller,
                hintText: 'Beer Name',
                inputType: TextInputType.name,
              ),
              _BeerLocationItem(
                value: concatLatitudeLongitude(
                    position?.latitude, position?.longitude),
                editIcon: Icons.map,
                onPressed: () async {
                  position = await _determinePosition();
                  setState(() {});
                },
              ),
            ],
          ),
        ),
        AddBeerBottomButton(
          onPressed: () async {
            if (controller.text.length > 0) {
              BlocProvider.of<AppBloc>(context)
                  .addBeer(controller.text, position);
            } else {
              showSimpleNotification(
                Text('Beer should have a name'),
                background: AppColors.errorColor,
                duration: Duration(milliseconds: 1500),
              );
            }
          },
        ),
      ],
    );
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }
}

class _BeerLocationItem extends StatelessWidget {
  _BeerLocationItem(
      {@required this.value, @required this.onPressed, this.editIcon});
  final String value;
  final IconData editIcon;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: AppColors.itemListBorder),
        ),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 25.0),
      child: Row(
        children: <Widget>[
          Expanded(
              child: Align(
            alignment: Alignment.center,
            child: Text(
              value,
              style: TextStyle(
                  color: AppColors.textColorGrey,
                  fontWeight: FontWeight.bold,
                  fontSize: 25.0),
            ),
          )),
          Visibility(
            visible: editIcon != null,
            child: InkWell(
              onTap: onPressed,
              child: SizedBox(
                height: 30.0,
                width: 30.0,
                child: Icon(editIcon, color: AppColors.textColorGrey),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
