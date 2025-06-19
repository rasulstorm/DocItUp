import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'no_records_model.dart';
export 'no_records_model.dart';

class NoRecordsWidget extends StatefulWidget {
  const NoRecordsWidget({super.key});

  @override
  State<NoRecordsWidget> createState() => _NoRecordsWidgetState();
}

class _NoRecordsWidgetState extends State<NoRecordsWidget> {
  late NoRecordsModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NoRecordsModel());

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
      decoration: BoxDecoration(),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.search_off_rounded,
            color: FlutterFlowTheme.of(context).secondary,
            size: 80.0,
          ),
          Text(
            'No Items Available',
            style: FlutterFlowTheme.of(context).titleLarge.override(
                  fontFamily: 'Satoshi',
                  letterSpacing: 0.0,
                ),
          ),
        ],
      ),
    );
  }
}
