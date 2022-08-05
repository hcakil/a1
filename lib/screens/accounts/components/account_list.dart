
import 'package:admin/blocs/account_bloc.dart';
import 'package:admin/models/account_model.dart';
import 'package:admin/screens/accounts/components/account_list_type_card.dart';
import 'package:admin/utils/app_widgets.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:provider/provider.dart';
class AccountListWidget extends StatelessWidget {
  final List<Account> list;
  const AccountListWidget({Key? key,required this.list}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final AccountBloc qb = Provider.of<AccountBloc>(context, listen: false);
    return qb.accountList.length>0 ?

    ListView.builder(itemBuilder:  (_, index) {
      Account data = list[index];

      return AccountListTypeCard(d: data);
    },
      shrinkWrap: true,
      physics: AlwaysScrollableScrollPhysics(),
      itemCount: localeLanguageList.length,
    ) :  Text("No Record Found");
  }
}
