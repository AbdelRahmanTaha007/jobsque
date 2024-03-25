import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobsque/controllers/SearchCubit/search_cubit.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});
  static const route = "searchScreen";
  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

final searchController = TextEditingController();
bool isThereData = true;

class _SearchScreenState extends State<SearchScreen> {
  void initState() {
    super.initState();
    SearchCubit.get(context).getSearches();
  }

  List<String> searchesName = [
    "UI/UX Designer",
    "Graphic Designer",
    "Flutter Developer",
    "Web Developer",
    "Civil Engineer",
    "University Proffesor",
    "Dentist",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          child: SafeArea(
              child: Container(
                  margin: EdgeInsets.only(top: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: 15, right: 15),
                        child: Row(
                          children: [
                            GestureDetector(
                                onTap: () {
                                  Navigator.pop(context);
                                },
                                child: Icon(Icons.arrow_back)),
                            SizedBox(
                              width: 20,
                            ),
                            Container(
                              width: 300,
                              height: 40,
                              child: TextFormField(
                                onChanged: (value) {
                                  setState(() {});
                                },
                                controller: searchController,
                                textAlign: TextAlign.start,
                                decoration: InputDecoration(
                                  prefixIcon: Icon(Icons.search),
                                  labelText: "Type Something...",
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(25)),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      (searchController.text == "")
                          ? Column(
                              children: [
                                Container(
                                  padding: EdgeInsets.only(left: 15),
                                  alignment: Alignment.centerLeft,
                                  width: 450,
                                  height: 40,
                                  decoration: BoxDecoration(
                                      color: Color.fromRGBO(229, 231, 235, 1)),
                                  child: Text(
                                    "Recent searches",
                                    style: TextStyle(fontSize: 16),
                                  ),
                                ),
                                Container(
                                  height: 330,
                                  width: 400,
                                  margin: EdgeInsets.only(left: 15, right: 15),
                                  child: ListView.builder(
                                    itemCount: searchesName.length,
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      return ListTile(
                                        leading: Icon(Icons.timer_sharp),
                                        title: Text(searchesName[index]),
                                        trailing: GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              
                                            searchesName.remove(index);
                                            });
                                          },
                                          child: Container(
                                            decoration: BoxDecoration(
                                                border: Border.all(
                                                    color: Colors.red),
                                                borderRadius:
                                                    BorderRadius.circular(35)),
                                            child: Icon(
                                              Icons.close,
                                              color: Colors.red,
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.only(left: 15),
                                  alignment: Alignment.centerLeft,
                                  width: 450,
                                  height: 40,
                                  decoration: BoxDecoration(
                                      color: Color.fromRGBO(229, 231, 235, 1)),
                                  child: Text(
                                    "Popular searches",
                                    style: TextStyle(fontSize: 16),
                                  ),
                                ),
                                Container(
                                  height: 250,
                                  width: 400,
                                  margin: EdgeInsets.only(left: 15, right: 15),
                                  child: ListView.builder(
                                    shrinkWrap: true,
                                    itemCount: searchesName.length,
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      return ListTile(
                                        leading: Icon(Icons.search),
                                        title: Text(searchesName[index]),
                                        trailing: GestureDetector(
                                          onTap: () {
                                            // searchesName.remove(index);
                                          },
                                          child: Icon(
                                            Icons.arrow_circle_right_outlined,
                                            color: Colors.blue,
                                            size: 35,
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ],
                            )
                          : (isThereData == true)
                              ? Container(
                                  child: Column(
                                    children: [
                                      Container(
                                        margin: EdgeInsets.only(left: 20),
                                        child: Row(
                                          children: [
                                            GestureDetector(
                                              onTap: () {
                                                showModalBottomSheet(
                                                  enableDrag: true,
                                                  context: context,
                                                  builder: (context) {
                                                    return Center(
                                                      child: Container(
                                                        height: 900,
                                                        child: Container(
                                                          margin:
                                                              EdgeInsets.only(
                                                                  left: 10,
                                                                  right: 10,
                                                                  top: 30),
                                                          child: Column(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Row(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceBetween,
                                                                children: [
                                                                  GestureDetector(
                                                                      onTap:
                                                                          () {},
                                                                      child: Icon(
                                                                          Icons
                                                                              .arrow_back)),
                                                                  Text(
                                                                    "Set Filter",
                                                                    style: TextStyle(
                                                                        fontWeight:
                                                                            FontWeight
                                                                                .bold,
                                                                        fontSize:
                                                                            18),
                                                                  ),
                                                                  Text(
                                                                    "Reset",
                                                                    style: TextStyle(
                                                                        color: Color(
                                                                            0xFF3366FF)),
                                                                  )
                                                                ],
                                                              ),
                                                              SizedBox(
                                                                height: 10,
                                                              ),
                                                              Text(
                                                                "Job Title",
                                                                textAlign:
                                                                    TextAlign
                                                                        .left,
                                                                style: TextStyle(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold),
                                                              ),
                                                              SizedBox(
                                                                height: 5,
                                                              ),
                                                              TextField(
                                                                decoration: InputDecoration(
                                                                    border: OutlineInputBorder(
                                                                        borderRadius:
                                                                            BorderRadius.circular(
                                                                                10)),
                                                                    hintText:
                                                                        "Enter Job Title...",
                                                                    prefixIcon:
                                                                        Icon(Icons
                                                                            .card_travel)),
                                                              ),
                                                              SizedBox(
                                                                height: 10,
                                                              ),
                                                              Text("Location",
                                                                  textAlign:
                                                                      TextAlign
                                                                          .left,
                                                                  style: TextStyle(
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold)),
                                                              SizedBox(
                                                                height: 5,
                                                              ),
                                                              TextField(
                                                                decoration: InputDecoration(
                                                                    border: OutlineInputBorder(
                                                                        borderRadius:
                                                                            BorderRadius.circular(
                                                                                10)),
                                                                    hintText:
                                                                        "Enter Location",
                                                                    prefixIcon:
                                                                        Icon(Icons
                                                                            .card_travel)),
                                                              ),
                                                              SizedBox(
                                                                height: 10,
                                                              ),
                                                              Text("Salary",
                                                                  textAlign:
                                                                      TextAlign
                                                                          .left,
                                                                  style: TextStyle(
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold)),
                                                              SizedBox(
                                                                height: 5,
                                                              ),
                                                              TextField(
                                                                decoration: InputDecoration(
                                                                    border: OutlineInputBorder(
                                                                        borderRadius:
                                                                            BorderRadius.circular(
                                                                                10)),
                                                                    hintText:
                                                                        "Enter Salary",
                                                                    prefixIcon:
                                                                        Icon(Icons
                                                                            .card_travel)),
                                                              ),
                                                              SizedBox(
                                                                height: 15,
                                                              ),
                                                              ElevatedButton(
                                                                  onPressed:
                                                                      () {},
                                                                  child: Text(
                                                                      "Show results"))
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                    );
                                                  },
                                                );
                                              },
                                              child: Image.asset(
                                                  "assets/images/setting-4.png"),
                                            ),
                                            SizedBox(
                                              width: 10,
                                            ),
                                            SizedBox(
                                              width: 10,
                                            ),
                                            GestureDetector(
                                              onTap: () {
                                                showModalBottomSheet(
                                                  context: context,
                                                  builder: (context) {
                                                    return Container(
                                                      height: 200,
                                                      width: 450,
                                                      child: Column(
                                                        children: [
                                                          SizedBox(
                                                            height: 25,
                                                          ),
                                                          Text(
                                                            "On-Site/Remote",
                                                            style: TextStyle(
                                                                fontSize: 18,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                          ),
                                                          SizedBox(
                                                            height: 30,
                                                          ),
                                                          Container(
                                                            margin:
                                                                EdgeInsets.only(
                                                                    left: 10,
                                                                    right: 10),
                                                            child: Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceEvenly,
                                                              children: [
                                                                Container(
                                                                  padding:
                                                                      EdgeInsets
                                                                          .all(
                                                                              6),
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    border: Border.all(
                                                                        color: Colors
                                                                            .black12),
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            25),
                                                                  ),
                                                                  width: 80,
                                                                  height: 40,
                                                                  child: Center(
                                                                      child: Text(
                                                                          "Remote")),
                                                                ),
                                                                SizedBox(
                                                                  width: 5,
                                                                ),
                                                                Container(
                                                                  padding:
                                                                      EdgeInsets
                                                                          .all(
                                                                              6),
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    border: Border.all(
                                                                        color: Colors
                                                                            .black12),
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            25),
                                                                  ),
                                                                  width: 80,
                                                                  height: 40,
                                                                  child: Center(
                                                                      child: Text(
                                                                          "Remote")),
                                                                ),
                                                                SizedBox(
                                                                  width: 5,
                                                                ),
                                                                Container(
                                                                  padding:
                                                                      EdgeInsets
                                                                          .all(
                                                                              6),
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    border: Border.all(
                                                                        color: Colors
                                                                            .black12),
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            25),
                                                                  ),
                                                                  width: 80,
                                                                  height: 40,
                                                                  child: Center(
                                                                      child: Text(
                                                                          "Remote")),
                                                                ),
                                                                SizedBox(
                                                                  width: 5,
                                                                ),
                                                                Container(
                                                                  padding:
                                                                      EdgeInsets
                                                                          .all(
                                                                              6),
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    border: Border.all(
                                                                        color: Colors
                                                                            .black12),
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            25),
                                                                  ),
                                                                  width: 80,
                                                                  height: 40,
                                                                  child: Center(
                                                                      child: Text(
                                                                          "Remote")),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                          SizedBox(
                                                            height: 15,
                                                          ),
                                                          ElevatedButton(
                                                              onPressed: () {},
                                                              child: Text(
                                                                  "Show results"))
                                                        ],
                                                      ),
                                                    );
                                                  },
                                                );
                                              },
                                              child: Container(
                                                child: const Center(
                                                    child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Text(
                                                      "Remote",
                                                      style: TextStyle(
                                                          color: Colors.white),
                                                    ),
                                                    Icon(
                                                      Icons
                                                          .keyboard_arrow_down_outlined,
                                                      color: Colors.white,
                                                    )
                                                  ],
                                                )),
                                                decoration: BoxDecoration(
                                                  color: Color.fromRGBO(
                                                      9, 26, 122, 1),
                                                  border: Border.all(
                                                      color: Colors.black12),
                                                  borderRadius:
                                                      BorderRadius.circular(15),
                                                ),
                                                width: 100,
                                                height: 40,
                                              ),
                                            ),
                                            SizedBox(
                                              width: 10,
                                            ),
                                            GestureDetector(
                                              onTap: () {},
                                              child: Container(
                                                child: const Center(
                                                    child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Text(
                                                      "Full Time",
                                                      style: TextStyle(
                                                          color: Colors.white),
                                                    ),
                                                    Icon(
                                                      Icons
                                                          .keyboard_arrow_down_outlined,
                                                      color: Colors.white,
                                                    )
                                                  ],
                                                )),
                                                decoration: BoxDecoration(
                                                  color: Color.fromRGBO(
                                                      9, 26, 122, 1),
                                                  border: Border.all(
                                                      color:
                                                          const Color.fromARGB(
                                                              31, 0, 0, 0)),
                                                  borderRadius:
                                                      BorderRadius.circular(15),
                                                ),
                                                width: 100,
                                                height: 40,
                                              ),
                                            ),
                                            SizedBox(
                                              width: 10,
                                            ),
                                            GestureDetector(
                                              onTap: () {},
                                              child: Container(
                                                child: const Center(
                                                    child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Text(
                                                      "Post Date",
                                                    ),
                                                    Icon(Icons
                                                        .keyboard_arrow_down_outlined)
                                                  ],
                                                )),
                                                decoration: BoxDecoration(
                                                  color: Colors.black12,
                                                  border: Border.all(
                                                      color: Colors.black12),
                                                  borderRadius:
                                                      BorderRadius.circular(15),
                                                ),
                                                width: 100,
                                                height: 40,
                                              ),
                                            ),
                                            /////////
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Container(
                                        padding: EdgeInsets.only(left: 15),
                                        alignment: Alignment.centerLeft,
                                        width: 450,
                                        height: 40,
                                        decoration: BoxDecoration(
                                            color: Color.fromRGBO(
                                                229, 231, 235, 1)),
                                        child: Text(
                                          "Featuring No.+ jobs",
                                          style: TextStyle(fontSize: 16),
                                        ),
                                      ),
                                      BlocConsumer<SearchCubit, SearchState>(
                                        listener: (context, state) {
                                          if (state is SuccessGetSearchState) {
                                            print(state);
                                          }
                                          if (state is ErrorGetSearchState) {
                                            print(state);
                                          }
                                        },
                                        builder: (context, state) {
                                          return Container(
                                            margin: EdgeInsets.only(
                                                left: 15, right: 15, top: 20),
                                            child: ListView.builder(
                                              physics:
                                                  NeverScrollableScrollPhysics(),
                                              scrollDirection: Axis.vertical,
                                              shrinkWrap: true,
                                              itemCount:
                                                  SearchCubit.get(context)
                                                      .searches
                                                      .length,
                                              itemBuilder:
                                                  (BuildContext context,
                                                      int index) {
                                                var searchitem =
                                                    SearchCubit.get(context)
                                                        .searches[index];
                                                return Container(
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            15),
                                                  ),
                                                  width: 300,
                                                  margin: const EdgeInsets.only(
                                                      right: 10),
                                                  child: Container(
                                                    child: Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceEvenly,
                                                      children: [
                                                        Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            Row(
                                                              children: [
                                                                Image.network(
                                                                  searchitem
                                                                      .image!,
                                                                  width: 50,
                                                                  height: 60,
                                                                  fit: BoxFit
                                                                      .fill,
                                                                ),
                                                                const SizedBox(
                                                                  width: 15,
                                                                ),
                                                                Column(
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    Text(
                                                                      searchitem
                                                                          .name!,
                                                                      style: TextStyle(
                                                                          fontSize:
                                                                              18,
                                                                          fontWeight:
                                                                              FontWeight.bold),
                                                                    ),
                                                                    Text(
                                                                      searchitem
                                                                          .compName!,
                                                                      style:
                                                                          TextStyle(
                                                                        fontSize:
                                                                            14,
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ],
                                                            ),
                                                            const Icon(
                                                              Icons
                                                                  .archive_outlined,
                                                              size: 30,
                                                            )
                                                          ],
                                                        ),
                                                        SizedBox(height: 20),
                                                        Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .center,
                                                              children: [
                                                                Container(
                                                                  child: Center(
                                                                    child: Text(
                                                                        searchitem
                                                                            .jobType!,
                                                                        textAlign:
                                                                            TextAlign.center),
                                                                  ),
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: const Color
                                                                        .fromRGBO(
                                                                        214,
                                                                        228,
                                                                        255,
                                                                        1),
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            15),
                                                                  ),
                                                                  width: 70,
                                                                  height: 30,
                                                                ),
                                                                const SizedBox(
                                                                  width: 5,
                                                                ),
                                                                Container(
                                                                  child: Center(
                                                                      child: Text(
                                                                          searchitem
                                                                              .jobTimeType!)),
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: const Color
                                                                        .fromRGBO(
                                                                        214,
                                                                        228,
                                                                        255,
                                                                        1),
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            15),
                                                                  ),
                                                                  width: 70,
                                                                  height: 30,
                                                                ),
                                                                const SizedBox(
                                                                  width: 5,
                                                                ),
                                                                Container(
                                                                  child: Center(
                                                                      child: Text(
                                                                          searchitem
                                                                              .jobLevel!)),
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: const Color
                                                                        .fromRGBO(
                                                                        214,
                                                                        228,
                                                                        255,
                                                                        1),
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            15),
                                                                  ),
                                                                  width: 70,
                                                                  height: 30,
                                                                ),
                                                              ],
                                                            ),
                                                            Text.rich(TextSpan(
                                                                children: [
                                                                  TextSpan(
                                                                    text:
                                                                        "\$ ${searchitem.salary!}",
                                                                    style: TextStyle(
                                                                        fontWeight:
                                                                            FontWeight
                                                                                .bold,
                                                                        fontSize:
                                                                            16,
                                                                        color: Colors
                                                                            .green),
                                                                  ),
                                                                  TextSpan(
                                                                      text:
                                                                          "/Month"),
                                                                ])),
                                                          ],
                                                        ),
                                                        const SizedBox(
                                                          height: 15,
                                                        ),
                                                        const Divider(),
                                                        const SizedBox(
                                                          height: 5,
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                );
                                              },
                                            ),
                                          );
                                        },
                                      )
                                    ],
                                  ),
                                )
                              : Container(
                                  height: 600,
                                  margin: EdgeInsets.only(left: 20, right: 20),
                                  child: Center(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Image.asset(
                                            "assets/images/Search Ilustration.png"),
                                        SizedBox(
                                          height: 20,
                                        ),
                                        Text(
                                          "Search Not Found",
                                          style: TextStyle(
                                              fontSize: 24,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Text(
                                          "Try searching with different keywords so we can show you",
                                          style: TextStyle(
                                            fontSize: 18,
                                          ),
                                          textAlign: TextAlign.center,
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                    ],
                  )))),
    );
  }
}
