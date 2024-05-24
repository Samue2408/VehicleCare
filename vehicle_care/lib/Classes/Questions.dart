class Question {
  final String enunciado;
  final List<String> opciones;
  final List<String> respuestas;


  Question({
    required this.enunciado,
    required this.opciones,
    this.respuestas = const[], //esto para que sea una lista vacia por lo que no sabemos la respuestas    
  });


  Question ActaualizarPregunta(List<String> resp){
    return Question(enunciado: enunciado, opciones: opciones, respuestas: resp);
  }

}