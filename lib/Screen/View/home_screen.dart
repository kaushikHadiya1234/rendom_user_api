import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rendom_user/Screen/Model/user_model.dart';
import 'package:rendom_user/Screen/Provider/user_provider.dart';
import 'package:rendom_user/utils/Api_helper.dart';
import 'package:sizer/sizer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  UserProvider? pf;
  UserProvider? pt;

  @override
  void initState() {
    super.initState();
    Provider.of<UserProvider>(context, listen: false).getData();
  }

  @override
  Widget build(BuildContext context) {
    pt = Provider.of<UserProvider>(context, listen: true);
    pf = Provider.of<UserProvider>(context, listen: false);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: Text(
            "RANDOM DATA",
            style: TextStyle(color: Colors.white),
          ),
          actions: [
            Padding(
              padding: EdgeInsets.only(right: 1.5.w),
              child: IconButton(
                onPressed: () async {
                  // pf!.Refresh(await Apihelper.apihelper.ApiData());
                  Provider.of<UserProvider>(context, listen: false).getData();
                },
                icon: Icon(
                  Icons.refresh,
                  color: Colors.white,
                ),
              ),
            ),
          ],
          centerTitle: true,
          backgroundColor: Colors.black,
        ),
        backgroundColor: Colors.black,
        body:
            // FutureBuilder(
            //   future: pt!.data,
            //   builder: (context, snapshot) {
            //     if (snapshot.hasError) {
            //       return Text(
            //         "Error :- ${snapshot.error}",
            //         style: TextStyle(color: Colors.white),
            //       );
            //     } else if (snapshot.hasData) {
            //       pf!.Refresh(snapshot.pt!.data!);
            //       UserModel data = snapshot.pt!.data!;
            //       return
            pt!.data == null
                ? CircularProgressIndicator()
                : SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 10,
                          ),
                          Align(
                            alignment: Alignment.center,
                            child: CircleAvatar(
                              radius: 80,
                              backgroundImage: NetworkImage(
                                "${pt!.data!.results![0].picture!.large}",
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Align(
                            alignment: Alignment.center,
                            child: Text(
                              "${pt!.data!.results![0].name!.title} ${pt!.data!.results![0].name!.first} ${pt!.data!.results![0].name!.last}",
                              style: TextStyle(
                                  color: Colors.white, fontSize: 25.sp),
                            ),
                          ),
                          Container(
                            height: 3.h,
                            alignment: Alignment.topLeft,
                            // color: Colors.yellow,
                            child: Row(
                              children: [
                                Text(
                                  "Name :",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 12.sp),
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  "${pt!.data!.results![0].name!.title} ${pt!.data!.results![0].name!.first} ${pt!.data!.results![0].name!.last}",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 12.sp),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Container(
                            height: 30,
                            alignment: Alignment.topLeft,
                            child: Row(
                              children: [
                                Text(
                                  "Email :",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 12.sp),
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  "${pt!.data!.results![0].email}",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 12.sp),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Container(
                            height: 30,
                            // color: Colors.yellow,
                            alignment: Alignment.topLeft,
                            child: Row(
                              children: [
                                Text(
                                  "Phone :",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 12.sp),
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  "${pt!.data!.results![0].phone}",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 12.sp),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            height: 30,
                            // color: Colors.yellow,
                            alignment: Alignment.topLeft,
                            child: Row(
                              children: [
                                Text(
                                  "Cell :",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 12.sp),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  "${pt!.data!.results![0].cell}",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 12.sp),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            height: 60,
                            alignment: Alignment.topLeft,
                            child: Row(
                              children: [
                                Text(
                                  "Address :",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 12.sp),
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Expanded(
                                  child: Container(
                                    // height: 60,
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      "${pt!.data!.results![0].location!.street!.number} ${pt!.data!.results![0].location!.street!.name}, ${pt!.data!.results![0].location!.city},\n${pt!.data!.results![0].location!.state}, ${pt!.data!.results![0].location!.country} -${pt!.data!.results![0].location!.postcode}",
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 12.sp),
                                      maxLines: 3,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            height: 30,
                            alignment: Alignment.topLeft,
                            child: Row(
                              children: [
                                Text(
                                  "Dob Date :",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 12.sp),
                                ),
                                SizedBox(width: 5),
                                Text(
                                  "${pt!.data!.results![0].dob!.date}",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 12.sp),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            height: 30,
                            alignment: Alignment.topLeft,
                            child: Row(
                              children: [
                                Text(
                                  "Dob Age :",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 12.sp),
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  "${pt!.data!.results![0].dob!.age}",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 12.sp),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            height: 30,
                            alignment: Alignment.topLeft,
                            child: Row(
                              children: [
                                Text(
                                  "NAT :",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 12.sp),
                                ),
                                SizedBox(width: 5),
                                Text(
                                  "${pt!.data!.results![0].nat}",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 12.sp),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
        // }
        // return Center(child: CircularProgressIndicator());
        // },
        // ),
      ),
    );
  }
}
