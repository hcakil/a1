import 'package:admin/blocs/account_bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class CustomSearchBar extends StatelessWidget {
  const CustomSearchBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return      Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: kIsWeb ? MediaQuery.of(context).size.width * 0.4 :  MediaQuery.of(context).size.width * 0.35,
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColorLight,
          border: Border.all(color: Colors.grey[400]!, width: 0.5),
          borderRadius: BorderRadius.circular(40),
        ),
        child: Padding(
          padding: EdgeInsets.only(left: 10),
          child: TextFormField(
            autofocus: true,
            //controller: context.watch<SearchBloc>().textfieldCtrl,
            style: TextStyle(
                fontSize: 16, fontWeight: FontWeight.w500),
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: "Search Accounts",
              hintStyle: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Theme.of(context).secondaryHeaderColor),
              prefixIcon: IconButton(
                icon: Icon(
                  Icons.search,
                  size: 25,
                  color: Theme.of(context).iconTheme.color,
                ),
                onPressed: () {
                //  context.read<SearchBloc>().saerchInitialize();
                },
              ),
            ),
            textInputAction: TextInputAction.search,
           onChanged: (value1){
              print(value1);
              final AccountBloc qb = Provider.of<AccountBloc>(context, listen: false);
           qb.isNotReady().then((_) {
             qb.getSearchedAccountsList(value1).then((value) {
                 print("searched" + value1);
             });
           });
           },
           /* onFieldSubmitted: (value) {
              if (value == '') {
              //  openSnacbar(scaffoldKey, 'Type something!');
              } else {
              //  context.read<SearchBloc>().setSearchText(value);
              //  context.read<SearchBloc>().addToSearchList(value);
              }
            },*/
          ),
        ),
      ),
    );
  }
}
