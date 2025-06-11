import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/index.dart';
import 'sign_up_widget.dart' show SignUpWidget;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SignUpModel extends FlutterFlowModel<SignUpWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for EmailAddressTextField widget.
  FocusNode? emailAddressTextFieldFocusNode;
  TextEditingController? emailAddressTextFieldTextController;
  String? Function(BuildContext, String?)?
      emailAddressTextFieldTextControllerValidator;
  // State field(s) for PaswordTextField widget.
  FocusNode? paswordTextFieldFocusNode;
  TextEditingController? paswordTextFieldTextController;
  late bool paswordTextFieldVisibility;
  String? Function(BuildContext, String?)?
      paswordTextFieldTextControllerValidator;
  // State field(s) for ConfirmPasswordTextField widget.
  FocusNode? confirmPasswordTextFieldFocusNode1;
  TextEditingController? confirmPasswordTextFieldTextController1;
  late bool confirmPasswordTextFieldVisibility;
  String? Function(BuildContext, String?)?
      confirmPasswordTextFieldTextController1Validator;
  // State field(s) for ConfirmPasswordTextField widget.
  FocusNode? confirmPasswordTextFieldFocusNode2;
  TextEditingController? confirmPasswordTextFieldTextController2;
  String? Function(BuildContext, String?)?
      confirmPasswordTextFieldTextController2Validator;

  @override
  void initState(BuildContext context) {
    paswordTextFieldVisibility = false;
    confirmPasswordTextFieldVisibility = false;
  }

  @override
  void dispose() {
    emailAddressTextFieldFocusNode?.dispose();
    emailAddressTextFieldTextController?.dispose();

    paswordTextFieldFocusNode?.dispose();
    paswordTextFieldTextController?.dispose();

    confirmPasswordTextFieldFocusNode1?.dispose();
    confirmPasswordTextFieldTextController1?.dispose();

    confirmPasswordTextFieldFocusNode2?.dispose();
    confirmPasswordTextFieldTextController2?.dispose();
  }
}
