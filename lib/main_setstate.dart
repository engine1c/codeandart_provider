import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  String data = 'TopLevel DATA 030303';

  void _onChangeState(newData){
    setState(() {
      data = newData;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Provider<String>(
      create: (context) => data,
      child: MaterialApp(
        title: 'Flutter TopLevel',
        theme: ThemeData(
    
          primarySwatch: Colors.blue,
        ),
        home: HomePage(data: data, onChange: _onChangeState,),
                //home: HomePage(data: data,),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  final String data;
  final Function onChange;
  HomePage({required this.data, required this.onChange});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(
          child: Text('HomePage===${data}'),
        ),
      ),
      body: Center( 
        child: Widget1(data: data, onChange: onChange,), 
        //child: Widget1(data: data,),
      ),
    );
  }
}

class Widget1 extends StatelessWidget {
   final String data;
   final Function onChange;

  Widget1({required this.data, required this.onChange});


  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Widget2(data:data, onChange: onChange,),
          Text('Widget1===${data}'),
          //Widget3(data: data,),
        ],
      ),
       
      );
  }
}

class Widget2 extends StatelessWidget {
  final String data;
  final Function onChange;

  Widget2({required this.data, required this.onChange});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          MyTextWidget(onChange: onChange),
          Widget3(data:data),
          Text('Widget2===${data}'),
          //Widget3(data: data,),
        ],
      ),
       
      );
   
  }
}

class Widget3 extends StatelessWidget {
   final String data;
   Widget3({required this.data});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('Widget3===${data}'),
    );
  }
}

class MyTextWidget extends StatelessWidget {
  final Function onChange;//VoidCallback

  MyTextWidget({required this.onChange});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
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
        onChanged: (newData) => onChange(newData),
      ),
    );
  }
}


