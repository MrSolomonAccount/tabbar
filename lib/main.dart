import "package:flutter/material.dart";
void main()=>runApp(const MyApp());
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home:  HomePage()
    );
  }
}
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
 late TabController tabController;
 @override
 void initState() {
    // TODO: implement initState
    super.initState();
tabController= TabController(length: 3, vsync: this);
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: CustomScrollView(
        slivers: [
SliverAppBar(floating: true,
   pinned:true,
        expandedHeight: 200.0,
        bottom:  TabBar(
          controller: tabController,
          tabs: const [Text("Tab 1"), Text("Tab 2"), Text("Tab 3")])      
      ),

      SliverFillRemaining(child: DefaultTabController(length: 3, 
    child: TabBarView(
        children:  [
    
    ListView.builder(itemCount:3,itemBuilder: (context, index)=>ListTile(title: Text("item $index"))),
    ListView.builder(itemCount:3,itemBuilder: (context, index)=>ListTile(title: Text("item $index"))),
    ListView.builder(itemCount:100,itemBuilder: (context, index)=>ListTile(title: Text("item $index")))
    


        ]
      )),)
]
    )
    );
  }
}

