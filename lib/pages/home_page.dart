import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_app_new/cubit/app_cubit.dart';
import 'package:travel_app_new/misc/colors.dart';
import 'package:travel_app_new/widgets/app_large_test.dart';
import 'package:travel_app_new/widgets/app_text.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  var images = {
    "balloning.png": "Balloning",
    "hiking.png": "Hiking",
    "kayaking.png": " Kayaking",
    "snorkling.png": "Snorkling"
  };
  @override
  Widget build(BuildContext context) {
    TabController _tabController = TabController(length: 3, vsync: this);
    return Scaffold(
      body: BlocBuilder<AppCubit, AppState>(
        builder: (context, state) {
          if (state is LoadedState) {
            var info = state.places;
            return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.only(top: 70, left: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Icon(Icons.menu, size: 30, color: Colors.black54),
                        Container(
                          margin: EdgeInsets.only(right: 20),
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.grey.withOpacity(0.5),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 17,
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 20),
                    child: AppLargeText(text: "Discover"),
                  ),
                  const SizedBox(
                    height: 17,
                  ),
                  //tabBar
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      child: TabBar(
                          labelPadding: EdgeInsets.only(left: 20, right: 20),
                          controller: _tabController,
                          labelColor: Colors.black,
                          unselectedLabelColor: Colors.grey,
                          isScrollable: true,
                          indicatorSize: TabBarIndicatorSize.label,
                          indicator: CircularTabIndicator(
                              color: AppColors.mainColor, radius: 4),
                          tabs: [
                            Tab(text: "Places"),
                            Tab(text: "Inspiration"),
                            Tab(text: "Emotions"),
                          ]),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 20),
                    height: 200,
                    width: double.maxFinite,
                    child: TabBarView(
                      controller: _tabController,
                      children: [
                        ListView.builder(
                            itemCount: info.length,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: ((context, index) {
                              return GestureDetector(
                                onTap: () {
                                  BlocProvider.of<AppCubit>(context)
                                      .detailPage(info[index]);
                                },
                                child: Container(
                                  margin: EdgeInsets.only(right: 10, top: 10),
                                  width: 200,
                                  height: 300,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: Colors.white,
                                    image: DecorationImage(
                                        image: NetworkImage(
                                            "http://mark.bslmeiyu.com/uploads/" +
                                                info[index].img),
                                        fit: BoxFit.cover),
                                  ),
                                ),
                              );
                            })),
                        Text("Tibyan is Stupied"),
                        Text("Up"),
                      ],
                    ),
                  ),
                  SizedBox(height: 17),
                  Container(
                    margin: EdgeInsets.only(left: 20, right: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        AppLargeText(
                          text: "Explore more",
                          size: 22,
                        ),
                        AppText(
                          text: "See all",
                          color: AppColors.textColor1,
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 10),
                  Container(
                    height: 90,
                    width: double.maxFinite,
                    margin: EdgeInsets.only(left: 20),
                    child: ListView.builder(
                        itemCount: 4,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (_, index) {
                          return Container(
                            margin: EdgeInsets.only(right: 30),
                            child: Column(
                              children: [
                                Container(
                                  // margin: EdgeInsets.only(right: 50),
                                  width: 80,
                                  height: 70,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: Colors.white,
                                    image: DecorationImage(
                                        image: AssetImage("images/" +
                                            images.keys.elementAt(index)),
                                        fit: BoxFit.cover),
                                  ),
                                ),
                                SizedBox(
                                  height: 1,
                                ),
                                Container(
                                  child: AppText(
                                    text: images.values.elementAt(index),
                                    color: AppColors.textColor2,
                                  ),
                                ),
                              ],
                            ),
                          );
                        }),
                  ),
                ]);
          } else {
            return Container();
          }
        },
      ),
    );
  }
}

class CircularTabIndicator extends Decoration {
  Color color;
  double radius;
  CircularTabIndicator({required this.color, required this.radius});

  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    return _CirclePainter(color: color, radius: radius);
  }
}

class _CirclePainter extends BoxPainter {
  Color color;
  double radius;
  _CirclePainter({required this.color, required this.radius});

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    Paint _paint = Paint();
    _paint.color = color;
    _paint.isAntiAlias = true;
    final Offset circleOffset = Offset(
        configuration.size!.width / 2 - radius / 2, configuration.size!.height);
    canvas.drawCircle(offset + circleOffset, radius, _paint);
  }
}
