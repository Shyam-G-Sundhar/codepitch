import 'package:codepitch/screens/explorepage.dart';
import 'package:codepitch/screens/profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 2,
          shadowColor: Colors.black,
          leading: Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              onTap: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => ProfilePage()));
              },
              child: CircleAvatar(
                backgroundImage: NetworkImage(
                    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRnv9ocIoy9fyoO7YjEiRXrbZBvPhRcTUA5Us2LTMGu9A&s'),
              ),
            ),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: IconButton(
                  onPressed: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => ProfilePage()));
                  },
                  icon: Icon(
                    Icons.code,
                    size: 30,
                    weight: 20.0,
                  )),
            )
          ],
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                  child: Row(
                children: [
                  Text(
                    'Code',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.red),
                  ),
                  Text('Pitch',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white))
                ],
              ))
            ],
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  children: [
                    Text(
                      'Hello Developer ! ,',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                          fontSize: 24.sp),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Container(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      InfoWidget(
                        no: 7,
                        name: 'Trending News',
                      ),
                      InfoWidget(
                        no: 16,
                        name: 'Communities For You',
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 5.h,
              ),
              Container(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      InfoWidget(
                        no: 14,
                        name: 'New Code Snippets',
                      ),
                      InfoWidget(
                        no: 1,
                        name: 'New Discussion',
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 5.h,
              ),
              ExpansionTile(
                initiallyExpanded: true,
                title: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    children: [
                      Text(
                        r'''Today's Highlights''',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
                children: [
                  HighlightPage(
                    titleName: 'Data Types in C',
                    communityName: 'C Community',
                    time: '9:30 AM - 11:00 AM',
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  HighlightPage(
                    communityName: 'Online Meeting',
                    titleName: 'Trending Tech',
                    time: '1:00 PM - 3:30 PM',
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class InfoWidget extends StatefulWidget {
  InfoWidget({super.key, required this.name, required this.no});
  String name;
  int no;
  @override
  State<InfoWidget> createState() => _InfoWidgetState();
}

class _InfoWidgetState extends State<InfoWidget> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        height: 120,
        width: 150,
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.white,
            width: 1.7,
          ),
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '${widget.no}',
              style: TextStyle(
                fontWeight: FontWeight.w600,
                color: Colors.white,
                fontSize: 20,
              ),
            ),
            SizedBox(height: 5), // Added SizedBox for spacing
            Text(
              '${widget.name}',
              textAlign: TextAlign.center, // Align text to center
              style: TextStyle(
                fontWeight: FontWeight.w500,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class HighlightPage extends StatefulWidget {
  HighlightPage(
      {super.key,
      required this.communityName,
      required this.titleName,
      required this.time});
  String titleName, communityName, time;

  @override
  State<HighlightPage> createState() => _HighlightPageState();
}

class _HighlightPageState extends State<HighlightPage> {
  bool notificationOn = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 8.0),
      child: Container(
        height: 185,
        decoration: BoxDecoration(
            color: Colors.grey.shade800,
            borderRadius: BorderRadius.circular(20)),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => ExplorePage()));
                    },
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStatePropertyAll(Colors.white)),
                    icon: Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: Row(
                        children: [
                          Icon(
                            Icons.explore,
                            color: Colors.black,
                          ),
                          SizedBox(
                            width: 3.w,
                          ),
                          Text('Explore',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500)),
                        ],
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.group,
                        color: Colors.white,
                        size: 20,
                      ),
                      SizedBox(
                        width: 5.0,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          '${widget.communityName}',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w700,
                              fontSize: 12.sp),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 8.h,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Text(
                        '${widget.titleName}',
                        style: TextStyle(
                            fontSize: 23.sp,
                            color: Colors.white,
                            fontWeight: FontWeight.w700),
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      Row(
                        children: [
                          Text(
                            '${widget.time}',
                            style: TextStyle(
                                fontSize: 16.sp,
                                color: Colors.white,
                                fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                    ],
                  ),
                  IconButton(
                      style: ButtonStyle(
                          backgroundColor: notificationOn
                              ? MaterialStateProperty.all(Colors.white)
                              : MaterialStateProperty.all(Colors.grey)),
                      onPressed: () {
                        setState(() {
                          notificationOn = !notificationOn;
                        });
                      },
                      icon: notificationOn
                          ? Icon(
                              Icons.notifications_on,
                              color: Colors.black,
                            )
                          : Icon(
                              Icons.notifications,
                              color: Colors.black,
                            ))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
