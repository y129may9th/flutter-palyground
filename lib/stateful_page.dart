import 'package:flutter/material.dart';
import 'package:sample_provider/todo_index_page.dart';

// StatefulWidgetを継承するとStateを扱える
// このWidgetを表示すると、Stateを元にUIが作成される
// 別途State用のクラスを作ってその中でbuildする
class StatefulPage extends StatefulWidget {
  // 使用するStateを指定
  @override
  _NewWidgetState createState() => _NewWidgetState();
}

// Stateを継承して使う
class _NewWidgetState extends State<StatefulPage> {
  // データを宣言
  int count = 0;

  // データを元にWidgetを作る
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false, // デフォルトの戻るアイコンを削除
        // leading: Icon(Icons.arrow_back_ios), // これだとただのアイコン設置。クリックとかはできない。
        leadingWidth: 85,
        leading: TextButton(
          child: const Text(
            '戻りたい...',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 12.0,
            ),
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text('Stateful Widget'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.favorite),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.more_vert),
          ),
        ],
      ),
      body: Center(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                count.toString(),
              ),
              TextButton(
                onPressed: () {
                  // データを更新する時は setState を呼ぶ
                  setState(() {
                    // データを更新
                    count = count + 1;
                  });
                },
                child: const Text('カウントアップ'),
              ),
              ElevatedButton(
                onPressed: () {
                  // 指定した画面に遷移する
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      // 実際に表示するページ(ウィジェット)を指定する
                      builder: (context) => TodoIndexPage(),
                    ),
                  );
                },
                child: Text('TODO Page'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
