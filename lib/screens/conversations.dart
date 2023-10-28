import 'package:flutter/material.dart';

class Conversations extends StatefulWidget {
  @override
  _ConversationsState createState() => _ConversationsState();
}

class _ConversationsState extends State<Conversations> {
  TextEditingController _searchController = TextEditingController();

  List<Map<String, dynamic>> storyList = [
    {
      "name": "Novac",
      "imageUrl": "https://randomuser.me/api/portraits/men/31.jpg",
      "isOnline": true,
      "hasStory": true,
    },
    {
      "name": "Derick",
      "imageUrl": "https://randomuser.me/api/portraits/men/81.jpg",
      "isOnline": false,
      "hasStory": false,
    },
    {
      "name": "Mevis",
      "imageUrl": "https://randomuser.me/api/portraits/women/49.jpg",
      "isOnline": true,
      "hasStory": false,
    },
    {
      "name": "Emmanual",
      "imageUrl": "https://randomuser.me/api/portraits/men/35.jpg",
      "isOnline": true,
      "hasStory": true,
    },
    {
      "name": "Gracy",
      "imageUrl": "https://randomuser.me/api/portraits/women/56.jpg",
      "isOnline": false,
      "hasStory": false,
    },
    {
      "name": "Robert",
      "imageUrl": "https://randomuser.me/api/portraits/men/36.jpg",
      "isOnline": false,
      "hasStory": true,
    }
  ];

  List<Map<String, dynamic>> conversationList = [
    {
      "name": "Novac",
      "imageUrl": "https://randomuser.me/api/portraits/men/31.jpg",
      "isOnline": true,
      "hasStory": true,
      "message": "Where are you?",
      "time": "5:00 pm"
    },
    {
      "name": "Derick",
      "imageUrl": "https://randomuser.me/api/portraits/men/81.jpg",
      "isOnline": false,
      "hasStory": false,
      "message": "It's good!!",
      "time": "7:00 am"
    },
    {
      "name": "Mevis",
      "imageUrl": "https://randomuser.me/api/portraits/women/49.jpg",
      "isOnline": true,
      "hasStory": false,
      "message": "I love You too!",
      "time": "6:50 am"
    },
    {
      "name": "Emannual",
      "imageUrl": "https://randomuser.me/api/portraits/men/35.jpg",
      "isOnline": true,
      "hasStory": true,
      "message": "Got to go!! Bye!!",
      "time": "yesterday"
    },
    {
      "name": "Gracy",
      "imageUrl": "https://randomuser.me/api/portraits/women/56.jpg",
      "isOnline": false,
      "hasStory": false,
      "message": "Sorry, I forgot!",
      "time": "2nd Feb"
    },
    {
      "name": "Robert",
      "imageUrl": "https://randomuser.me/api/portraits/men/36.jpg",
      "isOnline": false,
      "hasStory": true,
      "message": "No, I won't go!",
      "time": "28th Jan"
    },
    {
      "name": "Lucy",
      "imageUrl": "https://randomuser.me/api/portraits/women/56.jpg",
      "isOnline": false,
      "hasStory": false,
      "message": "Hahahahahaha",
      "time": "25th Jan"
    },
    {
      "name": "Emma",
      "imageUrl": "https://randomuser.me/api/portraits/women/56.jpg",
      "isOnline": false,
      "hasStory": false,
      "message": "Been a while!",
      "time": "15th Jan"
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.only(left: 20, right: 20, top: 15),
          child: ListView(
            children: [
              _buildAppBar(),
              SizedBox(height: 15),
              _buildSearchBar(),
              SizedBox(height: 20),
              _stories(),
              SizedBox(height: 20),
              ...List.generate(
                  conversationList.length,
                  (index) =>
                      _buildConversationItem(index)), // display conversations
            ],
          ),
        ),
      ),
    );
  }

  // Widget for the App Bar.
  Widget _buildAppBar() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
              image: NetworkImage(
                  "https://randomuser.me/api/portraits/men/11.jpg"),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Text("Chats",
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
        Icon(Icons.edit),
      ],
    );
  }

  // Widget for the search bar.
  Widget _buildSearchBar() {
    return Container(
      width: double.infinity,
      height: 40,
      decoration: BoxDecoration(
        color: Color(0xFFe9eaec),
        borderRadius: BorderRadius.circular(15),
      ),
      child: TextField(
        cursorColor: Color(0xFF000000),
        controller: _searchController,
        decoration: InputDecoration(
          prefixIcon:
              Icon(Icons.search, color: Color(0xFF000000).withOpacity(0.5)),
          hintText: "Search",
          border: InputBorder.none,
        ),
      ),
    );
  }

  // Widget for stories.
  Widget _stories() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          Padding(
            padding: EdgeInsets.only(right: 20),
            child: Column(
              children: [
                Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle, color: Color(0xFFe9eaec)),
                  child: Center(child: Icon(Icons.add, size: 33)),
                ),
                SizedBox(height: 10),
                SizedBox(
                  width: 75,
                  child: Align(
                      child:
                          Text('Your Story', overflow: TextOverflow.ellipsis)),
                ),
              ],
            ),
          ),
          // Renders story items based on sample data.
          Row(
            children: List.generate(
                storyList.length, (index) => _buildStoryItem(index)),
          ),
        ],
      ),
    );
  }

  // Helper function to build individual story items.
  Widget _buildStoryItem(int index) {
    return Padding(
      padding: const EdgeInsets.only(right: 20),
      child: Column(
        children: [
          Container(
            width: 60,
            height: 60,
            child: Stack(
              children: [
                storyList[index]['hasStory']
                    ? Container(
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border:
                                Border.all(color: Colors.blueAccent, width: 3)),
                        child: Padding(
                          padding: const EdgeInsets.all(3.0),
                          child: Container(
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                    image: NetworkImage(
                                        storyList[index]['imageUrl']),
                                    fit: BoxFit.cover)),
                          ),
                        ),
                      )
                    : Container(
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                                image:
                                    NetworkImage(storyList[index]['imageUrl']),
                                fit: BoxFit.cover)),
                      ),
                storyList[index]['isOnline']
                    ? Positioned(
                        top: 38,
                        left: 42,
                        child: Container(
                          width: 20,
                          height: 20,
                          decoration: BoxDecoration(
                              color: Color(0xFF66BB6A),
                              shape: BoxShape.circle,
                              border: Border.all(
                                  color: Color(0xFFFFFFFF), width: 3)),
                        ),
                      )
                    : Container()
              ],
            ),
          ),
          SizedBox(height: 10),
          SizedBox(
            width: 75,
            child: Align(
              child: Text(storyList[index]['name'],
                  overflow: TextOverflow.ellipsis),
            ),
          ),
        ],
      ),
    );
  }

// Creates a list tile for each conversation item.
  Widget _buildConversationItem(int index) {
    return ListTile(
      leading: CircleAvatar(
        backgroundImage: NetworkImage(conversationList[index]['imageUrl']),
      ),
      title: Text(conversationList[index]['name']),
      subtitle: Text(conversationList[index]['message']),
      trailing: Text(conversationList[index]['time']),
    );
  }
}
