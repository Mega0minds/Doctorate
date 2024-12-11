import 'package:docrate/utilities/resource.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Welcome back",
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: AppColor.gray),
              ),
              Text(
                "Andrew Smith",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: AppWeight.signPage,
                ),
              )
            ],
          ),
          leading: CircleAvatar(
            backgroundImage: AssetImage('assets/img/profile.jpg'),
            radius: 50,
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.search,
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.favorite_border,
              ),
            )
          ],
        ),
        body: SingleChildScrollView(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            SizedBox(
              height: 40,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 24),
              child: Text(
                "Upcoming Appointments",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: AppWeight.mainweight,
                ),
              ),
            ),
            SizedBox(
              height: 24,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Padding(
                padding: const EdgeInsets.only(left: 24),
                child: Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16.0),
                        color: AppColor.primary,
                      ),
                      width: 218,
                      height: 132,
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                SizedBox(
                                  height: 32,
                                  width: 32,
                                  child: CircleAvatar(
                                    backgroundImage:
                                        AssetImage("assets/img/profile.jpg"),
                                    radius: 50,
                                  ),
                                ),
                                SizedBox(
                                  width: 8,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Jason Smith",
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: AppWeight.secondCreate,
                                          color: AppColor.white),
                                    ),
                                    Text(
                                      "Dentist",
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: AppWeight.signPage,
                                          color: AppColor.ash),
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          "4.8",
                                          style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: AppWeight.signPage,
                                              color: AppColor.white),
                                        ),
                                        Icon(Icons.star)
                                      ],
                                    ),
                                  ],
                                ),
                                PopupMenuButton(
                                    // add icon, by default "3 dot" icon
                                    // icon: Icon(Icons.book)
                                    itemBuilder: (context) {
                                  return [
                                    PopupMenuItem<int>(
                                      value: 0,
                                      child: Text("View"),
                                    ),
                                    PopupMenuItem<int>(
                                      value: 1,
                                      child: Text("Call"),
                                    ),
                                    PopupMenuItem<int>(
                                      value: 2,
                                      child: Text("Cancel"),
                                    ),
                                  ];
                                }, onSelected: (value) {
                                  if (value == 0) {
                                    print("My account menu is selected.");
                                  } else if (value == 1) {
                                    print("Settings menu is selected.");
                                  } else if (value == 2) {
                                    print("Logout menu is selected.");
                                  }
                                }),
                              ],
                            ),
                            SizedBox(
                              height: 16,
                            ),
                            Row(
                              children: [
                                SizedBox(
                                  width: 18.25,
                                ),
                                Text(
                                  "5 Oct",
                                  style: TextStyle(
                                      color: AppColor.white,
                                      fontWeight: AppWeight.secondCreate,
                                      fontSize: 14),
                                ),
                                SizedBox(
                                  width: 10.25,
                                ),
                                Text(
                                  "10:30pm",
                                  style: TextStyle(
                                      color: AppColor.white,
                                      fontWeight: AppWeight.secondCreate,
                                      fontSize: 14),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 16,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16.0),
                        color: AppColor.primary,
                      ),
                      width: 218,
                      height: 132,
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                SizedBox(
                                  height: 32,
                                  width: 32,
                                  child: CircleAvatar(
                                    backgroundImage:
                                        AssetImage("assets/img/profile.jpg"),
                                    radius: 50,
                                  ),
                                ),
                                SizedBox(
                                  width: 8,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Jason Smith",
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: AppWeight.secondCreate,
                                          color: AppColor.white),
                                    ),
                                    Text(
                                      "Dentist",
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: AppWeight.signPage,
                                          color: AppColor.ash),
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          "4.8",
                                          style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: AppWeight.signPage,
                                              color: AppColor.white),
                                        ),
                                        Icon(Icons.star)
                                      ],
                                    ),
                                  ],
                                ),
                                PopupMenuButton(
                                    // add icon, by default "3 dot" icon
                                    // icon: Icon(Icons.book)
                                    itemBuilder: (context) {
                                  return [
                                    PopupMenuItem<int>(
                                      value: 0,
                                      child: Text("View"),
                                    ),
                                    PopupMenuItem<int>(
                                      value: 1,
                                      child: Text("Call"),
                                    ),
                                    PopupMenuItem<int>(
                                      value: 2,
                                      child: Text("Cancel"),
                                    ),
                                  ];
                                }, onSelected: (value) {
                                  if (value == 0) {
                                    print("My account menu is selected.");
                                  } else if (value == 1) {
                                    print("Settings menu is selected.");
                                  } else if (value == 2) {
                                    print("Logout menu is selected.");
                                  }
                                }),
                              ],
                            ),
                            SizedBox(
                              height: 16,
                            ),
                            Row(
                              children: [
                                SizedBox(
                                  width: 18.25,
                                ),
                                Text(
                                  "5 Oct",
                                  style: TextStyle(
                                      color: AppColor.white,
                                      fontWeight: AppWeight.secondCreate,
                                      fontSize: 14),
                                ),
                                SizedBox(
                                  width: 10.25,
                                ),
                                Text(
                                  "10:30pm",
                                  style: TextStyle(
                                      color: AppColor.white,
                                      fontWeight: AppWeight.secondCreate,
                                      fontSize: 14),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 16,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16.0),
                        color: AppColor.primary,
                      ),
                      width: 218,
                      height: 132,
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                SizedBox(
                                  height: 32,
                                  width: 32,
                                  child: CircleAvatar(
                                    backgroundImage:
                                        AssetImage("assets/img/profile.jpg"),
                                    radius: 50,
                                  ),
                                ),
                                SizedBox(
                                  width: 8,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Jason Smith",
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: AppWeight.secondCreate,
                                          color: AppColor.white),
                                    ),
                                    Text(
                                      "Dentist",
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: AppWeight.signPage,
                                          color: AppColor.ash),
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          "4.8",
                                          style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: AppWeight.signPage,
                                              color: AppColor.white),
                                        ),
                                        Icon(Icons.star)
                                      ],
                                    ),
                                  ],
                                ),
                                PopupMenuButton(
                                    // add icon, by default "3 dot" icon
                                    // icon: Icon(Icons.book)
                                    itemBuilder: (context) {
                                  return [
                                    PopupMenuItem<int>(
                                      value: 0,
                                      child: Text("View"),
                                    ),
                                    PopupMenuItem<int>(
                                      value: 1,
                                      child: Text("Call"),
                                    ),
                                    PopupMenuItem<int>(
                                      value: 2,
                                      child: Text("Cancel"),
                                    ),
                                  ];
                                }, onSelected: (value) {
                                  if (value == 0) {
                                    print("My account menu is selected.");
                                  } else if (value == 1) {
                                    print("Settings menu is selected.");
                                  } else if (value == 2) {
                                    print("Logout menu is selected.");
                                  }
                                }),
                              ],
                            ),
                            SizedBox(
                              height: 16,
                            ),
                            Row(
                              children: [
                                SizedBox(
                                  width: 18.25,
                                ),
                                Text(
                                  "5 Oct",
                                  style: TextStyle(
                                      color: AppColor.white,
                                      fontWeight: AppWeight.secondCreate,
                                      fontSize: 14),
                                ),
                                SizedBox(
                                  width: 10.25,
                                ),
                                Text(
                                  "10:30pm",
                                  style: TextStyle(
                                      color: AppColor.white,
                                      fontWeight: AppWeight.secondCreate,
                                      fontSize: 14),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 24, right: 24, top: 20, bottom: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        "Categories",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: AppWeight.mainweight,
                        ),
                      ),
                      SizedBox(
                        width: 178,
                      ),
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          "See all",
                          style: TextStyle(
                              color: AppColor.primary,
                              fontSize: 16,
                              fontWeight: AppWeight.signPage),
                        ),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                        width: 72,
                        height: 72,
                        decoration: BoxDecoration(
                            color: AppColor.ash2,
                            borderRadius: BorderRadius.circular(16)),
                        child: IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.monitor_heart_outlined),
                        ),
                      ),
                      SizedBox(
                        width: 12,
                      ),
                      Container(
                        width: 72,
                        height: 72,
                        decoration: BoxDecoration(
                            color: AppColor.ash2,
                            borderRadius: BorderRadius.circular(16)),
                        child: IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.monitor_heart_outlined),
                        ),
                      ),
                      SizedBox(
                        width: 12,
                      ),
                      Container(
                        width: 72,
                        height: 72,
                        decoration: BoxDecoration(
                            color: AppColor.ash2,
                            borderRadius: BorderRadius.circular(16)),
                        child: IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.monitor_heart_outlined),
                        ),
                      ),
                      SizedBox(
                        width: 12,
                      ),
                      Container(
                        width: 72,
                        height: 72,
                        decoration: BoxDecoration(
                            color: AppColor.ash2,
                            borderRadius: BorderRadius.circular(16)),
                        child: IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.monitor_heart_outlined),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Row(
                    children: [
                      Container(
                        width: 72,
                        height: 72,
                        decoration: BoxDecoration(
                            color: AppColor.ash2,
                            borderRadius: BorderRadius.circular(16)),
                        child: IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.monitor_heart_outlined),
                        ),
                      ),
                      SizedBox(
                        width: 12,
                      ),
                      Container(
                        width: 72,
                        height: 72,
                        decoration: BoxDecoration(
                            color: AppColor.ash2,
                            borderRadius: BorderRadius.circular(16)),
                        child: IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.monitor_heart_outlined),
                        ),
                      ),
                      SizedBox(
                        width: 12,
                      ),
                      Container(
                        width: 72,
                        height: 72,
                        decoration: BoxDecoration(
                            color: AppColor.ash2,
                            borderRadius: BorderRadius.circular(16)),
                        child: IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.monitor_heart_outlined),
                        ),
                      ),
                      SizedBox(
                        width: 12,
                      ),
                      Container(
                        width: 72,
                        height: 72,
                        decoration: BoxDecoration(
                            color: AppColor.ash2,
                            borderRadius: BorderRadius.circular(16)),
                        child: IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.monitor_heart_outlined),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 24, right: 24, top: 20, bottom: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              "Categories",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: AppWeight.mainweight,
                              ),
                            ),
                            SizedBox(
                              width: 178,
                            ),
                            TextButton(
                              onPressed: () {},
                              child: Text(
                                "See all",
                                style: TextStyle(
                                    color: AppColor.primary,
                                    fontSize: 16,
                                    fontWeight: AppWeight.signPage),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
