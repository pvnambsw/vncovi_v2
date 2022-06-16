import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:provider/provider.dart';

import '../../../../themes/app_colors.dart';
import '../../../../themes/app_styles.dart';
import '../../blocs/state_of_dropdownbutton.dart';
import '../list_countries_covid_expansiontile.dart';
import 'monitor_covid.dart';
class DataTracking extends StatefulWidget {
  const DataTracking({Key? key}) : super(key: key);

  @override
  State<DataTracking> createState() => _DataTrackingState();
}

class _DataTrackingState extends State<DataTracking> {
  late StateOfDropdown _state;
  List<Color> listColors = [
    AppColor.kInfectedColor,
    AppColor.kRecovercolor,
    AppColor.kPrimaryColor,
    AppColor.kDeathColor
  ];
  @override
  void initState() {
    _state = StateOfDropdown();
    super.initState();
    _state.getItemCountry();
  }

  @override
  Widget build(BuildContext context) {

    return ChangeNotifierProvider<StateOfDropdown>(
      create: (_) => _state,
      child: Consumer<StateOfDropdown>(
        builder: (context, model, child) {
          String value = model.selected;
          String imgUrl = model.flag;
          // print(value);
          // _state.getCovidCountry1();
          return Center(
            child: Column(
              children: [
                Container(
                  height: 60,
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  padding:
                  const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(25),
                    border: Border.all(
                      color: const Color(0xFFE5E5E5),
                    ),
                  ),
                  child: Row(
                    children: [
                      // SvgPicture.asset('assets/icons/maps-and-flags.svg'),
                      SizedBox(
                        width: 30,
                        height: 30,
                        child: imgUrl.isEmpty?const Placeholder():Image.network(imgUrl),
                      ),

                      const SizedBox(
                        width: 20,
                      ),
                      Expanded(
                        child: DropdownButton(
                          hint: const Text("Chọn quốc gia"),
                          isExpanded: true,
                          underline: const SizedBox(),
                          icon: SvgPicture.asset('assets/icons/dropdown.svg'),
                          value: value,
                          items: model.items!
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                          onChanged: (String? newValue) {
                            setState(() {
                              model.setselected(newValue!);
                              model.getCovidCountry1();
                            });
                          },
                        ),
                      ),
                    ], //////////////////////////
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
                  child: Row(
                    children: <Widget>[
                      RichText(
                        text: const TextSpan(
                          children: [
                            TextSpan(
                              text: "Thông tin dịch bệnh\n",
                              style: AppStyle.kTitleTextStyle,
                            ),
                            TextSpan(
                              text: "Dữ liệu COVID-19 lấy từ Worldometers",
                              style: TextStyle(
                                color: AppColor.kTextLightColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Spacer(),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) =>
                              const ListCovidCountriesExpansionTile(),
                            ),
                          );
                        },
                        child: const Text(
                          "Xem chi tiết",
                          style: TextStyle(
                            color: AppColor.kPrimaryColor,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  child: MonitorCovid(
                    cases: model.caseCovid,
                    active: model.activeCovid,
                    recovered: model.recoverCovid,
                    deaths: model.dealtCovid,
                  ),
                ),
                const SizedBox(height: 15),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const <Widget>[
                          Text(
                            "Thống kê tình hình",
                            style: AppStyle.kTitleTextStyle,
                          ),
                        ],
                      ),
                      // const CovidMap(),
                      const SizedBox(height: 15),
                      PieChart(
                        dataMap: {
                          "Ca nhiễm": model.caseCovid.toDouble(),
                          "Ca hồi phục": model.recoverCovid.toDouble(),
                          "Ca đang điều trị": model.activeCovid.toDouble(),
                          "Ca tử vong": model.dealtCovid.toDouble(),
                        },
                        animationDuration: Duration(milliseconds: 1200),
                        chartType: ChartType.ring,
                        colorList: listColors,
                        legendOptions: const LegendOptions(
                            legendPosition: LegendPosition.right),
                      ),
                      const SizedBox(height: 15),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
