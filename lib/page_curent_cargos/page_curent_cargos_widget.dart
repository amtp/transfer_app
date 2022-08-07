import '../backend/api_requests/api_calls.dart';
import '../cargo_detail/cargo_detail_widget.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_animations.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/percent_indicator.dart';

class PageCurentCargosWidget extends StatefulWidget {
  const PageCurentCargosWidget({Key key}) : super(key: key);

  @override
  _PageCurentCargosWidgetState createState() => _PageCurentCargosWidgetState();
}

class _PageCurentCargosWidgetState extends State<PageCurentCargosWidget>
    with TickerProviderStateMixin {
  final animationsMap = {
    'containerOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      duration: 600,
      fadeIn: true,
      initialState: AnimationState(
        offset: Offset(0, 90),
        scale: 1,
        opacity: 0,
      ),
      finalState: AnimationState(
        offset: Offset(0, 0),
        scale: 1,
        opacity: 1,
      ),
    ),
  };
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    startPageLoadAnimations(
      animationsMap.values
          .where((anim) => anim.trigger == AnimationTrigger.onPageLoad),
      this,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        automaticallyImplyLeading: false,
        leading: FlutterFlowIconButton(
          borderColor: Colors.transparent,
          borderRadius: 30,
          borderWidth: 1,
          buttonSize: 60,
          icon: Icon(
            Icons.arrow_back_rounded,
            color: FlutterFlowTheme.of(context).tertiaryColor,
            size: 30,
          ),
          onPressed: () async {
            Navigator.pop(context);
          },
        ),
        title: Text(
          'В процессе доставки',
          style: FlutterFlowTheme.of(context).title2.override(
            fontFamily: 'Roboto',
            color: FlutterFlowTheme.of(context).primaryColor,
            fontSize: 22,
            fontWeight: FontWeight.w500,
          ),
        ),
        actions: [],
        centerTitle: true,
        elevation: 2,
      ),
      backgroundColor: Color(0xFFF1F4F8),
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
                child: FutureBuilder<dynamic>(
                  future: getCurentCargosCall(),
                  builder: (context, snapshot) {
                    // Customize what your widget looks like when it's loading.
                    if (!snapshot.hasData) {
                      return Center(child: CircularProgressIndicator());
                    }
                    final gridViewGetDepartmentsResponse = snapshot.data;
                    return Builder(
                      builder: (context) {
                        final CargosCollect = (getJsonField(
                            gridViewGetDepartmentsResponse, r'$.cargos')
                            ?.toList() ??
                            [])
                            .take(30)
                            .toList();
                        return ListView.builder(
                          padding: EdgeInsets.zero,
                          scrollDirection: Axis.vertical,
                          itemCount: CargosCollect.length,
                          itemBuilder: (context, listViewIndex) {
                            final listViewApintRecord =
                            CargosCollect[listViewIndex];
                            return Padding(
                              padding:
                              EdgeInsetsDirectional.fromSTEB(16, 16, 16, 16),
                              child: Container(
                                width: double.infinity,
                                constraints: BoxConstraints(
                                  maxWidth: 500,
                                ),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(12),
                                  border: Border.all(
                                    color: Color(0xFFF1F4F8),
                                    width: 2,
                                  ),
                                ),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      12, 16, 12, 12),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            'Номер партии: ',
                                            style: FlutterFlowTheme.of(context)
                                                .subtitle1
                                                .override(
                                              fontFamily: 'Outfit',
                                              color: Color(0xFF101213),
                                              fontSize: 18,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                          Container(
                                            height: 30,
                                            decoration: BoxDecoration(
                                              color: Color(0xFF5CB85C),
                                              borderRadius:
                                              BorderRadius.circular(6),
                                              shape: BoxShape.rectangle,
                                            ),
                                            child: Padding(
                                              padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  10, 3, 10, 0),
                                              child: Text(
                                                getJsonField(listViewApintRecord,
                                                    r'$.partynumber')
                                                    .toString(),
                                                textAlign: TextAlign.center,
                                                style: FlutterFlowTheme.of(context)
                                                    .subtitle1
                                                    .override(
                                                  fontFamily: 'Outfit',
                                                  color: Colors.white,
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0, 4, 0, 4),
                                        child: Text(
                                          getJsonField(listViewApintRecord,
                                              r'$.partydate')
                                              .toString(),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyText2
                                              .override(
                                            fontFamily: 'Outfit',
                                            color: Color(0xFF57636C),
                                            fontSize: 14,
                                            fontWeight: FontWeight.normal,
                                          ),
                                        ),
                                      ),
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Text(
                                            'Сатус: ',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyText2
                                                .override(
                                              fontFamily: 'Outfit',
                                              color: Color(0xFF57636C),
                                              fontSize: 14,
                                              fontWeight: FontWeight.normal,
                                            ),
                                          ),
                                          Text(
                                            getJsonField(listViewApintRecord,
                                                r'$.asigstatusname')
                                                .toString(),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyText2
                                                .override(
                                              fontFamily: 'Outfit',
                                              color: Color(0xFF3E84B5),
                                              fontSize: 16,
                                              fontWeight: FontWeight.normal,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0, 12, 0, 12),
                                        child: LinearPercentIndicator(
                                          percent: getJsonField(listViewApintRecord,
                                              r'$.asigstatusprc'),
                                          width: 310,
                                          lineHeight: 16,
                                          animation: true,
                                          progressColor: Color(0xFF4B39EF),
                                          backgroundColor: Color(0xFFF1F4F8),
                                          barRadius: Radius.circular(16),
                                          padding: EdgeInsets.zero,
                                        ),
                                      ),
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Text(
                                                'Вес: ',
                                                style: FlutterFlowTheme.of(context)
                                                    .subtitle1
                                                    .override(
                                                  fontFamily: 'Outfit',
                                                  color: Color(0xFF101213),
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              ),
                                              Text(
                                                getJsonField(listViewApintRecord,
                                                    r'$.asigwight')
                                                    .toString(),
                                                style: FlutterFlowTheme.of(context)
                                                    .subtitle1
                                                    .override(
                                                  fontFamily: 'Outfit',
                                                  color: Color(0xFF101213),
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Text(
                                                'Мест: ',
                                                style: FlutterFlowTheme.of(context)
                                                    .subtitle1
                                                    .override(
                                                  fontFamily: 'Outfit',
                                                  color: Color(0xFF57636C),
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              ),
                                              Text(
                                                getJsonField(listViewApintRecord,
                                                    r'$.asigmest')
                                                    .toString(),
                                                style: FlutterFlowTheme.of(context)
                                                    .subtitle1
                                                    .override(
                                                  fontFamily: 'Outfit',
                                                  color: Color(0xFF57636C),
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Padding(
                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                0, 4, 0, 0),
                                            child: Text(
                                              'Создан: ',
                                              style: FlutterFlowTheme.of(context)
                                                  .bodyText2
                                                  .override(
                                                fontFamily: 'Outfit',
                                                color: Color(0xFF57636C),
                                                fontSize: 14,
                                                fontWeight: FontWeight.normal,
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                0, 4, 0, 0),
                                            child: Text(
                                              getJsonField(listViewApintRecord,
                                                  r'$.asigcreate')
                                                  .toString(),
                                              style: FlutterFlowTheme.of(context)
                                                  .bodyText2
                                                  .override(
                                                fontFamily: 'Outfit',
                                                color: Color(0xFF57636C),
                                                fontSize: 14,
                                                fontWeight: FontWeight.normal,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Divider(
                                        height: 24,
                                        thickness: 2,
                                        color: Color(0xFFF1F4F8),
                                      ),
                                      InkWell(
                                        onTap: () async {
                                          await Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) => CargoDetailWidget(
                                                cargoId: getJsonField(
                                                    listViewApintRecord,
                                                    r'$.asigid')
                                                    .toString(),
                                              ),
                                            ),
                                          );
                                        },
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Container(
                                              width: 40,
                                              height: 40,
                                              decoration: BoxDecoration(
                                                color: Color(0xFF57636C),
                                                boxShadow: [
                                                  BoxShadow(
                                                    blurRadius: 4,
                                                    color: Color(0x2B202529),
                                                    offset: Offset(0, 2),
                                                  )
                                                ],
                                                shape: BoxShape.circle,
                                              ),
                                              alignment: AlignmentDirectional(0, 0),
                                              child: Text(
                                                getJsonField(listViewApintRecord,
                                                    r'$.cargcount')
                                                    .toString(),
                                                style: FlutterFlowTheme.of(context)
                                                    .bodyText1
                                                    .override(
                                                  fontFamily: 'Outfit',
                                                  color: Colors.white,
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.normal,
                                                ),
                                              ),
                                            ),
                                            Expanded(
                                              child: Padding(
                                                padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    16, 0, 0, 0),
                                                child: Text(
                                                  'Состав партии',
                                                  style: FlutterFlowTheme.of(
                                                      context)
                                                      .subtitle2
                                                      .override(
                                                    fontFamily: 'Outfit',
                                                    color: Color(0xFF57636C),
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Icon(
                                              Icons.keyboard_arrow_right_rounded,
                                              color: Color(0xFF57636C),
                                              size: 24,
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ).animated(
                                  [animationsMap['containerOnPageLoadAnimation']]),
                            );
                          },
                        );
                      },
                    );
                  },
                ))
          ],
        ),
      ),
    );
  }
}
