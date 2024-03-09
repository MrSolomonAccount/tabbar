import 'package:autoscale_tabbarview/autoscale_tabbarview.dart';
import 'package:flutter/material.dart';
void main()=>runApp(const MyApp());
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
    //showSemanticsDebugger: true,
      home: HomePage()
    );
  }
}
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin{
  late TabController tabController;
  int tabIndex=0;
overflowContent(){
  return Column(children: [
    for(int i=0; i<100; i++)Text("Content $i")
    ]);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tabController=TabController(length: 3, vsync: this);
  tabController.addListener(() => setState(() {
    
  }));
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      
      body: 
      CustomScrollView(
        slivers: [
          SliverAppBar(
            flexibleSpace: Container(color: Colors.blue,),
            expandedHeight: 200,
            backgroundColor: Colors.blue,
            bottom:TabBar(
         
              controller: tabController,
              indicatorColor: Colors.red,
              tabs: const [Tab(text:"Tab 1"), Tab(text:"Tab 2"), Tab(text:"Tab 3")]),
          ),




   SliverFillRemaining(
      child:TabBarView(
        controller: tabController,
        children:  [
                  ListView.builder(
          itemCount:2 ,
          itemBuilder: (_, index)=>ListTile(title: Text("Content $index"),)),
                  ListView.builder(
          itemCount:3 ,
          itemBuilder: (_, index)=>ListTile(title: Text("Content $index"),)),

Wrap(children: [overflowContent()],)
  /*ListView.builder(
      physics: null,  
          itemCount:50 ,
          itemBuilder: (_, index)=>ListTile(title: Text("Content $index"),))
    */
        ]),
    )
       
        ],
      ),

    
    );

  }
}