import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  static final String id = 'home_page';

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

   int _selectedIndex = 0;
   final padding = 8.0;

 final List<String> titles = [
     "Popular \n Cars",
     "Favourites",
     "Tesla models ",
     "All"
   ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[400],
      body:Row(
        children: [
          NavigationRail(
            minWidth: 56.0,
            groupAlignment: 0.7,
            backgroundColor: Colors.grey[600],
              selectedIndex: _selectedIndex,
              onDestinationSelected: (int index){
                setState(() {
                  _selectedIndex = index;
                });
              },
            labelType: NavigationRailLabelType.all,
            leading: Column(
             children: <Widget> [
               SizedBox(height: 20,),
             Container(
               child: Center(
                 child: CircleAvatar(
                   radius: 18,
                   backgroundImage: AssetImage('assets/images/Jurabek.jpeg'),
                 ),
               ),
             ),
                SizedBox(height: 102,),
                RotatedBox(
                    quarterTurns:-1,
                  child: IconButton(
                    icon: Icon(Icons.tune),
                    color: Colors.white,
                    onPressed: (){},
                  ),
                )
             ],
            ),
            selectedLabelTextStyle: TextStyle(
              color: Colors.white,
              fontSize: 14,
              letterSpacing: 0.8,
              decoration: TextDecoration.underline,
              decorationThickness: 2.0
            ),
            unselectedLabelTextStyle: TextStyle(
              fontSize: 14,
              letterSpacing: 0.8
            ),
            destinations: [
              BuildRotatedTextRailDestination('Popular', padding),
              BuildRotatedTextRailDestination('Favourites', padding),
              BuildRotatedTextRailDestination('Tesla', padding),
              BuildRotatedTextRailDestination('All', padding),
            ],
          ),
          Expanded(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(8,8,0,0),
           child: MediaQuery.removePadding(
             context: context,
              child: ListView(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                    IconButton(onPressed: (){},
                        icon: Icon(Icons.search)),
                      IconButton(onPressed: (){},
                          icon: Icon(Icons.shopping_cart)),
                  ],
                  ),

                  Text(titles[_selectedIndex],
                  style: Theme.of(context).textTheme.headline4,),
                  _itemList('Model 2016', "assets/images/Tesla model 2016.jpg" ),
                  _itemList( "Model_3", "assets/images/tesla-model-3.webp"),
                  _itemList("Model Ei ","assets/images/Tesla Ei futuro.jpeg" ),
                  _itemList( 'Model Y',"assets/images/Tesla model y long Range.jpeg"),
                  _itemList( "Model 2020 Roadster","assets/images/Tesla 2020 Roadster.png"),
                  _itemList("Model exp_3","assets/images/tesla-model-exp-3.jpg"),
                  _itemList("Model X","assets/images/tesla-model-x.jpg"),
                  _itemList("Model Y_2020","assets/images/tesla-model-y-2020-ts.jpg"),
                  _itemList("Model S_3","assets/images/tesla-model-s-tesla-model-3-deliveries-chart.png"),
                ],
              ),
           )
    )
          )
          // ContentSpace(_selectedIndex),
        ],
      )
        );
}
}
   // ignore: non_constant_identifier_names
   NavigationRailDestination BuildRotatedTextRailDestination( String text, double padding){
  return NavigationRailDestination(icon: SizedBox.shrink(), label:Padding(
    padding: EdgeInsets.symmetric(vertical: padding),
    child: RotatedBox(
      quarterTurns: -1,
      child: Text(text),
    ),
  ),
  );
   }

    Widget _itemList(text, images){
     return Container(
       height: 220,
     margin: EdgeInsets.all(10.0),
       decoration: BoxDecoration(
         image: DecorationImage(
           image: AssetImage(images),
          fit: BoxFit.cover,
         ),
         borderRadius: BorderRadius.circular(20),
       ),
       child: Stack(
       children: [
         Container(
           decoration: BoxDecoration(
             borderRadius: BorderRadius.circular(20),
             gradient: LinearGradient(
                 begin: Alignment.topRight,
                 colors: [
                   Colors.black.withOpacity(0.9),
                   Colors.black.withOpacity(0.3),
                   Colors.black.withOpacity(0.1),
                   Colors.black.withOpacity(0.06),
                 ]),

           ),
         ),
       Padding(
             padding: EdgeInsets.fromLTRB(15, 10, 0, 150),
             child: Text(text,style: TextStyle(fontSize: 20,color: Colors.white, fontWeight: FontWeight.bold)),
           )

       ],
       ),
     );
    }


