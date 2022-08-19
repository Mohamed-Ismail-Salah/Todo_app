import 'package:flutter/material.dart';
import 'package:todo/widgets/custom%20text.dart';

class Custom_Iamge extends StatelessWidget{
  const Custom_Iamge({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(


      children: [

        Container(



            height: 100,


            width: 100,

            child: Image.asset("assets/images/5058446.png",color: Colors.purple,)),

        SizedBox(height: 20,)

        ,                Custom_text(text: " You don't even have a job  now\n    You can add a new task",

          titel: false,

          color: Colors.grey,

          size: 25,

        )

      ],

    );

  }

}