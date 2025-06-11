import '/auth/firebase_auth/auth_util.dart';
import '/backend/ai_agents/ai_agent.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/upload_data.dart';
import 'dart:ui';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:provider/provider.dart';
import 'gg_model.dart';
export 'gg_model.dart';

/// d button
class GgWidget extends StatefulWidget {
  const GgWidget({super.key});

  @override
  State<GgWidget> createState() => _GgWidgetState();
}

class _GgWidgetState extends State<GgWidget> {
  late GgModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => GgModel());

    _model.textController ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<AIChatsRecord>>(
      stream: queryAIChatsRecord(),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Center(
            child: SizedBox(
              width: 35.0,
              height: 35.0,
              child: SpinKitSquareCircle(
                color: FlutterFlowTheme.of(context).lineColor,
                size: 35.0,
              ),
            ),
          );
        }
        List<AIChatsRecord> containerAIChatsRecordList = snapshot.data!;

        return Container(
          decoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(24.0),
          ),
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                  child: Container(
                    width: double.infinity,
                    height: 500.0,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                      borderRadius: BorderRadius.circular(12.0),
                      border: Border.all(
                        color: FlutterFlowTheme.of(context).alternate,
                        width: 1.0,
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SingleChildScrollView(
                            scrollDirection: Axis.vertical,
                            child: Flex(
                              direction: Axis.vertical,
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                PagedListView<DocumentSnapshot<Object?>?,
                                    AIChatsRecord>.separated(
                                  pagingController:
                                      _model.setListViewController(
                                    AIChatsRecord.collection
                                        .where(
                                          'user_id',
                                          isEqualTo: currentUserUid,
                                        )
                                        .orderBy('timestamp'),
                                  ),
                                  padding: EdgeInsets.zero,
                                  primary: false,
                                  shrinkWrap: true,
                                  reverse: true,
                                  scrollDirection: Axis.vertical,
                                  separatorBuilder: (_, __) =>
                                      SizedBox(height: 36.0),
                                  builderDelegate:
                                      PagedChildBuilderDelegate<AIChatsRecord>(
                                    // Customize what your widget looks like when it's loading the first page.
                                    firstPageProgressIndicatorBuilder: (_) =>
                                        Center(
                                      child: SizedBox(
                                        width: 35.0,
                                        height: 35.0,
                                        child: SpinKitSquareCircle(
                                          color: FlutterFlowTheme.of(context)
                                              .lineColor,
                                          size: 35.0,
                                        ),
                                      ),
                                    ),
                                    // Customize what your widget looks like when it's loading another page.
                                    newPageProgressIndicatorBuilder: (_) =>
                                        Center(
                                      child: SizedBox(
                                        width: 35.0,
                                        height: 35.0,
                                        child: SpinKitSquareCircle(
                                          color: FlutterFlowTheme.of(context)
                                              .lineColor,
                                          size: 35.0,
                                        ),
                                      ),
                                    ),

                                    itemBuilder: (context, _, listViewIndex) {
                                      final listViewAIChatsRecord = _model
                                          .listViewPagingController!
                                          .itemList![listViewIndex];
                                      return Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Container(
                                            width: 40.0,
                                            height: 40.0,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              borderRadius:
                                                  BorderRadius.circular(20.0),
                                            ),
                                            child: Align(
                                              alignment: AlignmentDirectional(
                                                  0.0, 0.0),
                                              child: Padding(
                                                padding: EdgeInsets.all(8.0),
                                                child: Text(
                                                  'AI',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Satoshi',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .info,
                                                        letterSpacing: 0.0,
                                                      ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          Container(
                                            width: 277.9,
                                            height: 73.89,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                            ),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Text(
                                                  listViewAIChatsRecord.message,
                                                  textAlign: TextAlign.start,
                                                  maxLines: 999,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Satoshi',
                                                        letterSpacing: 0.0,
                                                      ),
                                                ),
                                                Text(
                                                  listViewAIChatsRecord.sender,
                                                  textAlign: TextAlign.start,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Satoshi',
                                                        letterSpacing: 0.0,
                                                      ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      );
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ].divide(SizedBox(height: 12.0)),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                      borderRadius: BorderRadius.circular(12.0),
                      border: Border.all(
                        color: FlutterFlowTheme.of(context).alternate,
                        width: 1.0,
                      ),
                    ),
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(8.0, 8.0, 8.0, 8.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          FlutterFlowIconButton(
                            borderColor: Colors.transparent,
                            borderRadius: 20.0,
                            borderWidth: 1.0,
                            buttonSize: 40.0,
                            fillColor: Color(0x00F1F4F8),
                            icon: Icon(
                              Icons.attach_file_rounded,
                              color: FlutterFlowTheme.of(context).primaryText,
                              size: 20.0,
                            ),
                            onPressed: () async {
                              final selectedMedia = await selectMedia(
                                includeDimensions: true,
                                mediaSource: MediaSource.photoGallery,
                                multiImage: false,
                              );
                              if (selectedMedia != null &&
                                  selectedMedia.every((m) => validateFileFormat(
                                      m.storagePath, context))) {
                                safeSetState(() => _model
                                    .isDataUploading_uploadimagechatai = true);
                                var selectedUploadedFiles = <FFUploadedFile>[];

                                var downloadUrls = <String>[];
                                try {
                                  selectedUploadedFiles = selectedMedia
                                      .map((m) => FFUploadedFile(
                                            name: m.storagePath.split('/').last,
                                            bytes: m.bytes,
                                            height: m.dimensions?.height,
                                            width: m.dimensions?.width,
                                            blurHash: m.blurHash,
                                          ))
                                      .toList();

                                  downloadUrls = (await Future.wait(
                                    selectedMedia.map(
                                      (m) async => await uploadData(
                                          m.storagePath, m.bytes),
                                    ),
                                  ))
                                      .where((u) => u != null)
                                      .map((u) => u!)
                                      .toList();
                                } finally {
                                  _model.isDataUploading_uploadimagechatai =
                                      false;
                                }
                                if (selectedUploadedFiles.length ==
                                        selectedMedia.length &&
                                    downloadUrls.length ==
                                        selectedMedia.length) {
                                  safeSetState(() {
                                    _model.uploadedLocalFile_uploadimagechatai =
                                        selectedUploadedFiles.first;
                                    _model.uploadedFileUrl_uploadimagechatai =
                                        downloadUrls.first;
                                  });
                                } else {
                                  safeSetState(() {});
                                  return;
                                }
                              }
                            },
                          ),
                          Expanded(
                            child: TextFormField(
                              controller: _model.textController,
                              focusNode: _model.textFieldFocusNode,
                              autofocus: false,
                              textCapitalization: TextCapitalization.sentences,
                              textInputAction: TextInputAction.send,
                              obscureText: false,
                              decoration: InputDecoration(
                                hintText: 'Type your message...',
                                hintStyle: GoogleFonts.roboto(
                                  color: Color(0x00000000),
                                  fontSize: 0.0,
                                ),
                                enabledBorder: InputBorder.none,
                                focusedBorder: InputBorder.none,
                                errorBorder: InputBorder.none,
                                focusedErrorBorder: InputBorder.none,
                                filled: true,
                                fillColor: Color(0x00F1F4F8),
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Satoshi',
                                    letterSpacing: 0.0,
                                  ),
                              minLines: 1,
                              validator: _model.textControllerValidator
                                  .asValidator(context),
                              inputFormatters: [
                                if (!isAndroid && !isiOS)
                                  TextInputFormatter.withFunction(
                                      (oldValue, newValue) {
                                    return TextEditingValue(
                                      selection: newValue.selection,
                                      text: newValue.text.toCapitalization(
                                          TextCapitalization.sentences),
                                    );
                                  }),
                              ],
                            ),
                          ),
                          FlutterFlowIconButton(
                            borderColor: Colors.transparent,
                            borderRadius: 20.0,
                            borderWidth: 1.0,
                            buttonSize: 40.0,
                            fillColor: FlutterFlowTheme.of(context).primary,
                            icon: Icon(
                              Icons.send_rounded,
                              color: FlutterFlowTheme.of(context).info,
                              size: 20.0,
                            ),
                            onPressed: () async {
                              await AIChatsRecord.collection
                                  .doc()
                                  .set(createAIChatsRecordData(
                                    message: _model.textController.text,
                                    userId: currentUserUid,
                                    sender: currentUserUid,
                                    timestamp: getCurrentTimestamp,
                                    imageUrl: containerAIChatsRecordList
                                        .lastOrNull?.imageUrl,
                                  ));
                              await callAiAgent(
                                context: context,
                                prompt: _model.textController.text,
                                imageAsset:
                                    _model.uploadedLocalFile_uploadimagechatai,
                                threadId: currentUserUid,
                                agentCloudFunctionName: 'analysisAI',
                                provider: 'GOOGLE',
                                agentJson:
                                    "{\"status\":\"LIVE\",\"identifier\":{\"name\":\"analysisAI\",\"key\":\"32sdn\"},\"name\":\"Analysis AI\",\"description\":\"Custom AI doctor.\",\"aiModel\":{\"provider\":\"GOOGLE\",\"model\":\"gemini-2.0-flash-lite\",\"parameters\":{\"temperature\":{\"inputValue\":1},\"maxTokens\":{\"inputValue\":8192},\"topP\":{\"inputValue\":0.95}},\"messages\":[{\"role\":\"SYSTEM\",\"text\":\"\\nYou are professional doctor agent. \\n\\nAnalyse given medical analysis and give detailed health recommendations on what exactly to do. \\n\\nSpeak with me like with pacient. \\n\\nWhen user asking to analyze image or something like that be very careful. Pay attention to mean parameters that you know and compare them and give advices and health tips. \\n\\nDo not write a lot, be exact. \\nYou may talk as a real human, maybe as a friend, if user tells his name. \"}]},\"requestOptions\":{\"requestTypes\":[\"PLAINTEXT\",\"IMAGE\"]},\"responseOptions\":{\"responseType\":\"PLAINTEXT\"}}",
                                responseType: 'PLAINTEXT',
                              ).then((generatedText) {
                                safeSetState(
                                    () => _model.aiResponse = generatedText);
                              });

                              await AIChatsRecord.collection
                                  .doc()
                                  .set(createAIChatsRecordData(
                                    sender: 'AI',
                                    message: _model.aiResponse,
                                    timestamp: getCurrentTimestamp,
                                    userId: currentUserUid,
                                    imageUrl: '',
                                  ));
                              safeSetState(() {
                                _model.textController?.clear();
                              });

                              safeSetState(() {});
                            },
                          ),
                        ].divide(SizedBox(width: 8.0)),
                      ),
                    ),
                  ),
                ),
              ].divide(SizedBox(height: 16.0)),
            ),
          ),
        );
      },
    );
  }
}
