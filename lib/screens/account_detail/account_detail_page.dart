


import 'package:admin/blocs/theme_bloc.dart';
import 'package:admin/models/account_model.dart';
import 'package:admin/models/custom_color.dart';
import 'package:admin/screens/account_detail/components/employee_count.dart';
import 'package:admin/screens/account_detail/components/web_url.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'dart:io';


class AccountDetail extends StatefulWidget {
  final Account? data;



  const AccountDetail({Key? key, required this.data})
      : super(key: key);

  @override
  _AccountDetailState createState() => _AccountDetailState();
}

class _AccountDetailState extends State<AccountDetail> {


  double rightPaddingValue = 140;



  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(milliseconds: 100)).then((value) {
      setState(() {
        rightPaddingValue = 10;
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {

    final Account account = widget.data!;

    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: SafeArea(
          bottom: true,
          top: false,
          maintainBottomViewPadding: true,
          child: Column(
            children: [
              Expanded(
                child: CustomScrollView(
                  slivers: <Widget>[
                    _customAppBar( context),
                    SliverToBoxAdapter(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.all(20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Row(
                                  children: <Widget>[
                                    Container(
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(5),
                                          color: context.watch<ThemeBloc>().darkTheme == false
                                              ? CustomColor().loadingColorLight
                                              : CustomColor().loadingColorDark,
                                        ),
                                        child: AnimatedPadding(
                                          duration: Duration(milliseconds: 1000),
                                          padding: EdgeInsets.only(
                                              left: 10,
                                              right: rightPaddingValue,
                                              top: 5,
                                              bottom: 5),
                                          child: Text(
                                            account.tickersymbol,
                                            style: TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.w600),
                                          ),
                                        )),
                                    Spacer(),

                                   Container(),
                                  ],
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  children: <Widget>[
                                    Icon(CupertinoIcons.time_solid,
                                        size: 18, color: Colors.grey),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                        DateFormat.yMMMMEEEEd().format(account.openrevenueDate)
                                      ,//account.openrevenueDate.toIso8601String(),
                                      style: TextStyle(
                                          color: Theme.of(context).secondaryHeaderColor,
                                          fontSize: 12),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  account.name,
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      letterSpacing: -0.6,
                                      wordSpacing: 1
                                  ),
                                ),
                                Divider(
                                  color: Theme.of(context).primaryColor,
                                  endIndent: 200,
                                  thickness: 2,
                                  height: 20,
                                ),


                                SizedBox(height: 10,),

                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: <Widget>[

                                    //views feature
                                    ViewsCount(article: account,),
                                    SizedBox(width: 20,),

                                    WebUrl(webUrl: account.websiteurl),


                                  ],
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Text(account.description),
                                //HtmlBodyWidget(htmlData: account.description!,),
                                SizedBox(
                                  height: 20,
                                ),
                              ],
                            ),
                          ),

                        ],
                      ),
                    ),
                  ],
                ),
              ),



            ],
          ),
        ));
  }



  SliverAppBar _customAppBar( BuildContext context) {
    return SliverAppBar(
      expandedHeight: 270,
      flexibleSpace: FlexibleSpaceBar(
          background: Image.asset("assets/images/company_image.png",fit: BoxFit.cover,)

              ),
      leading: IconButton(
        icon:  Icon(Icons.keyboard_backspace, size: 22, color: Theme.of(context).secondaryHeaderColor),
        onPressed: () {
          Navigator.pop(context);
        },
      ),

    );
  }
}
