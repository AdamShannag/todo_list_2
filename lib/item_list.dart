import 'package:flutter/material.dart';

class ItemList extends StatefulWidget {
  List<String> itemList = [];

  ItemList(this.itemList);

  @override
  State<ItemList> createState() => _ItemListState();
}

class _ItemListState extends State<ItemList> {
  void removeItem(int index) {
    setState(() {
      widget.itemList.removeAt(index);
    });
  }

  void addItem() {
    if (textController.text.isEmpty) return;
    setState(() {
      widget.itemList.add(textController.text);
      textController.text = '';
    });
  }

  final textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: MediaQuery.of(context).size.height * 0.25,
          padding: const EdgeInsets.all(10),
          child: Card(
            elevation: 3,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  TextField(
                    decoration: const InputDecoration(
                      label: Text('Enter Todo item'),
                    ),
                    controller: textController,
                    onSubmitted: (_) => addItem(),
                  ),
                  ElevatedButton(
                    onPressed: addItem,
                    child: const Text('Add'),
                  )
                ],
              ),
            ),
          ),
        ),
        widget.itemList.isEmpty
            ? Column(
                children: [
                  const Text(
                    'Nothing here!',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.50,
                    child: Image.asset(
                      'assets/images/waiting.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              )
            : SizedBox(
                height: MediaQuery.of(context).size.height * 0.65,
                child: ListView.builder(
                  itemBuilder: (ctx, index) {
                    return Card(
                      elevation: 5,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 5, horizontal: 8),
                        child: ListTile(
                          leading: CircleAvatar(
                            radius: 20,
                            child: Text('${index + 1}'),
                          ),
                          title: Text(widget.itemList[index]),
                          trailing: IconButton(
                            onPressed: () => removeItem(index),
                            icon: Icon(
                              Icons.delete,
                              color: Theme.of(context).colorScheme.error,
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                  itemCount: widget.itemList.length,
                ),
              ),
      ],
    );
  }
}
