import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:http/http.dart' as http;

class CarselectList extends StatefulWidget {
  const CarselectList({super.key});

  @override
  State<CarselectList> createState() => _CarselectListState();
}

class _CarselectListState extends State<CarselectList> {
  late List data = [];
  late int sseq = 0;
  late String sid = '';
  late String sbrand = '';
  late String smodel = '';
  late String stransmission = '';
  late String sfueltype = '';
  late int smileage = 0;
  late double smpg = 0;
  late int syear = 0;
  late double senginesize = 0;
  late List<String> carselect = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    data.clear();
    // _Carselect();
  }

  //sseq sbrand smodel stransmission sfueltype smileage smpg syear senginesize

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FutureBuilder(
          future: _Carselect(),
          builder: (context, snapshot) {
            if (snapshot.hasData == false) {
              return CircularProgressIndicator();
            } else {
              return Center(
                child: data.isEmpty
                    ? const Text('데이터가 없습니다')
                    : ListView.builder(
                        itemCount: data.length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {},
                            //sbrand smodel stransmission sfueltype smileage smpg syear senginesize
                            onLongPress: () {
                              // getJSONDate2();
                              // getJsonData();
                              sseq = data[index]['sseq'];
                              sbrand = data[index]['sbrand'];
                              smodel = data[index]['smodel'];
                              stransmission = data[index]['stransmission'];
                              sfueltype = data[index]['sfueltype'];
                              smileage = data[index]['smileage'];
                              smpg = data[index]['smpg'];
                              syear = data[index]['syear'];
                              senginesize = data[index]['senginesize'];

                              // Get.to(
                              //   const deletePage(),
                              // )?.then(
                              //   (value) => getJsonData(),
                              // );
                              // arguments: Message.data[index]['code']);
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(1.0),
                              child: Container(
                                child: Card(
                                  color: Color.fromARGB(255, 37, 64, 129),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      children: [
                                        Row(
                                          children: [
                                            const Text(
                                              'no : ',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.white),
                                            ),
                                            Text('${data[index]['sseq']}')
                                          ],
                                        ),
                                        // "sid":"dudgur@gmail.com"
                                        Row(
                                          children: [
                                            const Text(
                                              'id : ',
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            Text(data[index]['sid'])
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            const Text(
                                              'brand : ',
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            Text(data[index]['sbrand'])
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            const Text(
                                              'model : ',
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            Text(data[index]['smodel'])
                                          ],
                                        ),
                                        //[{"sseq":1,"sid":"dudgur@gmail.com","sbrand":"BMW","smodel":"5Series","stransmission":"Automatic","sfueltype":"Diesel","smileage":15000,"smpg":16,"syear":2014,"senginesize":2.0},
                                        Row(
                                          children: [
                                            const Text(
                                              'transmission : ',
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            Text(data[index]['stransmission'])
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            const Text(
                                              'fueltype : ',
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            Text(data[index]['sfueltype'])
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            const Text(
                                              'mileage : ',
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            Text('${data[index]['smileage']}')
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            const Text(
                                              'mpg : ',
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            Text('${data[index]['smpg']}')
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            const Text(
                                              'year : ',
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            Text('${data[index]['syear']}')
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            const Text(
                                              'enginesize : ',
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            Text(
                                                '${data[index]['senginesize']}')
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
              );
            }
          },
        ),
      ),
    );
  }

// funtion
  Future<List> getJsonData() async {
    var url = Uri.parse('http://localhost:8080/search/list/dudgur@gmail.com');
    var respnse = await http.get(url);
    var dataConvertedJson = json.decode(utf8.decode(respnse.bodyBytes));
    // print(dataConvertedJson);

    return dataConvertedJson;
  }

  Future<List> _Carselect() async {
    getJsonData().then((value) {
      data.addAll(value);

      print(data);
    });
    return carselect;
  }
}//end