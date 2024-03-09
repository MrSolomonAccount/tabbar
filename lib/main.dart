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
            expandedHeight: 200,
            backgroundColor: Colors.blue,
            bottom:TabBar(
         
              controller: tabController,
              indicatorColor: Colors.red,
              tabs: const [Text("Tab 1"), Text("Tab 2"), Text("Tab 3")]),
          ),



/*SliverList.builder(
  itemCount: switch(tabController.index){
    0=>2,
    1=>3,
    _=>50
  },
  itemBuilder: (context, index)=> const ListTile(title: Text("mango"),))
*/

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

       ListView.builder(
      physics: const FixedExtentScrollPhysics(),       
          itemCount:50 ,
          itemBuilder: (_, index)=>ListTile(title: Text("Content $index"),))
      
     
        ]),
    )
       
        ],
      ),

    
    );

  }
}