import '../btnNavBar.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../page_home/page_home_widget.dart';
import '../custom_code/actions/index.dart' as actions;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPageWidget extends StatefulWidget {
  const LoginPageWidget({Key key}) : super(key: key);

  @override
  _LoginPageWidgetState createState() => _LoginPageWidgetState();
}

class _LoginPageWidgetState extends State<LoginPageWidget> {
  TextEditingController emailAddressLoginController;
  TextEditingController passwordLoginController;
  bool passwordLoginVisibility;
  bool isLoginAkept;
  dynamic hData;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    emailAddressLoginController = TextEditingController();
    passwordLoginController = TextEditingController();
    passwordLoginVisibility = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).background,
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 1,
                decoration: BoxDecoration(
                  color: Color(0xFFE8E8E8),
                  image: DecorationImage(
                    fit: BoxFit.fitWidth,
                    image: Image.asset(
                      'assets/images/head-bg-ss.png',
                    ).image,
                  ),
                ),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 24, 0, 20),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              'assets/images/logo-4.png',
                              width: 200,
                              fit: BoxFit.fitHeight,
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
                          child: DefaultTabController(
                            length: 1,
                            initialIndex: 0,
                            child: Column(
                              children: [
                                TabBar(
                                  labelColor: Color(0xFF0097FF),
                                  unselectedLabelColor:
                                  FlutterFlowTheme.of(context).grayLight,
                                  labelStyle: GoogleFonts.getFont(
                                    'Roboto',
                                    fontSize: 18,
                                  ),
                                  indicatorColor: Color(0xFF0080FF),
                                  indicatorWeight: 3,
                                  tabs: [
                                    Tab(
                                      text: 'Авторизация',
                                    ),
                                  ],
                                ),
                                Expanded(
                                  child: TabBarView(
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            10, 0, 10, 0),
                                        child: SingleChildScrollView(
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(0, 20, 0, 0),
                                                child: TextFormField(
                                                  controller:
                                                  emailAddressLoginController,
                                                  onChanged: (_) =>
                                                      EasyDebounce.debounce(
                                                        'emailAddressLoginController',
                                                        Duration(
                                                            milliseconds: 2000),
                                                            () => setState(() {}),
                                                      ),
                                                  obscureText: false,
                                                  decoration: InputDecoration(
                                                    isDense: true,
                                                    labelText: 'Номер телефона',
                                                    labelStyle: FlutterFlowTheme
                                                        .of(context)
                                                        .bodyText2
                                                        .override(
                                                      fontFamily: 'DM Sans',
                                                      color: FlutterFlowTheme
                                                          .of(context)
                                                          .secondaryColor,
                                                    ),
                                                    hintText:
                                                    'Введите свой номер телефона..',
                                                    hintStyle: FlutterFlowTheme
                                                        .of(context)
                                                        .bodyText1
                                                        .override(
                                                      fontFamily: 'Roboto',
                                                      color: FlutterFlowTheme
                                                          .of(context)
                                                          .secondaryText,
                                                      fontSize: 16,
                                                    ),
                                                    enabledBorder:
                                                    OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color:
                                                        Color(0xFFE2E6ED),
                                                        width: 1,
                                                      ),
                                                      borderRadius:
                                                      BorderRadius.circular(
                                                          8),
                                                    ),
                                                    focusedBorder:
                                                    OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color:
                                                        Color(0xFFE2E6ED),
                                                        width: 1,
                                                      ),
                                                      borderRadius:
                                                      BorderRadius.circular(
                                                          8),
                                                    ),
                                                    filled: true,
                                                    fillColor: Colors.white,
                                                    contentPadding:
                                                    EdgeInsetsDirectional
                                                        .fromSTEB(
                                                        20, 20, 20, 20),
                                                    suffixIcon:
                                                    emailAddressLoginController
                                                        .text.isNotEmpty
                                                        ? InkWell(
                                                      onTap: () =>
                                                          setState(
                                                                () => emailAddressLoginController
                                                                ?.clear(),
                                                          ),
                                                      child: Icon(
                                                        Icons.clear,
                                                        color: Color(
                                                            0xFF757575),
                                                        size: 22,
                                                      ),
                                                    )
                                                        : null,
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                      context)
                                                      .bodyText1
                                                      .override(
                                                    fontFamily: 'Roboto',
                                                    color: Colors.black,
                                                    fontSize: 16,
                                                    fontWeight:
                                                    FontWeight.w500,
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(0, 15, 0, 0),
                                                child: TextFormField(
                                                  controller:
                                                  passwordLoginController,
                                                  obscureText:
                                                  !passwordLoginVisibility,
                                                  decoration: InputDecoration(
                                                    isDense: true,
                                                    labelText: 'Пароль',
                                                    labelStyle: FlutterFlowTheme
                                                        .of(context)
                                                        .bodyText2
                                                        .override(
                                                      fontFamily: 'Roboto',
                                                      color: FlutterFlowTheme
                                                          .of(context)
                                                          .secondaryColor,
                                                    ),
                                                    hintText:
                                                    'Введите пароль...',
                                                    hintStyle: FlutterFlowTheme
                                                        .of(context)
                                                        .bodyText1
                                                        .override(
                                                      fontFamily: 'Roboto',
                                                      color: FlutterFlowTheme
                                                          .of(context)
                                                          .secondaryText,
                                                      fontSize: 16,
                                                      fontWeight:
                                                      FontWeight.normal,
                                                    ),
                                                    enabledBorder:
                                                    OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color:
                                                        Color(0xFFE2E6ED),
                                                        width: 1,
                                                      ),
                                                      borderRadius:
                                                      BorderRadius.circular(
                                                          8),
                                                    ),
                                                    focusedBorder:
                                                    OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color:
                                                        Color(0xFFE2E6ED),
                                                        width: 1,
                                                      ),
                                                      borderRadius:
                                                      BorderRadius.circular(
                                                          8),
                                                    ),
                                                    filled: true,
                                                    fillColor: Colors.white,
                                                    contentPadding:
                                                    EdgeInsetsDirectional
                                                        .fromSTEB(
                                                        20, 20, 20, 20),
                                                    suffixIcon: InkWell(
                                                      onTap: () => setState(
                                                            () => passwordLoginVisibility =
                                                        !passwordLoginVisibility,
                                                      ),
                                                      focusNode: FocusNode(
                                                          skipTraversal: true),
                                                      child: Icon(
                                                        passwordLoginVisibility
                                                            ? Icons
                                                            .visibility_outlined
                                                            : Icons
                                                            .visibility_off_outlined,
                                                        color:
                                                        FlutterFlowTheme.of(
                                                            context)
                                                            .gray600,
                                                        size: 20,
                                                      ),
                                                    ),
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                      context)
                                                      .bodyText1
                                                      .override(
                                                    fontFamily: 'Roboto',
                                                    color:
                                                    FlutterFlowTheme.of(
                                                        context)
                                                        .tertiaryColor,
                                                    fontSize: 16,
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(0, 24, 0, 0),
                                                child: FFButtonWidget(
                                                  onPressed: () async {
                                                    isLoginAkept = await actions
                                                        .checkAutchMistral(
                                                      context,
                                                      emailAddressLoginController
                                                          .text,
                                                      passwordLoginController
                                                          .text,
                                                    );
                                                    if (isLoginAkept) {
                                                      hData = await actions
                                                          .getUserMistral();
                                                      await Navigator
                                                          .pushAndRemoveUntil(
                                                        context,
                                                        MaterialPageRoute(
                                                          builder: (context) =>
                                                              NavBarPage( homeDatas: hData, ),

                                                        ),
                                                            (r) => false,
                                                      );
                                                    } else {
                                                      await showDialog(
                                                        context: context,
                                                        builder:
                                                            (alertDialogContext) {
                                                          return AlertDialog(
                                                            title: Text(
                                                                'Авторизация'),
                                                            content: Text(
                                                                'Номер телефона или пароль были введены не верно'),
                                                            actions: [
                                                              TextButton(
                                                                onPressed: () =>
                                                                    Navigator.pop(
                                                                        alertDialogContext),
                                                                child: Text(
                                                                    'Понятно'),
                                                              ),
                                                            ],
                                                          );
                                                        },
                                                      );
                                                    }

                                                    setState(() {});
                                                  },
                                                  text: 'Авторизоваться',
                                                  options: FFButtonOptions(
                                                    width: 230,
                                                    height: 60,
                                                    color: Color(0xFF2D65B3),
                                                    textStyle: FlutterFlowTheme
                                                        .of(context)
                                                        .subtitle2
                                                        .override(
                                                      fontFamily: 'DM Sans',
                                                      color: FlutterFlowTheme
                                                          .of(context)
                                                          .textColor,
                                                    ),
                                                    elevation: 3,
                                                    borderSide: BorderSide(
                                                      color: Colors.transparent,
                                                      width: 1,
                                                    ),
                                                    borderRadius:8,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
