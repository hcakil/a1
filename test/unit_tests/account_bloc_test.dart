import 'dart:io';
import 'package:admin/blocs/account_bloc.dart';
import 'package:admin/services/account_service.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mocktail/mocktail.dart';

import '../constants/config.dart';

class MockAccountService extends Mock implements AccountService {}

void main() {
  late AccountBloc sut;
  late MockAccountService mockAccountService;

  setUp(() {
    mockAccountService = MockAccountService();
    sut = AccountBloc(mockAccountService);
  });

  test("initial values are correct", () {
    expect(sut.accountList, []);
    expect(sut.accountSearchList, []);
    expect(sut.stateFilterList, []);
    expect(sut.stateFilterElement, "");
    expect(sut.token, "");
    expect(sut.isReady, false);
    expect(sut.isList, true);
    expect(sut.hasError, false);
    expect(sut.errorCode, null);
  });

  group("getAccounts", () {
    http.Response response =
        http.Response(ConfigTest().responseBody, 200, headers: {
      HttpHeaders.contentTypeHeader: 'application/json; charset=utf-8',
    });

    void arrangeNewsServiceReturnTwoAccounts() {
      when(() => mockAccountService.getAccountsList(""))
          .thenAnswer((_) async => response);
    }

    test("getAccounts using AccountService", () async {
      when(() => mockAccountService.getAccountsList(""))
          .thenAnswer((_) async => response);

      await sut.getAccountsList();
      verify(() => mockAccountService.getAccountsList("")).called(1);
    });

    test("""indicates loading of data,
         sets accounts which comes from the service,
         indicates that data is not being loaded anymore""", () async {
      arrangeNewsServiceReturnTwoAccounts();

      final future = sut.getAccountsList();
      expect(sut.isReady, false);
      await future;
      expect(sut.accountList.length, 2);
      expect(sut.isReady, true);
    });
  });
}
