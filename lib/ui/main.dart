import 'package:flutter/material.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:trop_dart/app/app_services.dart';
import 'package:trop_dart/data/beer/beer_interface.dart';
import 'package:trop_dart/data/beer/mobile/beer_mobile.dart';
import 'package:trop_dart/data/shared_preferences/shared_preferences.dart';
import 'package:trop_dart/data/shared_preferences/shared_preferences_interface.dart';
import 'package:trop_dart/data/storage/hive/storage_hive.dart';
import 'package:trop_dart/data/storage/storage.dart';
import 'package:trop_dart/ui/resources/app_colors.dart';
import 'package:trop_dart/ui/screens/routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await _initServices(_AppServices());
  runApp(MyApp());
}

Future<void> _initServices(ApplicationServicesProvider services) {
  return ApplicationServices.register(services);
}

class _AppServices implements ApplicationServicesProvider {
  const _AppServices();

  @override
  SharedPreferencesService get sharedPreferences => SharedPreferencesImpl();

  @override
  Storage get storage => StorageWithHive();

  @override
  BeerService get beer => BeerMobileImpl();
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return OverlaySupport(
      child: MaterialApp(
        theme: ThemeData(
          primaryColor: AppColors.primary,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        onGenerateRoute: AppRoutes.getRoutes,
      ),
    );
  }
}
