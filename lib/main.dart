import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final appTitle = 'Drawer Demo';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: appTitle,
      theme: new ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or press Run > Flutter Hot Reload in IntelliJ). Notice that the
        // counter didn't reset back to zero; the application is not restarted.
        primarySwatch: Colors.brown,
      ),
      home: MyHomePage(title: appTitle),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final String title;

  MyHomePage({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("profyl.org",
              style: TextStyle(color: Colors.white),
              textDirection: TextDirection.ltr),
//        backgroundColor: Colors.brown,
        ),
        body: HomeListPage(),
        drawer: DrawerPage());
  }
}

void showSnackBar(BuildContext context, String string) {
  final snackBar = SnackBar(
    content: Text('Clicked at row: ' + string.toUpperCase()),
    action: SnackBarAction(
      label: 'Undo',
      onPressed: () {
        // Some code to undo the change!
      },
    ),
  );
  Scaffold.of(context).showSnackBar(snackBar);
}

class HomeListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ListView(
      children: <Widget>[
        ListTile(
          leading: Icon(Icons.account_circle),
          title: Text('Profile'),
          onTap: () {
            showSnackBar(context, 'Profile');
          },
        ),
        ListTile(
          leading: Icon(Icons.book),
          title: Text('Navigate screen'),
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (_) {
              return MainScreen();
            }));
          },
        ),
        ListTile(
          leading: Icon(Icons.title),
          title: Text('Replace Screen'),
          onTap: (){

          },
        ),
      ],
    );
  }
}

class DrawerPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Drawer(
      // Add a ListView to the drawer. This ensures the user can scroll
      // through the options in the Drawer if there isn't enough vertical
      // space to fit everything.
      child: ListView(
        // Important: Remove any padding from the ListView.
        padding: EdgeInsets.zero,
        children: <Widget>[
          UserAccountsDrawerHeader(
            accountName: Text("Bpn Pande"),
            accountEmail: Text("jazzbpn@gmail.com"),
            currentAccountPicture: CircleAvatar(
              backgroundColor: Theme.of(context).platform == TargetPlatform.iOS
                  ? Colors.brown
                  : Colors.white,
              child: Text(
                "B",
                style: TextStyle(fontSize: 40.0),
              ),
            ),
          ),
          ListTile(
            title: Text('Navigate Screen'),
            onTap: () {},
          ),
          ListTile(
            subtitle: Text("Some subtitle"),
            title: Text('Overlap Screen'),
            onTap: () {
              // Update the state of the app
              // ...
              // Then close the drawer
              Navigator.pop(context);
//                Navigator.of(context).pop();
//                Navigator.of(context).push(MaterialPageRoute(
//                    builder: (BuildContext context) => NewPage("Page two")));
            },
          ),
        ],
      ),
    );
  }
}

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Main Screen'),
      ),
      body: GestureDetector(
        child: Hero(
          tag: 'imageHero',
          child: Image.network(
            'https://picsum.photos/250?image=9',
          ),
        ),
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (_) {
            return DetailScreen();
          }));
        },
      ),
    );
  }
}

class DetailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        child: Center(
          child: Hero(
            tag: 'imageHero',
            child: Image.network(
              'https://picsum.photos/250?image=9',
            ),
          ),
        ),
        onTap: () {
          Navigator.pop(context);
        },
      ),
    );
  }
}


