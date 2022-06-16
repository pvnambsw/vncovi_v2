import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../../other/my_empty.dart';
import '../../other/my_error.dart';
import '../blocs/state_of_listview.dart';
import 'data_tracking/monitor_covid.dart';


class ListCovidCountriesExpansionTile extends StatefulWidget {
  const ListCovidCountriesExpansionTile({Key? key}) : super(key: key);

  @override
  State<ListCovidCountriesExpansionTile> createState() =>
      _ListCovidCountriesExpansionTileState();
}

class _ListCovidCountriesExpansionTileState
    extends State<ListCovidCountriesExpansionTile> {
  late StateOfListView _state;

  @override
  void initState() {
    _state = StateOfListView();
    super.initState();
    _state.getCovidCountry();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Thông tin dịch bệnh Covid-19'),
      ),
      body: ChangeNotifierProvider<StateOfListView>(
        create: (_) => _state,
        child: Consumer<StateOfListView>(
          builder: (context, model, child) {
            return model.loading
                ? const Center(
                    // child: Text(
                    //   'Loading',
                    //   style: TextStyle(color: Colors.black),
                    // ),
              child: CircularProgressIndicator(
                color: Colors.indigo,
              ),
                  )
                : RefreshIndicator(
                    onRefresh: model.getCovidCountry,
                    child: model.error
                        ? const MyError()
                        : model.countriesCovid!.isEmpty
                            ? const MyEmpty()
                            : ListView.builder(
                                itemCount: model.countriesCovid!.length,
                                itemBuilder: (context, index) {
                                //  print(model.countriesCovid![index].cases!);
                                  return ExpansionTile(
                                   // leading: Image.network(model.countriesFlag![index].flag!),
                                    title: Text(
                                      '${model.countriesCovid![index].country}',
                                    ),
                                    children: [
                                      MonitorCovid(
                                        cases:
                                            model.countriesCovid![index].cases,
                                        active:
                                            model.countriesCovid![index].active,
                                        recovered: model
                                            .countriesCovid![index].recovered,
                                        deaths:
                                            model.countriesCovid![index].deaths,
                                      )
                                    ],
                                  );
                                },
                              ),
                  );
          },
        ),
      ),
    );
  }
}
