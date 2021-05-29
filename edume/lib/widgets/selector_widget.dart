import "package:flutter/material.dart";

class SelectorWidget extends StatefulWidget {
  final String text;
  final List<String> items;
  SelectorWidget({this.text, this.items});
  @override
  _SelectorWidgetState createState() => _SelectorWidgetState();
}

class _SelectorWidgetState extends State<SelectorWidget> {
  List<DropdownMenuItem> dropDownMenuItems = [];
  String choosenValue = "All";
  @override
  void initState() {
    for (int i = 0; i < widget.items.length; i++) {
      DropdownMenuItem item = new DropdownMenuItem(
        child: Text(widget.items[i],
            style: TextStyle(color: Colors.orange, fontSize: 20)),
        value: widget.items[i],
        onTap: () {
          setState(() {
            choosenValue = widget.items[i];
          });
        },
      );
      dropDownMenuItems.add(item);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Text(
            widget.text,
            style: TextStyle(color: Colors.orange, fontSize: 20),
          ),
          Container(
            width: 400,
            child: DropdownButton(
              icon: Icon(
                Icons.arrow_drop_down,
                color: Colors.black,
              ),
              items: dropDownMenuItems,
              value: choosenValue,
              dropdownColor: Colors.blueGrey.shade900,
              onChanged: (value) {
                setState(() {
                  choosenValue = value;
                });
              },
            ),
          )
        ],
      ),
    );
  }
}
