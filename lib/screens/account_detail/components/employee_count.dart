import 'package:admin/models/account_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';




class ViewsCount extends StatefulWidget {

  final Account article;
  const ViewsCount({
    Key? key, required this.article,
  }) : super(key: key);

  @override
  _ViewsCountState createState() => _ViewsCountState();
}

class _ViewsCountState extends State<ViewsCount> {

  @override
  void initState() {

    super.initState();
  }




  @override
  Widget build(BuildContext context) {
    final String collectionName = 'contents';

    
    return Container(
      child: Row(
        children: [
          Icon(Feather.users, color: Colors.grey, size: 20,),
          SizedBox(width: 3,),
          Text(
          widget.article.numberofemployees.toString(),
            style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w600,
                color: Colors.grey),
          ),

          SizedBox(width: 3,),

          Text('Employees',
            maxLines: 1,
            style: TextStyle(
              fontSize: 14, fontWeight: FontWeight.w500, color: Colors.grey),
          )
        ],
      ),
    );
  }
}