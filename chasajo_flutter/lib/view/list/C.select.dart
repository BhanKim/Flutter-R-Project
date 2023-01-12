import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class CarselectList extends StatefulWidget {
  const CarselectList({super.key});

  @override
  State<CarselectList> createState() => _CarselectListState();
}

class _CarselectListState extends State<CarselectList> {
  var userid = Get.arguments ?? "_";
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

  // user id result
  final user = FirebaseAuth.instance.currentUser;
  Map<String, dynamic> userData = {};

  Future<void> _sendMessage() async {
    FocusScope.of(context).unfocus();
    final docRef = FirebaseFirestore.instance.collection("user").doc(user!.uid);
    await docRef.get().then(
      (DocumentSnapshot doc) {
        userData = doc.data() as Map<String, dynamic>;
      },
      onError: (e) => print("Error getting document: $e"),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    data.clear();
    // getJsonData();
    print(userid);
  }

  //sseq sbrand smodel stransmission sfueltype smileage smpg syear senginesize
// carinsert(userData['email']);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FutureBuilder(
          future: getJsonData(),
          builder: (context, snapshot) {
            if (snapshot.hasData == false) {
              return const CircularProgressIndicator();
            } else {
              return Center(
                child: data.isEmpty
                    ? const Text('데이터가 없습니다')
                    : ListView.builder(
                        itemCount: data.length,
                        itemBuilder: (context, index) {
                          return Dismissible(
                            key: Key("${data[index]['sseq']}"),
                            onDismissed: (direction) {
                              // setState(() {
                              sseq = data[index]['sseq'];
                              deleteList();
                              // data.clear();
                              data.removeAt(index);
                              // });
                            },
                            child: GestureDetector(
                              onTap: () {},
                              child: Padding(
                                padding: const EdgeInsets.all(6.0),
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
                                                  color: Colors.white,
                                                ),
                                              ),
                                              Text(
                                                '${data[index]['sseq']}',
                                                style: const TextStyle(
                                                  color: Colors.white,
                                                ),
                                              )
                                            ],
                                          ),
                                          // "sid":"dudgur@gmail.com"
                                          Row(
                                            children: [
                                              const Text(
                                                'user ID : ',
                                                style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.white,
                                                ),
                                              ),
                                              Text(
                                                data[index]['sid'],
                                                style: const TextStyle(
                                                  color: Colors.white,
                                                ),
                                              )
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              const Text(
                                                'brand : ',
                                                style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.white,
                                                ),
                                              ),
                                              Text(
                                                data[index]['sbrand'],
                                                style: const TextStyle(
                                                  color: Colors.white,
                                                ),
                                              )
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              const Text(
                                                'model : ',
                                                style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.white,
                                                ),
                                              ),
                                              Text(
                                                data[index]['smodel'],
                                                style: const TextStyle(
                                                  color: Colors.white,
                                                ),
                                              )
                                            ],
                                          ),
                                          //[{"sseq":1,"sid":"dudgur@gmail.com","sbrand":"BMW","smodel":"5Series","stransmission":"Automatic","sfueltype":"Diesel","smileage":15000,"smpg":16,"syear":2014,"senginesize":2.0},
                                          Row(
                                            children: [
                                              const Text(
                                                'transmission : ',
                                                style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.white,
                                                ),
                                              ),
                                              Text(
                                                data[index]['stransmission'],
                                                style: const TextStyle(
                                                  color: Colors.white,
                                                ),
                                              )
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              const Text(
                                                'fueltype : ',
                                                style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.white,
                                                ),
                                              ),
                                              Text(
                                                data[index]['sfueltype'],
                                                style: const TextStyle(
                                                  color: Colors.white,
                                                ),
                                              )
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              const Text(
                                                'mileage : ',
                                                style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.white,
                                                ),
                                              ),
                                              Text(
                                                '${data[index]['smileage']}',
                                                style: const TextStyle(
                                                  color: Colors.white,
                                                ),
                                              )
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              const Text(
                                                'mpg : ',
                                                style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.white,
                                                ),
                                              ),
                                              Text(
                                                '${data[index]['smpg']}',
                                                style: const TextStyle(
                                                  color: Colors.white,
                                                ),
                                              )
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              const Text(
                                                'year : ',
                                                style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.white,
                                                ),
                                              ),
                                              Text(
                                                '${data[index]['syear']}',
                                                style: const TextStyle(
                                                  color: Colors.white,
                                                ),
                                              )
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              const Text(
                                                'enginesize : ',
                                                style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.white,
                                                ),
                                              ),
                                              Text(
                                                '${data[index]['senginesize']}',
                                                style: const TextStyle(
                                                  color: Colors.white,
                                                ),
                                              )
                                            ],
                                          )
                                        ],
                                      ),
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
    var url = Uri.parse('http://localhost:8080/search/list/$userid');
    var respnse = await http.get(url);
    var dataConvertedJson = json.decode(utf8.decode(respnse.bodyBytes));
    data.addAll(dataConvertedJson);
    return data;
  }

  // list search end

  // desc 조회한 차 리스트 삭제.
  // data 2023/01/11(수)
  deleteList() async {
    var url = Uri.parse('http://localhost:8080/search/delete/$userid/$sseq');
    await http.get(url);
    // getJsonData();
  }

  ///search/delete/{sid}/{sseq}
  // Future<List> _Carselect(userData) async {
  //   getJsonData().then((value) {
  //     print(value);
  //     data.addAll(value);
  //   });
  //   return data;

  // }
}//end