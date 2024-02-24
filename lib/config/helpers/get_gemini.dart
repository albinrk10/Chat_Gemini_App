import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:yes_no_app/infrastructure/models/gemini_model.dart';

class GetYesNoAnswer {
  final _dio = Dio(); // Inicializa una nueva instancia de Dio

  Future getAnswer(String question) async {
    // Realiza una solicitud GET a la URL proporcionada y pasa "question" como parámetro de consulta
    final response = await _dio.get(
        // 'https://gemini-bankend-dart-dghdk1a-albinrk10.globeapp.dev/ask',  //produccion
        'http://10.0.2.2:8080/ask',  //local
        queryParameters: {
          'question': question,
        });

    // Convierte la respuesta en una instancia de GeminiResponse
    final yesNoModel = GeminiResponse.fromMap(response.data);

    // Devuelve el campo "response" de la instancia de GeminiResponse
    log('Response: ${yesNoModel.response}');
    return yesNoModel.response;
  }
}
