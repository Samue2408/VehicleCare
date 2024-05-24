import 'package:flutter/material.dart';
import 'package:vehicle_care/Core/Dominio/modelos/Questions.dart';

class QuestionsPage extends StatefulWidget {
  const QuestionsPage({super.key});

  @override
  State<QuestionsPage> createState() => _QuestionsPageState();
}

class _QuestionsPageState extends State<QuestionsPage> {
  // lista de preguntas a responder
  final List<Question> _Preguntas = [
    Question(
        enunciado: "1. Can you describe the steps to change the oil in a car?",
        opciones: [
          'A. Take out the old oil, put in the new one.',
          'B. Take out the old oil, change the oil filter, put in the new one.',
          'C. Just put the new oil.',
          'D. I don’t  know'
        ]),
    Question(
        enunciado:
            "2. How would you check the brake fluid level in your vehicle?",
        opciones: [
          'A. Looking at the color of the liquid.',
          'B. Measuring the amount of liquid in the tank.',
          'C. Testing the taste of the liquid.',
          'D. I don’t  know'
        ]),
    Question(
        enunciado:
            "3. What would an illuminated engine warning light on the dashboard indicate?",
        opciones: [
          'A. That the engine is hot.',
          'B. That there is a problem with the engine.',
          'C. That the engine is running correctly.',
          'D. I don’t  know'
        ]),
    Question(
        enunciado: "4. How would you identify a refrigerant leak?",
        opciones: [
          'A. Because of the smell.',
          'B. By the color of the liquid under the car.',
          'C. Because of the noise made by the engine.',
          'D. I don’t  know'
        ]),
    Question(
        enunciado:
            "5.What are the signs of tire wear that would indicate they need to be replaced?",
        opciones: [
          'A. If they are dirty.',
          'B. If they are less than 1.6mm deep in the slots.',
          'C. If they have been used for more than one year.',
          'D. I don’t  know'
        ]),
  ];

  int selectedOptionIndex =
      -1; // Índice de la opción seleccionada, -1 indica que ninguna está seleccionada

  @override
  Widget build(BuildContext context) {
    //variables
    double screenHeight = MediaQuery.of(context).size.height;
    //
    return SafeArea(
      child: Scaffold(
        //appBar: appbar_general(screenHeight),
        body: Container(
          //medidas
          width: double.infinity,
          height: screenHeight,
          padding: EdgeInsets.symmetric(horizontal: 30, vertical: 150),
          //decoration
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.black,
                Color(0xff050309),
              ],
            ),
          ),
          child: ListView(
            children: [
              Container(
                child: Text(
                  "Knowledge in vehicle’s maintenance",
                  style: TextStyle(
                      fontFamily: "Bruno Ace",
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 30),
                ),
              ),
              Container(),
              Container(
                margin: EdgeInsets.only(top: 60.0),
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: List.generate(
                    _Preguntas.length,
                    (index) {
                      final pregunta = _Preguntas[index];
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(pregunta.enunciado,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold)),
                          SizedBox(height: 20),
                          Column(
                            children: generateRadioButtons(pregunta, index),
                          ),
                          SizedBox(height: 20),
                        ],
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

/*Metodos para agregar la respuesta a la bases de datos: va contener dos parametros, el index de la pregunta y el
index de la opcion que se escoja.

notas: como la primera vez la lista de pregunta va a estar vacia, el bool va estar en false y va entrar en el else.
pero si ya escogí una respuesta y lo que hago es cambiar de opcion, el bool va hacer true y va entrar en el if. 
*/
  void _OpcionSeleccionada(int indexPregunta, int indexOpcion) {
    final Question preguntas = _Preguntas[indexPregunta];
    final String opcion = preguntas.opciones[indexOpcion];
    bool Seleccion = preguntas.respuestas.contains(
        opcion); //el constains es para verificar que la opcion que se esocja está dentro de mi lista

    final respuest = List<String>.from(preguntas
        .respuestas); //esto se hace para replicar la lista de respuestas

    //agg las respuestas a la lista para que se esté actualizando
    if (Seleccion) {
      respuest.remove(opcion);
    } else {
      //entra en el else si la respuesta no está seleccionada
      respuest.add(opcion);
    }
    _Preguntas[indexPregunta] = preguntas.ActaualizarPregunta(respuest);
    setState(() {});
  }

  List<Widget> generateRadioButtons(Question pregunta, int index) {
    return List.generate(
      pregunta.opciones.length,
      (optionIndex) {
        return Row(
          children: [
            Radio<int>(
              value: optionIndex,
              groupValue: selectedOptionIndex,
              onChanged: (value) {
                setState(() {
                  selectedOptionIndex = value!;
                });
              },
              activeColor: Colors.purple,
            ),
            Text(pregunta.opciones[optionIndex],
                style: TextStyle(color: Colors.white)),
          ],
        );
      },
    );
  }
}
