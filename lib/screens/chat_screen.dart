import 'package:chat_ui/models/user_model.dart';
import 'package:flutter/material.dart';

import '../models/message_model.dart';
class ChatScreen extends StatefulWidget {
  final User user;

   ChatScreen({required this.user});
  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  _buildMessage(Message message, bool isMe){
    final Container msg= Container(
        margin: isMe ?
        EdgeInsets.only(top: 8.0,bottom: 8.0,left: 80.0) : 
        EdgeInsets.only(top: 8.0,bottom: 8.0),
        padding: EdgeInsets.symmetric(horizontal: 25.0, vertical: 15.0),
        width: MediaQuery.of(context).size.width*0.75,
        decoration: BoxDecoration(
          color: isMe? Theme.of(context).colorScheme.secondary:  Color(0xFFFFEFEE),
          borderRadius: isMe ?  BorderRadius.only(
            topLeft: Radius.circular(15.0),
            bottomLeft: Radius.circular(15.0),
          ):BorderRadius.only(
            topRight: Radius.circular(15.0),
            bottomRight: Radius.circular(15.0),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(message.time,
            style: TextStyle(
              color: Colors.blueGrey,
              fontWeight: FontWeight.w600,
              fontSize: 16.0,
            ),),
            SizedBox(height: 8.0),
            Text(message.text,
            style: TextStyle(
              color: Colors.grey,
              fontWeight: FontWeight.w600,
              fontSize: 16.0,
            ),
            ),
          ],
        ),
       );
       if(isMe){
        return msg;
       }
   return Row(
     children: [
      msg,
       IconButton(
        icon: message.isLiked 
        ?Icon(Icons.favorite)
        :Icon(Icons.favorite_border),
      iconSize: 30.0,
      color: message.isLiked ? Theme.of(context).primaryColor : Colors.blueGrey,
      onPressed:(){},
      ),
     ],
   );
  }

  _buildMessageComposer(){
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8.0),
      height: 70.0,
      color: Colors.white,
       child: Row(children: [
         IconButton(
          onPressed:(){},
          icon: Icon(Icons.photo),
         iconSize: 25.0,
         color: Theme.of(context).primaryColor,),
         Expanded(child: TextField(
          textCapitalization: TextCapitalization.sentences,
          onChanged: (value){},
          decoration: InputDecoration.collapsed(
            hintText: 'Send a message.....'
          ),
         )),
         IconButton(
          onPressed:(){},
          icon: Icon(Icons.send),
         iconSize: 25.0,
         color: Theme.of(context).primaryColor,)
      ],
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        title: Text(widget.user.name,
         style: TextStyle(
        fontSize: 28.0,
        fontWeight: FontWeight.bold,
      ),),
      elevation: 0.0,
        actions: [
      IconButton(icon: Icon(Icons.more_horiz),
      iconSize: 30.0,
      color: Colors.white,
      onPressed:(){},
      ),
      ],
      ),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Column(
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30.0),
                    topRight: Radius.circular(30.0),
                  )
                ),
                child: ClipRRect(
                   borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30.0),
                    topRight: Radius.circular(30.0),
                  ),
                  child: ListView.builder(
                    reverse: true,
                    padding:EdgeInsets.only(top: 15.0),
                    itemCount: messages.length,
                    itemBuilder: (BuildContext context, int index) {
                      final Message message = messages[index];
                      final bool isMe =message.sender.id==currentUser.id;
                      return _buildMessage(message,isMe);
                    }),
                ),
              ),
            ),
           _buildMessageComposer(),
          ],
        ),
      ),
    );
  }
}