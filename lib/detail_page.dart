import 'package:flutter/material.dart';

class DetailPage extends StatefulWidget {
  final String title;
  final int id;
  final int itemId;

  const DetailPage({
    required this.title,
    required this.id,
    required this.itemId,
    Key? key,
  }) : super(key: key);

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  double _baseFontSize = 16.0; // Will be initialized based on screen size
  double _currentScale = 1.0;
  double _minScale = 0.8;
  double _maxScale = 3.0;

  // Content database (simplified example)
  final Map<int, Map<int, String>> _contentDatabase = {
    1: {
      1: """
በዘባነ ኪሩብ

በዘባነ ኪሩብ ለሚቀመጠው
በእሳት ድንጋዮች ቅጥሩን ላጠረው
ዘምሩ ለእግዚአብሔር ለጌታ ዘምሩ
የተከበረ ነው በሰማይ በምድሩ/2/
አ.ዝ-----------
ኢሳያስ ሲያየው እጅግ አፈረ
የተፈራ ነው የተከበረ
የሰማይ ደጆች ተንቀጠቀጡ
ለቅዱስ ስሙ ክብርን ሲሰጡ
አ.ዝ--------
ያልተቀደሰ ለምጽ ያነደደው
እንዴት ይችላል ሊያመሰግነው
በል ፍቀድልኝ ፍቅር ነህና
ልግባ መቅደስህ ላቅርብ ምስጋና
አ.ዝ----------
ዙፋንህ ታየኝ ትምክህቴ ሆይ
ስትመሰገን በሰማይ ላይ
ሲያመሰግንህ ያልተደሰተ
ባይተዋር አልሁን አልውጣ ካንተ
አ.ዝ-----------
ቅኔ የሞላበት ያን ስገነት
ልቀላቀለው ተመኘው በእውነት
ልዘምርልህ ባይገባኝም
ዝም የሚል ልሳን አልሰጠኽኝም

✨ዘማሪ ሊቀ መዘምራን ቴዎድሮስ ዮሴፍ""",

      2: '''
ያላንተ ጌታ ደስታ መች አለ
ያላንተ አምላኬ ህይወት መች አለ 
ስምህን ጠርቶ የተማጸነ
ከእሳቱም ወጣ ከሞትም ዳነ

አዝ

እጆቼን ይዘህ አንተ እየመራ
ስንቱን አለፍኩት ስንቱን መከራ
ለካስ ሲያልፍ ቀን ሁሉም ይረሳል
ረሀብ ስደቱን ማን ያስታውሳል

አዝ

ፅዋዬን ባርከህ ተትረፈረፈ
የጠላቴም ጦር በላይ አለፈ
በሺ ቃላቶች አፌን ሞልቼ
ልዘምርልህ ጉያህ ገብቼ

አዝ

ገዳዬ ቢሮጥ በቀን በማታ
እያለ አንድዬ እያለ ጌታ
ለሞት አልተኛም ይደነቅ አለም
ተክሎኛልና ለዘለአለም

አዝ

ምስጋና ሆኖ ምግቤ መጠጤ
ተቀጣጠለ ፍቅርህ በውስጤ
አላቀረቅር አልደፋ አንገቴን
እሞላዋለው በእልልታ ቤቴን

አዝ

ምስጋና ሆኖ ምግቤ መጠጤ
ተቀጣጠለ ፍቅርህ በውስጤ
አላቀረቅር አልደፋ አንገቴን
እሞላዋለው በእልልታ ቤቴን''',

      3: '''
የሰማይም የምድርም ጌታ
በዝቶልናል እጅግ ስጦታ
በጎነትህ ቸርነትህ
እረድቶናል ክቡር ስምህ

በማይዝሉ ጽኑ ክንዶችህ
ተደገፍን በቸርነትህ
የፍቅር አባት ላመኑህ ጥላ
ክርስቶስ ነህ የእኛ ከለላ

ፍፁም ቆምን በንጹህ ደምህ
ተፈወስን በቅዱስ ቃልህ
መዛል ድካም ከቶ አይነካንም
ኃይላችን ነው ሁሌም የአንተን ስም

ያጣው ሲጮኽ ፊትህ ተደፍቶ
ሲያማክርህ ምስጢሩን ገልጦ
አባት ለልጁ እንደሚራራ
አወጣህን ከሙታን ሥፍራ

ምስክር ነን ለዓለም ሁሉ
ስላዳነን በሕያው ቃሉ
ለውለታው ምላሽ ባይኖርም
ከምስጋና ከቶ አንቦዝንም

ሊቀ ልሳናት ቸርነት ሰናይ ''',
      4: '''
ጉልበቴ ና ሀይሌ ያደረኩት
ህይወቴን አደራ የሰጠሁት
ለእግዚአብሔር ብቻ ነው ለጌታዬ
ከእርሱ ጋር መኖር ነው አላማዬ


እንደ ሚስኪን ሆኖ ከእኔ ጋር የሚያድር
አልብሶኛል ፍቅሩን በደሌን ሳይዘክር
ሳይነጥፍ አጠጣኝ ከምንጩ እየቀዳ
ተማረብኝ ነፍሴ ምህረቱን ወዳ


የማይቆረቁረኝ እርሱ ነው ምቾቴ
ወዶ የቀረበኝ ሳይገባው ሀጥያቴ
በቁስሌ ላይ ዘይት አፍስሶ የሚያክመኝ
እግዚአብሔር ብቻ ነው ለእኔስ የሚሻለኝ


ታላላቅ ሸክሜን ሳይዝል የሚሸከም
ከአምላኬ በስተቀር በዙሪያዬ የለም
የህይወት ዘር አድርጎ ደጅ ከተከለኝ
እኔን ከእቅፍ የለም የሚለየኝ


ረሀብ ጥማት ከቶ በሌለበት
መኖር ነው ምኞቴ በሰራልኝ እረፍት
ቅርጫፍ አድርጎ አጣበቀኝ ክንድ
ሰላሜ ነው ለኔ የውዴ መንገድ ''',

      5: '''

ቸርነትህ ነው ያደረሰኝ እስከዛሬ 
ቸርነትህ ነው የጠበቀኝ እስከዛሬ
ላመስግንህ የኔ ጌታ በዝማሬ(2)

መክሊቴንም ቀብሬ ባሳዝንህ 
መብራቴንም ይዤ ባልጠብቅህ 
በታላቅ ይቅርታ እንዳትረሳኝ
በፍቅር ጎብኝተህ ከሞት አውጣኝ
ከቤትህ እርቄ መች ጠገብኩኝ 
በረሐብ በእርዛት ተቸገርኩኝ
አምናለሁ አምላኬ እንድትምረኝ
ለይቅርታ መጣሁ ይቅር በለኝ

አንዳች እንደሌለኝ አውቀዋለሁ
ባንተ ቸርነት ግን እመካለሁ
የከበደው ሸክሜ ይቀለኛል
ይቅርታ ለባርያህ ይደርሰኛል
በመቅደስህ ቆሜ ለመዘመር
ስራህን ለትውልድ ለመመስከር
እኔ ማነኝ ብዬ አስባለሁ
አምላክ ቸርነትህን አደንቃለሁ

በሰው እጅ መመካት አቁሚያለሁ
እረዳቴ አንተ ነህ አውቄያለሁ
አንተ ከጠበከኝ በህይወቴ
ቅጥሬ አይደፈርም መድኃኒቴ
የኔን ሰራ ተወው ተግባሬንም
የመስቀሉን ነገር መርሳቴንም
አዚሜን አንሰተህ አንተን ልይህ
እየሱስ ክርስቶስ አምላኬ ነህ ''',

      6: '''
መክፈል የማልችለው አለብኝ ውለታ
ተነግሮ የማያልቅ አለብኝ ውለታ
አምላክ ተመስገን የኔ ጌታ
ይችው ነች አቅሜ ለስጦታ

በዘመኔ ሁሉ የደገፍከኝ በእጆችህ
ጌታ ዘርዝሬ  አልጨርሰው ውለታህ
ምስኪን ባሪያህ ለውለታህ አሁን ምን እከፍላለሁ
ሌላ አትሻም አንተ የአቅሜን  ይኸው አመሰግናለሁ

ስናቅ እንዳልነበር እኔ በሰዎች ተጥዬ 
ከውድቀቴ  አንስተህ  ሰው  አረከኝ ቸር ጌታዬ
ነፍሴ ለውለታህ በምስጋና ተሞልታለች
ጠዋት ማታ ስምህን  እያነሳች ታመሰግናለች

ነፍሴ መሸሸጊያ አጥታ አንተ ስላየሀት
ከለምለም ውስጥ ወስደህ ጌታ አሳረፍካት
የከበዳት ሸክም ቀሎ በአንተ እረፍት አገኘች
ይኸው በሰዎች ፊት የአንተን ክብር ትመሰክራለች
 
አይቸኩልም እግዚአብሔር ለሱ አለው ጊዜ
ሲጠሩት ይሰማል ደግሞ ያወጣል ከትካዜ
የጽድቅንም መንገድ እያሳየ ይመራናል
ወደ ህይወት መንገድ እረኛችን ወስዶ ያሳርፈናል

ሊቀ ልሳናት ቸርነት ሰናይ
''',
      7: '''

ገና እንዘምራለን/4x/ 
እንደ መላዕክቱ ብርሀንን ለብሰን ገና እንዘምራለን



ወላዲተ አምላክን ከፊት አስቀድመን
በዳዊት በገና መሰንቆ ታጅበን
ለስላሴ ክብር ገና እንዘምራለን


በምስጋና ስራ ከሰለጠኑት ጋር
ልብን የሚያስደስት መዝሙር እየዘመርን
ያልተሰማ ዜማ ያልታየ ምስጋና
ይፈልቃል አይቀርም ከእኛ ልቦና  
ገና እንዘምራለን



በትቢትም ሳይሆን በታላቅ ትህትና
በልዩ ተመስጦ በፍቅር በልቦና
ስራችን ይሆናል ለአምላክ ምስጋና 
ገና እንዘምራለን


ዳዊት በተመስጦ እርቃኑን ቢሆንም
ሜልኮል በዝማሬ ብትስቅበትም
አምላክ ወደደ እንዲያመሰግነው
በደስታ እንዳይዘምር ከልካዩ ሰው ማነው 
ገና እንዘምራለን''',
    },
  };

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      // Initialize base font size after first build
      setState(() {
        _baseFontSize = MediaQuery.of(context).size.width * 0.045;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    // Calculate current font size
    final currentFontSize = _baseFontSize * _currentScale;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.title,
          style: TextStyle(
            fontSize: screenWidth * 0.05, // Responsive app bar title
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.zoom_out_map),
            tooltip: 'Reset zoom',
            onPressed: () => setState(() => _currentScale = 1.0),
          ),
        ],
      ),
      body: GestureDetector(
        onScaleStart: (details) {
          // Store initial scale when gesture begins
        },
        onScaleUpdate: (details) {
          setState(() {
            _currentScale = (_currentScale * details.scale).clamp(
              _minScale,
              _maxScale,
            );
          });
        },
        child: SingleChildScrollView(
          padding: EdgeInsets.all(screenWidth * 0.04), // Responsive padding
          child: Text(
            _contentDatabase[widget.id]?[widget.itemId] ?? "Content not found",
            style: TextStyle(
              fontSize: currentFontSize,
              height: 1.6, // Optimal line spacing
            ),
            // textAlign: TextAlign.center,
            strutStyle: StrutStyle(
              fontSize: currentFontSize,
              height: 1.2,
              leading: 0.5,
            ),
          ),
        ),
      ),
    );
  }
}
