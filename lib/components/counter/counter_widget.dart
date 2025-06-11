import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_count_controller.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'counter_model.dart';
export 'counter_model.dart';

class CounterWidget extends StatefulWidget {
  const CounterWidget({
    super.key,
    required this.productId,
    required this.quantity,
  });

  final DocumentReference? productId;
  final int? quantity;

  @override
  State<CounterWidget> createState() => _CounterWidgetState();
}

class _CounterWidgetState extends State<CounterWidget> {
  late CounterModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CounterModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Container(
      width: 100.0,
      height: 50.0,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(16.0),
          bottomRight: Radius.circular(16.0),
          topLeft: Radius.circular(16.0),
          topRight: Radius.circular(16.0),
        ),
        shape: BoxShape.rectangle,
        border: Border.all(
          color: FlutterFlowTheme.of(context).accent1,
          width: 2.0,
        ),
      ),
      child: FlutterFlowCountController(
        decrementIconBuilder: (enabled) => FaIcon(
          FontAwesomeIcons.minus,
          color: enabled
              ? FlutterFlowTheme.of(context).accent1
              : FlutterFlowTheme.of(context).accent1,
          size: 16.0,
        ),
        incrementIconBuilder: (enabled) => FaIcon(
          FontAwesomeIcons.plus,
          color: enabled
              ? FlutterFlowTheme.of(context).accent1
              : FlutterFlowTheme.of(context).accent1,
          size: 16.0,
        ),
        countBuilder: (count) => Text(
          count.toString(),
          style: FlutterFlowTheme.of(context).titleLarge.override(
                fontFamily: 'Satoshi',
                letterSpacing: 0.0,
              ),
        ),
        count: _model.countControllerValue ??= widget!.quantity!,
        updateCount: (count) async {
          safeSetState(() => _model.countControllerValue = count);
          var _shouldSetState = false;
          _model.cartitem = await queryCartRecordOnce(
            parent: currentUserReference,
            queryBuilder: (cartRecord) => cartRecord.where(
              'ProductId',
              isEqualTo: widget!.productId,
            ),
            singleRecord: true,
          ).then((s) => s.firstOrNull);
          _shouldSetState = true;
          if (_model.countControllerValue.toString() == '0') {
            await _model.cartitem!.reference.delete();
            if (_shouldSetState) safeSetState(() {});
            return;
          } else {
            if (_model.cartitem?.productId != null) {
              await _model.cartitem!.reference.update(createCartRecordData(
                quantitiy: _model.countControllerValue,
              ));
            } else {
              await CartRecord.createDoc(currentUserReference!)
                  .set(createCartRecordData(
                productId: widget!.productId,
                quantitiy: _model.countControllerValue,
              ));
            }

            _model.cart = await queryCartRecordOnce(
              parent: currentUserReference,
            );
            _shouldSetState = true;
            FFAppState().CartCounter = 0;
            FFAppState().cartTotal = 0.0;
            while (FFAppState().CartCounter != _model.cart?.length) {
              FFAppState().cartTotal = FFAppState().cartTotal +
                  functions.cartPrice(
                      _model.cart!
                          .elementAtOrNull(FFAppState().CartCounter)!
                          .price,
                      _model.cart!
                          .elementAtOrNull(FFAppState().CartCounter)!
                          .quantitiy
                          .toDouble());
              FFAppState().CartCounter = FFAppState().CartCounter + 1;
            }
            FFAppState().CartCounter = 0;

            await currentUserReference!.update(createUserRecordData(
              cartTotal: FFAppState().cartTotal,
            ));
          }

          if (_shouldSetState) safeSetState(() {});
        },
        stepSize: 1,
        minimum: 0,
      ),
    );
  }
}
