import 'package:flutter/material.dart';
import 'package:budget_bites/main.dart';
import 'package:budget_bites/themes/appColorTheme.dart';
import 'package:budget_bites/themes/appTextTheme.dart';

class signUpEquipment extends StatefulWidget{
  @override
  _signUpEquipment createState()=> _signUpEquipment();
}

class _signUpEquipment extends State<signUpEquipment> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset : false, //so it doesnt cause error when having keyboard
      body: Container(
        color: appColorTheme.backgroundColor,
        child : Stack(
          alignment: AlignmentDirectional.topEnd, //puts components from top to bottom
          children: [
            Center( //centering everything on the page
              child: Column( //so things dont overlap
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(padding: EdgeInsets.only(top : screenHeight * 0.05)),
                  Container( //for text under title
                    alignment: Alignment.center,
                    width: screenWidth* .7,
                    height: screenHeight * .1,
                    //padding: EdgeInsets.only(bottom: screenHeight * .01),
                    child : Text(
                        'What equipment do you own?',
                        maxLines: 2,
                        textAlign: TextAlign.center,
                        style: appTextTheme.textUnderTitleSmaller,
                    ),
                  ),
                  Padding(padding: EdgeInsets.only(bottom : screenHeight * 0.02)),
                  Container(
                    alignment: Alignment.center,
                    width: screenWidth * .9,
                    height: screenHeight * .7,
                    padding: EdgeInsets.only(bottom: screenHeight * .02),
                    child: cuisineList(),
                  ),
                  enterEquipmentButton(),
                  
                ],
              )
            )
          ]
        )
      )
    );
  }
}



class enterEquipmentButton extends StatelessWidget{
  enterEquipmentButton({super.key});
  @override
  Widget build(BuildContext context){
    return InkWell(
      child: Container(
        height: screenHeight * .07,
      width: screenWidth * .7,
      child: Center(
        child : Text(
          'Continue',
          style: appTextTheme.signInUpButton,
        )
      ),
      decoration: BoxDecoration(
        color: appColorTheme.buttonColor,
        borderRadius: BorderRadius.circular(30),
      ),
      ),
      onTap: (){
          //Navigator.push(context, MaterialPageRoute(builder: (context) => signUpCuisine()),);
      },
    );
  }
}



class equipment{
  String equipmentName;
  var equipmentOwned = false;
  equipment(this.equipmentName, this.equipmentOwned);
}

class cuisineList extends StatefulWidget{
  @override
  _cuisineList createState() => _cuisineList();
}

class _cuisineList extends State<cuisineList>{
  List<equipment> equipmentList =[
    equipment('equipment', false),
    equipment('equipment1', false),
    equipment('equipment2', false),
    equipment('equipment3', false),
    equipment('equipment', false),equipment('equipment', false),equipment('equipment', false),
    equipment('equipment', false),
    equipment('equipment', false),
    equipment('equipment', false),
    equipment('equipment4', false),
    equipment('equipment', false),
    equipment('equipment', false),
    equipment('equipment', false),
    equipment('equipment', false),
    equipment('equipment', false),
  ];
  @override
  Widget build(BuildContext context){
    return Scrollbar(
      child: ListView.builder(
      itemCount: equipmentList.length,
      itemBuilder: (context, index){
        bool _valueCheck = equipmentList[index].equipmentOwned;
        return Card(
          child: CheckboxListTile(
            value: _valueCheck,
            onChanged: (value) {
              setState(() {
                equipmentList[index].equipmentOwned = value!;
                //_valueCheck = value!;
              });
              print(equipmentList[index].equipmentOwned);
            },
            title: Text(equipmentList[index].equipmentName)
          )
        );
      }
    ) 
    );
  }
}