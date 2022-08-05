// To parse this JSON data, do
//
//     final account = accountFromJson(jsonString);

import 'dart:convert';

import 'package:admin/utils/model_keys.dart';

Account accountFromJson(String str) => Account.fromJson(json.decode(str));

String accountToJson(Account data) => json.encode(data.toJson());

class Account {
  Account({
    required this.statecode,
    required this.tickersymbol,
    required this.name,
    required this.websiteurl,
    required this.address1Composite,
    required this.numberofemployees,
    required this.description,
    required this.openrevenueDate,
    required this.address1Stateorprovince,
    required this.accountnumber,
  });

  int statecode;
  String tickersymbol;
  String name;
  String websiteurl;
  String address1Composite;
  int numberofemployees;
  String description;
  DateTime openrevenueDate;
  String address1Stateorprovince;
  String accountnumber;

  factory Account.fromJson(Map<String, dynamic> json) => Account(
        statecode: json[AccountKeys.statecode] ?? 0,
        tickersymbol: json[AccountKeys.tickersymbol] ?? "",
        name: json[AccountKeys.name],
        websiteurl: json[AccountKeys.websiteurl] ?? "",
        address1Composite: json[AccountKeys.address1_composite],
        numberofemployees: json[AccountKeys.numberofemployees] ?? 0,
        description: json[AccountKeys.description],
        openrevenueDate: DateTime.parse(
            json[AccountKeys.openrevenue_date] ?? DateTime.now()),
        address1Stateorprovince:
            json[AccountKeys.address1_stateorprovince] ?? "",
        accountnumber: json[AccountKeys.accountnumber] ?? "0",
      );

  Map<String, dynamic> toJson() => {
        AccountKeys.statecode: statecode,
        AccountKeys.tickersymbol: tickersymbol,
        AccountKeys.name: name,
        AccountKeys.websiteurl: websiteurl,
        AccountKeys.address1_composite: address1Composite,
        AccountKeys.numberofemployees: numberofemployees,
        AccountKeys.description: description,
        AccountKeys.openrevenue_date: openrevenueDate.toIso8601String(),
        AccountKeys.address1_stateorprovince: address1Stateorprovince,
        AccountKeys.accountnumber: accountnumber,
      };
}
