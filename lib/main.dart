import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  final List<Map<String, dynamic>> listItems = [
    {
      'text': 'Item 1',
      'color': Colors.yellow[100],
    },
    {
      'text': 'Item 2',
      'color': Colors.yellow[300],
    },
    {
      'text': 'Item 3',
      'color': Colors.yellow[500],
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          const Text(
            'You have pushed the button this many times:',
          ),
          Text(
            '$_counter',
            style: Theme.of(context).textTheme.headline4,
          ),
          Container(
            margin: const EdgeInsets.all(30),
            padding: const EdgeInsets.all(20),
            width: 200,
            height: 100,
            decoration: BoxDecoration(
              // 枠線
              border: Border.all(color: Colors.green, width: 5),

              // 角丸
              borderRadius: BorderRadius.circular(8),

              // コンテナのカラー
              color: Colors.pink[300],

              // 背景画像
              image: const DecorationImage(
                image: NetworkImage('https://placehold.jp/100x100.png'),
              ),
            ),
            child: const Text('TextAlign.right', textAlign: TextAlign.right),
          ),
          Container(
            height: 125,
            padding: EdgeInsets.all(4),
            child: ListView.builder(
              shrinkWrap: true,
              // Container からはみ出しても、スクロールする
              physics: ClampingScrollPhysics(),
              itemCount: listItems.length,
              itemBuilder: (context, index) {
                return Container(
                  height: 50,
                  color: listItems[index]['color'],
                  child: Text(listItems[index]['text']),
                );
              },
            ),
          ),
          Container(
            height: 125,
            padding: EdgeInsets.all(4),
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: listItems.length,
              itemBuilder: (context, index) {
                // ListTile でタイトル・サブタイトル・画像・アイコン等を含めたアイテムが作れる
                return ListTile(
                  leading: Image.network('https://placehold.jp/50x50.png'),
                  title: Text(listItems[index]['text']),
                  subtitle: Text('subtitle'),
                  trailing: Icon(Icons.more_vert),
                );
              },
            ),
          ),
          Container(
            height: 100,
            padding: EdgeInsets.all(4),
            child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: listItems.length,
              itemBuilder: (context, index) {
                // 影のついたカードUIが作れる
                return Card(
                  child: Container(
                    width: 100,
                    child: Text(listItems[index]['text']),
                  ),
                );
              },
            ),
          ),
          Card(
            child: ListTile(
              leading: Image.network('https://placehold.jp/50x50.png'),
              title: Text('Card and ListTile'),
              subtitle: Text('subtitle'),
              trailing: Icon(Icons.more_vert),
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
