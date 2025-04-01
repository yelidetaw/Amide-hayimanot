import 'package:flutter/material.dart';
import 'detail_page.dart';

class ListScreen extends StatelessWidget {
  final int id;
  ListScreen(this.id, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(getTitleForPage(id)), // Dynamically set the title
      ),
      body: ListView(children: getListItems(context, id)),
    );
  }

  String getTitleForPage(int id) {
    // Return different titles based on the `id`
    switch (id) {
      case 1:
        return 'የጌታችን ዝማሬዎች'; // Title for page 1
      case 2:
        return 'የእመቤታችን ዝማሬዎች'; // Title for page 2
      case 3:
        return 'የንሰሃ ዝማሬዎች'; // Title for page 3
      case 4:
        return 'የጥምቅትና የመስቀል ዝማሬዎች'; // Title for page 4
      case 5:
        return 'የቅዱሳን መላዕክት ዝማሬዎች'; // Title for page 5
      case 6:
        return 'የፃድቃንና የሰማዕታት ዝማሬዎች'; // Title for page 6
      default:
        return 'የሰርግ ዝማሬዎች'; // Default title
    }
  }

  List<Widget> getListItems(BuildContext context, int id) {
    if (id == 1) {
      List<String> titles = [
        'በዘባነ ኪሩብ',
        'ያላንተ ጌታ',
        'የሰማይ የምድር ጌታ',
        'ጉልበቴ እና ሀይሌ',
        'ቸርነትህ ነው',
        'አለብኝ ውለታ',
        'ገና እንዘምራለን',
        'ታላቅ ነህ እግዚአብሔር',
        'ቀና ቀና እንድል ታደርጋለህ',
        'ኦ ስሉስ ቅዱስ',
        'በደመናት ግሩም ነው',
        'አምነንህ ተነስተናል',
        'ወዶናልና',
        'ላገልግልህ ጌታ',
        'በመጨረሻ እንነሳለን',
        'በኪሩቤል ጀርባ',
        'ምስጉን ነው',
        'ስላሴ መታመኛዬ',
        'ወይኩን ፈቃድከ',
        'ቃልህን ሰምቼ',
        'በስመአብ ወወልድ',
        'ምስጋና ላቅርብ ለስላሴ',
        'ባለውለታዬ',
        'አንደበቴም ያውጣ',
        'እጹብ ድንቅ ነው',
        'የስላሴን መንበር',
        'ስላሴን አመስግኑ',
        'አንተ ግን አንተ ነህ',
        'ገደል በገድል ቤት',
        'የስላሴን መንበር',
        'እልል በሉ',
        'ድንቅ አድርጎልኛል',
        'አይኖቼ ማዳኑን',
        'ሳይገባን ጌታ',
      ];
      return titles.asMap().entries.map((entry) {
        int index = entry.key + 1;
        String title = entry.value;
        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder:
                    (context) => DetailPage(
                      title: title, // The title of the item
                      id: id, // The category ID (1, 2, 3, etc.)
                      itemId: index, // The specific item ID (1, 2, 3, etc.)
                    ),
              ),
            );
          },
          child: ListTile(title: Text('$index. $title')),
        );
      }).toList();
    } else if (id == 2) {
      List<String> titles = [
        'አንቺን የያዘ ሰው',
        'ስድቤን አርቀሽ',
        'የያሬድ ውብ ዜማ',
        'ማርያም አርጋለች',
        'አለፍኩት ድንግል',
        'የፍቅር እናት',
        'ለተጠማ ውሻ',
        'እመቤቴ ምርኩዝ እረዳቴ',
        'ውበት ነሽ',
        'ስምሽን ቢጠሩ የማትጠገቢ',
        'የሲሎንዲስ ጥበብ',
        'ቢያበሉኝ ቢያጠጡኝ',
        'ዕርስታችን ነሽ',
        'ድንግል ተወለደች',
        'ኪዳነ ምህረት እናቴ',
        'ስምሽን ለልጅ ልጅ',
        'ጽርሃ አርያም',
        'ስለረዳሽኝ እመቤቴ',
        'ደጅሽ ላይ ቆሜ',
        'በታምርኪ ተፈስሀ',
        'መራራ ህይወቴ',
        'መሐረኒ ድንግል',
        'ወደ ቀድሞ ነገር እንመለስ',
        'ሐረገ ወይን ነሽ ድንግል',
        'ድንግል በድንግልና',
        'ድንግል ፈጣሪዎን',
        'ቋንቋዬ ነሽ ድንግል',
        'እንደ ኤልሳቤት',
        'ዮም ፍሰሀኮነ',
        'ትህትናሽ ግሩም ነው',
        'እመአምላክ ሙሽራ ነሽ',
        'ሰላም እለኪ እያለ',
        'በሐጥያት ያደፈ',
        'አስታርቂኝ',
        'ለምኚ ድንግል ለምኚ',
        'የቀደሙ አባቶች ምሳሌ',
        'አዘክሪ ድንግል',
        'ዘውትር ሲከፋኝ',
      ];
      return titles.asMap().entries.map((entry) {
        int index = entry.key + 1;
        String title = entry.value;
        return GestureDetector(
          // Navigate to the DetailPage when tapped
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder:
                    (context) => DetailPage(
                      title: title, // The title of the item
                      id: id, // The category ID (1, 2, 3, etc.)
                      itemId: index, // The specific item ID (1, 2, 3, etc.)
                    ),
              ),
            );
          },
          child: ListTile(title: Text('$index. $title')),
        );
      }).toList();
    } else if (id == 3) {
      List<String> titles = [
        'የሐሰት ዳኝነት ',
        ' አምስቱን ሀዘናት',
        'ኢትዮጲያ እጅሽን ዘርጊ',
        'ዘጠኝ ሰአት ሲሖን',
        ' እኔስ በምግባሬ ',
        'የልቤን በልቤ ይዤ',
        ' እመቤቴ ማርያም',
        ' እግዚአብሔር መልካም ነው',
        ' ለመዳኑ ህይወት',
        ' መከራው ክርስትናዬን አጠፋው',
        ' በእያሪኮ መንገድ',
        ' በእፀመስቀል ላይ',
        ' ኑ እንቅረብ',
        ' አልፋ እና ኦሜጋ',
        'አቤቱ ደግ ሰው',
        'ከንቱ ነኝ',
        'ዋ ለነብሴ',
        'ያ ደሀ ተጣራ',
        'ድንግል ማርያም ብዬ',
        'ድንግል ትንሳኤሽን',
        'ጊዜዬ እስኪደርስ',
        'የሲና ሀመልማል',
        'ይቅር ስላልከኝ ነው',
        'ድንግል የዚያን ጊዜ',
        'ጌታ ሆይ አይሁድ',
        'ኦ የማይሞተው ሞተ',
        'በስራዬ የት ይሆን መግቢያዬ',
        'መቼ ነው ጌታ',
        'እመአምላክ አስቢኝ',
        'ሀጢአቴ በዛ እመቤቴ',
        'ሰው ለሰው',
        'አጽናኚኝ እመአምላክ',
        'አልፋ እና ኦሜጋ',
        'አቤቱ ደግ ሰው',
        'በኢየሩሳሌም',
        'አምላክ ሆይ ወደ እኛ ባትመጣ',
        'ምድረ ቀራንዮ',
        'በጌቴ ሴማኒ',
        'ኦ የማይሞተው ሞተ',
        'ተይ ተመከሪ',
        'ጌታ መታመኛዬ',
        'ድንግል ሆይ ጠብቂኝ',
        'ልመናዬን ስማኝ',
        'በመከራ ጽና',
        'አለምን ለማዳን',
        'የኛ ምርኩዝ',
        'አቤቱ የዚያን ጊዜ',
        'ወደ እግርሽ ጫማ',
        'እንደበደሌማ ከሆነ ቅጣቴ',
        'አማናዊት ኪዳን',
        'የተናኩኝ ነበርኩ',
        'ታናሽ ሆኜ ልኑር',
        'የብርሀን እናት ነሽና',
        'እመቤታችን ምን ሖናለች',
        'ጌታ ሆይ ውለታህ',
        'የጥበብ ሀገሯ',
        'እጠብቅሀለው ደጅ ላይ ቆሜ',
        'አቤቱ የሆነብንን አስብ',
        'አንድ አድርገን',
        'ሀዋርያቲሁ',
        'ወይን እኮ የላቸውም',
        'የሁሉ አይን',
        'ወደ እኔ ተመልከት',
        'በሰማያት ከበረ',
        'መአዛሽ ያውዳል',
        'ጌታ ብርሀኔ እና መድኃኒቴ ነው',
        'እጠበኝ ቆሽሻለው',
        'ለምን ጠላህኝ',
        'ቃልኪዳን ግቢልኝ',
        'እኔ እሆንን',
      ];
      return titles.asMap().entries.map((entry) {
        int index = entry.key + 1;
        String title = entry.value;
        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder:
                    (context) => DetailPage(
                      title: title, // The title of the item
                      id: id, // The category ID (1, 2, 3, etc.)
                      itemId: index, // The specific item ID (1, 2, 3, etc.)
                    ),
              ),
            );
          },
          child: ListTile(title: Text('$index. $title')),
        );
      }).toList();
    } else if (id == 4) {
      List<String> titles = ['አምስተኛ ርዕስ', 'ስድስተኛ ርዕስ'];
      return titles.asMap().entries.map((entry) {
        int index = entry.key + 1;
        String title = entry.value;
        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder:
                    (context) => DetailPage(
                      title: title, // The title of the item
                      id: id, // The category ID (1, 2, 3, etc.)
                      itemId: index, // The specific item ID (1, 2, 3, etc.)
                    ),
              ),
            );
          },
          child: ListTile(title: Text('$index. $title')),
        );
      }).toList();
    } else if (id == 5) {
      List<String> titles = [
        'ድረስ ሚካኤል',
        'ሊረዳኝ መጣ ሀያል ሚካኤል',
        'ሚካኤል ይበልጣል ክብሩ',
        'ገብርኤል ገብርኤል ስለው ሰምቶ',
        'ባህራንኒ ይቤ',
        'ገብርኤል ነው አምላክ',
        'በሰማይ ሰልፍ ሆነ',
      ];
      return titles.asMap().entries.map((entry) {
        int index = entry.key + 1;
        String title = entry.value;
        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder:
                    (context) => DetailPage(
                      title: title, // The title of the item
                      id: id, // The category ID (1, 2, 3, etc.)
                      itemId: index, // The specific item ID (1, 2, 3, etc.)
                    ),
              ),
            );
          },
          child: ListTile(title: Text('$index. $title')),
        );
      }).toList();
    } else if (id == 6) {
      List<String> titles = [
        'ጻድቃን ሰማዕታት በሙሉ',
        'አብነ ሀራ ምስራቃዊ',
        'አብነ ሀራ ድንግል',
        'የእውነት አማላጅ',
        'ተክለሀይማኖት(ልጅህ ስለሆንኩኝ',
        'አትታደስም',
        'ተክለሀይማኖት ጸሀይ',
        'ፈጥነ ቅረበን ጊዮርጊስ',
        'የክብርን ዘውድ ጭኖ',
        'መርቆርዮስ',
        'የኢቲስ አንበሳ',
        'ተክለሀይማኖት',
        'ገድሉ ታምራቱ',
        'አባ አባ ተክለሀይማኖት',
      ];
      return titles.asMap().entries.map((entry) {
        int index = entry.key + 1;
        String title = entry.value;
        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder:
                    (context) => DetailPage(
                      title: title, // The title of the item
                      id: id, // The category ID (1, 2, 3, etc.)
                      itemId: index, // The specific item ID (1, 2, 3, etc.)
                    ),
              ),
            );
          },
          child: ListTile(title: Text('$index. $title')),
        );
      }).toList();
    } else if (id == 7) {
      List<String> titles = ['ሰባተኛ ርዕስ', 'ስምንተኛ ርዕስ'];
      return titles.asMap().entries.map((entry) {
        int index = entry.key + 1;
        String title = entry.value;
        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder:
                    (context) => DetailPage(
                      title: title, // The title of the item
                      id: id, // The category ID (1, 2, 3, etc.)
                      itemId: index, // The specific item ID (1, 2, 3, etc.)
                    ),
              ),
            );
          },
          child: ListTile(title: Text('$index. $title')),
        );
      }).toList();
    } else if (id == 8) {
      List<String> titles = ['ስምንተኛ ርዕስ', 'ዘጠነኛ ርዕስ'];
      return titles.asMap().entries.map((entry) {
        int index = entry.key + 1;
        String title = entry.value;
        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder:
                    (context) => DetailPage(
                      title: title, // The title of the item
                      id: id, // The category ID (1, 2, 3, etc.)
                      itemId: index, // The specific item ID (1, 2, 3, etc.)
                    ),
              ),
            );
          },
          child: ListTile(title: Text('$index. $title')),
        );
      }).toList();
    } else if (id == 9) {
      List<String> titles = ['ዘጠነኛ ርዕስ', 'አስር ርዕስ'];
      return titles.asMap().entries.map((entry) {
        int index = entry.key + 1;
        String title = entry.value;
        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder:
                    (context) => DetailPage(
                      title: title, // The title of the item
                      id: id, // The category ID (1, 2, 3, etc.)
                      itemId: index, // The specific item ID (1, 2, 3, etc.)
                    ),
              ),
            );
          },
          child: ListTile(title: Text('$index. $title')),
        );
      }).toList();
    } else if (id == 10) {
      List<String> titles = ['አስር ርዕስ', 'ሌላ የሚጨምር'];
      return titles.asMap().entries.map((entry) {
        int index = entry.key + 1;
        String title = entry.value;
        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder:
                    (context) => DetailPage(
                      title: title, // The title of the item
                      id: id, // The category ID (1, 2, 3, etc.)
                      itemId: index, // The specific item ID (1, 2, 3, etc.)
                    ),
              ),
            );
          },
          child: ListTile(title: Text('$index. $title')),
        );
      }).toList();
    } else {
      return [];
    }
  }
}
