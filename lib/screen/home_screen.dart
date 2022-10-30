import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:navigation/layout/main_layout.dart';
import 'package:navigation/screen/route_one_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async{
      //  true : pop 가능
      //  false: pop 불가능

        final canPop = Navigator.of(context).canPop();

        return canPop;
      }
    ,child: MainLayout(title: 'Home Screen', children: [
        ElevatedButton(
          onPressed: () async {
            final result = await Navigator.of(context).push(
              MaterialPageRoute(
                builder: (BuildContext context) => RouteOneScreen(
                  number: 123,
                ),
              ),
            );
          },
          child: Text('push'),
        ),
        ElevatedButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text('Pop'),
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
            // boolean 값을 리턴해 준다.
            print(Navigator.of(context).canPop());
          },
          child: Text('Can Pop'),
        )
      ]),
    );
  }
}
