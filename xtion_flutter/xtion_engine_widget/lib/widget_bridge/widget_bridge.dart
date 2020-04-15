
import '../view_desc.dart';
import '../widget_property/widget_property.dart';
import '../widget_property/hidden.dart';

class WidgetBridge<T extends ViewDesc> {

  T desc;

  void Function() propertyValueChanged;

  WidgetBridge(
    this.desc
  );

  void changeDescriptionValue(String desc, dynamic value) {

    WidgetProperty p = null;

    if(desc == "hidden") {
      p = Hidden(value);
    }
    changePropertyValue(p);
  }

  void changePropertyValue(WidgetProperty propertyValue) {

    var find = false;
    if(propertyValue is Hidden) {
      find = true;
      desc.hidden.calculateResultValue = propertyValue.value;
    }

    if(find == true && propertyValueChanged != null) {

      propertyValueChanged();
    }
  }
}