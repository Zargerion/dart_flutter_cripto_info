import 'package:flutter/material.dart';
import './models/criptoDataModel.dart';
import 'asyncFetching.dart';
import './widgets/dataListWidget.dart';

void main() { runApp(MyApp()); }

//class MyApp extends StatelessWidget {
//  final ApiService apiService = ApiService();

//  @override
//  Widget build(BuildContext context) {
//    return MaterialApp(
//      title: 'My App',
//      home: Scaffold(
//        appBar: AppBar(
//          title: Text('Currency.Cripto'),
 //       ),
//        body: FutureBuilder<List<CriptoDataModel>>(
//          future: apiService.fetchData(),
//          builder: (context, snapshot) {
//            if (snapshot.hasData && snapshot.data != null) {
//              return Container(
//                padding: EdgeInsets.only(top: 20),
//                child: CriptoListWidget(snapshot.data!),
 //             );
//            } else if (snapshot.hasError) {
 //             return Text('Ошибка: ${snapshot.error}');
 //           } else {
//              return CircularProgressIndicator();
//            }
//          },
//        ),
//      ),
//    );
//  }
//}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

enum SortType {
  Ascending,
  Descending,
  None,
}

class _MyAppState extends State<MyApp> {
  //bool sortAscending = true;

  //void toggleSort() {
  //  setState(() {
  //    sortAscending = !sortAscending;
   // });
  //}

  SortType sortType = SortType.None;

  void toggleSort() {
    setState(() {
      switch (sortType) {
        case SortType.Ascending:
          sortType = SortType.Descending;
          break;
        case SortType.Descending:
          sortType = SortType.None;
          break;
        case SortType.None:
          sortType = SortType.Ascending;
          break;
      }
    });
  }

  final ApiService apiService = ApiService();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My App',
      home: Scaffold(
        appBar: AppBar(
          title: Row(
            children: [
              Text(
                'Currency.Cripto',
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(width: 30),
              IconButton(
                icon: Icon(
                  //sortAscending ? Icons.arrow_upward : Icons.arrow_downward,
                  getSortIcon(),
                ),
                onPressed: toggleSort,
              ),
            ],
          ),
        ),
        body: FutureBuilder<List<CriptoDataModel>>(
          future: apiService.fetchData(),
          builder: (context, snapshot) {
            if (snapshot.hasData && snapshot.data != null) {

              List<CriptoDataModel> sortedList = List.from(snapshot.data!);

              if (sortType == SortType.Ascending) {
                sortedList.sort((a, b) => a.percentChange24h.compareTo(b.percentChange24h));
              } else if (sortType == SortType.Descending) {
                sortedList.sort((a, b) => b.percentChange24h.compareTo(a.percentChange24h));
              }

              return Container(
                padding: EdgeInsets.only(top: 20),
                child: CriptoListWidget(sortedList),
              );
            } else if (snapshot.hasError) {
              return Text('Ошибка: ${snapshot.error}');
            } else {
              return CircularProgressIndicator();
            }
          },
        ),
      ),
    );
  }
  IconData getSortIcon() {
    switch (sortType) {
      case SortType.Ascending:
        return Icons.arrow_upward;
      case SortType.Descending:
        return Icons.arrow_downward;
      case SortType.None:
      default:
        return Icons.sort;
    }
  }
}
