import 'package:admin/blocs/account_bloc.dart';
import 'package:admin/blocs/theme_bloc.dart';

import 'package:admin/models/theme_model.dart';
import 'package:admin/screens/accounts/accounts_page.dart';
import 'package:admin/services/account_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ThemeBloc>(
      create: (_) => ThemeBloc(),
      child: Consumer<ThemeBloc>(
        builder: (_, mode, child) {
          //Possible Future Additionals Choosed MultiProvider
          return MultiProvider(
            providers: [
              ChangeNotifierProvider<AccountBloc>(
                create: (context) => AccountBloc(AccountService()),
              ),
            ],
            child: MaterialApp(
                theme: ThemeModel().lightMode,
                darkTheme: ThemeModel().darkMode,
                themeMode:
                    mode.darkTheme == true ? ThemeMode.dark : ThemeMode.light,
                debugShowCheckedModeBanner: false,
                home: AccountsScreen() //LoginPage()
                ),
          );
        },
      ),
    );
  }
}
