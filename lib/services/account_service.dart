import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:admin/config/config.dart';

class AccountService {

  Future<http.Response> tokenRefresh() async {
    print(" tokenRefresh worked");
    Map<String,String> header = {
      HttpHeaders.accessControlAllowHeadersHeader : "Origin,Content-Type,X-Amz-Date,Authorization,X-Api-Key,X-Amz-Security-Token,locale",
      HttpHeaders.accessControlAllowOriginHeader : "Origin, X-Requested-With, Content-Type, Accept",
      HttpHeaders.accessControlAllowCredentialsHeader : "true",
      HttpHeaders.accessControlAllowMethodsHeader : "POST, OPTIONS",
      HttpHeaders.accessControlMaxAgeHeader : "86400",


    };
    var response = await http.post(Uri.parse(Config().tokenGetUrl),headers: header,
        body: Config().tokenBody);
    print(response.statusCode.toString());
    print(response.body.toString());
    return response;
  }

  Future<http.Response> getAccountsList(String _token) async {
    print(" getAccountsList worked");

    var response = await http.get(Uri.parse(Config().accountUrl), headers: {
      HttpHeaders.authorizationHeader: "Bearer " + _token,
      HttpHeaders.contentTypeHeader: "application/json",
    });

    var jsonResponse = json.decode(response.body)["value"];
   // print("response" + jsonResponse.toString());
    print("success");
    return response;
  }
}
