import 'package:chat_ui/screens/chat_screen.dart';

import 'package:chat_ui/models/message_model.dart';
import 'package:flutter/material.dart';

class RecentChats extends StatelessWidget {
  const RecentChats({super.key});

  @override
  Widget build(BuildContext context) {
    return  Expanded(
               child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30.0),
                  topRight: Radius.circular(30.0),
                       ),
                       ),
                       child: ClipRRect(
                        borderRadius:BorderRadius.only(
                  topLeft: Radius.circular(30.0),
                  topRight: Radius.circular(30.0),
                       ),
                         child: ListView.builder(
                          itemCount: chats.length,
                          itemBuilder:(BuildContext context,int index){
                            final Message chat=chats[index];
                           return GestureDetector(
                            onTap: (() => Navigator.push(context,MaterialPageRoute
                            (
                              builder: (_)=>ChatScreen(user: chat.sender,),
                              ),)
                              ),
                             child: Container(
                              margin: EdgeInsets.only(top: 5.0,bottom: 5.0,right: 20.0),
                              padding: EdgeInsets.symmetric(
                                vertical: 10.0,
                                horizontal: 20.0,
                              ),
                              decoration: BoxDecoration(
                                color: chat.unread ? Color(0xFFFFEFEE) : Colors.white,
                                borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(20.0),
                                  bottomRight: Radius.circular(20.0),
                                )
                              ),
                               child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                 children: [
                                   Row(
                                     children:[ 
                                      CircleAvatar(
                                        radius: 35.0,
                                        backgroundImage: AssetImage(chat.sender.imageUrl),
                                      ),
                                      SizedBox(width: 10.0,),
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                          chat.sender.name,
                                          style: TextStyle(
                                            fontSize: 15.0,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.grey,
                                          ),
                                     ),
                                     SizedBox(
                                      height: 5.0,
                                     ),
                                     Container(
                                      width: MediaQuery.of(context).size.width*0.45,
                                       child: Text(
                                        chat.text,
                                          style: TextStyle(
                                              fontSize: 15.0,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.blueGrey,
                                            ),
                                            overflow: TextOverflow.ellipsis,
                                       ),
                                     ),
                                        ],
                                      ),
                                     ],
                                   ),
                                   Column(children: [
                                    Text(chat.time,
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15.0,
                                      color: Colors.grey,
                                    ),),
                                    SizedBox(
                                      height: 5.0,
                                    ),
                                    chat.unread ? Container(
                                      width: 40.0,
                                      height: 20.0,
                                      decoration:BoxDecoration(
                                        color: Theme.of(context).primaryColor,
                                        borderRadius: BorderRadius.circular(30.0),
                                      ),
                                      alignment: Alignment.center,
                                      child: Text('NEW',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight:FontWeight.bold,
                                        fontSize: 12.0, 
                                      ),),
                                      ) : Text(" "),
                                   ],)
                                 ],
                               ),
                             ),
                           );
                          },),
                       ) ,
               ),
             );
  }
}