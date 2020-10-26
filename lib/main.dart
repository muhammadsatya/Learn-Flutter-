import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'page_ketiga.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: PageGridView(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class PageNotifAlert extends StatefulWidget {
  @override
  _PageNotifAlertState createState() => _PageNotifAlertState();
}

class _PageNotifAlertState extends State<PageNotifAlert> {

  final GlobalKey<ScaffoldState> key = new GlobalKey<ScaffoldState>();
  SimpleDialog simpleDialog;

  void showSnackBar(){
    key.currentState.showSnackBar(new SnackBar(content: new Text('This is SnackBar')));
  }

  void showSimpleDialog() {
    simpleDialog = new SimpleDialog(
      title: new Text('Warning'),
      children: <Widget>[
        new SimpleDialogOption(
          child: Text('Jakarta'),
          onPressed: () {
            print('Jakarta');
          },
        ),
        new SimpleDialogOption(
          child: Text('Bogor'),
          onPressed: () {
            print('Bogor');
          },
        ),
        new SimpleDialogOption(
          child: Text('Close'),
          onPressed: () {
            Navigator.pop(context);
          },
        )
      ],
    );

    showDialog(context: context, child: simpleDialog);
  }


  void showAlertDialog() {
    showDialog(context: context,
        child: new AlertDialog(
          title: Text('Warning'),
          content: Text('Anda Yakin ingin keluar ?'),
          actions: <Widget>[
            new IconButton(
                icon: Icon(Icons.close),
                color: Colors.red,
                onPressed: () {
                  Navigator.pop(context);
                }),
            new IconButton(
                icon: Icon(Icons.check),
                color: Colors.green,
                onPressed: () {
                  Navigator.pop(context);
                })
          ],
        )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: new Text('Notification Widget'),
        backgroundColor: Colors.pink,
      ),
      key: key,
      body: new Center(
        child: new Column(
          children: <Widget>[
            new RaisedButton(
              onPressed: () {
                showSimpleDialog();
              },
              child: new Text('Show Alert Dialog'),
            ),
            new MaterialButton(onPressed: (){
                showAlertDialog();
            }, child: Text('Alert Dialog'), color: Colors.cyan, textColor: Colors.white,),

            new MaterialButton(onPressed: (){
              showSnackBar();
            }, child: Text('SnackBar'), color: Colors.red, textColor: Colors.white,),

            new MaterialButton(onPressed: (){
              Fluttertoast.showToast(msg: 'ini Toast',
              toastLength: Toast.LENGTH_LONG,
              gravity: ToastGravity.CENTER,
              backgroundColor: Colors.green,
              textColor: Colors.white);
            }, child: Text('Show Toast'), color: Colors.deepOrange, textColor: Colors.white,),
          ],
        ),
      ),
    );
  }
}

class PageSliderWidget extends StatefulWidget {
  @override
  _PageSliderWidgetState createState() => _PageSliderWidgetState();
}

class _PageSliderWidgetState extends State<PageSliderWidget> {
  double drag = 1.0;

  void methodDragVolume(value) {
    setState(() {
      drag = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink,
        title: new Text('Drag Slider'),
      ),
      body: new Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Slider(
                value: drag,
                min: 1.0,
                max: 1000.0,
                onChanged: (double val) {
                  methodDragVolume(val);
                }),
            new Text('Value : $drag')
          ],
        ),
      ),
    );
  }
}

class PageButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: new Text('Button'),
      ),
      body:new Center(
        child: new Column(
          children: <Widget>[
            new RaisedButton(
              onPressed: () {},
              child: Text('Button Raised'),
            ),
            new FlatButton(onPressed: null, child: Text('Button Flat')),
            new MaterialButton(
            onPressed: () {},
            child: Text('Button Material'),
            color: Colors.cyan,
            textColor: Colors.white,
            ),
          ],
        ),
      )
    );
  }
}

class PageInputWidget extends StatefulWidget {
  @override
  _PageInputWidgetState createState() => _PageInputWidgetState();
}

class _PageInputWidgetState extends State<PageInputWidget> {
  String txt = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink,
        title: new Text('Page Input Widget'),
      ),
      body: new Column(
        children: <Widget>[
          new Container(
            padding: EdgeInsets.all(8),
            child: TextField(
              onChanged: (String text) {
                setState(() {
                  txt = text;
                });
              },
              decoration: new InputDecoration(
                hintText: 'Input Username ',
                labelText: 'username',
              ),
            ),
          ),
          new Text(txt),
        ],
      ),
    );
  }
}

