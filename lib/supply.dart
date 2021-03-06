import 'package:http/http.dart' as http;
import 'dart:convert';


Map<String, String> lessons = {}; // id : Название, номер аудитории
Map<String, String> time = {};    // id : Время
List<String> out = [];            // Время, Название, номер аудитории

listsCreator(var shedule){
  List<Map<String, dynamic>> local = [];

  for(int i = 0; i<6; i++){
    for (Map<String, dynamic> element in shedule['lessons']) {
      if(element['timeslot'].toString()[1] == i.toString())local.add(element);
    }
  }

  for (Map<String, dynamic> element in shedule['curricula']) {
    lessons.putIfAbsent(element["lessonid"].toString(), () => element["subjectname"].toString() + " " + element["roomname"].toString());
  }

  for (Map<String, dynamic> element in local) {
    time.putIfAbsent(element["id"].toString(), () => element["timeslot"].toString());
  }

  print(lessons);
  print(time);

  totalOut();
}


get() async{
  try {
    var response;
    // response = await http.post(Uri.parse('https://openid.sfedu.ru/server.php/login'), body: {''});
    // print("Response status: ${response.statusCode}");
    // print("Response body: ${response.body}");

     response = await http.get(Uri.parse('https://schedule.sfedu.ru/APIv1/schedule/group/16'));

    print("Response status: ${response.statusCode})");
    print("Response body: ${response.body}");

    final shedule = jsonDecode(response.body);
    print('${shedule.runtimeType} : $shedule');
    // print(shedule['curricula']);

    listsCreator(shedule);

  }catch(error){print("Error: $error");}

}

totalOut(){
  time.forEach((key, value) {
    var local = value.toString().split(",");
    out.add(lessons[key].toString() + " " + local[1].substring(0, local[1].lastIndexOf(":")) + " - " + local[2].substring(0, local[2].lastIndexOf(":")));
  });

}