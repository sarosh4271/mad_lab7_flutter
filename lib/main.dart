import 'package:flutter/material.dart';
import 'package:mad_lab7_flutter/recipie.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return (MaterialApp(
      debugShowCheckedModeBanner: false,
      home: recipebook(),
    ));
  }
}

class recipebook extends StatefulWidget {
  @override
  _recipebookState createState() => _recipebookState();
}

class _recipebookState extends State<recipebook> {
  Expanded recipebuttons(
      {String recipename,
      String preptime,
      String recipeimg,
      String recipedescription}) {
    return Expanded(
        child: InkWell(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            flex: 1,
            child: CircleAvatar(
              radius: 30,
              backgroundImage: AssetImage('images/$recipeimg.jpg'),
            ),
          ),
          Expanded(
            flex: 3,
            child: Column(
              children: [
                Expanded(
                  flex: 1,
                  child: Row(
                    children: <Widget>[
                      Text(
                        recipename,
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ],
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Row(
                    children: <Widget>[
                      Text(
                        'Prep Time: $preptime min',
                        style: TextStyle(fontSize: 16),
                      )
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => recipedetail(
                    recipename: recipename,
                    recipeimg: recipeimg,
                    preptime: preptime,
                    recipedescription: recipedescription)));
        print('tapped');
      },
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.green.shade700,
          actions: [IconButton(icon: Icon(Icons.book), onPressed: () {})],
          title: Text(
            'My Recipe Book',
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          )),
      body: SafeArea(
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
            recipebuttons(
                recipeimg: 'eggbenedict',
                recipename: 'Egg Benedict',
                preptime: '30',
                recipedescription:
                    'This is the full description of items recipe. Hope you like it.'),
            recipebuttons(
                recipeimg: 'mushroom',
                recipename: 'Mushroom Risotto',
                preptime: '30',
                recipedescription:
                    'This is the full description of items recipe. Hope you like it.'),
            recipebuttons(
                recipeimg: 'breakfast',
                recipename: 'Full BreakFast',
                preptime: '20',
                recipedescription:
                    'This is the full description of items recipe. Hope you like it.'),
            recipebuttons(
                recipeimg: 'burger',
                recipename: 'Burger',
                preptime: '30',
                recipedescription:
                    'This is the full description of items recipe. Hope you like it.'),
            recipebuttons(
                recipeimg: 'sandwich',
                recipename: 'Egg Sandwich',
                preptime: '10',
                recipedescription:
                    'This is the full description of items recipe. Hope you like it.'),
            recipebuttons(
                recipeimg: 'creme',
                recipename: 'Creme Brulee',
                preptime: '60',
                recipedescription:
                    'This is the full description of items recipe. Hope you like it.'),
          ])),
    );
  }
}
