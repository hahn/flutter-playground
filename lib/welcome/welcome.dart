import 'package:flutter/material.dart';

class WelcomeScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _WelcomeScreenState();

}

class _WelcomeScreenState extends State<WelcomeScreen> with SingleTickerProviderStateMixin {


  TabController _tabController;
  int page = 0;
  String nextText = "Lanjut";

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: contents.length);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  void _nextPage(int delta) {
    final int newIndex = _tabController.index + delta;
    setState(() {
      page = newIndex;
      print("page: $page");
      print("text: ${_tabController.previousIndex}");
    });
    if (newIndex == _tabController.length) {
      setState(() {
        nextText = "LOGIN";
      });
    } else {
      setState(() {
        nextText = "LANJUT";
      });
    }
    if(newIndex < 0 || newIndex >= _tabController.length) return;
    _tabController.animateTo(newIndex);
  }

  Widget _buildBody() {
    return Container(
//      color: Colors.red,
      child: Stack(
        fit: StackFit.expand,
        alignment: Alignment.center,
        children: <Widget>[
          _buildTab(),
          Positioned(
            child: _buildPageSelector(),
            bottom: 20.0,
          ),
        ],
      ),
    );
  }

  Widget _buildTab() {
    return TabBarView(
      controller: _tabController,
      children: contents.map((WelcomeContent content) {
        return Padding(
          padding: const EdgeInsets.all(0.0),
          child: WelcomeCard(content: content,),
        );
      }).toList(),
    );
  }

  Widget _buildPageSelector() {
    return PreferredSize(
      child: Theme(
        data: Theme.of(context).copyWith(accentColor: Colors.white),
        child: Container(
          height: 48.0,
          alignment: Alignment.center,
          child: TabPageSelector(
            controller: _tabController,
          ),
        )),
      preferredSize: const Size.fromHeight(48.0),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: _buildBody(),

      ),
    );
  }
}

class WelcomeContent {
  final String title;
  final String text;
  final IconData icon;
  final Color color;

  const WelcomeContent({this.title = "", this.text, this.icon, this.color});
}

const List<WelcomeContent> contents = const <WelcomeContent>[
  const WelcomeContent(title: 'JUDULNYA', text: 'blablabalabalaa', icon: Icons.directions_car, color: Colors.blue),
  const WelcomeContent(title: 'JUDULNYA', text: 'BICYCLE', icon: Icons.directions_bike, color: Colors.orange),
  const WelcomeContent(title: 'JUDULNYA', text: 'BOAT', icon: Icons.directions_boat, color: Colors.green),
  const WelcomeContent(title: 'JUDULNYA', text: 'BUS', icon: Icons.directions_bus, color: Colors.yellow),
  const WelcomeContent(title: 'JUDULNYA', text: 'TRAIN', icon: Icons.directions_railway, color: Colors.lightBlue),
  const WelcomeContent(title: 'JUDULNYA', text: 'WALK', icon: Icons.directions_walk, color: Colors.red),
];

class WelcomeCard extends StatelessWidget {
  const WelcomeCard({Key key, this.content}): super(key: key);

  final WelcomeContent content;


  @override
  Widget build(BuildContext context) {
    final TextStyle styleTitle = Theme.of(context).textTheme.display1;
    final TextStyle styleContent = Theme.of(context).textTheme.headline;
    print("choice: ${content.text}");
    return Container(
      color: content.color,
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Icon(content.icon, size: 128.0, color: styleTitle.color),
            Padding(padding: EdgeInsets.only(top: 20.0)),
            Text(content.title, style: styleTitle,),
            Padding(padding: EdgeInsets.only(top: 20.0)),
            Text(content.text, style: styleContent),
          ],
        ),
      ),
    );
  }
}