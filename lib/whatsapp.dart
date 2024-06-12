import 'package:flutter/material.dart';

class WhatsApp extends StatefulWidget {
  const WhatsApp({super.key});

  @override
  State<WhatsApp> createState() => _WhatsAppState();
}

//appbar with navigation
class _WhatsAppState extends State<WhatsApp> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  int _selectedIndex = 1; // Default to "Chats" tab

  final List<Widget> _pages = [
    GroupPage(),
    ChatsPage(),
    UpdatesPage(),
    CallsPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // Remove the debug banner
      theme: ThemeData(
        primaryColor: Color(0xFF075E54), // WhatsApp green color
        hintColor: Color(0xFF25D366), // WhatsApp accent color
      ),
      home: Scaffold(
        key: _scaffoldKey,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(100.0), 
          child: AppBar(
            automaticallyImplyLeading: false, 
            flexibleSpace: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                SizedBox(height: 15.0), 
                Row(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'WhatsApp',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Spacer(),
                    IconButton(
                      icon: Icon(Icons.camera_alt),
                      color: Colors.white,
                      onPressed: () {},
                    ),
                    IconButton(
                      icon: Icon(Icons.search),
                      color: Colors.white,
                      onPressed: () {},
                    ),
                    IconButton(
                      icon: Icon(Icons.more_vert),
                      color: Colors.white,
                      onPressed: () {
                        _scaffoldKey.currentState?.openEndDrawer();
                      },
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    IconButton(
                      icon: Icon(Icons.group),
                      color: Colors.white,
                      onPressed: () {
                        _onItemTapped(0);
                      },
                    ),
                    TextButton(
                      onPressed: () {
                        _onItemTapped(1);
                      },
                      child: Text(
                        'Chats',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        _onItemTapped(2);
                      },
                      child: Text(
                        'Updates',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        _onItemTapped(3);
                      },
                      child: Text(
                        'Calls',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            backgroundColor: Color.fromARGB(255, 0, 92, 75),
          ),
        ),

// side drawer
        endDrawer: Drawer(
          child: Container(
            color: Colors.black, // Set background color to black
            child: ListView(
              padding: EdgeInsets.zero,
              children: <Widget>[
                Container(
                  height: 100.0, // Set height equal to AppBar height
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 0, 92, 75),
                  ),
                  child: DrawerHeader(
                    margin: EdgeInsets.zero,
                    padding: EdgeInsets.zero,
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Text(
                          'Menu',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                ListTile(
                  leading: Padding(
                    padding: EdgeInsets.only(top: 8.0), // Add top padding
                    child: CircleAvatar(
                      backgroundImage: AssetImage(
                          'assets/images/11.jpg'), 
                      backgroundColor: Colors
                          .white, 
                    ),
                  ),
                  title: Text(
                    'Profile',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold, // Set text color 
                    ),
                  ),
                  onTap: () {
                    // Handle the profile tap
                  },
                ),
                ListTile(
                  leading: Icon(
                    Icons.settings,
                    color: Colors.white, // Set icon color
                  ),
                  title: Text(
                    'Settings',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold, // Set text color
                    ),
                  ),
                  onTap: () {
                    // Handle the settings tap
                  },
                ),
                ListTile(
                  leading: Icon(
                    Icons.logout,
                    color: Colors.white, // Set icon color
                  ),
                  title: Text(
                    'Logout',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold, // Set text color
                    ),
                  ),
                  onTap: () {
                    // Handle the logout tap
                  },
                ),
              ],
            ),
          ),
        ),
        body: _pages[_selectedIndex],
      ),
    );
  }
}

