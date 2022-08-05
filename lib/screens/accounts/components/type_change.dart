import 'package:admin/blocs/account_bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class TypeChangeWidget extends StatelessWidget {
  const TypeChangeWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return
      Column(
        mainAxisSize: MainAxisSize.min,
        children: [

          Row(
            children: [
              InkWell(
                onTap: (){
                  final AccountBloc qb = Provider.of<AccountBloc>(context, listen: false);
                  print("isList True");
                  qb.changeListType(true);
                },
                child: Padding(
                  padding: EdgeInsets.only(right:  kIsWeb ?  15.0 : 5),
                  child: Icon(
                    Icons.list,
                    size: 25,
                    color: Theme.of(context).iconTheme.color,
                  ),
                ),
              ),
              InkWell(
                onTap: (){
                  final AccountBloc qb = Provider.of<AccountBloc>(context, listen: false);
                  print("isList False");
                  qb.changeListType(false);
                },
                child: Padding(
                  padding: const EdgeInsets.only(right: 15.0),
                  child: Icon(
                    Icons.apps,
                    size: 25,
                    color: Theme.of(context).iconTheme.color,
                  ),
                ),
              ),
            ],
          ),
        ],
      );
  }
}
