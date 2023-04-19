import 'package:firstsplashscreenview/firstsplashscreenview.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:students_portal/Components/dashboard.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
                primarySwatch: Colors.blue,
                canvasColor: const Color(0xff403B34),
                backgroundColor: Colors.purple,
                cardColor: const Color(0xffE0698C),
                indicatorColor: const Color(0xffFE5A7D),
                buttonColor: const Color.fromARGB(255, 248, 215, 218),
                scaffoldBackgroundColor: const Color(
                  0xffFFF1F5,
                ),
                hintColor: const Color(0xff6679B3),
                selectedRowColor: const Color(0xff3087B5),
                unselectedWidgetColor: const Color(0xffE0698C),
                primaryColor: const Color(0xffffffff),
                accentColor: const Color(0xff8E8C90),
                hoverColor: const Color(0xffFF6092),
                secondaryHeaderColor: const Color(0xffFEFAF4),
                shadowColor: const Color.fromRGBO(137, 209, 239, 1),
                focusColor: const Color(0xff8ABFF4),
                primaryColorLight: const Color(0xffFFE6E8),
                primaryColorDark: const Color(0xffD7EEF2)

            ),     
      home: SplashScreen(
        backgroundColor: Colors.blue,
        duration: const Duration(seconds: 5),
        nextPage:  const HomeScreen(),
        circleHeight: 200,
        text: const Text(
          "Kilimo High School \nStudent Portal",
          style: TextStyle(
            color: Colors.white,
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
        child:Image.asset('images/new_logo.png',),
    ),
    );
  }
}
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Theme.of(context).selectedRowColor,
        elevation: 0,
      ),
      backgroundColor: Theme.of(context).selectedRowColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Center(
              child: Image.asset("images/new_logo.png"),
            ),
            Text("Enter The Streams", style: TextStyle(color: Colors.white, fontSize: 20),),
      
           Padding(
             padding: const EdgeInsets.only(left: 30.0, right: 30, top: 10, bottom: 10),
             child: TextField(
              controller: _controller,
              decoration:InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 18.0, horizontal: 10.0),
                    counterText: '',
                    filled: true,
                    
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide.none),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(
                          color: Theme.of(context).primaryColorLight, width: 2.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(
                          color: Theme.of(context).buttonColor, width: 2.0),
                    ),
                    hintStyle: const TextStyle(
                      color: Colors.black, // <-- Change this
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.normal,
                    ),
                  ),
          ),
           ),

           ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: Theme.of(context).cardColor,
              shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                      )
            ),
            onPressed: ()async {
              SharedPreferences prefs = await SharedPreferences.getInstance();
               if(_controller.text.isNotEmpty){
                
                prefs.setString("addStream", _controller.text);
              }

              List<String>? prefList = prefs.getStringList('streamList');
              
                var itemList = prefs.getString('addStream');
              if(prefList == null){     
                setState((){
                prefList = [];
                });
                }
              
                if (prefList != null) {
                prefList?.add(itemList!);
                }else{
                  prefList!.add(itemList!);
                }

              prefs.setStringList("streamList", prefList!);
              
             Fluttertoast.showToast(msg: "Stream Successfully Added");
              _controller.clear();
             
            }, child: const Text('Add Stream')),

           const SizedBox(height: 30,),

             SizedBox(
            height: 45,
            width: 200,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  primary: Theme.of(context).cardColor,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50),
                      // side: BorderSide(color: Theme.of(context).buttonColor)
                      )),
              onPressed: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (context)=> Dashboard()));
              },
              child: Text( 'Continue',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).primaryColor,
                    fontSize: 18),
              )
            ),
          ),

          
          ],
        ),
      ),
    );
  }
}