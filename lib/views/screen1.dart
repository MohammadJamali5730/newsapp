import 'package:flutter/material.dart';
import 'package:newsapp/models/modelnews.dart';
import 'package:newsapp/sevices/servicnews.dart';

class Screen1 extends StatefulWidget {
  const Screen1({super.key});

  @override
  State<Screen1> createState() => _Screen1State();
}

class _Screen1State extends State<Screen1> {
  TextEditingController textEditingctrl = TextEditingController();
  ScrollController scrollctrl = ScrollController();
  Servicnews servicnews = Servicnews();
  bool isloading = true;
  List<Modelnews> loadmoredata = [];
  int maximum = 5;

  @override
  void initState() {
    super.initState();
    loaddata();

    scrollctrl.addListener(
      () {
        return loadfive();
      },
    );
  }

  @override
  void dispose() {
    super.dispose();
    scrollctrl.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        bottom: PreferredSize(
            preferredSize:const Size.fromHeight(30),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                onChanged: (value){
                return forsearch(value);
                },
                   controller: textEditingctrl,
                decoration:const InputDecoration(
                    
                    hintText: 'Search...',
                    border: OutlineInputBorder(
              
                        borderRadius: BorderRadius.all(Radius.circular(25)))),
              ),
            )),
        backgroundColor: Colors.orange,
        
        centerTitle: true,
      ),
      body: isloading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              controller: scrollctrl,
              itemCount: loadmoredata.length,
              itemBuilder: (context, index) {
                return Column( mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(loadmoredata[index].author),
                    Card(
                      shape: Border.all(width: 0.5 , color: Colors.black38),
                      margin:const EdgeInsets.all(10),
                      child: ListTile(
                        title: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(loadmoredata[index].title),
                        ),
                        subtitle: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(loadmoredata[index].description),
                        ),
                        leading: Expanded(child: Image.network(loadmoredata[index].urlToImage , errorBuilder: (context, error, stackTrace) => Image.asset('assets/boy7.jpg'),)),
                      
                      ),
                    ),
                  
                  ],
                );
              },
            ),
            backgroundColor: Colors.amber[100],
    );
  }
 void forsearch(String query)
 {
   if (query.isEmpty) {
     setState(() {
       loadmoredata = servicnews.Articles.sublist(0,maximum);
     });
     
   }else{
    setState(() {
      loadmoredata = servicnews.Articles.where((element) {
       return element.title.toLowerCase().contains(query.toLowerCase());
      },).toList();
    });
   }
 }
  void loadfive() async{
    if (scrollctrl.position.pixels == scrollctrl.position.maxScrollExtent && textEditingctrl.text.isEmpty) {
      setState(() {
        maximum+=3;
      });
     await loaddata();
    }
  }

  Future<void> loaddata() async {
    await servicnews.getapi();
    setState(() {
      loadmoredata=servicnews.Articles.sublist(0, maximum);
      isloading = false;
    });
  }
}
