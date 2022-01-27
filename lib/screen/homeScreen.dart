import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:internet_speed_test/callbacks_enum.dart';
import 'package:internet_speed_test/internet_speed_test.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({ Key? key }) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final internetSpeedTest = InternetSpeedTest();
  double downloadSpeed=0;
  double uploadSpeed=0;
  @override
  void initState() {
    super.initState();
      internetSpeedTest.startDownloadTesting(
     onDone: (double transferRate, SpeedUnit unit) {
                Flushbar(
                  flushbarPosition: FlushbarPosition.TOP,
                  backgroundColor: Colors.green,
                  title:  "checking network speed app",
                  message:  "downloaded!!!,sucessfully",
                  duration:const  Duration(seconds: 3),
                ).show(context); 
     },
     onProgress: (double percent, double transferRate, SpeedUnit unit) {
      downloadSpeed =unit.index.toDouble();
       setState(() {
         
       });
     },
     onError: (String errorMessage, String speedTestError) {
                Flushbar(
                  flushbarPosition: FlushbarPosition.TOP,
                  backgroundColor: Colors.red,
                  title:  "checking network speed app",
                  message:  errorMessage,
                  duration:const  Duration(seconds: 3),
                ).show(context); 
     },
   );



  internetSpeedTest.startUploadTesting(
     onDone: (double transferRate, SpeedUnit unit) {   
                Flushbar(
                  flushbarPosition: FlushbarPosition.TOP,
                  backgroundColor: Colors.green,
                  title:  "checking network speed app",
                  message:  "uploaded!!!,sucessfully",
                  duration:const  Duration(seconds: 3),
                ).show(context); 
     },
     onProgress: (double percent, double transferRate, SpeedUnit unit) {
       uploadSpeed =unit.index.toDouble();
       setState(() {
         
       });
     },
     onError: (String errorMessage, String speedTestError) {
                Flushbar(
                  flushbarPosition: FlushbarPosition.TOP,
                  backgroundColor: Colors.red,
                  title:  "checking network speed app",
                  message:  errorMessage,
                  duration:const  Duration(seconds: 3),
                ).show(context); 
     },
  );
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        title:const Text("Checking network speed app",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 16),),
      ),
      backgroundColor: Colors.blueGrey,
       body: Column(
         children: [
            Expanded(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const  Icon(Icons.upload_rounded,size: 80,color: Colors.white,),
                    const SizedBox(
                      height: 30,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                       const Text("Upload speed:  ",style: TextStyle(color: Colors.white,fontSize: 16,),),Text(uploadSpeed.toString()+" B/s",style:const TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold,),),
                      ],
                    ),
                    
                  ],
                ),
                ),
              ),
           const Divider(
             color: Colors.black,
             thickness: 4,
           ),
            Expanded(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const  Icon(Icons.download_rounded,size: 80,color: Colors.white,),
                    const SizedBox(
                      height: 30,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                       const Text("Download speed:  ",style: TextStyle(color: Colors.white,fontSize: 16,),),Text(downloadSpeed.toString()+" B/s",style:const TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold,),),
                      ],
                    ),
                    
                  ],
                ),
                ),
              ),
         ],
       ),
    );
  }
}






