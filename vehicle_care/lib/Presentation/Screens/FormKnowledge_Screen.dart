import 'package:flutter/material.dart';
import 'package:vehicle_care/Core/Dominio/modelos/Questions.dart';
import 'package:vehicle_care/Presentation/Screens/RegisterCarScreen.dart';

class QuestionsPage extends StatefulWidget {
  const QuestionsPage({super.key});

  static const String routeName = "FormScreen";

  @override
  State<QuestionsPage> createState() => _QuestionsPageState();
}

List<Icon> ne = <Icon>[Icon(Icons.abc), Icon(Icons.abc)];

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
  Map<int, int> selectedOptionIndexes =
      {}; // Mapa para mantener el estado de las selecciones

  @override
  void initState() {
    super.initState();
    // Inicializar el estado de las selecciones
    _Preguntas.asMap().forEach((index, pregunta) {
      selectedOptionIndexes[index] = -1; // -1 indica ninguna selección
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> generateRadioButtons(Question pregunta, int index) {
      double screenHeight = MediaQuery.of(context).size.height;
      return List.generate(
        pregunta.opciones.length,
        (optionIndex) {
          return Flex(direction: Axis.horizontal, children: [
            Expanded(
              child: Row(
                children: [
                  Radio<int>(
                    value: optionIndex,
                    groupValue: selectedOptionIndexes[index],
                    onChanged: (value) {
                      setState(() {
                        selectedOptionIndexes[index] = value!;
                      });
                    },
                    activeColor: Colors.purple,
                  ),
                  Expanded(
                    child: Text(
                      pregunta.opciones[optionIndex],
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: screenHeight * 0.016,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ]);
        },
      );
    }

    //variables
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    //
    return SafeArea(
      child: Scaffold(
        body: Container(
          //medidas
          width: double.infinity,
          height: screenHeight,
          padding: EdgeInsets.symmetric(horizontal: 30),
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
              SizedBox(height: screenHeight * 0.097),
              const Text(
                "Knowledge in vehicle’s maintenance",
                style: TextStyle(
                    fontFamily: "Bruno Ace",
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 30),
              ),
              Text(
                "This is a form to know your level of knowledge about vehicle maintenance",
                style: TextStyle(
                    fontFamily: "Jura",
                    color: Colors.white,
                    fontWeight: FontWeight.w100,
                    fontSize: screenWidth * 0.04),
              ),
              Container(
                margin: EdgeInsets.only(top: 60.0),
                child: Column(
                  //crossAxisAlignment: CrossAxisAlignment.start,
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
                          SizedBox(height: screenHeight * 0.021),
                          Wrap(
                            children: generateRadioButtons(pregunta,
                                index), // Utiliza la función para generar los Radio buttons
                          ),
                          SizedBox(height: 20),
                        ],
                      );
                    },
                  ),
                ),
              ),
              ElevatedButton(
                style: ButtonStyle(
                    backgroundColor:
                        const MaterialStatePropertyAll(Color(0xFF1B0950)),
                    minimumSize: MaterialStateProperty.all<Size>(
                        Size(screenWidth * 0.010, screenHeight * 0.065))),
                child: const Text(
                  'Send',
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
                onPressed: () {
                  Navigator.pushReplacementNamed(
                      context, RegisterCarScreen.routeName);
                },
              ),
              const SizedBox(height: 50)
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
    setState(() {
      selectedOptionIndexes[indexPregunta] = indexOpcion;
    });
  }

  List<String> getSelectedResponses() {
    List<String> respuestas = [];
    selectedOptionIndexes.forEach((indexPregunta, indexOpcion) {
      if (indexOpcion != -1) {
        respuestas.add(_Preguntas[indexPregunta].opciones[indexOpcion]);
      }
    });
    return respuestas;
  }
}
