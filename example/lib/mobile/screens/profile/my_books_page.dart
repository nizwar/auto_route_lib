import 'package:auto_route/auto_route.dart';
import 'package:example/mobile/router/router.dart';
import 'package:flutter/material.dart';

class MyBooksPage extends StatelessWidget {
  final String filter;

  const MyBooksPage({Key key, @queryParam this.filter = 'none'}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'My Books -> filter: $filter',
              style: Theme.of(context).textTheme.headline6,
            ),
            const SizedBox(height: 16),
            Text(
              'Fragment Support? ${context.route.fragment}',
              style: Theme.of(context).textTheme.bodyText1,
            ),
            const SizedBox(height: 32),
            RaisedButton(
                child: Text('Show alert'),
                onPressed: () {
                  showDialog(
                      context: context,
                      useRootNavigator: false,
                      child: AlertDialog(
                        title: Text('Dialog'),
                        actions: [
                          RaisedButton(
                              child: Text('Go Back'),
                              onPressed: () {
                                context.router.pop();
                                // context.router.pop();
                              })
                        ],
                      ));
                  // context.router.pop();
                }),
            RaisedButton(
                child: Text('Go Back'),
                onPressed: () {
                  // context.router.popUntil(ModalRoute.withName(ProfileRoute.name));
                  context.router.popUntil((route) {
                    print(route);
                    return true;
                  });
                  // context.router.pop();
                })
          ],
        ),
      ),
    );
  }
}
