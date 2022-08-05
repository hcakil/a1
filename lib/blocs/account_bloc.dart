import 'dart:convert';
import 'package:admin/config/config.dart';
import 'package:admin/models/account_model.dart';
import 'package:admin/services/account_service.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:nb_utils/nb_utils.dart';
import 'package:package_info/package_info.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AccountBloc extends ChangeNotifier {
  final AccountService _accountService;

  AccountBloc(this._accountService);

  bool _hasError = false;

  bool get hasError => _hasError;

  String? _errorCode;

  String? get errorCode => _errorCode;

  String _appVersion = '0.0';

  String get appVersion => _appVersion;

  String _packageName = '';

  String get packageName => _packageName;

  List<Account> _accountList = [];

  List<Account> get accountList => _accountList;

  List<Account> _accountSearchList = [];

  List<Account> get accountSearchList => _accountSearchList;

  List<String> _stateFilterList = [];

  List<String> get stateFilterList => _stateFilterList;

  String _stateFilterElement = "";

  String get stateFilterElement => _stateFilterElement;

  String _token = "";

  String get token => _token;

  bool _isReady = false;

  bool get isReady => _isReady;

  bool _isList = true;

  bool get isList => _isList;

  void initPackageInfo() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    _appVersion = packageInfo.version;
    _packageName = packageInfo.packageName;
    notifyListeners();
  }

  tokenRefresh() async {
    log(" tokenRefresh worked");
    try {
     // var response = await _accountService.tokenRefresh();
        var response = await http.post(Uri.parse(Config().tokenGetUrl),
        body: Config().tokenBody);

      print(response.statusCode.toString());
      print(response.body.toString());
      if (response.statusCode >= 200 && response.statusCode < 400) {
        _token = json.decode(response.body)["access_token"];

        if (_token.isNotEmpty) {
          _hasError = false;
          notifyListeners();
        }
      } else {
        _hasError = true;
        _isReady = true;
        _errorCode = "Something went";

        notifyListeners();
      }
    } catch (e) {
      log("hata var $e");
      _hasError = true;
      _errorCode = "TOKEN can not get properly.1 Please Try again later.. $e";

      notifyListeners();
    }
  }

  Future<void> getAccountsList() async {
    log(" getAccountsList worked");
    try {
      var response = await _accountService.getAccountsList(_token);

      /* var response = await http.get(Uri.parse(Config().accountUrl), headers: {
        HttpHeaders.authorizationHeader: "Bearer " + _token,
        HttpHeaders.contentTypeHeader: "application/json",
      });*/
      if (response.statusCode <= 200 && response.statusCode < 400) {
        var jsonResponse = json.decode(response.body)["value"];
        if (kDebugMode) print("success");
        if (jsonResponse != null) {
          _accountList = [];
          _stateFilterList = ["All"];
          jsonResponse.forEach((v) {
            _accountList.add(new Account.fromJson(v));
          });
          _accountSearchList = _accountList;

            log(_accountList.length.toString());
            log("account length");


          //In here fill the filter list elements.
          _accountSearchList.forEach((account) {
            bool _isThereAlready = false;
            for (int i = 0; i < _stateFilterList.length; i++) {
              String filter =
                  account.accountnumber + "-" + account.address1Stateorprovince;
              if (_stateFilterList[i].contains(filter)) {
                _isThereAlready = true;
                break;
              }
            }
            if (!_isThereAlready) {
              _stateFilterList.add(account.accountnumber +
                  "-" +
                  account.address1Stateorprovince);
            }
          });
          if (_stateFilterList.isNotEmpty) {
            _stateFilterElement = _stateFilterList[0];
          }

          _hasError = false;
          _isReady = true;

          notifyListeners();
        }
      } else if (response.statusCode == 401) {
        tokenRefresh().then((value) async {
          if (_hasError) {
            _hasError = true;
            _isReady = true;
            _errorCode = "Token Refresh not worked. Please try again later";

            notifyListeners();
          } else {
            await getAccountsList();
          }
        });
      } else {
        _hasError = true;
        _isReady = true;
        _errorCode = "Something went wrong";

        notifyListeners();
      }
    } catch (e) {
      log("hata var $e");
      _hasError = true;
      _isReady = true;
      _errorCode =
          "Account List can not be filled properly. Please Try again later..";

      notifyListeners();
    }
  }

  Future isNotReady() async {
    _hasError = false;
    _isReady = false;
    notifyListeners();
  }

  Future changeListType(bool value) async {
    _isReady = false;

    _isList = value;

    _hasError = false;
    _isReady = true;
    notifyListeners();
  }

  Future getSearchedAccountsList(String searchText) async {
    log(" getSearchedAccountsList worked");
    log(searchText);

    _accountList.forEach((element) {
      print(element.name);
      print(element.accountnumber);
    });

    _accountSearchList = [];
    _accountList.forEach((element) {
      if ((element.name.toLowerCase().contains(searchText.toLowerCase())) ||
          (element.accountnumber
              .toLowerCase()
              .contains(searchText.toLowerCase()))) {
        _accountSearchList.add(element);
      }
    });

      log(_accountSearchList.length.toString());
      log("_accountList.length.toString()");


    _hasError = false;
    _isReady = true;

    notifyListeners();
  }

  Future filterAccountsBasedOnState(String stateCodeAndProvince) async {

    log(" filterAccountsBasedOnState worked");

    _stateFilterElement = stateCodeAndProvince;
    _accountSearchList = [];
    if (!stateCodeAndProvince.contains("All")) {
      _accountList.forEach((element) {
        String filterString =
            element.accountnumber + "-" + element.address1Stateorprovince;
        if (filterString
            .toLowerCase()
            .contains(stateCodeAndProvince.toLowerCase())) {
          _accountSearchList.add(element);
        }
      });
    } else {
      //Fill whole list
      _accountSearchList = _accountList;
    }
    _hasError = false;
    _isReady = true;

    notifyListeners();
  }

  Future clearAllData() async {
    final SharedPreferences sp = await SharedPreferences.getInstance();
    sp.clear();
  }
}
