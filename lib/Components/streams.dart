import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Streams extends StatefulWidget {
  Streams({Key? key}) : super(key: key);

  @override
  State<Streams> createState() => _StreamsState();
}

class _StreamsState extends State<Streams> {

  String? name = '';
  List<String>? streamList = [];

  getStreams() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var stream = prefs.getString("addStream");    
    setState(() {
      name = stream;
      streamList = prefs.getStringList("streamList")!;
    });
    print(stream);

  }

  @override
  void initState() {
    getStreams();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.add),
        title: Text("Streams Available"),
      ),
      body: Column(
        children: [
          ListView.builder(
            itemCount: streamList!.length,
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemBuilder: (context, index){
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                color: Colors.white,
                elevation: 10,
                child: ListTile(
                  leading: Icon(Icons.edit, color: Theme.of(context).selectedRowColor,),
                  title: Text(streamList![index], style: TextStyle(color: Theme.of(context).selectedRowColor),) ,
                  trailing: const Icon(Icons.delete, color: Colors.red,),
                ),
              ),
            );
          })
        ],
      ),
    );
  }
}