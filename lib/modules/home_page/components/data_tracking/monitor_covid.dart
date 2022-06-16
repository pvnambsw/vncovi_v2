import 'package:flutter/material.dart';
import '../../../../themes/app_colors.dart';
import 'counter_covid.dart';

class MonitorCovid extends StatelessWidget {
  const MonitorCovid(
      {Key? key, this.cases, this.deaths, this.active, this.recovered})
      : super(key: key);
  final int? cases;
  final int? deaths;
  final int? recovered;
  final int? active;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    // print(size);
    final wd = size.width;
    final hg = size.height;
    // print(wd);
    // print(hg);
    final wd1 = (wd / 2) - 15;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                    top: 10, left: 20, right: 5, bottom: 5),
                child: SizedBox(
                  height: 130,
                  width: wd1,
                  child: CounterCovid(
                    number: cases,
                    color: AppColor.kInfectedColor,
                    title: 'Ca nhiễm',
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    top: 5, left: 20, right: 5, bottom: 15),
                child: SizedBox(
                  height: 130,
                  width: wd1,
                  child: CounterCovid(
                    number: active,
                    color: AppColor.kPrimaryColor,
                    title: 'Đang điều trị',
                  ),
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                    top: 10, left: 5, right: 20, bottom: 5),
                child: SizedBox(
                  height: 130,
                  width: wd1,
                  child: CounterCovid(
                    number: recovered,
                    color: AppColor.kRecovercolor,
                    title: 'Hồi phục',
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    top: 5, left: 5, right: 20, bottom: 15),
                child: SizedBox(
                  height: 130,
                  width: wd1,
                  child: CounterCovid(
                    number: deaths,
                    color: AppColor.kDeathColor,
                    title: 'Tử vong',
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
