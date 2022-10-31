import 'package:flutter/material.dart';
import 'package:get/get.dart';


class PermissionsScreen extends StatefulWidget {
  const PermissionsScreen({ Key? key }) : super(key: key);

  @override
  _PermissionsScreenState createState() => _PermissionsScreenState();
}

class _PermissionsScreenState extends State<PermissionsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: Container(padding: const EdgeInsets.all(20),
       decoration:const BoxDecoration(
         gradient: LinearGradient(colors: [
          Color(0xFF482D92),

Color(0xFF622CAA)
         ])
       ),
      
      child:Stack(
        children: [
          Positioned(
            top: 40,//MediaQuery.of(context).size.height*0.0552,//40
            child:PermissionCard("assets/Bluetooth.png", "Required Bluetooth", "LOrem ipasm th u-eouiujhge76bkd\nuyeuytguewhhvgh guye uywtggcf\nuyewfd", (){},context)
            ),
          Positioned(
            top: 145,//MediaQuery.of(context).size.height*0.2003,//145
            child:PermissionCard("assets/Vector.png", "Location", "LOrem ipasm th u-eouiujhge76bkd\nuyeuytguewhhvgh guye uywtggcf\nuyewfd", (){},context)
            
          ),
          Positioned(
                        bottom: 10,//MediaQuery.of(context).size.height*0.0138,//10
                        child: Container(
                         width: MediaQuery.of(context).size.width-50,
                         height: MediaQuery.of(context).size.height*0.083,//60
                         decoration: BoxDecoration(
                           color:const Color(0xFFFDDD00),
                           borderRadius: BorderRadius.circular(60)
                         ), 
                        child: InkWell(
                          child:
                          Row(
                            
                            mainAxisAlignment: MainAxisAlignment.center,
                            children:const [
                               Text("Grant Permision",style: TextStyle(color:Color(0xFF482482),fontSize: 15,fontWeight: FontWeight.w700),),
                               SizedBox(width: 10,),
                               Icon(Icons.arrow_forward,color:Color(0xFF482482),)
                          ],),
                          onTap: (){
                            
                            
                          },
                        
                        ),
                      )) 
        ],
      ),
      ),
    );
  }
}


Widget PermissionCard(String image,String title,String subTitle,Function ontap,BuildContext context){
  return GestureDetector(
  onTap: () =>ontap ,
  child:Container(
            width: MediaQuery.of(context).size.width*0.874,//300
                height:80,//80
            padding:const EdgeInsets.all(5),
            child: Row(
              
              //crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  alignment: Alignment.topCenter,
                  width: 20,
                  height: 55,
                  child: Image.asset(image),
                ),
                
              SizedBox(width: 20,),
              Container(
                
                child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                 
                  Text(title,style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.w700),),
                   SizedBox(height: 3,),
                  Text(subTitle,style: TextStyle(color: Colors.white,fontSize: 12,fontWeight: FontWeight.normal),)
                ],
              ),
              )
              
              ],
            ),
          )) ;
}