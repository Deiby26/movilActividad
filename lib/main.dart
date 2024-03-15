import 'package:flutter/material.dart';
import 'dart:math';
void static; String seleccionarletrasMayus(int numero){ 
  List<String> alphabet = List.generate(26, (int index) => String.fromCharCode('A'.codeUnitAt(0) + index));
  Random random = Random();
  String password = '';
  for (int i = 0; i < numero; i++){
    int randomIndex = random.nextInt(alphabet.length);
    String randomLetter = alphabet[randomIndex];
    password = password + randomLetter;
  }
  return password;
}
String seleccionarLetrasMinusculas(int numero) {
  List<String> alphabet = List.generate(26, (int index) => String.fromCharCode('a'.codeUnitAt(0) + index));
  Random random = Random();
  String password = '';
  for (int i = 0; i < numero; i++) {
    int randomIndex = random.nextInt(alphabet.length);
    String randomLetter = alphabet[randomIndex];
    password += randomLetter;
  }
  return password;
}

String seleccionarNumeros(int numero) {
  Random random = Random();
  String password = '';
  for (int i = 0; i < numero; i++) {
    int randomNumber = random.nextInt(10); 
    password += randomNumber.toString(); 
  }
  return password;
}

String seleccionarEspeciales(int numero) {
  Random random = Random();
  List<String> caracteresEspeciales = ['!', '@', '#', '\$', '%', '^', '&', '*', '(', ')', '-', '_', '+', '=', '{', '}', '[', ']', '|', '\\', ';', ':', '"', '\'', ',', '.', '<', '>', '/', '?'];
  String password = '';
  for (int i = 0; i < numero; i++) {
    int randomIndex = random.nextInt(caracteresEspeciales.length);
    String randomChar = caracteresEspeciales[randomIndex];
    password += randomChar;
  }
  return password;
}
String combinarCadenas(String selectedLetter, String selectedLetterMinusculas,
    String selectednums, String selectedespecial) {
  int minLength = min(selectedLetter.length, selectedLetterMinusculas.length);
  minLength = min(minLength, selectednums.length);
  minLength = min(minLength, selectedespecial.length);

  String combinedString = '';

  for (int i = 0; i < minLength; i++) {
    combinedString += selectedLetter[i] +
        selectedLetterMinusculas[i] +
        selectednums[i] +
        selectedespecial[i];
  }

  combinedString = combinedString.substring(0, minLength);

  return combinedString;
}


void main() {
  runApp(const MainApp());
}
class MainApp extends StatefulWidget {
  const MainApp({Key? key}) : super(key: key);
  @override
  _MainAppState createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  String mostarLingitud = "";
  int sval1 = 0;
  double _currentSlideValue = 10;
  String selectedLetter = '';
  String selecdLetterminusculas = '';
  String selectednums = '';
  String selectedespecial = '';
  bool? _isCheked = false;
  bool? _ischekedmin = false;
  bool? _ischekednum = false;
  bool? _ischekedcarak =false;

  @override
  Widget build(BuildContext context) {
    var data = 'G E N E R A D O R';
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Center(child: Text(data)),
          backgroundColor: Color.fromARGB(255, 105, 162, 36),
        ),
        body: Column(
          children: [
            Container(
              color: Color.fromARGB(255, 200, 208, 80),
              height: 50,
              width: 600,
              child: const Center(child: Text("B I E N V E N I D O")),
            ),
            
            Slider(
              value: _currentSlideValue,
              min: 0,
              max: 10,
              divisions: 10,
              label: _currentSlideValue.toString(),
              onChanged: (double value) {
                setState(() {
                  _currentSlideValue = value;
                  sval1 = (_currentSlideValue.toInt());  
                  mostarLingitud = _currentSlideValue.toString();  
                });
              },            
            ),
            Text('Longitud de la contraseña: $mostarLingitud'),
            
            
            CheckboxListTile(
              title: const Text("Mayusculas: "),
              value: _isCheked, 
              onChanged: (bool? newValue){
                setState(() {
                  _isCheked = newValue;
                  _isCheked = _isCheked;
                  if (_isCheked == false){
                    selectedLetter = "";
                  }else {
                    selectedLetter = seleccionarletrasMayus(sval1);
                    

                  }

                });
              }              
              ),
        
            CheckboxListTile(
              title: Text("Minusculas: "),
              value: _ischekedmin,
              onChanged: (bool? newvalue2){
                setState(() {
                  _ischekedmin = newvalue2;
                  if (_ischekedmin == false){
                    selecdLetterminusculas = "";
                  } else {
                    selecdLetterminusculas = seleccionarLetrasMinusculas(sval1);
                  }
                });
              }
              ),
            CheckboxListTile(
              title: Text("Numeros: "),
              value: _ischekednum,
              onChanged: (bool? newvalue3){
                setState(() {
                  _ischekednum = newvalue3;
                  if (_ischekednum == false){
                    selectednums = '';

                    
                  } else {
                    selectednums = seleccionarNumeros(sval1);

                  }
                });
              }
              ),

            CheckboxListTile(
              title: Text("Caracteres especiales: "),
              value: _ischekedcarak, 
              onChanged: (bool? newvalue4){
                setState(() {
                  _ischekedcarak = newvalue4;
                  if (_ischekedcarak == false){
                    selectedespecial= '';
                  } else {
                    selectedespecial = seleccionarEspeciales(sval1);
                  }
                  
                });
              }
              ),
              
              Text('contraseña mayuculas: $selectedLetter', style:TextStyle(color: Colors.blue),),
              Text('contraseña minusculas: $selecdLetterminusculas', style: TextStyle(color: Colors.amber),),
              Text('Contraseña numeros: $selectednums'),
              Text('Contraseña especial: $selectedespecial'),
              Text('contraseña combinada: ${combinarCadenas(selectedLetter, selecdLetterminusculas, selectednums, selectedespecial)}', style: TextStyle(color: const Color.fromARGB(255, 5, 101, 55)),),
              ElevatedButton(
                onPressed: (){
                  setState(() {
                    _isCheked = false;
                    _ischekedmin = false;
                    _ischekednum = false;
                    _ischekedcarak = false;
                    selectedLetter = '';
                    selecdLetterminusculas = '';
                    selectednums = '';
                    selectedespecial = '';
                    
                  });
                }, 
                child: const Text("Generar nueva contraseña")),
              
              Container(
                width: 160,
                
                child: Image.network('https://us.123rf.com/450wm/123vector/123vector1709/123vector170900251/86132604-ilustraci%C3%B3n-del-icono-del-candado-verde-del-c%C3%ADrculo.jpg'),)

            
          ],
        ),
        
      ),
    );
  }
}
