import 'package:flutter/material.dart';
import 'package:amidehayimanot/list.dart';
import 'package:amidehayimanot/aboutus.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: HomePage());
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var currentPage = DrawerSections.dashbord;

  // Helper method to map index to content ID
  int _getContentIdFromIndex(int index) {
    return index + 1; // Simple mapping (1-10)
  }

  // Helper method to get category name
  String _getCategoryName(int index) {
    final names = [
      "የጌታችን",
      "የእመቤታችን",
      "የንስሐ",
      "ጥምቅትና መስቀል",
      "የመላዕክት",
      "ፃድቃንና ሰማዕታት",
      "የሰርግ",
      "ቅዱሳን",
      "ምስጋና",
      "ዜማ",
    ];
    return index < names.length ? names[index] : "Category ${index + 1}";
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final screenWidth = mediaQuery.size.width;
    final screenHeight = mediaQuery.size.height;

    // Calculate responsive font sizes
    final double titleFontSize = screenWidth * 0.03;
    final double categoryFontSize = screenWidth * 0.028;
    final double hintFontSize = screenWidth * 0.032;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0, // Remove shadow
        title: Container(
          height: 40,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(30),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 8,
                offset: Offset(0, 2),
              ),
            ],
          ),
          child: TextField(
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,
              hintText: 'Search ...',
              hintStyle: TextStyle(
                color: Colors.grey.shade500,
                fontSize: hintFontSize,
                fontStyle: FontStyle.italic,
              ),
              prefixIcon: Icon(
                Icons.search_rounded,
                color: Colors.grey.shade600,
                size: 22,
              ),
              suffixIcon: IconButton(
                icon: Icon(
                  Icons.brightness_4_sharp,
                  color: Colors.grey.shade600,
                  size: 20,
                ),
                onPressed: () {
                  // Add theme toggle functionality
                },
              ),
              border: InputBorder.none,
              contentPadding: EdgeInsets.symmetric(vertical: 10),
            ),
            style: TextStyle(
              color: Colors.black87,
              fontSize: hintFontSize * 0.9,
            ),
          ),
        ),
        actions: [
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Aboutus()),
              );
            },
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: SizedBox(
                width: 35,
                height: 35,
                child: CircleAvatar(
                  backgroundImage: AssetImage('assets/image/amide.png'),
                ),
              ),
            ),
          ),
        ],
      ),
      body: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.fromLTRB(20, 40, 20, 0),
            child: Image(
              image: AssetImage('assets/image/ch-1.png'),
              width: double.infinity,
              height: screenHeight * 0.2,
              fit: BoxFit.fitWidth,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Text(
              'የጅማ ደብረ ኤፍራታ ቅድስት ድንግል ማርያም ካቴድራል ዓምደ ሃይማኖት ሰንበት ትምህርት ቤት',
              textAlign: TextAlign.start,
              style: TextStyle(
                fontSize: titleFontSize,
                color: const Color(0xFF2B042B),
              ),
            ),
          ),
          InkWell(
            onTap: () {},
            child: Container(
              padding: EdgeInsets.only(top: 25.0),
              margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: List.generate(
                    10,
                    (index) => Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder:
                                    (context) => ListScreen(
                                      _getContentIdFromIndex(index),
                                    ),
                              ),
                            );
                          },
                          child: Container(
                            margin: EdgeInsets.symmetric(horizontal: 8),
                            child: Image(
                              image: AssetImage('assets/image/amide.png'),
                              width: screenWidth * 0.18,
                              height: screenWidth * 0.18,
                            ),
                          ),
                        ),
                        SizedBox(height: 5),
                        Text(
                          _getCategoryName(index),
                          style: TextStyle(fontSize: categoryFontSize),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          Container(
            child: Text(
              'yegetachin',
              style: TextStyle(fontSize: categoryFontSize),
            ),
          ),
        ],
      ),
      drawer: Drawer(
        child: SingleChildScrollView(
          child: Column(children: [MyHeaderDrawer(), MyDrawerList()]),
        ),
      ),
    );
  }

  Widget MyDrawerList() {
    // final screenWidth = MediaQuery.of(context).size.width;
    // final drawerItemFontSize = screenWidth * 0.035;

    return Container(
      color: const Color(0xFF2B042B),
      padding: EdgeInsets.only(top: 15),
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            menuItem(1, " የጌታችን ዝማሬዎች", currentPage == DrawerSections.dashbord),
            menuItem(
              2,
              " የእመቤታችን ዝማሬዎች",
              currentPage == DrawerSections.contacts,
            ),
            menuItem(3, "የንሰሃ ዝማሬዎች", currentPage == DrawerSections.add),
            menuItem(
              4,
              "የጥምቅትና የመስቀል ዝማሬዎች",
              currentPage == DrawerSections.notes,
            ),
            menuItem(
              5,
              "የቅዱሳን መላዕክት ዝማሬዎች",
              currentPage == DrawerSections.settings,
            ),
            menuItem(
              6,
              " የፃድቃንና የሰማዕታት ዝማሬዎች",
              currentPage == DrawerSections.notifications,
            ),
            menuItem(
              7,
              "የሰርግ ዝማሬዎች",
              currentPage == DrawerSections.privacy_policy,
            ),
          ],
        ),
      ),
    );
  }

  Widget menuItem(int id, String title, bool selected) {
    final screenWidth = MediaQuery.of(context).size.width;
    final drawerItemFontSize = screenWidth * 0.035;

    return Material(
      color: selected ? Colors.grey[300] : Colors.transparent,
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ListScreen(id)),
          );
          setState(() {
            switch (id) {
              case 1:
                currentPage = DrawerSections.dashbord;
                break;
              case 2:
                currentPage = DrawerSections.contacts;
                break;
              case 3:
                currentPage = DrawerSections.add;
                break;
              case 4:
                currentPage = DrawerSections.notes;
                break;
              case 5:
                currentPage = DrawerSections.settings;
                break;
              case 6:
                currentPage = DrawerSections.notifications;
                break;
              case 7:
                currentPage = DrawerSections.privacy_policy;
                break;
            }
          });
        },
        child: Padding(
          padding: EdgeInsets.all(15.0),
          child: Row(
            children: [
              Expanded(
                child: Icon(
                  Icons.church,
                  color: const Color.fromARGB(255, 88, 89, 141),
                ),
              ),
              Expanded(
                flex: 3,
                child: Text(
                  title,
                  style: TextStyle(
                    color: const Color(0xFFF3BD46),
                    fontSize: drawerItemFontSize,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

enum DrawerSections {
  dashbord,
  contacts,
  add,
  notes,
  settings,
  notifications,
  privacy_policy,
  send_feedback,
}

class MyHeaderDrawer extends StatefulWidget {
  @override
  _MyHeaderDrawerState createState() => _MyHeaderDrawerState();
}

class _MyHeaderDrawerState extends State<MyHeaderDrawer> {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/image/ch-4.jpg'),
          fit: BoxFit.fitWidth,
        ),
      ),
      width: double.infinity,
      height: screenWidth * 0.5,
      padding: EdgeInsets.only(top: 20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: screenWidth * 0.2,
              height: screenWidth * 0.2,
              margin: EdgeInsets.only(bottom: 10),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/image/amide.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
