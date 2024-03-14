import 'package:flutter/material.dart';
import 'index.dart';

void main() {
  runApp(const MainApp());
  
}

class MainApp extends StatefulWidget {
  const MainApp({Key? key}) : super(key: key);

  @override
  
  _MainAppState createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  double _currentSlideValue = 10;
  String selectedLetter = '';
  bool? _isCheked = false;
  bool? _ischekedmin = false;
  bool? _ischekednum = false;
  bool? _ischekedcarak =false;

  bool? valor1 = false;
  


  @override
  Widget build(BuildContext context) {
    var data = 'Generador de contraseñas';
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Center(child: Text(data)),
          backgroundColor: Colors.lightBlue,
        ),
        body: Column(
          children: [
            Container(
              color: const Color.fromARGB(255, 99, 192, 235),
              height: 50,
              width: 600,
              child: const Center(child: Text("B I E N V E N I D O")),
            ),
            const Text("Longitud de la contraseña"),
            Slider(
              value: _currentSlideValue,
              min: 0,
              max: 10,
              divisions: 10,
              label: _currentSlideValue.toString(),
              onChanged: (double value) {
                setState(() {
                  _currentSlideValue = value;
                  selectedLetter = seleccionarletrasMayus(_currentSlideValue.toInt());      
                });
              },            
            ),
            Text(selectedLetter),
            CheckboxListTile(
              title: const Text("Mayusculas: "),
              value: _isCheked, 
              onChanged: (bool? newValue){
                setState(() {
                  _isCheked = newValue;
                  valor1 = _isCheked;


                });
              }              
              ),
            CheckboxListTile(
              title: Text("Minusculas: "),
              value: _ischekedmin,
              onChanged: (bool? newvalue2){
                setState(() {
                  _ischekedmin = newvalue2;
                });
              }
              ),
            CheckboxListTile(
              title: Text("Numeros: "),
              value: _ischekednum,
              onChanged: (bool? newvalue3){
                setState(() {
                  _ischekednum = newvalue3;
                });
              }
              ),

            CheckboxListTile(
              title: Text("Caracteres especiales: "),
              value: _ischekedcarak, 
              onChanged: (bool? newvalue4){
                setState(() {
                  _ischekedcarak = newvalue4;
                });
              }
              ),
              Text(valor1.toString())

            
          ],
        ),
        
      ),
    );
  }
}
