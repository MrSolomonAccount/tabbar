import 'package:flutter/material.dart';
void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home:  HomePage());
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
 late TabController tabController;
 List<int> childCount=[3,3,100];
 @override
 void initState() {
    // TODO: implement initState
    super.initState();
    tabController=TabController(length: 3, vsync: this);
  }
  scrollOrNot({required int numOfChildren}){
    print("number of children is $numOfChildren in scrollornot");

    if(numOfChildren<8){ return const NeverScrollableScrollPhysics();}
    else{return const AlwaysScrollableScrollPhysics();}
  }
  @override
  Widget build(BuildContext context) {
    return  NestedScrollView(
headerSliverBuilder:(context, innerBoxIsScrolled)=>[
 SliverAppBar(
  expandedHeight: 300,
  floating: true,
  bottom: TabBar(
    onTap: (value){
     setState(() {
      tabController.index=value;       
     });
    },
    controller: tabController,
    indicatorColor: Colors.red,
    tabs: const [Text("Tab 1"),Text("Tab 2"),Text("Tab 3")]),
)
],
body: TabBarView(
  controller: tabController,
  children: [
  TabContent(numOfChildren: childCount[0]),
  TabContent(numOfChildren: childCount[1]),
  TabContent(numOfChildren: childCount[2]),
  

]),
);
  }
}

class TabContent extends StatelessWidget {
  final int numOfChildren;
  const TabContent({super.key, required this.numOfChildren});
@override
Widget build(BuildContext context){
 print("in the class the num of children is $numOfChildren");
  return Scaffold(body:
  CustomScrollView(
  physics: numOfChildren<5?const NeverScrollableScrollPhysics(): const AlwaysScrollableScrollPhysics(),
    slivers:[
   SliverList.builder(
    itemCount: numOfChildren,
    itemBuilder: (context, index)=> ListTile(title: Text("item $index"),))
 
  ])
  );

}
}