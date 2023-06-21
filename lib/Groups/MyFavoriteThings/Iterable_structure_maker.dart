class IterableStringListMaker {
  late List<dynamic> items_current;
  late List<dynamic> items_snapshot_at_start;
  late int item_length_snapshot_at_born;
  dynamic itemsCurrentFirst;
  dynamic itemsCurrentLast;
  dynamic item_length_snapshot_at_born_fisrt;
  dynamic item_length_snapshot_at_born_last;
  late bool IsRepeatMode;

  IterableStringListMaker({required List<dynamic> items, bool isRepeatMode = true}) {
    items_current = items;
    itemsCurrentFirst = items_current[0];
    itemsCurrentLast = items_current[items_current.length - 1];
    items_snapshot_at_start = []..addAll(items);
    item_length_snapshot_at_born = items_snapshot_at_start.length;
    item_length_snapshot_at_born_fisrt = items_snapshot_at_start[0];
    item_length_snapshot_at_born_last = items_snapshot_at_start[items_snapshot_at_start.length - 1];
    IsRepeatMode = isRepeatMode;

    // print(itemsHistoryLast);//DEVELOPMENT
  }

  // void push(int item) {
  //   items.add(item);
  // }
  //
  // int pop() {
  //   return items.removeLast();
  // }
  //
  // bool isEmpty() {
  //   return items.isEmpty;
  // }
  //
  // int get size {
  //   return items.length;
  // }
  //
  dynamic next() {
    // itemsCurrent = []..addAll(itemsHistory);
    var nextThing = items_current.first;
    items_current.remove(items_current.first.toString());
    // itemsCurrent.remove(itemsCurrent.first);
    return nextThing;
  }

  List<dynamic> All() {
    return items_current;
  }

  dynamic first() {
    return itemsCurrentFirst;
  }

  dynamic last() {
    return itemsCurrentLast;
  }

  List<dynamic> All_at_born() {
    return items_snapshot_at_start;
  }

  dynamic first_at_born() {
    return item_length_snapshot_at_born_fisrt; //FAIL
  }

  dynamic last_at_born() {
    return item_length_snapshot_at_born_last;
  }
}
