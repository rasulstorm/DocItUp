import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/index.dart';
import 'forgot_password_page_widget.dart' show ForgotPasswordPageWidget;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ForgotPasswordPageModel
    extends FlutterFlowModel<ForgotPasswordPageWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for EmailPasswordReset widget.
  FocusNode? emailPasswordResetFocusNode;
  TextEditingController? emailPasswordResetTextController;
  String? Function(BuildContext, String?)?
      emailPasswordResetTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    emailPasswordResetFocusNode?.dispose();
    emailPasswordResetTextController?.dispose();
  }
}
