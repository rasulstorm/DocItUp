import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/navigationbar_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import 'dart:ui';
import '/index.dart';
import 'edit_profile_page_widget.dart' show EditProfilePageWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class EditProfilePageModel extends FlutterFlowModel<EditProfilePageWidget> {
  ///  Local state fields for this page.

  FFUploadedFile? avatar;

  ///  State fields for stateful widgets in this page.

  bool isDataUploading_imageAvatar = false;
  FFUploadedFile uploadedLocalFile_imageAvatar =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  // State field(s) for UserNameTextField widget.
  FocusNode? userNameTextFieldFocusNode;
  TextEditingController? userNameTextFieldTextController;
  String? Function(BuildContext, String?)?
      userNameTextFieldTextControllerValidator;
  // State field(s) for EmailAddressTextField widget.
  FocusNode? emailAddressTextFieldFocusNode1;
  TextEditingController? emailAddressTextFieldTextController1;
  String? Function(BuildContext, String?)?
      emailAddressTextFieldTextController1Validator;
  // State field(s) for EmailAddressTextField widget.
  FocusNode? emailAddressTextFieldFocusNode2;
  TextEditingController? emailAddressTextFieldTextController2;
  String? Function(BuildContext, String?)?
      emailAddressTextFieldTextController2Validator;
  // State field(s) for EmailAddressTextField widget.
  FocusNode? emailAddressTextFieldFocusNode3;
  TextEditingController? emailAddressTextFieldTextController3;
  String? Function(BuildContext, String?)?
      emailAddressTextFieldTextController3Validator;
  // State field(s) for EmailAddressTextField widget.
  FocusNode? emailAddressTextFieldFocusNode4;
  TextEditingController? emailAddressTextFieldTextController4;
  String? Function(BuildContext, String?)?
      emailAddressTextFieldTextController4Validator;
  // State field(s) for EmailAddressTextField widget.
  FocusNode? emailAddressTextFieldFocusNode5;
  TextEditingController? emailAddressTextFieldTextController5;
  String? Function(BuildContext, String?)?
      emailAddressTextFieldTextController5Validator;
  // Model for Navigationbar component.
  late NavigationbarModel navigationbarModel;

  @override
  void initState(BuildContext context) {
    navigationbarModel = createModel(context, () => NavigationbarModel());
  }

  @override
  void dispose() {
    userNameTextFieldFocusNode?.dispose();
    userNameTextFieldTextController?.dispose();

    emailAddressTextFieldFocusNode1?.dispose();
    emailAddressTextFieldTextController1?.dispose();

    emailAddressTextFieldFocusNode2?.dispose();
    emailAddressTextFieldTextController2?.dispose();

    emailAddressTextFieldFocusNode3?.dispose();
    emailAddressTextFieldTextController3?.dispose();

    emailAddressTextFieldFocusNode4?.dispose();
    emailAddressTextFieldTextController4?.dispose();

    emailAddressTextFieldFocusNode5?.dispose();
    emailAddressTextFieldTextController5?.dispose();

    navigationbarModel.dispose();
  }
}
