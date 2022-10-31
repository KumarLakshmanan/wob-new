import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:get/get.dart';
import 'package:wob/screens/permissions.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({ Key? key }) : super(key: key);

  @override
  _OtpScreenState createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       body:
          Padding(
            padding: const EdgeInsets.all(25),
            child: 
            // Column(
            //   crossAxisAlignment: CrossAxisAlignment.start,
            //   children: [
                Container(
                  padding: EdgeInsets.only(top: MediaQuery.of(context).size.width*0.4),
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height-40,
                  child: 
                  Stack(
                    children: [
                     
                     Container(
                     
                       child: Text("Enter Otp",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25),)),
                       Container(
                         margin: EdgeInsets.only(top:30),
                         child: Text("Sent to +91 6373878908",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25),),
                       ),
               Container(
                 margin: EdgeInsets.only(top:40),
                   padding: EdgeInsets.only(top:40),
                 child:  PinCodeTextField(
                      appContext: context,
                      length: 5,
                      obscureText: false,
                      animationType: AnimationType.scale,
                      animationDuration: const Duration(milliseconds: 200),
                      enableActiveFill: false,
                      onCompleted: (v) {},
                      keyboardType: TextInputType.number,
                      textInputAction: TextInputAction.done,
                      onSubmitted: (value) {
                        Get.to(PermissionsScreen());
                      },
                      // cursorHeight: 30,
                      // cursorWidth: 2,
                      // cursorColor: color.white.shade03,
                      textStyle: TextStyle(
                        color:  Colors.black,
                        fontSize: 20,
                      ),
                      pinTheme: PinTheme(
                        shape: PinCodeFieldShape.underline,
                        fieldHeight: 30,
                        fieldWidth: 55,
                        // activeFillColor: color.primary.shade04,
                        inactiveFillColor: Colors.black,
                         activeColor:Colors.black,
                        inactiveColor: Colors.black,
                         selectedColor: Colors.black,
                        // selectedFillColor: color.primary.shade01,
                        // errorBorderColor: color.red.shade01,
                        borderWidth: 1,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      //errorAnimationController: errorController,
                      onChanged: (value) {
                        
                      },
                    ),
                 
               ),
               Container(
                 margin: EdgeInsets.only(top: 120),
                 child: Row(children: [
                Text("Don't receive secure code?",style: TextStyle(fontSize: 12),),
                Text(" Resent otp in 00:49",style: TextStyle(fontSize: 12,color: const Color(0xFF482D92)),)
              ],),
               ),
              
             
                        
                        Positioned(
                        bottom: 10,
                        child:Center(child: Text("Accept that you are at legal age to consume alcohol",style: TextStyle(color: Color(0xFF979797),fontSize: 11),
                        ))
                        ) ,
                        
                      
                    ],
                  ),
               ),
              
               
                  
                   
               
            //   ],
            // ),
          )
    );
  }
}