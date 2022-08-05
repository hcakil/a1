import 'dart:developer';

import 'package:admin/blocs/account_bloc.dart';
import 'package:admin/screens/accounts/components/account_grid_type_card.dart';
import 'package:admin/screens/accounts/components/account_list_type_card.dart';
import 'package:admin/screens/accounts/components/custom_search_bar.dart';
import 'package:admin/screens/accounts/components/filter_widget.dart';
import 'package:admin/screens/accounts/components/type_change.dart';
import 'package:admin/utils/snackbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../constants.dart';

class AccountsScreen extends StatefulWidget {
  @override
  State<AccountsScreen> createState() => _AccountsScreenState();
}

class _AccountsScreenState extends State<AccountsScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  late ScrollController controller;

  @override
  void initState() {
    super.initState();
    fillValues();
  }

  Future<void> fillValues() async {
    final AccountBloc qb = Provider.of<AccountBloc>(context, listen: false);
    qb.tokenRefresh().then((value) {
      if (qb.hasError) {
        log("error");
        log(qb.errorCode!);
        setState(() {
          openSnackbar(_scaffoldKey, qb.errorCode);
        });
      } else {
        qb.getAccountsList().then((value) {
          log("getAccountsList from accounts page");
          if (qb.hasError) {
            log("error");
            log(qb.errorCode!);
            setState(() {
              openSnackbar(_scaffoldKey, "Data can not get sucessfully");
            });
          } else {
            qb.accountSearchList.forEach((element) {
              print(element.name);
            });
            log("finished");
          }
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final AccountBloc qb = Provider.of<AccountBloc>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: Text(
       kIsWeb ?    "Web Tech Assessment" : "Mobile Tech Assessment",
          style: TextStyle(color: Theme.of(context).scaffoldBackgroundColor),
        ),
        backgroundColor: Theme.of(context).primaryColorDark,
      ),
      key: _scaffoldKey,
      body: context.watch<AccountBloc>().isReady == true
          ? SafeArea(
              child: SingleChildScrollView(
                primary: false,
                padding: EdgeInsets.all(defaultPadding),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: defaultPadding),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          flex: 5,
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  CustomSearchBar(),
                                  FilterWidget(),
                                  TypeChangeWidget(),
                                ],
                              ),
                              context.watch<AccountBloc>().isList == true
                                  ? listWidget(context, qb)
                                  : gridWidget(context, qb),
                            ],
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            )
          : Center(
              child: CupertinoActivityIndicator(),
            ),
    );
  }

  Padding gridWidget(BuildContext context, AccountBloc qb) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: MediaQuery.of(context).size.height * .9,
        child: GridView.builder(
          padding: EdgeInsets.only(left: 10, right: 10, top: 15, bottom: 15),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 8,
              crossAxisSpacing: 8,
              childAspectRatio: 1.1),
          itemCount: qb.accountSearchList.length != 0
              ? qb.accountSearchList.length + 1
              : 10,
          itemBuilder: (_, int index) {
            if (index < qb.accountSearchList.length) {
              return AccountGridTypeCard(d: qb.accountSearchList[index]);
            }
            return Opacity(
              opacity: !context.watch<AccountBloc>().isReady ? 1.0 : 0.0,
              child: Center(
                child: SizedBox(
                    width: 32.0,
                    height: 32.0,
                    child: new CupertinoActivityIndicator()),
              ),
            );
          },
        ),
      ),
    );
  }

  Padding listWidget(BuildContext context, AccountBloc qb) {
    return Padding(
      padding: const EdgeInsets.all(1.0),
      child: Container(
        height: MediaQuery.of(context).size.height * .9,
        color: Colors.white,
        child: ListView.separated(
          padding: EdgeInsets.fromLTRB(5, 15, 5, 15),
          //  controller: controller,
          scrollDirection: Axis.vertical,
          physics: AlwaysScrollableScrollPhysics(),
          itemCount: qb.accountSearchList.length != 0
              ? qb.accountSearchList.length + 1
              : 5,
          separatorBuilder: (BuildContext context, int index) => SizedBox(
            width: 15,
          ),
          shrinkWrap: true,
          itemBuilder: (_, int index) {
            if (index < qb.accountSearchList.length) {
              return AccountListTypeCard(
                d: qb.accountSearchList[index],
              );
            }
            return Opacity(
              opacity: !context.watch<AccountBloc>().isReady ? 1.0 : 0.0,
              child: Center(
                child: SizedBox(
                    width: 32.0,
                    height: 32.0,
                    child: new CupertinoActivityIndicator()),
              ),
            );
          },
        ),
      ),
    );
  }
}
