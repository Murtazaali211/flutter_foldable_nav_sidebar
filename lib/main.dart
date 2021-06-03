import 'package:flutter/material.dart';
import 'package:foldable_sidebar/foldable_sidebar.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,       
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  FSBStatus drawerStatus;
  @override
  Widget build(BuildContext context) {
    
    return SafeArea(
      child: Scaffold(        
      appBar: AppBar(        
        title: Text("Folable Sidebar"),
      ),
      body: FoldableSidebarBuilder(
        drawerBackgroundColor: Colors.deepOrange,
        drawer: CustomDrawer(closeDrawer: () {
          setState(() {
            drawerStatus = FSBStatus.FSB_CLOSE;
          });
        }),
        screenContents: FirstScreen(),
        status: drawerStatus,
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.deepOrange,
        child: Icon(Icons.menu, color: Colors.white),
        onPressed: (){
          setState(() {
            drawerStatus = drawerStatus == FSBStatus.FSB_OPEN ? FSBStatus.FSB_CLOSE : FSBStatus.FSB_OPEN;
          });
        },
      ), 
    )
    );
  }
}

class FirstScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black.withAlpha(200),     
      child: Center(child: Text("Click on FAB to Open Drawer", style: TextStyle(fontSize: 20, color: Colors.white)),),      
    );
  }
}

class CustomDrawer extends StatelessWidget {
  final Function closeDrawer;
  
  const CustomDrawer({Key key, this.closeDrawer}): super(key: key);

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQueryData = MediaQuery.of(context);
    return Container(
      color: Colors.white,
      width: mediaQueryData.size.width * 0.60,
      height: mediaQueryData.size.height,
      child: Column(
        children: <Widget>[
          Container(
            width: double.infinity,
            height: 200,
            color: Colors.grey.withAlpha(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image.asset(
                  "assets/images/reactivelogo.png",
                  width: 100,
                  height: 100,
                ),
                SizedBox(
                  height: 10,
                ),
                Text("ReactiveLogix")
              ],
            )
          ),
          ListTile(
            onTap: (){
              debugPrint("Tapped Profile");
            },
            leading: Icon(Icons.person),
            title: Text(
              "your Profile",
            ),
          ),
          Divider(
            height: 1,
            color: Colors.grey,
          ),
          ListTile(
            onTap: (){
              debugPrint("Tapped settings");
            },
            leading: Icon(Icons.settings),
            title: Text("Settings"),
          ),
          Divider(
            height: 1,
            color: Colors.grey,
          ),
          ListTile(
            onTap: (){
              debugPrint("Tapped Payments");
            },
            leading: Icon(Icons.payment),
            title: Text("Payments"),
          ),
          Divider(
            height: 1,
            color: Colors.grey,
          ),
          ListTile(
            onTap: (){
              debugPrint("Tapped Notifications");
            },
            leading: Icon(Icons.notifications),
            title: Text("Notifications"),
          ),
          Divider(
            height: 1,
            color: Colors.grey,
          ),
          ListTile(
            onTap: (){
              debugPrint("Tapped Log Out");
            },
            leading: Icon(Icons.exit_to_app),
            title: Text("Log Out"),
          ),
        ]
      ),
    );
  }
}