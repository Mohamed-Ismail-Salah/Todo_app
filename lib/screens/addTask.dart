
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:todo/controller/task_controller.dart';
import 'package:todo/models/task.dart';
import 'package:todo/widgets/custom%20text.dart';
import 'package:todo/widgets/custom_button.dart';
import 'package:todo/widgets/input_field.dart';
import 'package:get/get.dart';
import 'package:flutter_circle_color_picker/flutter_circle_color_picker.dart';

class AddTask extends StatefulWidget {

  @override
  State<AddTask> createState() => _AddTaskState();
}
String dropdownvalue=" Once only";
List<String>repetlist=[
 " Once only",
"  once every day",
  "Once every week",
  "Once every month",

];
final TaskController taskController =Get.put(TaskController());
TextEditingController titleController =TextEditingController();
TextEditingController noteController =TextEditingController();
DateTime selectedDate = DateTime.now();
String startTime=DateFormat("h:mm a").format(DateTime.now()).toString();
String endTime=DateFormat("h:mm a").format(DateTime.now().add( Duration(minutes: 15))).toString();




Color _currentColor = Colors.blue;
late var _controller = CircleColorPickerController(
  initialColor: Colors.purple,
);
class _AddTaskState extends State<AddTask> {



  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.purple,
          leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Icon(
              (Icons.arrow_back_ios_sharp),
            ),
          ),
          title: Custom_text(
            text: 'New Task',
            titel: false,
            size: 40,
            color: Colors.white,
          ),
        ),




        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Custom_text(
                text: 'title',
                titel: false,
                size: 30,
                color: Colors.grey,
              ),
              InputField(
                sufIcon: Icon(Icons.text_format_outlined),
                hint: 'Enter the title here',
         Controller: titleController,
              ),
              Custom_text(
                text: 'Note',
                titel: false,
                size: 30,
                color: Colors.grey,
              ),
              InputField(
                sufIcon: Icon(Icons.note_add),
                hint: 'Enter the Note here',
Controller: noteController,
              ),
              Custom_text(
                text: 'Date',
                titel: false,
                size: 30,
                color: Colors.grey,
              ),
              InputField(
                sufIcon: IconButton(icon:Icon(Icons.calendar_month_sharp),onPressed: (){
                  getDateFromUser();
                },),

                hint:
                '${DateFormat.yMd().format(selectedDate)}',
              ),
              Row(
                children: [
                  SizedBox(
                    width: 10,
                  ),
                  Custom_text(
                    text: 'start time',
                    titel: false,
                    size: 30,
                    color: Colors.grey,
                  ),
                  SizedBox(
                    width: 70,
                  ),
                  Custom_text(
                    text: 'end time',
                    titel: false,
                    size: 30,
                    color: Colors.grey,
                  ),
                ],
              ),
              Row(
                children: [
                  Container(
                    width: 160,
                    child: InputField(
                      sufIcon:IconButton(icon:Icon(Icons.access_time),onPressed: (){
                        getTimeFromUser(true);
                      },),
                      hint: '${startTime}',
                    ),
                  ),
                  SizedBox(
                    width:20,
                  ),
                  Container(
                    width: 160,
                    child: InputField(
                      sufIcon:IconButton(icon:Icon(Icons.access_time),onPressed: (){
                        getTimeFromUser(false);
                      },),
                      hint: '${endTime} ',
                    ),
                  ),
                ],
              ),

                  Custom_text(
                    text: ' repeat',
                    titel: false,
                    size: 30,
                    color: Colors.grey,
                  ),


                  Container(
                    height: 50,

                    decoration: BoxDecoration(
                      borderRadius:  BorderRadius.circular(12),
                      color:Colors.purple ,
                    ),

                    child: DropdownButton(
                      isExpanded: true,
                      style: TextStyle(
                        color: Colors.grey,
                      fontSize: 20,
                      ),
                   underline: SizedBox(),
                      alignment : AlignmentDirectional.center,
                        borderRadius:  BorderRadius.circular(40),
                      onChanged: (String? newValue) {
                      setState(() {
                        dropdownvalue = newValue!;
                      });
                    },

                    value:dropdownvalue,
                      icon: const Icon(Icons.keyboard_arrow_down,size: 30,color: Colors.grey,),
                      items: repetlist.map((String items) {
                        return DropdownMenuItem(
                          value: items,
                          child: Text(items),

                        );
                      }).toList(),
                    ),
                  ),








             Center(
                child: CircleColorPicker(
textStyle: TextStyle(fontSize: 0),
                  controller: _controller,
                  onChanged: (color) {
                    setState(() => _currentColor = color);
                  },
                ),
              ),
              Center(
                  child: customButton(
                      onPressed: () {
                        validatedate();

                      },
                      title: 'Add',
                      colour: _controller.color)),
              Center(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextButton(
                      onPressed: () => _controller.color = Colors.blue,
                      child: Text('BLUE', style: TextStyle(color: Colors.blue)),
                    ),
                    TextButton(
                      onPressed: () => _controller.color = Colors.green,
                      child:
                          Text('GREEN', style: TextStyle(color: Colors.green)),
                    ),
                    TextButton(
                      onPressed: () => _controller.color = Colors.red,
                      child: Text('RED', style: TextStyle(color: Colors.red)),
                    ),
                  ],
                ),
              ),
            ]),
          ),
        ));

  }
  getDateFromUser()async{
  DateTime ?pickdate=await  showDatePicker(context: context, initialDate: selectedDate, firstDate:  DateTime(2015), lastDate: DateTime(2100));
if(pickdate!=null){
  setState((){
    selectedDate=pickdate;
  });

}


  }


  getTimeFromUser(bool isStart)async{
   TimeOfDay ?pickTime=await  showTimePicker(context: context,initialTime: isStart?TimeOfDay.fromDateTime(DateTime.now())
       :TimeOfDay.fromDateTime( DateTime.now().add( Duration(minutes: 15))),);

      if(isStart){
        setState((){
          startTime=pickTime as String;
        });
      }else if(!isStart){
        setState((){
          endTime=pickTime as String;
        });

      }


    }





  validatedate(){
    if(titleController.text.isEmpty||noteController.text.isEmpty){
      Get.snackbar( "requird",  "all field is requird ");
    }else  {

      addtasktodb();

      Get.back();
    }
  }
  addtasktodb()async{


      int va=await taskController.addTask(
        task:Task(
          title: titleController.text,
          note: noteController.text,
          isCompleted: 0,
          data: DateFormat.yMd().format(selectedDate)
          ,color:_controller.color.value ,

          repeat: dropdownvalue,
          startTime: startTime,
          endTime: endTime,
        )
    );




  }


  }



