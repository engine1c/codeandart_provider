import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:codeandart_provider/models/data.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<Data>(
      create: (context)=>Data(),
      child: MaterialApp(
        title: 'Flutter TopLevel',
        theme: ThemeData(
      
          primarySwatch: Colors.blue,
        ),
        home: HomePage(),
      ),
    );
  }
}

class HomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(
          child: Text('HomePage=${context.watch<Data>().getData}'),
        ),
      ),
      body: Center( 
        child: Widget1(), 
      ),
    );
  }
}

class Widget1 extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Widget2(),
          Text('Widget1===${context.watch<Data>().getData}'),
        ],
      ),
       
      );
  }
}

class Widget2 extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          MyTextWidget(),
          Widget3(),
          Text('Widget2===${context.watch<Data>().getData}'),
        ],
      ),
       
      );
   
  }
}

class Widget3 extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('Widget3===${context.watch<Data>().getData}'),
    );
  }
}

class MyTextWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      width:  150,
      height: 30,
      decoration: BoxDecoration(
        boxShadow: const [BoxShadow(
            color: Colors.deepPurple,
            blurRadius:11,
            offset: Offset(3,3),
            blurStyle: BlurStyle.outer
          ),
          ],
          borderRadius: BorderRadius.circular(2),
        color: Colors.black12,
        border: Border.all(),),
      child: TextField(
         //onChanged: (newData) => Provider.of<Data>(context, listen: false).changeString(newData),
         onChanged: (newData) => context.read<Data>().changeString(newData),
      ),
    );
  }
}


