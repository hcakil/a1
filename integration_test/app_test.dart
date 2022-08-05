import 'dart:convert';
import 'dart:io';

import 'package:admin/blocs/account_bloc.dart';
import 'package:admin/blocs/theme_bloc.dart';
import 'package:admin/models/account_model.dart';
import 'package:admin/screens/account_detail/account_detail_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:admin/models/theme_model.dart';
import 'package:admin/screens/accounts/accounts_page.dart';
import 'package:admin/services/account_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:provider/provider.dart';

import '../test/constants/config.dart';

class MockAccountService extends Mock implements AccountService {}

void main() {
  late AccountBloc sut;
  late MockAccountService mockAccountService;

  setUp(() {
    mockAccountService = MockAccountService();
    sut = AccountBloc(mockAccountService);
  });

  http.Response response =
      http.Response(ConfigTest().responseBody, 200, headers: {
    HttpHeaders.contentTypeHeader: 'application/json; charset=utf-8',
  });
  http.Response responseToken =
      http.Response(ConfigTest().responseTokenBody, 200, headers: {
    HttpHeaders.contentTypeHeader: 'application/json; charset=utf-8',
  });

  List<Account> _accountList = [];

  void arrangeAccountServiceReturnTokenRefresh() {
    when(() => mockAccountService.tokenRefresh())
        .thenAnswer((_) async => responseToken);
  }

  void arrangeAccountServiceReturnTwoAccounts() {
    when(() => mockAccountService.getAccountsList(ConfigTest().token))
        .thenAnswer((_) async {
      var jsonResponse = json.decode(response.body)["value"];
      jsonResponse.forEach((v) {
        _accountList.add(new Account.fromJson(v));
      });

      return response;
    });
  }

  Widget createWidgetUnderTest() {
    return ChangeNotifierProvider<ThemeBloc>(
      create: (_) => ThemeBloc(),
      child: Consumer<ThemeBloc>(
        builder: (_, mode, child) {
          return MultiProvider(
            providers: [
              ChangeNotifierProvider<AccountBloc>(
                create: (context) => AccountBloc(mockAccountService),
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

  testWidgets("""Tapping  on the first account opens details page""",
      (WidgetTester tester) async {
    arrangeAccountServiceReturnTokenRefresh();
    arrangeAccountServiceReturnTwoAccounts();

    await tester.pumpWidget(createWidgetUnderTest());

    await tester.pump();

    await tester.tap(find.text("Fabrikam, Inc."));

    await tester.pump(Duration(seconds: 2));

    expect(find.byType(AccountsScreen), findsNothing);
    expect(find.byType(AccountDetail), findsOneWidget);

    expect(find.text("FBKMZ"), findsOneWidget);
   // expect(find.text("Tennessee"), findsOneWidget);
  });
}
