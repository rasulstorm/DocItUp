import '/auth/firebase_auth/auth_util.dart';
import '/backend/ai_agents/ai_agent.dart';
import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import 'dart:ui';
import 'chat_agent_widget.dart' show ChatAgentWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ChatAgentModel extends FlutterFlowModel<ChatAgentWidget> {
  ///  Local state fields for this page.

  List<ChatStruct> chats = [];
  void addToChats(ChatStruct item) => chats.add(item);
  void removeFromChats(ChatStruct item) => chats.remove(item);
  void removeAtIndexFromChats(int index) => chats.removeAt(index);
  void insertAtIndexInChats(int index, ChatStruct item) =>
      chats.insert(index, item);
  void updateChatsAtIndex(int index, Function(ChatStruct) updateFn) =>
      chats[index] = updateFn(chats[index]);

  /// ""
  String? inputText = 'ss';

  FFUploadedFile? pickedImage;

  String uploadedImageUrl = '\"\"';

  ///  State fields for stateful widgets in this page.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Stores action output result for [AI Agent - Send Message to Analysis AI] action in Button widget.
  String? agentResponse;
  bool isDataUploading_uploadedDataLocalState = false;
  FFUploadedFile uploadedLocalFile_uploadedDataLocalState =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
