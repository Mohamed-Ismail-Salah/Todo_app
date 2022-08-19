import 'package:flutter/material.dart';

class Custom_text extends StatelessWidget{
  @override
  String text;
   bool titel;
   Color color ;
   double size;
  Custom_text({this.size=35,this.color=Colors.black,required this.text,required this.titel} );

  Widget build(BuildContext context) {
      if(titel)
 {
   return  Text(text,style: TextStyle(
     fontFamily:"SourceSansPro-Regular",
     fontSize: size,
     fontWeight:FontWeight.bold,
     color: color,

   ),
   );
 }else{
        return  Text(text,style: TextStyle(
          fontFamily:"EduTASBeginner-VariableFont_wght",
          fontSize: size,
          color: color,

        ),
        );
      }
  }

}