import 'dart:math';
//import 'package:flutter/material.dart';

void main() {
  
  
 
  
}

  //List<String> abecedario = List.generate(26, (index) => String.fromCharCode('a'.codeUnitAt(0) + index));
  //print(abecedario);

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

