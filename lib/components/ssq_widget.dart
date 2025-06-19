import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'ssq_model.dart';
export 'ssq_model.dart';

/// Add three page variables: pickedFile of type LocalFile, extractedText of
/// type String with default value empty string, and analysisResult of type
/// String with default value empty string.
///
/// Inside a Column with top padding of 32, left and right padding of 16, and
/// bottom padding of 16, add these widgets in order: a button labeled Select
/// Medical Report, an Image widget 300 pixels wide and 200 pixels high bound
/// to pickedFile, a button labeled Upload and Analyze, and a Text widget
/// bound to analysisResult with font size eighteen using the primary theme
/// color. Configure the Select Medical Report button so that on tap it
/// launches the pick media action for gallery images only and saves the
/// result to pickedFile. Configure the Upload and Analyze button so that on
/// tap it first runs on‑device text recognition on pickedFile, writing its
/// output to extractedText and defaulting to an empty string if no text is
/// found, and it shows a loading indicator while this runs. Then add a
/// condition: if extractedText is not empty, call the OpenAI chat completions
/// endpoint at https://api.openai.com/v1/chat/completions using a POST
/// request with headers Content‑Type application/json and Authorization
/// Bearer
/// sk‑proj‑Z3‑ikYJa7tmB39yLNPGUJjWavxeq_dgxLeD_iMVL0r1WyMxMFPlc3imRihL9S2S1gWVRu9uxOlT3BlbkFJG‑XG9_RLamkNkN‑JQ‑ZQc‑UzHTHDYnxPSNLHOO99WusyoGDGo5PRHlzI7peUZTxLFW‑IvImwwA,
/// sending a JSON body that first sends a system message You are a helpful
/// medical assistant and then a user message saying Here is a patient’s test
/// results followed by the extractedText and Please give concise health
/// recommendations. Map the returned message content to analysisResult, show
/// loading during the API call, and on failure display a snackbar showing
/// Error colon actionErrorMessage. If extractedText is empty, display a
/// snackbar saying No text detected please try a clearer image. Finally
/// rename the Select Medical Report button to btnSelectReport, the Image
/// widget to imgReportPreview, the Upload and Analyze button to
/// btnUploadAnalyze, and the Text widget to txtRecommendations.
class SsqWidget extends StatefulWidget {
  const SsqWidget({super.key});

  @override
  State<SsqWidget> createState() => _SsqWidgetState();
}

class _SsqWidgetState extends State<SsqWidget> {
  late SsqModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SsqModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.transparent,
      ),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(32.0, 16.0, 32.0, 16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            FFButtonWidget(
              onPressed: () {
                print('Button pressed ...');
              },
              text: 'Select Medical Report',
              options: FFButtonOptions(
                width: double.infinity,
                height: 50.0,
                padding: EdgeInsets.all(8.0),
                iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                color: FlutterFlowTheme.of(context).primary,
                textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                      fontFamily: 'Satoshi',
                      color: FlutterFlowTheme.of(context).info,
                      letterSpacing: 0.0,
                    ),
                elevation: 0.0,
                borderSide: BorderSide(
                  color: Colors.transparent,
                  width: 1.0,
                ),
                borderRadius: BorderRadius.circular(8.0),
              ),
            ),
            Image.network(
              '',
              width: 300.0,
              height: 200.0,
              fit: BoxFit.cover,
            ),
            FFButtonWidget(
              onPressed: () {
                print('Button pressed ...');
              },
              text: 'Upload and Analyze',
              options: FFButtonOptions(
                width: double.infinity,
                height: 50.0,
                padding: EdgeInsets.all(8.0),
                iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                color: FlutterFlowTheme.of(context).primary,
                textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                      fontFamily: 'Satoshi',
                      color: FlutterFlowTheme.of(context).info,
                      letterSpacing: 0.0,
                    ),
                elevation: 0.0,
                borderSide: BorderSide(
                  color: Colors.transparent,
                  width: 1.0,
                ),
                borderRadius: BorderRadius.circular(8.0),
              ),
            ),
            Text(
              'Your health recommendations will appear here after analysis.',
              style: FlutterFlowTheme.of(context).bodyLarge.override(
                    fontFamily: 'Satoshi',
                    color: FlutterFlowTheme.of(context).primary,
                    fontSize: 18.0,
                    letterSpacing: 0.0,
                  ),
            ),
          ].divide(SizedBox(height: 16.0)),
        ),
      ),
    );
  }
}
