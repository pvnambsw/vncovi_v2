import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vncovid/modules/other/my_empty.dart';
import 'package:vncovid/modules/other/my_error.dart';

import '../../themes/app_assets.dart';
import '../../themes/app_colors.dart';
import '../../themes/app_styles.dart';
import 'blocs/injections_provider.dart';


class InjectionsPage extends StatefulWidget {
  const InjectionsPage({Key? key}) : super(key: key);

  @override
  State<InjectionsPage> createState() => _InjectionsPageState();
}

class _InjectionsPageState extends State<InjectionsPage> {
  int _currentIndex = 0;
  late PageController _pageController;
  late InjectionsProvider _state;

  @override
  void initState() {
    _state = InjectionsProvider();
    _pageController = PageController(viewportFraction: 0.9);
    super.initState();
    _state.getVaccine();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Thông tin loại Vaccine Covid-19'),
      ),
      body: ChangeNotifierProvider<InjectionsProvider>(
        create: (_) => _state,
        child: Consumer<InjectionsProvider>(
          builder: (context, model, child) {
            return model.loading
                ? const Center(
              // child: Text(
              //   'Loading',
              //   style: TextStyle(color: Colors.black),
              // ),
              child: CircularProgressIndicator(color: Colors.indigo,),
            )
                : RefreshIndicator(
              onRefresh: model.getVaccine,
              child: model.error
                  ? const MyError()
                  : model.vaccine!.isEmpty
                  ? const MyEmpty()
                  : SafeArea(
                child: Container(
                  width: double.infinity,
                  margin: const EdgeInsets.symmetric(
                      horizontal: 24),
                  child: Column(
                    children: [
                      SizedBox(
                        height: size.height * (1 / 25),
                      ),
                      SizedBox(
                        height: size.height * (2 / 3),
                        child: PageView.builder(
                            controller: _pageController,
                            onPageChanged: (index) {
                              setState(() {
                                _currentIndex = index;
                              });
                            },
                            itemCount: model.vaccine!.length,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding:
                                const EdgeInsets.all(4),
                                child: Material(
                                  borderRadius:
                                  const BorderRadius.all(
                                      Radius.circular(24)),
                                  color: AppColor.kPrimaryColor
                                      .withOpacity(0.3),
                                  elevation: 4,
                                  child: Container(
                                      padding:
                                      const EdgeInsets.all(
                                          16),
                                      child: Column(
                                        crossAxisAlignment:
                                        CrossAxisAlignment
                                            .start,
                                        children: [
                                          Center(
                                            child: Text(
                                              '${model.vaccine![index].nameVaccine}',
                                              style: AppStyle
                                                  .kTitleStyle
                                                  .copyWith(
                                                  fontSize:
                                                  25,
                                                  color: Colors
                                                      .indigo),
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          Center(
                                            child: Image.asset(
                                              AppAssets.vaccine,
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 15,
                                          ),
                                          RichText(
                                            text: TextSpan(
                                              text:
                                              'Công nghệ sử dụng: \n',
                                              style: AppStyle
                                                  .kSubTextStyle
                                                  .copyWith(
                                                  color: Colors.black45),
                                              children: <
                                                  TextSpan>[
                                                TextSpan(
                                                  text:
                                                  '${model.vaccine![index].typeVaccine}',
                                                  style: AppStyle
                                                      .kSubTextStyle
                                                      .copyWith(
                                                      color:
                                                      Colors.white60),
                                                ),
                                              ],
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          RichText(
                                            text: TextSpan(
                                              text:
                                              'Liều tiêm: \n',
                                              style: AppStyle
                                                  .kSubTextStyle
                                                  .copyWith(
                                                  color: Colors.black45),
                                              children: <
                                                  TextSpan>[
                                                TextSpan(
                                                  text:
                                                  '${model.vaccine![index].doses}',
                                                  style: AppStyle
                                                      .kSubTextStyle
                                                      .copyWith(
                                                      color:
                                                      Colors.white60),
                                                ),
                                              ],
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          RichText(
                                            text: TextSpan(
                                              text:
                                              'Hiệu quả sau tiêm: \n',
                                              style: AppStyle
                                                  .kSubTextStyle
                                                  .copyWith(
                                                  color: Colors.black45),
                                              children: <
                                                  TextSpan>[
                                                TextSpan(
                                                  text:
                                                  '${model.vaccine![index].effective}',
                                                  style: AppStyle
                                                      .kSubTextStyle
                                                      .copyWith(
                                                      color:
                                                      Colors.white60),
                                                ),
                                              ],
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          RichText(
                                            text: TextSpan(
                                              text:
                                              'Công ty sản xuất: \n',
                                              style: AppStyle
                                                  .kSubTextStyle
                                                  .copyWith(
                                                  color: Colors.black45),
                                              children: <
                                                  TextSpan>[
                                                TextSpan(
                                                  text:
                                                  '${model.vaccine![index].company}',
                                                  style: AppStyle
                                                      .kSubTextStyle
                                                      .copyWith(
                                                      color:
                                                      Colors.white60),
                                                ),
                                              ],
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          RichText(
                                            text: TextSpan(
                                              text:
                                              'Bảo quản Vaccine: \n',
                                              style: AppStyle
                                                  .kSubTextStyle
                                                  .copyWith(
                                                  color: Colors.black45),
                                              children: <
                                                  TextSpan>[
                                                TextSpan(
                                                  text:
                                                  '${model.vaccine![index].storage}',
                                                  style: AppStyle
                                                      .kSubTextStyle
                                                      .copyWith(
                                                      color:
                                                      Colors.white60),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      )),
                                ),
                              );
                            }),
                      ),
                      Container(
                        height: 12,
                        alignment: Alignment.center,
                        margin: const EdgeInsets.symmetric(
                            vertical: 24),
                        child: ListView.builder(
                          physics:
                          const NeverScrollableScrollPhysics(),
                          //Không cho listview cuộn
                          scrollDirection: Axis.horizontal,
                          itemCount: 6,
                          itemBuilder: (context, index) {
                            return buildIndicator(
                                index == _currentIndex, size);
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

Widget buildIndicator(bool isActive, Size size) {
  return AnimatedContainer(
    duration: const Duration(milliseconds: 300),
    //Hieeuj ung
    curve: Curves.bounceOut,
    //height: 12,
    margin: const EdgeInsets.symmetric(horizontal: 14),
    width: isActive ? size.width * (1 / 6) : 24,
    decoration: BoxDecoration(
        color: isActive ? Colors.indigo : Colors.indigoAccent,
        borderRadius: const BorderRadius.all(Radius.circular(12)),
        boxShadow: const [
          BoxShadow(color: Colors.black38, offset: Offset(2, 3), blurRadius: 3)
        ]),
  );
}

//////////////////////////////

