import 'package:flutter/material.dart';
import '../models/criptoDataModel.dart';
import 'itemInfo.dart';

class CriptoListWidget extends StatelessWidget {
  final List<CriptoDataModel> dataList;

  CriptoListWidget(this.dataList);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: dataList.length,
      itemBuilder: (context, index) {
        final item = dataList[index];
        return Container(
          margin: EdgeInsets.only(bottom: 10, right: 20, left: 20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6.0),
            color: Colors.grey.shade50,
            shape: BoxShape.rectangle,
            boxShadow: [
              BoxShadow(
                  color: Colors.grey.shade300,
                  spreadRadius: 0.0,
                  blurRadius: 4,
                  offset: Offset(3.0, 3.0)),
              BoxShadow(
                  color: Colors.grey.shade400,
                  spreadRadius: 0.0,
                  blurRadius: 4 / 2.0,
                  offset: Offset(3.0, 3.0)),
              BoxShadow(
                  color: Colors.white,
                  spreadRadius: 2.0,
                  blurRadius: 4,
                  offset: Offset(-3.0, -3.0)),
              BoxShadow(
                  color: Colors.white,
                  spreadRadius: 2.0,
                  blurRadius: 4 / 2,
                  offset: Offset(-3.0, -3.0)),
            ],
          ),
          child: ListTile(
            title: Text(item.symbol),
            subtitle: Text(item.priceUsd.toString() + " | " + item.percentChange24h.toString()),
            trailing: IconButton (
              icon: Icon(
                Icons.density_medium,
                color: Colors.grey.shade400,
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ItemInfo(data: item),
                  ),
                );
              },
            ),
          ),
        );
      },
    );
  }
}