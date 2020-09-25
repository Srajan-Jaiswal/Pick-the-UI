import 'package:flutter/material.dart';
import 'package:flutter_template_login/home_list.dart';
import 'package:flutter_template_login/ui/ui_helper.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'LOGIN',
      theme: ThemeData(
        primaryColor: UIHelper.BLACK,
        primaryColorLight: UIHelper.BLACK,
        primaryColorDark: UIHelper.BLACK,
      ),
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Future<bool> getData() async {
    await Future.delayed(const Duration(milliseconds: 0));
    return true;
  }

  List<HomeList> homeList = HomeList.homeList;
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  bool multiple = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: UIHelper.BLACK,
      key: _scaffoldKey,
      drawer: new Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: const <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.black,
              ),
              child: Text(
                '\n    Welcome Srajan',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.account_circle),
              title: Text('SRAJAN JAISWAL',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 15,
                ),),
            ),
            ListTile(
              leading: Icon(Icons.add_circle),
              title: Text('Add UI',style: TextStyle(
                  color: Colors.black,
                  fontSize: 15,
                ),),
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Settings',style: TextStyle(
                  color: Colors.black,
                  fontSize: 15,
                ),),
            ),
          ],
        ),
      ),
      appBar: _appBar,
      body: _body,
    );
  }

  Widget get _appBar => new AppBar(
        title: Text(
          "              Pick Your UI",
          style: TextStyle(fontWeight: FontWeight.w800),
        ),
        leading: IconButton(
            icon: Icon(Icons.menu),
            onPressed: () => _scaffoldKey.currentState.openDrawer()),
        actions: <Widget>[
          IconButton(
            icon: Icon(multiple ? Icons.dashboard : Icons.view_agenda),
            onPressed: () {
              setState(() {
                multiple = !multiple;
              });
            },
          ),
        ],
      );

  Widget get _body => FutureBuilder(
      future: getData(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return SizedBox();
        } else {
          return GridView(
            padding: EdgeInsets.only(top: 5, left: 12, right: 12),
            scrollDirection: Axis.vertical,
            children: List.generate(homeList.length, (index) {
              return HomeListView(
                listData: homeList[index],
                callBack: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => homeList[index].navigateScreen,
                    ),
                  );
                },
              );
            }),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: multiple ? 2 : 1,
              mainAxisSpacing: 12.0,
              crossAxisSpacing: 12.0,
              childAspectRatio: 1.5,
            ),
          );
        }
      });
}

class HomeListView extends StatelessWidget {
  final HomeList listData;
  final VoidCallback callBack;

  const HomeListView({
    Key key,
    this.listData,
    this.callBack,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.5,
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(20.0)),
        child: Stack(
          alignment: AlignmentDirectional.center,
          children: <Widget>[
            Image.asset(
              listData.imagePath,
              fit: BoxFit.cover,
            ),
            Material(
              color: Colors.transparent,
              child: InkWell(
                splashColor: Colors.grey.withOpacity(0.2),
                borderRadius: BorderRadius.all(Radius.circular(4.0)),
                onTap: () {
                  callBack();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
