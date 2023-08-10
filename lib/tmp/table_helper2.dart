import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:prj_app_mvp/tmp/tmp.dart';
import 'package:prj_app_mvp/utils/super_helper.dart';

import '../data/source/remote/american_stock_listing_delisting_api_helper.dart';

class TableHelper extends StatefulWidget {
  List<AmericanStockMarketListingDelistingApiDto>? futureBuilderSnapshotData;

  TableHelper({super.key, this.futureBuilderSnapshotData});

  @override
  State<TableHelper> createState() => _TableHelperState();
}

class _TableHelperState extends State<TableHelper> {
  late int numItems;
  late List<bool> selected;

  @override
  void initState() {
    super.initState();

    numItems = widget.futureBuilderSnapshotData!.length;
    selected = List<bool>.generate(numItems, (int index) => false);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          // color: Colors.green.withOpacity(0.6),
          width: MediaQuery.of(context).size.width * 0.8,
          height: MediaQuery.of(context).size.height * 0.03,

          decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.3),
            borderRadius: const BorderRadius.only(topLeft: Radius.circular(4.0), topRight: Radius.circular(4.0)),
            // border:   Border(
            //   top: BorderSide(color: Colors.black.withOpacity(0.3), width: 3.0),
            //   bottom: BorderSide(color: Colors.black.withOpacity(0.3), width: 3.0),
            //   left: BorderSide(color: Colors.black.withOpacity(0.3), width: 3.0),
            //   right: BorderSide(color: Colors.black.withOpacity(0.3), width: 3.0),
            // ),
          ),

          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(widget.futureBuilderSnapshotData![0].symbol),
              Text(widget.futureBuilderSnapshotData![0].name),
              Text(widget.futureBuilderSnapshotData![0].exchange),
              Text(widget.futureBuilderSnapshotData![0].status),
            ],
          ),
        ),
        Container(
          // color: Colors.green.withOpacity(0.6),
          width: MediaQuery.of(context).size.width * 0.8,
          height: MediaQuery.of(context).size.height * 0.6,

          decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.3),
            borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(4.0), bottomRight: Radius.circular(4.0)),
            // border:   Border(
            //   top: BorderSide(color: Colors.black.withOpacity(0.3), width: 3.0),
            //   bottom: BorderSide(color: Colors.black.withOpacity(0.3), width: 3.0),
            //   left: BorderSide(color: Colors.black.withOpacity(0.3), width: 3.0),
            //   right: BorderSide(color: Colors.black.withOpacity(0.3), width: 3.0),
            // ),
          ),
          child: ListView.builder(
            itemCount: widget.futureBuilderSnapshotData!.length,
            itemBuilder: (context, index) {
              debugSomething(index);
              return SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  // physics: const BouncingScrollPhysics(),//
                  physics: const NeverScrollableScrollPhysics(), //스크롤바 고정 설정
                  children: [
                    if (index != 0) Text(widget.futureBuilderSnapshotData![index].symbol),
                    if (index != 0) Text(widget.futureBuilderSnapshotData![index].name),
                    if (index != 0) Text(widget.futureBuilderSnapshotData![index].exchange),
                    if (index != 0) Text(widget.futureBuilderSnapshotData![index].status),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
