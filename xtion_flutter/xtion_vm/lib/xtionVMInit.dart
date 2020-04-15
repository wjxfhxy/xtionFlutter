library xtion_vm;

import 'package:xtion_engine/model/uimodel/view_model.dart';
import 'package:xtion_vm/model/panel_model.dart';

import 'model/layout_model.dart';
import 'model/text_model.dart';
import 'model/textinput_model.dart';
import 'model/textinputarea_model.dart';
import 'model/dropdownbox_model.dart';
import 'model/button_model.dart';
import 'model/calendar_model.dart';
import 'model/selectbox_model.dart';
import 'model/list_model.dart';
import 'model/row_model.dart';
import 'model/panel_model.dart';

 xtionVMInit() {

   ViewModel.registerModelFactory((Map<String, dynamic> content) {

     var type = content["type"] as String;

     switch(type) {
       case 'layout': {

         return LayoutModel.fromJSON(content);
       }
       case 'panel': {

         return PanelModel.fromJSON(content);
       }
       case 'text': {

         return TextModel.fromJSON(content);
       }
       case 'textinput': {

         return TextInputModel.fromJSON(content);
       }
       case 'textinputarea': {

         return TextInputAreaModel.fromJSON(content);
       }
       case 'dropdownbox': {

         return DropdownBoxModel.fromJSON(content);
       }
       case 'button': {

         return ButtonModel.fromJSON(content);
       }
       case 'calendar': {

         return CalendarModel.fromJSON(content);
       }
       case 'selectbox': {

         return SelectBoxModel.fromJSON(content);
       }
       case 'list': {

         return ListModel.fromJSON(content);
       }
       case 'row': {

         return RowModel.fromJSON(content);
       }
     }

     return ViewModel.fromJSON(content);
   });
 }
