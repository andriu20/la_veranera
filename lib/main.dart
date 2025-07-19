import 'package:flutter/material.dart';
import 'package:la_veranera/get_it.dart';
import 'package:la_veranera/src/core/util/secure_storage_util.dart';
import 'package:la_veranera/src/presentation/pages/login_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  initDependencies();
  SecureStorageUtil();

  return runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'Material App', home: LoginPage(),
    theme: ThemeData(
      scaffoldBackgroundColor: Colors.white,
      
    ),
    );
  }
}
