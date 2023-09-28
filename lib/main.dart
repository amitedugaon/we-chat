import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(EarningsScreen());
}

class EarningsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: ColorfulSafeArea(
          color: Colors.black,
          child: DefaultTabController(
            length: 2, // Number of tabs
            child: Column(
              children: [
                Container(
                  margin:
                      EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
                  // Adjust vertical margin

                  child: TabBar(
                    tabs: [
                      Tab(text: 'Today'),
                      // Tab for today's earnings
                      Tab(text: 'History'),
                      // Tab for earnings history
                    ],
                    unselectedLabelColor: Colors.blue,
                    labelColor: Colors.white,
                    indicator: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(
                            20) // Set the background color of the tab bar
                        ),
                    // Adjust vertical padding
                    labelStyle: TextStyle(fontSize: 16.0,fontWeight: FontWeight.bold,letterSpacing: 0.9),
                  ),
                ),
                Expanded(
                  child: TabBarView(
                    children: [
                      // Today's Earnings Tab
                      EarningsTab(
                          title: 'Today', earningsData: todayEarningsData),

                      // History Tab
                      EarningsTab(
                          title: 'History', earningsData: historyEarningsData),
                    ],
                  ),
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}

class EarningsTab extends StatelessWidget {
  final String title;
  final List<EarningItem> earningsData;

  EarningsTab({required this.title, required this.earningsData});

  @override
  Widget build(BuildContext context) {
    return ListView(
        children: [
          if (title == 'History')
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Yesterday',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ListView.builder(
            itemCount: earningsData.length,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              final item = earningsData[index];
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  margin: EdgeInsets.all(1),
                  decoration: BoxDecoration(
                      border: Border.all(), borderRadius: BorderRadius.circular(5)),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListTile(
                      title: Text('Patient Name: John Doe'),
                      // Replace with actual patient name
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Location: Punchkula sector 22'), // Display location
                          Row(
                            children: [
                              Text('Earnings: \$${item.amount.toStringAsFixed(2)}'),
                              SizedBox(width: 10,),
                              Container( decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.red, // Red circular background
                              ),child: Icon(Icons.close,color: Colors.white,)), // Add payment status icon here
                            ],
                          ),
                        ],
                      ),
                      // You can add more details or styling as needed
                    ),
                  ),
                ),
              );
            },
          ),
        ],
    );
  }
}

class EarningItem {
  final String date;
  final double amount;

  EarningItem({required this.date, required this.amount});
}

final todayEarningsData = [
  EarningItem(date: '2023-09-28', amount: 45.75),
  EarningItem(date: '2023-09-27', amount: 52.10),
  // Add more items for today's earnings
];

final historyEarningsData = [
  EarningItem(date: '2023-09-26', amount: 37.50),
  EarningItem(date: '2023-09-25', amount: 60.25),
  // Add more items for earnings history
];

//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text('Chat with Support'),
//         ),
//         body: ChatScreen(),
//       ),
//     );
//   }
// }
//
// class ChatScreen extends StatefulWidget {
//   @override
//   State createState() => ChatScreenState();
// }
//
// class ChatScreenState extends State<ChatScreen> {
//   final List<ChatMessage> _messages = <ChatMessage>[];
//   final TextEditingController _textController = TextEditingController();
//
//   void _handleSubmitted(String text) {
//     _textController.clear();
//     ChatMessage message = ChatMessage(
//       text: text,
//       isUserMessage: true, // You can set this based on who sent the message
//     );
//     setState(() {
//       _messages.insert(0, message);
//     });
//     // Here, you should implement logic to send the message to your backend or admin.
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: <Widget>[
//         Flexible(
//           child: ListView.builder(
//             padding: EdgeInsets.all(8.0),
//             reverse: true,
//             itemCount: _messages.length,
//             itemBuilder: (_, int index) => _messages[index],
//           ),
//         ),
//         Divider(height: 1.0),
//         Container(
//           decoration: BoxDecoration(
//             color: Theme.of(context).cardColor,
//           ),
//           child: _buildTextComposer(),
//         ),
//       ],
//     );
//   }
//
//   Widget _buildTextComposer() {
//     return IconTheme(
//       data: IconThemeData(color: Theme.of(context).primaryColor),
//       child: Container(
//         margin: EdgeInsets.symmetric(horizontal: 8.0),
//         child: Row(
//           children: <Widget>[
//             Flexible(
//               child: TextField(
//                 controller: _textController,
//                 onSubmitted: _handleSubmitted,
//                 decoration: InputDecoration.collapsed(
//                   hintText: 'Send a message',
//                 ),
//               ),
//             ),
//             IconButton(
//               icon: Icon(Icons.send),
//               onPressed: () => _handleSubmitted(_textController.text),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
//
// class ChatMessage extends StatelessWidget {
//   ChatMessage({required this.text, required this.isUserMessage});
//
//   final String text;
//   final bool isUserMessage;
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: const EdgeInsets.symmetric(vertical: 10.0),
//       child: Row(
//         mainAxisAlignment:
//         isUserMessage ? MainAxisAlignment.end : MainAxisAlignment.start,
//         children: <Widget>[
//           Container(
//             margin: const EdgeInsets.only(right: 16.0, left: 16.0),
//             child: CircleAvatar(
//               // You can set the user or admin avatar here.
//               // Use NetworkImage or AssetImage as needed.
//               backgroundImage: AssetImage('assets/avatar.png'),
//             ),
//           ),
//           Flexible(
//             child: Container(
//               padding: const EdgeInsets.all(16.0),
//               decoration: BoxDecoration(
//                 color: isUserMessage
//                     ? Colors.blue[100]
//                     : Colors.grey[200],
//                 borderRadius: BorderRadius.circular(8.0),
//               ),
//               child: Text(text),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
