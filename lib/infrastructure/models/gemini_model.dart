import 'dart:convert';

class GeminiResponse {
    final String question;
    final String response;

    GeminiResponse({
        required this.question,
        required this.response,
    });

    factory GeminiResponse.fromJson(String str) => GeminiResponse.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory GeminiResponse.fromMap(Map<String, dynamic> json) => GeminiResponse(
        question: json["question"],
        response: json["response"],
    );

    Map<String, dynamic> toMap() => {
        "question": question,
        "response": response,
    };
}