//group page
class GroupPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      child: ListView(
        children: [
          ListTile(
            leading: Icon(Icons.group, color: Colors.white, size: 35.0),
            title: Text(
              'Groups',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
            subtitle: Text(
              'Your group chats',
              style: TextStyle(color: Colors.white70, fontSize: 16),
            ),
          ),
          Divider(color: Colors.white54),
          // you can add your own groups here
          ListTile(
            leading: CircleAvatar(
              backgroundImage: AssetImage('assets/images/familygr.jpg'),
            ),
            title: Text(
              'Family',
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
            subtitle: Text(
              'Friends group chat',
              style: TextStyle(color: Colors.white70),
            ),
          ),
          ListTile(
            leading: CircleAvatar(
              backgroundImage: AssetImage('assets/images/friend.jpg'),
            ),
            title: Text(
              'Friends',
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
            subtitle: Text(
              'Friends group chat',
              style: TextStyle(color: Colors.white70),
            ),
          ),
          ListTile(
            leading: CircleAvatar(
              backgroundImage: AssetImage('assets/images/work.jpg'),
            ),
            title: Text(
              'Work',
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
            subtitle: Text(
              'Work group chat',
              style: TextStyle(color: Colors.white70),
            ),
          ),
        ],
      ),
    );
  }
}

//chat page
class ChatsPage extends StatelessWidget {
  final List<Map<String, String>> chats = [
    {
      'name': 'Urooj',
      'message': 'Hello, how are you?',
      'profilePic': 'assets/images/4.jpg',
      'time': 'Today',
    },
    {
      'name': 'Areej',
      'message': 'Did you finish the project?',
      'profilePic': 'assets/images/1.jpg',
      'time': 'Today',
    },
    {
      'name': 'Fariha',
      'message': 'Let\'s catch up tomorrow!',
      'profilePic': 'assets/images/8.jpg',
      'time': 'Today',
    },
    {
      'name': 'Leo',
      'message': 'Hello, how are you?',
      'profilePic': 'assets/images/7.jpg',
      'time': 'Yesterday',
    },
    {
      'name': 'Henry',
      'message': 'Did you finish the project?',
      'profilePic': 'assets/images/3.jpg',
      'time': 'Yesterday',
    },
    {
      'name': 'Charlie',
      'message': 'Let\'s catch up tomorrow!',
      'profilePic': 'assets/images/9.jpg',
      'time': 'Yesterday',
    },
    {
      'name': 'Hamna',
      'message': 'Hello, how are you?',
      'profilePic': 'assets/images/12.jpg',
      'time': 'Yesterday',
    },
    {
      'name': 'Amelia',
      'message': 'Did you finish the project?',
      'profilePic': 'assets/images/2.jpg',
      'time': 'Monday',
    },
    {
      'name': 'Jenny',
      'message': 'Let\'s catch up tomorrow!',
      'profilePic': 'assets/images/10.jpg',
      'time': 'Monday',
    },
    {
      'name': 'Alice',
      'message': 'Hello, how are you?',
      'profilePic': 'assets/images/6.jpg',
      'time': 'Monday',
    },
    {
      'name': 'Lily',
      'message': 'Did you finish the project?',
      'profilePic': 'assets/images/13.jpg',
      'time': 'Sunday',
    },
    {
      'name': 'Olivia',
      'message': 'Let\'s catch up tomorrow!',
      'profilePic': 'assets/images/14.jpg',
      'time': 'Sunday',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      child: ListView.builder(
        itemCount: chats.length,
        itemBuilder: (context, index) {
          final chat = chats[index];
          return ListTile(
            leading: CircleAvatar(
              backgroundImage: AssetImage(chat['profilePic']!),
            ),
            title: Text(
              chat['name']!,
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
            subtitle: Row(
              children: [
                Icon(
                  Icons.done_all,
                  color: Colors.white,
                  size: 16.0,
                ),
                SizedBox(width: 4.0),
                Text(
                  chat['message']!,
                  style: TextStyle(color: Colors.white),
                ),
              ],
            ),
            trailing: Text(
              chat['time']!,
              style: TextStyle(color: Colors.white),
            ),
          );
        },
      ),
    );
  }
}

//updates page
class UpdatesPage extends StatelessWidget {
  final List<Map<String, String>> myStatus = [
    {
      'time': 'Just now',
      'profilePic': 'assets/images/11.jpg',
    },
  ];
  
//STATUS
  final List<Map<String, String>> contactStatus = [
    {
      'name': 'Urooj',
      'time': 'Today, 10:00 AM',
      'profilePic': 'assets/images/4.jpg',
    },
    {
      'name': 'Areej',
      'time': 'Yesterday, 9:00 AM',
      'profilePic': 'assets/images/1.jpg',
    },
    {
      'name': 'Fariha',
      'time': 'Yesterday, 5:00 PM',
      'profilePic': 'assets/images/8.jpg',
    },
  ];

//channels
  final List<Map<String, String>> channels = [
    {
      'name': 'Tech Updates',
      'description': 'Latest tech news',
      'profilePic': 'assets/images/Technology.jpg',
    },
    {
      'name': 'Sports News',
      'description': 'Daily sports updates',
      'profilePic': 'assets/images/sports.jpg',
    },
    {
      'name': 'Art & Craft',
      'description': 'Top Art designs',
      'profilePic': 'assets/images/A&C.jpg',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      child: ListView(
        children: [
          ListTile(
            leading: CircleAvatar(
              backgroundImage: AssetImage(myStatus[0]['profilePic']!),
            ),
            title: Text(
              'My Status',
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
            subtitle: Text(
              myStatus[0]['time']!,
              style: TextStyle(color: Colors.white70),
            ),
          ),
          Divider(color: Colors.white54),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Recent Updates',
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ),
          ...contactStatus.map((status) {
            return ListTile(
              leading: CircleAvatar(
                backgroundImage: AssetImage(status['profilePic']!),
              ),
              title: Text(
                status['name']!,
                style: TextStyle(color: Colors.white),
              ),
              subtitle: Text(
                status['time']!,
                style: TextStyle(color: Colors.white70),
              ),
            );
          }).toList(),
          Divider(color: Colors.white54),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Channels',
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ),
          ...channels.map((channel) {
            return ListTile(
              leading: CircleAvatar(
                backgroundImage: AssetImage(channel['profilePic']!),
              ),
              title: Text(
                channel['name']!,
                style: TextStyle(color: Colors.white),
              ),
              subtitle: Text(
                channel['description']!,
                style: TextStyle(color: Colors.white70),
              ),
            );
          }).toList(),
        ],
      ),
    );
  }
}

//call page
class CallsPage extends StatelessWidget {
  final List<Map<String, String>> calls = [
    {
      'name': 'Urooj',
      'callType': 'Outgoing',
      'time': 'Today, 10:00 AM',
      'profilePic': 'assets/images/4.jpg',
    },
    {
      'name': 'Areej',
      'callType': 'Missed',
      'time': 'Today, 9:00 AM',
      'profilePic': 'assets/images/1.jpg',
    },
    {
      'name': 'Fariha',
      'callType': 'Incoming',
      'time': 'Yesterday, 5:00 PM',
      'profilePic': 'assets/images/8.jpg',
    },
    {
      'name': 'Alice',
      'callType': 'Outgoing',
      'time': 'Yesterday, 3:00 PM',
      'profilePic': 'assets/images/6.jpg',
    },
    {
      'name': 'Henry',
      'callType': 'Missed',
      'time': 'Yesterday, 1:00 PM',
      'profilePic': 'assets/images/3.jpg',
    },
    {
      'name': 'Charlie',
      'callType': 'Incoming',
      'time': 'Yesterday, 11:00 AM',
      'profilePic': 'assets/images/9.jpg',
    },
    {
      'name': 'Hamna',
      'callType': 'Outgoing',
      'time': 'Monday, 2:00 PM',
      'profilePic': 'assets/images/12.jpg',
    },
    {
      'name': 'Amelia',
      'callType': 'Missed',
      'time': 'Monday, 12:00 PM',
      'profilePic': 'assets/images/2.jpg',
    },
    {
      'name': 'Jenny',
      'callType': 'Incoming',
      'time': 'Monday, 10:00 AM',
      'profilePic': 'assets/images/10.jpg',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      child: ListView.builder(
        itemCount: calls.length,
        itemBuilder: (context, index) {
          final call = calls[index];
          return ListTile(
            leading: CircleAvatar(
              backgroundImage: AssetImage(call['profilePic']!),
            ),
            title: Text(
              call['name']!,
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
            subtitle: Row(
              children: [
                Icon(
                  call['callType'] == 'Outgoing'
                      ? Icons.call_made
                      : call['callType'] == 'Incoming'
                          ? Icons.call_received
                          : Icons.call_missed,
                  color:
                      call['callType'] == 'Missed' ? Colors.red : Colors.green,
                  size: 16.0,
                ),
                SizedBox(width: 4.0),
                Text(
                  call['time']!,
                  style: TextStyle(color: Colors.white),
                ),
              ],
            ),
            trailing: IconButton(
              icon: Icon(Icons.phone, color: Colors.green),
              onPressed: () {
                // Handle the phone icon press
              },
            ),
          );
        },
      ),
    );
  }
}
