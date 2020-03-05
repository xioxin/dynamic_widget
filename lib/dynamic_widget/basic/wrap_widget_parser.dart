import 'package:dynamic_widget/dynamic_widget.dart';
import 'package:dynamic_widget/dynamic_widget/utils.dart';
import 'package:flutter/widgets.dart';

class WrapWidgetParser extends WidgetParser {
  @override
  bool forWidget(String widgetName) {
    return "Wrap" == widgetName;
  }

  @override
  Widget parse(Map<String, dynamic> map, BuildContext buildContext,
      ClickListener listener) {
    return Wrap(
      direction: map.containsKey("direction")
          ? parseAxis(map["direction"])
          : Axis.horizontal,
      alignment: map.containsKey("alignment")
          ? parseWrapAlignment(map["alignment"])
          : WrapAlignment.start,
      spacing: map.containsKey("spacing") ? toDouble(map["spacing"]) : 0.0,
      runAlignment: map.containsKey("runAlignment")
          ? parseWrapAlignment(map["runAlignment"])
          : WrapAlignment.start,
      runSpacing: map.containsKey("runSpacing") ? toDouble(map["runSpacing"]) : 0.0,
      crossAxisAlignment: map.containsKey("crossAxisAlignment")
          ? parseWrapCrossAlignment(map["crossAxisAlignment"])
          : WrapCrossAlignment.start,
      textDirection: map.containsKey("textDirection")
          ? parseTextDirection(map["textDirection"])
          : null,
      verticalDirection: map.containsKey("verticalDirection")
          ? parseVerticalDirection(map["verticalDirection"])
          : VerticalDirection.down,
      children: DynamicWidgetBuilder.buildWidgets(
          map['children'], buildContext, listener),
    );
  }
}
