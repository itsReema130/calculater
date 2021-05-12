import "package:flutter/material.dart";
import 'package:math_expressions/math_expressions.dart';

class SimpleCalculater extends StatefulWidget {
  SimpleCalculater({Key key}) : super(key: key);

  @override
  _SimpleCalculaterState createState() => _SimpleCalculaterState();
}

class _SimpleCalculaterState extends State<SimpleCalculater> {

  String equation = "0";
  String result = "0";
  String expression = "";
  double equationFontSize = 38.0;
  double resultFontSize = 48.0;
buttonPressed(String buttonText){
  setState(() {
    if (buttonText == "C") {
      equation="0";
      result="0";

      
    } else if(buttonText == "⌫") {
      equation=equation.substring(0,equation.length - 1 );
      if(equation==""){
        equation="0";
      }
    } else if(buttonText == "=") {
         expression = equation;
        expression = expression.replaceAll('×', '*');
        expression = expression.replaceAll('÷', '/');

        try{
          Parser p = Parser();
          Expression exp = p.parse(expression);
          ContextModel cm = ContextModel();
          result = '${exp.evaluate(EvaluationType.REAL, cm)}';
        }catch(e){

          result = "Try Again !";
        }

      
      
    } else{
      if(equation =="0"){
        equation=buttonText;
      }else{
      equation =equation +buttonText;}
    }
  });

}

  Widget buildButton (String buttonText, double buttonHeight, Color buttonColor){
    return Container(
                         height: MediaQuery.of(context).size.height * 0.1 *buttonHeight,
                        //  color: Colors.grey[400],
                         child: ElevatedButton(
                           
                           style: ElevatedButton.styleFrom(
                             elevation: 20,  
                             primary: Colors.pink[100],
                             padding: EdgeInsets.all(12.0),
                            //  shadowColor: Color(colo),
                             shape: RoundedRectangleBorder(
                               
                             borderRadius: BorderRadius.circular(30),
                             side: BorderSide(
                               color: buttonColor,
                               width: 3,
                               
                               style: BorderStyle.solid),
             
                           ),),
               
                          
                          //  padding: EdgeInsets.all(16.0),
                           
                           onPressed: () =>buttonPressed(buttonText),
                           child:Text(buttonText.toUpperCase(),
                           style: TextStyle(
                             fontSize: 30.0,
                             fontWeight: FontWeight.normal,
                             color: Colors.white,
                           ),),
                           ),
                       );
  }
        @override
        Widget build(BuildContext context) {
          return Scaffold(
            
            appBar: AppBar( title: Text("calculater".toUpperCase()),
            shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(30),)),
              backgroundColor: Colors.pink[100]),
            body: Column(
              children:<Widget>[

        Container(
          alignment: Alignment.centerRight,
          padding: EdgeInsets.fromLTRB(10, 20, 10,0),
          
          child: Text(equation,style: TextStyle(fontSize: equationFontSize),),
        ),

         Container(
          alignment: Alignment.centerRight,
          padding: EdgeInsets.fromLTRB(10, 20, 10,0),
          child: Text(result,style: TextStyle(fontSize: resultFontSize),),
        ),
        // top half of the screen
         Expanded(child: Divider(),),

        //  bottom half of the screen
         Row(
           mainAxisAlignment: MainAxisAlignment.center,
           children: [
             Container(
               width: MediaQuery.of(context).size.width *.75,
               child: Table(
                 children: [
                   TableRow(
                     
                     children: [
                       Padding(padding:EdgeInsets.only(left: 5,right: 10),
                    
                        child:buildButton("C", 1, Colors.pink[200]),),
                          Padding(padding:EdgeInsets.only(left: 5,right: 10),
                    
                        child:buildButton("⌫", 1, Colors. pink[200]),),
                          Padding(padding:EdgeInsets.only(left: 5,right: 10),
                    
                        child:buildButton("÷", 1,Colors.pink[200]),)
                      ]
                    ),

                    TableRow(
                        children: [
                            Padding(padding:EdgeInsets.only(left: 5,right: 10 ,top: 10),
                    
                        child:buildButton("7", 1, Colors.pink[200]),),
                            Padding(padding:EdgeInsets.only(left: 5,right: 10 ,top: 10),
                    
                        child:buildButton("8", 1, Colors.pink[200]),),
                            Padding(padding:EdgeInsets.only(left: 5,right: 10 ,top: 10),
                    
                        child:buildButton("9", 1, Colors.pink[200]),),
                        ]
                    ),

                    TableRow(
                        children: [
                            Padding(padding:EdgeInsets.only(left: 5,right: 10 ,top: 10),
                    
                        child:buildButton("4", 1, Colors.pink[200]),),
                           Padding(padding:EdgeInsets.only(left: 5,right: 10 ,top: 10),
                    
                        child: buildButton("5", 1, Colors.pink[200]),),
                            Padding(padding:EdgeInsets.only(left: 5,right: 10 ,top: 10),
                    
                        child:buildButton("6", 1, Colors.pink[200]),)
                        ]
                    ),

                    TableRow(
                        children: [
                            Padding(padding:EdgeInsets.only(left: 5,right: 10 ,top: 10),
                    
                        child:buildButton("1", 1, Colors.pink[200]),),
                            Padding(padding:EdgeInsets.only(left: 5,right: 10 ,top: 10),
                    
                        child:buildButton("2", 1, Colors.pink[200]),),
                            Padding(padding:EdgeInsets.only(left: 5,right: 10 ,top: 10),
                    
                        child:buildButton("3", 1, Colors.pink[200]),)
                        ]
                    ),

                    TableRow(
                        children: [
                            Padding(padding:EdgeInsets.only(left: 10,right: 10 ,top: 10,bottom: 40),
                    
                        child:buildButton(".", 1, Colors.pink[200]),),
                            Padding(padding:EdgeInsets.only(left: 5,right: 10 ,top: 10,bottom: 10),
                    
                        child:buildButton("0", 1, Colors.pink[200]),),
                            Padding(padding:EdgeInsets.only(left: 5,right: 10 ,top: 10,bottom: 10) ,
                    
                        child:buildButton("00", 1, Colors.pink[200]),),
                        ]
                    ),
                  ],
                ),
              ), 
                     Container(
                width: MediaQuery.of(context).size.width * 0.25,
                child: Table(
                  children: [
                    TableRow(
                        children: [
                            Padding(padding:EdgeInsets.only(left: 5,right: 10 ,top: 10),
                    
                        child:buildButton("×", 1, Colors.pink[200]),),
                        ]
                    ),

                    TableRow(
                        children: [
                            Padding(padding:EdgeInsets.only(left: 5,right: 10 ,top: 10),
                    
                        child:buildButton("-", 1, Colors.pink[200]),),
                        ]
                    ),

                    TableRow(
                        children: [
                            Padding(padding:EdgeInsets.only(left: 5,right: 10 ,top: 10),
                    
                        child:buildButton("+", 1, Colors.pink[200]),)
                        ]
                    ),

                    TableRow(
                        children: [
                            Padding(padding:EdgeInsets.only(left: 5,right: 10 ,top: 10,bottom: 50),
                    
                        child:buildButton("=", 2, Colors.pink[200]),)
                        ]
                    ),
                  ],
                ),
              )
                     ]
                   )
                 ],

               ),
           ) ;
          

         
       
     
  }
}