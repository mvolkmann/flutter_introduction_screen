import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show SystemChrome, SystemUiOverlayStyle;
import 'package:introduction_screen/introduction_screen.dart';

const title = 'My App';

void main() {
  // Make the status bar background transparent so the background color
  // of the onboarding pages will also appear in the status bar
  // without being shaded.
  SystemChrome.setSystemUIOverlayStyle(
    // We are using dark instead of light so the text
    // on the status bar will be gray instead of white.
    SystemUiOverlayStyle.dark.copyWith(statusBarColor: Colors.transparent),
  );

  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Onboarding(),
      theme: ThemeData(primarySwatch: Colors.blue),
      title: title,
    ),
  );
}

class PageData {
  final String body;
  final String imagePath;
  final String title;

  const PageData({
    required this.body,
    required this.imagePath,
    required this.title,
  });
}

class Onboarding extends StatelessWidget {
  Onboarding({Key? key}) : super(key: key);

  final pages = [
    PageData(
      title: 'Maisey',
      body: 'This is a Treeing Walker Coonhound.',
      imagePath: 'assets/images/treeing-walker-coonhound.jpg',
    ),
    PageData(
      title: 'Ramsay',
      body: 'This is a Native American Indian Dog.',
      imagePath: 'assets/images/native-american-indian-dog.jpg',
    ),
    PageData(
      title: 'Oscar',
      body: 'This is a German Shorthaired Pointer.',
      imagePath: 'assets/images/german-shorthaired-pointer.jpg',
    ),
    PageData(
      title: 'Comet',
      body: 'This is a Wippet.',
      imagePath: 'assets/images/whippet.jpg',
    ),
  ];

  void endOnboarding(context) {
    // We are using pushReplacement instead of push so
    // there is no back button for returning to Onboarding.
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (_) => Home()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return IntroductionScreen(
      // Tapping this exits onboarding.
      done: Text('Done'),
      globalBackgroundColor: Colors.yellow.shade100,
      // This prevents the images from overlapping the safe area.
      isTopSafeArea: true,
      // This icon appears on the last onboarding page.
      // Tapping it ends onboarding.
      next: Icon(Icons.navigate_next),
      onDone: () => endOnboarding(context),
      pages: pages
          .map(
            (page) => PageViewModel(
              title: page.title,
              body: page.body,
              image: Image.asset(page.imagePath, height: 300),
            ),
          )
          .toList(),
      // The skip button appears on all onboarding pages except the last.
      // Tapping it advances to the last onboarding page.
      showSkipButton: true,
      skip: Text('Skip'),
    );
  }
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('Add content here.'),
          ],
        ),
      ),
    );
  }
}
