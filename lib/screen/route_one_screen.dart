import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:navigation/layout/main_layout.dart';
import 'package:navigation/screen/route_two_screen.dart';

class RouteOneScreen extends StatelessWidget {
  final int? number;
  const RouteOneScreen({Key? key, this.number}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MainLayout(title: 'Route One Screen', children: [
      Text(
        'arguments : ${number.toString()}',
        textAlign: TextAlign.center,
      ),
      ElevatedButton(
        onPressed: () {
          // 불린값을 리턴해준다
          print(Navigator.of(context).canPop());
        },
        child: Text('Can Pop'),
      ),
      ElevatedButton(
        onPressed: () {
          // 더이상 뒤로가기가 없를 때 뒤로가지 않는다
          Navigator.of(context).maybePop();
        },
        child: Text('Maybe Pop'),
      ),
      ElevatedButton(
        onPressed: () {
          Navigator.of(context).pop(456);
        },
        child: Text('Pop'),
      ),
      ElevatedButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
                builder: (BuildContext context) => RouteTwoScreen(),
              settings: RouteSettings(
                arguments: 789
              )
            ),
          );
        },
        child: Text('Push'),
      )
    ]);
  }
}
