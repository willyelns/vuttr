import 'package:flutter/material.dart';

import 'models/useful_tool.dart';
import 'widgets/tool_card.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'VUTTR',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'VUTTR'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final List<UsefulTool> usefulToolList = [
    UsefulTool(
      title: 'Notion',
      description:
          'A simple description about how the Notion is a very useful tool. A simple description about how the Notion is a very useful tool. A simple description about how the Notion is a very useful tool. A simple description about how the Notion is a very useful tool.',
      tags: ['Tag', 'Tag', 'Tag', 'Tag', 'Tag'],
    ),
    UsefulTool(
      title: 'Notion 2',
      description:
          'A simple description about how the Notion is a very useful tool. A simple description about how the Notion is a very useful tool. A simple description about how the Notion is a very useful tool. A simple description about how the Notion is a very useful tool.',
      tags: ['Tag', 'Tag', 'Tag', 'Tag', 'Tag'],
    ),
    UsefulTool(
      title: 'Notion 3',
      description:
          'A simple description about how the Notion is a very useful tool. A simple description about how the Notion is a very useful tool. A simple description about how the Notion is a very useful tool. A simple description about how the Notion is a very useful tool.',
      tags: ['Tag', 'Tag', 'Tag', 'Tag', 'Tag'],
    ),
    UsefulTool(
      title: 'Notion 4',
      description:
          'A simple description about how the Notion is a very useful tool. A simple description about how the Notion is a very useful tool. A simple description about how the Notion is a very useful tool. A simple description about how the Notion is a very useful tool.',
      tags: ['Tag', 'Tag', 'Tag', 'Tag', 'Tag'],
    ),
  ];

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late List<UsefulTool> displayedList;

  @override
  void initState() {
    super.initState();
    displayedList = widget.usefulToolList;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextField(
                onChanged: (value) {
                  setState(() {
                    final toFilter = widget.usefulToolList;
                    displayedList = toFilter
                        .where((element) => element.title
                            .toLowerCase()
                            .contains(value.toLowerCase()))
                        .toList();
                  });
                },
                decoration: InputDecoration(
                  hintText: 'search',
                  prefixIcon: Icon(Icons.search),
                  // suffix: Row(
                  //   children: [
                  //     Text('search with tag'),
                  //     Checkbox(
                  //         value: false,
                  //         onChanged: (value) {
                  //           setState(() {});
                  //         })
                  //   ],
                  // ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 16),
                child: Divider(),
              ),
              for (var tool in displayedList)
                ToolCard(
                  tool: tool,
                  onDelete: _onDelete,
                ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addMore,
        tooltip: 'Add new item',
        child: Icon(Icons.add),
      ),
    );
  }

  void _addMore() {
    print('call to add more');
  }

  void _onDelete(String id) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Delete this item?'),
            content: Text('Are you sure to delete the $id tool?'),
            actions: [
              ElevatedButton(
                onPressed: () {
                  final item = widget.usefulToolList
                      .firstWhere((element) => element.title == id);
                  setState(() {
                    widget.usefulToolList.remove(item);
                  });
                  Navigator.of(context).pop();
                },
                child: Text('Yes, I am sure'),
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('No, nevermind'),
              )
            ],
          );
        });
  }
}
