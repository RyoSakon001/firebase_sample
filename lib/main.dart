import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'firebase_options.dart';

// asyncで、終わるまで待つ
void main() async {
  // インスタンス化？
  WidgetsFlutterBinding.ensureInitialized();
  // Firebaseの初期化？Firebaseと接続し、時間がかかるからawaitの中に入れる？
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  // なにをしている？
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyWidget(),
    );
  }
}

class MyWidget extends StatefulWidget {
  // なにをしている？
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  final TextEditingController _controller = TextEditingController();

  final _list = List.generate(10, (index) => 'test $index');

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // 一番上の時刻と、一番下の「バー」を除いたエリア
      body: SafeArea(
        child: Column(
          // 主軸（今回はColumn）の配置を決定（spaceBetween）
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // スペースを目一杯埋める
            Expanded(
              child: Container(
                height: double.infinity,
                alignment: Alignment.topCenter,
                // Streamとは？ →非同期処理(Firebaseと接続するため)

                child: StreamBuilder<QuerySnapshot>(
                  // SELECT
                  stream: FirebaseFirestore.instance
                      .collection('dream')
                      .orderBy('createdAt')
                      .snapshots(),
                  // 表す実際の内容
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      return const Text('エラーが発生しました');
                    }
                    if (!snapshot.hasData) {
                      return const Center(child: CircularProgressIndicator());
                    }

                    // まず、配列にFirebaseの内容をいれる?
                    final list = snapshot.requireData.docs
                        .map<String>((DocumentSnapshot document) {
                      final documentData =
                          document.data()! as Map<String, dynamic>;
                      return documentData['content']! as String;
                    }).toList();

                    // 自分が追加した内容もはいれつにくわえる？
                    final reverseList = list.reversed.toList();

                    return ListView.builder(
                      itemCount: reverseList.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Center(
                          child: Text(
                            reverseList[index],
                            style: const TextStyle(fontSize: 20),
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
            ),
            // テキスト入力場所。ExpandedウィジェットとElevatedButtonウィジェットを横に並べる
            // Post送信して、その値を_controllerで受け取るようなイメージ
            Row(
              children: [
                // 隙間を目一杯埋める
                Expanded(
                  child: TextField(
                    controller:
                        _controller, // 入力された値を入れる時の変数名。TextEditController classウィジェットの性質を持つ。
                    autofocus: true,
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    // Insert
                    final document = <String, dynamic>{
                      'content': _controller.text,
                      'createdAt': Timestamp.fromDate(DateTime.now()),
                    };
                    FirebaseFirestore.instance
                        .collection('dream')
                        .doc() // 引数なしならID自動生成
                        .set(document);
                    setState(_controller.clear);
                  },
                  child: const Text('送信'),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
