import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// import 'package:faker/faker.dart';

class HomeScreenPage extends StatefulWidget {
  const HomeScreenPage({super.key});

   @override
  State<HomeScreenPage> createState() => _HomeScreenPageState();
}

class _HomeScreenPageState extends State<HomeScreenPage>
    with TickerProviderStateMixin {
  late final AnimationController _fadeController;
  late final AnimationController _sizeController;
  late final Animation<double> _fadeAnimation;
  late final Animation<double> _sizeAnimation;

  @override
  void initState() {
    super.initState();
    _fadeController = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    )..repeat(reverse: true);

    _sizeController = AnimationController(
      duration: const Duration(milliseconds: 850),
      vsync: this,
    )..repeat(reverse: true);

    _fadeAnimation = CurvedAnimation(
      parent: _fadeController,
      curve: Curves.easeInOut,
    );

    _sizeAnimation = CurvedAnimation(
      parent: _sizeController,
      curve: Curves.easeOut,
    );
  }

  @override
  void dispose() {
    _fadeController.dispose();
    _sizeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      
      canPop: false,
      onPopInvoked: (didPop) async {
        if (didPop) {
          return;
        }
        final NavigatorState navigator = Navigator.of(context);
        final bool? shouldPop = await _showBackDialog(context);
        if (shouldPop ?? false) {
          navigator.pop();
        }
      },
      
child: Scaffold(
  
      appBar: AppBar(title: const Text('ListTile Samples')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Hero(
            tag: 'ListTile-Hero',
            // Wrap the ListTile in a Material widget so the ListTile has someplace
            // to draw the animated colors during the hero transition.
            child: Material(
              
              child: ListTile(
                title: const Text('ListTile with Hero'),
                subtitle: const Text('Tap here for Hero transition'),
                tileColor: Colors.cyan,
            onTap: () {
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(builder: (context) => const HomeScreenPage()));
              Navigator.push(
                    context,
                    MaterialPageRoute<Widget>(builder: (BuildContext context){
                      return Scaffold(
                        appBar: AppBar(title: const Text('ListTile Hero')),
                        body: Center(
                          child: Hero(
                            tag: 'ListTile-Hero',
                            child: Material(
                              child: ListTile(
                                title: const Text('ListTile with Hero'),
                                subtitle: const Text('Tap here to go back'),
                                tileColor: Colors.blue[700],
                                onTap: () {
                                  Navigator.pop(context);
                                },
                              ),
                            ),
                          ),
                        ),
                      );
                    }),
                  );
                },
              ),
            ),
          ),

           FadeTransition(
            opacity: _fadeAnimation,
            // Wrap the ListTile in a Material widget so the ListTile has someplace
            // to draw the animated colors during the fade transition.
            child: const Material(
              child: ListTile(
                title: Text('ListTile with FadeTransition'),
                selectedTileColor: Colors.green,
                selectedColor: Colors.white,
                selected: true,
              ),
            ),
          ),
          SizedBox(
            height: 100,
            child: Center(
              child: SizeTransition(
                sizeFactor: _sizeAnimation,
                axisAlignment: -1.0,
                // Wrap the ListTile in a Material widget so the ListTile has someplace
                // to draw the animated colors during the size transition.
                child: const Material(
                  child: ListTile(
                    title: Text('ListTile with SizeTransition'),
                    tileColor: Colors.red,
                    minVerticalPadding: 25.0,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
),
    );
  }
   Future<bool?> _showBackDialog(BuildContext context) {
    return showDialog<bool>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Exit"),
          content: const Text(
            "Are you sure?",
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(false);
              },
              child: const Text("No"),
            ),
            TextButton(
              onPressed: () {
                 SystemNavigator.pop();
              },
              child: const Text("Yes"),
            ),
          ],
        );
      },
    );
  }
}
final List<String> _images = [
  'https://images.pexels.com/photos/167699/pexels-photo-167699.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260',
  'https://images.pexels.com/photos/2662116/pexels-photo-2662116.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
  'https://images.pexels.com/photos/273935/pexels-photo-273935.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
  'https://images.pexels.com/photos/1591373/pexels-photo-1591373.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
  'https://images.pexels.com/photos/462024/pexels-photo-462024.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
  'https://images.pexels.com/photos/325185/pexels-photo-325185.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500'
];