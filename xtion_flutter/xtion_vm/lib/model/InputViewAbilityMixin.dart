
import 'package:xtion_engine_widget/title_view_desc.dart';
import 'package:xtion_engine_widget/string_desc.dart';

abstract class InputViewAbilityMixin {

  inputViewAbilityFromJSON(Map<String, dynamic> content, TitleViewDesc desc) {

    desc.title = content["title"] as String ?? "";

    desc.value = content["value"] as String ?? "";

    desc.required = StringDesc(content["required"], desc.required.defaultValue);

    desc.readOnly = StringDesc(content["readonly"], desc.readOnly.defaultValue);

    desc.placeholder = content["placeholder"] as String ?? "";

  }
}