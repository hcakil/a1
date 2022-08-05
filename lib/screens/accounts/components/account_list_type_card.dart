
import 'package:admin/config/config.dart';
import 'package:admin/models/account_model.dart';
import 'package:admin/screens/account_detail/account_detail_page.dart';
import 'package:admin/utils/next_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';



class AccountListTypeCard extends StatelessWidget {
  final Account d;
  //final String heroTag;
  const AccountListTypeCard({  required this.d, }) ;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        child: Container(
          height: MediaQuery.of(context).size.height/7.0,// 103,

            //padding: EdgeInsets.all(15),
            decoration: BoxDecoration(
                color: Theme.of(context).primaryColorLight,
                borderRadius: BorderRadius.circular(5),
                border: Border.all( color :Colors.grey),
                boxShadow: <BoxShadow>[
                  BoxShadow(
                      color: Theme.of(context).shadowColor,
                      blurRadius: 10,
                      offset: Offset(0, 3))
                ]),
            child: Column(
              children: <Widget>[
                Row(
                 // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Flexible(
                      flex: 3,
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Container(
                            height: MediaQuery.of(context).size.height/7.4,
                            width: MediaQuery.of(context).size.height/7.4,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child:  Image.asset("assets/images/no_image.png",)
                         //   Container(),
                          ),
                          // VideoIcon(contentType: d.contentType, iconSize: 40,)
                        ],
                      ),
                    ),
                    SizedBox(width: 20,),
                    Flexible(
                      flex: 5,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(top:8.0),
                            child: Text(
                            d.name.length != 0 ? d.name :
                            "Title",
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500),
                              maxLines: 4,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          SizedBox(
                            height: 6,
                          ),
                          Container(
                            padding: EdgeInsets.only( right: 10, top: 3, bottom: 3),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                               // color: Colors.blueGrey[600]
                            ),
                            child:d.description.isNotEmpty ?
                            Text(
                            d.description
                              ,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 3,
                              style: TextStyle(fontSize: 14,fontWeight: FontWeight.w500, color: Colors.grey),
                            ) : Text("Description"),
                          ),
                        ],
                      ),
                    ),

                  ],
                ),


              ],
            )),
        onTap: () =>nextScreeniOS(context, AccountDetail(data: d,)),
        //navigateToDetailsScreen(context, d, heroTag),
      ),
    );
  }
}
