import 'package:http/http.dart' as http;
import 'dart:convert';
get() async{
  try {
    var response;
    // response = await http.post(Uri.parse('https://openid.sfedu.ru/server.php/login'), body: {'openid_url':'ivzaharov@sfedu.ru','password':'Qaplqapl'});
    // print("Response status: ${response.statusCode}");
    // print("Response body: ${response.body}");
     response = await http.get(Uri.parse('https://schedule.sfedu.ru/APIv1/schedule/group/16'));

    print("Response status: ${response.statusCode})");
    print("Response body: ${response.body}");
    final shedule = jsonDecode(response.body);
    print('${shedule.runtimeType} : $shedule');
    print(shedule['curricula']);
    List<Map<String, dynamic>> k = [];
    List<Map<String, dynamic>> fina = [];
    for (Map<String, dynamic> element in shedule['lessons']) {
      k.add(element);
    }
    for(int i = 0; i<6; i++){
      for (Map<String, dynamic> element in k) {
        if(element['timeslot'].toString()[1] == i.toString())fina.add(element);
      }
    }
    for (Map<String, dynamic> element in fina) {
      print(element);
    }

  }catch(error){print("Error: $error");}


}