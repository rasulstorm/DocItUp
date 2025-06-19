import '/backend/backend.dart';
import '/components/action2_sheet_simple/action2_sheet_simple_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_toggle_icon.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'product_details_widget.dart' show ProductDetailsWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ProductDetailsModel extends FlutterFlowModel<ProductDetailsWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for Action2SheetSimple component.
  late Action2SheetSimpleModel action2SheetSimpleModel;

  @override
  void initState(BuildContext context) {
    action2SheetSimpleModel =
        createModel(context, () => Action2SheetSimpleModel());
  }

  @override
  void dispose() {
    action2SheetSimpleModel.dispose();
  }
}