class PageTabBar extends StatefulWidget {
  @override
  _PageTabBarState createState() => _PageTabBarState();
}

class _PageTabBarState extends State<PageTabBar>
    with SingleTickerProviderStateMixin {
  TabController tabController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tabController = new TabController(length: 4, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tab Bar Apps'),
        backgroundColor: Colors.red,
        bottom: new TabBar(
          controller: tabController,
          tabs: <Widget>[
            new Tab(
              icon: new Icon(Icons.home),
            ),
            new Tab(
              icon: new Icon(Icons.dashboard),
            ),
            new Tab(
              icon: new Icon(Icons.data_usage),
            ),
            new Tab(
              icon: new Icon(Icons.close),
            ),
          ],
        ),
      ),
      body: new TabBarView(
        controller: tabController,
        children: <Widget>[
          PageHome(),
          PageListWidget(),
          PageList(),
          PageWidgetContainer()
        ],
      ),
    );
  }
}

class PageGridView extends StatefulWidget {
  @override
  _PageGridViewState createState() => _PageGridViewState();
}

class _PageGridViewState extends State<PageGridView> {
  List<int> itemGrid = new List();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    for (int i = 0; i < 3; i++) {
      itemGrid.add(i);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Page Grid View'),
        backgroundColor: Colors.pink,
        titleSpacing: 10.0,
        elevation: 35.0,
//        toolbarOpacity: 0.5,
        actions: <Widget>[
          new IconButton(icon: Icon(Icons.menu), onPressed: () {}),
          new IconButton(icon: Icon(Icons.data_usage), onPressed: () {}),
        ],
      ),
      body: new GridView.builder(
          gridDelegate:
              new SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
          itemBuilder: (BuildContext context, int index) {
            return new Card(
              color: Colors.pink,
              child: new Padding(padding: const EdgeInsets.all(25)),
            );
          }),
    );
  }
}

class PageListWidget extends StatefulWidget {
  @override
  _PageListWidgetState createState() => _PageListWidgetState();
}

class _PageListWidgetState extends State<PageListWidget> {
  List<int> item = new List();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    for (int i = 0; i < 25; i++) {
      item.add(i);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: new ListView.builder(
        itemCount: item.length,
        itemBuilder: (BuildContext context, int index) {
          return new ListTile(
            title: new Text('Item Nomor : $index'),
            trailing: new Icon(Icons.print),
          );
        },
      ),
    );
  }
}

class PageList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: new ListView(
        children: <Widget>[
          new ListTile(
            title: Text('Rendang'),
            trailing: Icon(Icons.fastfood),
          ),
          new ListTile(
            title: Text('Minuman'),
            trailing: Icon(Icons.local_drink),
          ),
          new ListTile(
            title: Text('Phone'),
            trailing: Icon(Icons.phone),
          ),
          new ListTile(
            title: Text('Alarm'),
            trailing: Icon(Icons.alarm),
          ),
          new ListTile(
            title: Text('Camera'),
            trailing: Icon(Icons.camera),
          ),
        ],
      ),
    );
  }
}

class PageRowColum extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: new Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          new Text('This'),
          new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new Text('This'),
              new Text('is'),
              new Text('Colum')
            ],
          ),
          new Text('Row')
        ],
      ),
    );
  }
}

class PageWidgetContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: new Container(
        color: Colors.blue,
        child: new Text('My Container'),
        height: 500.0,
        alignment: Alignment.center,
        padding: const EdgeInsets.all(20),
        foregroundDecoration: new BoxDecoration(color: Colors.pink),
      ),
    );
  }
}

class PageUtama extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: new Center(
        child: Column(
          children: <Widget>[
            new MaterialButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => PagePertama()));
              },
              child: Text('Page Pertama'),
              color: Colors.deepOrange,
              textColor: Colors.white,
            ),
            new MaterialButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => PageKedua()));
              },
              child: Text('Page Kedua'),
              color: Colors.amberAccent,
              textColor: Colors.white,
            ),
            new MaterialButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => PageKetiga()));
              },
              child: Text('Page Ketiga'),
              color: Colors.pink,
              textColor: Colors.white,
            )
          ],
        ),
      ),
    );
  }
}

class PageHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: new Center(
        child: Text('Page Home'),
      ),
    );
  }
}

class PageDasboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: new Center(
        child: Text('Page Dashboard'),
      ),
    );
  }
}

class PagePertama extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: new Center(
        child: Text('Page Pertama'),
      ),
    );
  }
}

class PageKedua extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: new Center(
        child: Text('Page Kedua'),
      ),
    );
  }
}
