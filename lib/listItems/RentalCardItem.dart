import 'package:flutter/material.dart';
import 'package:flutter_list_app_v2/model/RentalModel.dart';
import 'package:meta/meta.dart';

/// Displays its integer item as 'item N' on a Card whose color is based on
/// the item's value. The text is displayed in bright green if selected is true.
/// This widget's height is based on the animation parameter, it varies
/// from 0 to 128 as the animation varies from 0.0 to 1.0.
class RentalCardItem extends StatelessWidget {
  const RentalCardItem(
      {Key key,
      @required this.animation,
      this.onTap,
      @required this.item,
      this.selected: false})
      : assert(animation != null),
        assert(item != null),
        assert(selected != null),
        super(key: key);

  final Animation<double> animation;
  final VoidCallback onTap;
  final RentalModel item;
  final bool selected;

  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = Theme.of(context).textTheme.display1;
    if (selected) textStyle = textStyle.copyWith(color: Colors.red);
    return new Padding(
      padding: const EdgeInsets.all(2.0),
      child: new SizeTransition(
        axis: Axis.vertical,
        sizeFactor: animation,
        child: new GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: onTap,
          child: new SizedBox(
            height: 128.0,
            child: new Card(
//              color: Colors.primaries[item % Colors.primaries.length],
              child: new Center(
                child: new Text("Item ${item.bikeNumber}", style: textStyle),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
