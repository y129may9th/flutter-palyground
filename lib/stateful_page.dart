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
            ],
          ),
        ),
      ),
    );
  }
}
