import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class PageSetingsWidget extends StatefulWidget {
  const PageSetingsWidget({Key key}) : super(key: key);

  @override
  _PageSetingsWidgetState createState() => _PageSetingsWidgetState();
}

class _PageSetingsWidgetState extends State<PageSetingsWidget> {
  bool switchListTileValue1;
  bool switchListTileValue2;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: Color(0xFFF1F4F8),
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
          'Настройки',
          style: FlutterFlowTheme.of(context).title2.override(
            fontFamily: 'Roboto',
            color: FlutterFlowTheme.of(context).primaryText,
            fontSize: 22,
            fontWeight: FontWeight.w500,
          ),
        ),
        actions: [],
        centerTitle: false,
        elevation: 2,
      ),
      backgroundColor: Color(0xFFF1F4F8),
      body: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: Text(
                      'Выберите ниже, какие уведомления вы хотите получать, и мы обновим настройки.',
                      style: FlutterFlowTheme.of(context).bodyText2.override(
                        fontFamily: 'Roboto',
                        color: Color(0xFF8E9AA6),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 12, 0, 0),
              child: SwitchListTile.adaptive(
                value: switchListTileValue1 ??= true,
                onChanged: (newValue) =>
                    setState(() => switchListTileValue1 = newValue),
                title: Text(
                  'Push Уведомления',
                  style: FlutterFlowTheme.of(context).title3.override(
                    fontFamily: 'Roboto',
                    color: Color(0xFF1B8CC0),
                  ),
                ),
                subtitle: Text(
                  'Получайте Push-уведомления при изменении статуса груза, а также эксклюзивные новости',
                  style: FlutterFlowTheme.of(context).bodyText2.override(
                    fontFamily: 'Roboto',
                    color: Color(0xFF8E9AA6),
                  ),
                ),
                activeColor: FlutterFlowTheme.of(context).primaryColor,
                activeTrackColor: Colors.white,
                dense: false,
                controlAffinity: ListTileControlAffinity.trailing,
                contentPadding: EdgeInsetsDirectional.fromSTEB(24, 12, 24, 12),
              ),
            ),
            SwitchListTile.adaptive(
              value: switchListTileValue2 ??= true,
              onChanged: (newValue) =>
                  setState(() => switchListTileValue2 = newValue),
              title: Text(
                'Email Уведомления',
                style: FlutterFlowTheme.of(context).title3.override(
                  fontFamily: 'Roboto',
                  color: Color(0xFF1B8CC0),
                ),
              ),
              subtitle: Text(
                'Получайте уведомления по электронной почте ',
                style: FlutterFlowTheme.of(context).bodyText2.override(
                  fontFamily: 'Roboto',
                  color: Color(0xFF8E9AA6),
                ),
              ),
              activeColor: FlutterFlowTheme.of(context).primaryColor,
              activeTrackColor: Colors.white,
              dense: false,
              controlAffinity: ListTileControlAffinity.trailing,
              contentPadding: EdgeInsetsDirectional.fromSTEB(24, 12, 24, 12),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 24, 0, 0),
              child: FFButtonWidget(
                onPressed: () async {
                  Navigator.pop(context);
                },
                text: 'Сохранить настройки',
                options: FFButtonOptions(
                  width: 190,
                  height: 50,
                  color: FlutterFlowTheme.of(context).primaryColor,
                  textStyle: FlutterFlowTheme.of(context).subtitle2.override(
                    fontFamily: 'Lexend Deca',
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                  elevation: 3,
                  borderSide: BorderSide(
                    color: Colors.transparent,
                    width: 1,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
