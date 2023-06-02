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
                  pf!.getData();
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
        body: Center(
          child: pt!.data == null
              ? CircularProgressIndicator()
              : SingleChildScrollView(
                child: Container(
                  height: 80.h,
                  width: 95.w,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: Colors.white)
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
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
                            style:
                                TextStyle(color: Colors.white, fontSize: 25.sp),
                          ),
                        ),
                        Coustom("Name", '${pt!.data!.results![0].name!.title} ${pt!.data!.results![0].name!.first} ${pt!.data!.results![0].name!.last}'),
                        Coustom('Email', "${pt!.data!.results![0].email}"),
                        Coustom('Phone', "${pt!.data!.results![0].phone}"),
                        Coustom('Cell',  "${pt!.data!.results![0].cell}"),
                        Coustom('Address', "${pt!.data!.results![0].location!.street!.number} ${pt!.data!.results![0].location!.street!.name}, ${pt!.data!.results![0].location!.city},\n${pt!.data!.results![0].location!.state}, ${pt!.data!.results![0].location!.country} -${pt!.data!.results![0].location!.postcode}"),
                        Coustom('Dob Date', "${pt!.data!.results![0].dob!.date}"),
                        Coustom('Dob Age', "${pt!.data!.results![0].dob!.age}"),
                        Coustom('Nat', "${pt!.data!.results![0].nat}")
                      ],
                    ),
                  ),
                ),
              ),
        ),
      ),
    );
  }
  Widget Coustom(String? name,String? value) {
    return   Container(
      height: 40,
      alignment: Alignment.topLeft,
      child: Row(
        children: [
          Text(
            "$name :",
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
                "$value",
                style: TextStyle(
                    color: Colors.white, fontSize: 12.sp),
              ),
            ),
          ),
        ],
      ),
    );
  }
}