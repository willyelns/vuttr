import 'package:flutter/material.dart';
import 'package:vuttr/models/useful_tool.dart';

class ToolCard extends StatelessWidget {
  const ToolCard({
    Key? key,
    required this.tool,
    required this.onDelete,
  }) : super(key: key);

  final UsefulTool tool;
  final void Function(String id) onDelete;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 16),
      elevation: 3,
      child: Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  tool.title,
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                IconButton(
                    onPressed: () => onDelete(tool.title),
                    icon: Icon(Icons.close))
              ],
            ),
            Container(
              child: Text(tool.description),
            ),
            Container(
              margin: const EdgeInsets.only(top: 16),
              child: Row(
                children: [
                  for (var tag in tool.tags)
                    Text(
                      '#$tag ',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
