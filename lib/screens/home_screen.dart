import 'package:chat_ui/widgets/favourite_contacts.dart';
import 'package:chat_ui/widgets/recent_chats.dart';
import 'package:flutter/material.dart';
import '../widgets/category_selector.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}
class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    backgroundColor: Theme.of(context).primaryColor,
     appBar: AppBar(
      leading: IconButton(icon: Icon(Icons.menu),
      iconSize: 30.0,
      color: Colors.white,
      onPressed:(){},
      ),
      title: Text("Chats",
      style: TextStyle(
        fontSize: 28.0,
        fontWeight: FontWeight.bold,
      ),
      ),
      elevation: 0.0,
      actions: [
      IconButton(icon: Icon(Icons.search),
      iconSize: 30.0,
      color: Colors.white,
      onPressed:(){},
      ),
      ],
     ),
     body: Column(children: [
      CategorySelector(),
      Expanded(
        child: Container(
          decoration:BoxDecoration(color: Theme.of(context).colorScheme.secondary,
          borderRadius: BorderRadius.only(
           topLeft: Radius.circular(30.0),
           topRight: Radius.circular(30.0),
          ),
          ),
          child: Column(
            children: [
             FavouriteContacts(),
              RecentChats(),
            ],
          ),
        ),
      ),
     ]),
    );
  }
}