import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:notesappflutter/models/response_mode.dart';
import 'package:notesappflutter/utils/configs/api_config.dart';

class NoteServices {
  final String _baseUrl = "${ApiConfig.baseUrl}/notes";

  Future<ResponseModel> saveNote({required String title, required String tags, required String body}) async {
    /* merubah string to List dipisahkan dengan coma dan menghapus spasi */
    List tagsList = tags.split(",").map((tag) => tag.trim()).toList();

    // todo: dapatkan access token dari lokal storage
    final String? accessToken = "123";
    final response = await http.post(
      Uri.parse(_baseUrl),
      headers: {
        "Content-Type": "application/json; charset=UTF-8",
        "Authorization": "Bearer $accessToken"
      },
      body: jsonEncode({
        "title": title,
        "tags": tagsList, // tags ini harus bertipe List
        "body": body,
      }),
    );

    return ResponseModel.fromJson(jsonDecode(response.body));
  }

  // todo: return ResponseModel
  Future getNotes() async {
    /*
    * untuk mendapatkan semua note gunakan method http.get() method
    * pada link berikut https://notesapi.caniget.my.id:443/notes
    * gunakan auth Bearer pada bagian header
    * @return ResponseModel
    */
  }

  // todo: return ResponseModel
  Future deleteNotes({required String noteId }) async {
    /*
    * untuk menghapus salah satu note gunakan method http.delete() method
    * pada link berikut https://notesapi.caniget.my.id:443/notes/{id}
    * gunakan noteId sebagai path parameter
    * gunakan auth Bearer pada bagian header
    * @return: ResponseModel
    */
  }
}