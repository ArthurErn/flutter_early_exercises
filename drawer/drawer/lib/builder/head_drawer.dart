import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HeadDrawer extends StatelessWidget {
  final name = 'Arthur Ern';
  final email = 'arthurern48@gmail.com';
  final urlImage =
      'https://media-exp1.licdn.com/dms/image/C4D03AQE6iG5LC6sC6w/profile-displayphoto-shrink_800_800/0/1610557629993?e=1626307200&v=beta&t=8yywNihiXjdv1t13cAxd2uRGc--8tmhWRteR-pJrvsc';

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.only(top: 30),
        child: Row(
          children: [
            CircleAvatar(radius: 40, backgroundImage: NetworkImage(urlImage)),
            SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(name, style: TextStyle(fontSize: 20, color: Colors.white)),
                SizedBox(height: 4),
                Text(email, style: TextStyle(fontSize: 12, color: Colors.white))
              ],
            ),
            Spacer(),
            CircleAvatar(
              radius: 24,
              backgroundColor: Colors.deepPurple[700],
              child: Icon(Icons.add_comment_outlined)
            )
          ],
        ));
  }
}
