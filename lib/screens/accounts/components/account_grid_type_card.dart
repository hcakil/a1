
import 'package:admin/config/config.dart';
import 'package:admin/models/account_model.dart';
import 'package:admin/screens/account_detail/account_detail_page.dart';
import 'package:admin/utils/next_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';



class AccountGridTypeCard extends StatelessWidget {
  final Account d;
  //final String heroTag;
  const AccountGridTypeCard({  required this.d, }) ;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                boxShadow: <BoxShadow>[
                  BoxShadow(
                      blurRadius: 10,
                      offset: Offset(0,3),
                      color: Theme.of(context).shadowColor
                  )
                ]

            ),
            child: Stack(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  child: Image.asset("assets/images/no_image.png",)//CustomCacheImageWithDarkFilterBottom(imageUrl: d.thumbnailUrl, radius: 5.0),
                ),

                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    margin: EdgeInsets.only(left: 15, bottom: 15, right: 10),
                    child: Text(d.name, style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                        letterSpacing: -0.6
                    ),),
                  ),
                )


              ],
            )
        ),

          onTap: () =>nextScreeniOS(context, AccountDetail(data: d,)),


      ),
    );
  }
}
