
class IterableStringListMaker {
  late List<dynamic> itemsCurrent;
  late List<dynamic> itemsSnapshotAtStart;
  late int itemLengthSnapshotAtBorn;
  dynamic itemsCurrentFirst;
  dynamic itemsCurrentLast;
  dynamic itemLengthSnapshotAtBornFisrt;
  dynamic itemLengthSnapshotAtBornLast;
  late bool isRepeatingMode;

  IterableStringListMaker({required List<dynamic> items, bool isRepeatMode = true}) {
    itemsCurrent = items;
    itemsCurrentFirst = itemsCurrent[0];
    itemsCurrentLast = itemsCurrent[itemsCurrent.length - 1];
    itemsSnapshotAtStart = [...items];
    itemLengthSnapshotAtBorn = itemsSnapshotAtStart.length;
    itemLengthSnapshotAtBornFisrt = itemsSnapshotAtStart[0];
    itemLengthSnapshotAtBornLast = itemsSnapshotAtStart[itemsSnapshotAtStart.length - 1];
    isRepeatingMode = isRepeatMode;
  }
  dynamic next() {
    var nextThing = itemsCurrent.first;
    itemsCurrent.remove(itemsCurrent.first.toString());
    return nextThing;
  }

  List<dynamic> all() {
    return itemsCurrent;
  }

  dynamic first() {
    return itemsCurrentFirst;
  }

  dynamic last() {
    return itemsCurrentLast;
  }

  List<dynamic> allAtBorn() {
    return itemsSnapshotAtStart;
  }

  dynamic firstAtBorn() {
    return itemLengthSnapshotAtBornFisrt; //FAIL
  }

  dynamic lastAtBorn() {
    return itemLengthSnapshotAtBornLast;
  }

}
