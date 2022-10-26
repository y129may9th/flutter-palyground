import 'package:flutter/material.dart';

class TodoIndexPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('リスト一覧'),
      ),
      body: ListView(
        children: const <Widget>[
          Card(
            child: ListTile(
              title: Text('ニンジンを買う'),
            ),
          ),
          Card(
            child: ListTile(
              title: Text('タマネギを買う'),
              tileColor: Colors.blueGrey,
            ),
          ),
          Card(
            child: ListTile(
              title: Text('ジャガイモを買う'),
            ),
          ),
          Card(
            child: ListTile(
              title: Text('カレールーを買う'),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          // リスト追加画面から渡される値を受け取る
          final newListText = await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => TodoAddPage(),
            ),
          );
          if (newListText != null) {
            print(newListText);
            // キャンセルした場合は newListText が null となるので注意
          }
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

class TodoAddPage extends StatefulWidget {
  @override
  _TodoAddPageState createState() => _TodoAddPageState();
}

class _TodoAddPageState extends State<TodoAddPage> {
  String _text = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('リスト追加'),
      ),
      body: Container(
          padding: EdgeInsets.all(64),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                _text,
                style: const TextStyle(color: Colors.blue),
              ),
              const SizedBox(height: 8),
              TextField(
                onChanged: (String value) {
                  // データが変更したことを知らせる（画面を更新する）
                  setState(() {
                    _text = value;
                  });
                },
              ),
              const SizedBox(height: 8),
              Container(
                // 横幅いっぱいに広げる
                width: double.infinity,
                // リスト追加ボタン
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.yellow[700],
                  ),
                  onPressed: () {
                    // "pop"で前の画面に戻る
                    // "pop"の引数から前の画面にデータを渡す
                    Navigator.of(context).pop(_text);
                  },
                  child: const Text(
                    'リスト追加',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 8),
              Container(
                width: double.infinity,
                // キャンセルボタン
                child: TextButton(
                  // ボタンをクリックした時の処理
                  onPressed: () {
                    // 追加の処理
                    Navigator.of(context).pop();
                  },
                  child: Text('キャンセル'),
                ),
              ),
            ],
          )),
    );
  }
}
