
import 'package:transfer_app/backend/api_requests/schema/AutcData.dart';

import 'api_manager.dart';
String usertoken;



Future<dynamic> getArtPieceCall({
  String objectID = '',
}) =>
    ApiManager.instance.makeApiCall(
      callName: 'Get Art Piece',
      apiDomain: 'collectionapi.metmuseum.org',
      apiEndpoint: 'public/collection/v1/objects/$objectID',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnResponse: true,
    );



Future<dynamic> checkAutchMistral({
  String email = '',
  String password = '',
}) =>
    ApiManager.instance.makeApiCall(
      callName: 'Check Autch',
      apiDomain: 'api.mistral-korea.ru',
      apiEndpoint: '',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'login': email,
        'pass': password,
      },
      returnResponse: true,
    );



Future<dynamic> getDepartmentsCall() => ApiManager.instance.makeApiCall(
  callName: 'Get Departments',
  apiDomain: 'collectionapi.metmuseum.org',
  apiEndpoint: 'public/collection/v1/departments',
  callType: ApiCallType.GET,
  headers: {},
  params: {},
  returnResponse: true,
);

Future<dynamic> getCurentCargosCall() => ApiManager.instance.makeApiCall(
  callName: 'Get CurentCargos',
  apiDomain: 'api.mistral-korea.ru',
  apiEndpoint: 'cerentcargos',
  callType: ApiCallType.GET,
  headers: {},
  params: {},
  returnResponse: true,
  isCash: false,
);
Future<dynamic> getHistoryCargosCall() => ApiManager.instance.makeApiCall(
  callName: 'Get HistoryCargos',
  apiDomain: 'api.mistral-korea.ru',
  apiEndpoint: 'historycargos',
  callType: ApiCallType.GET,
  headers: {},
  params: {},
  returnResponse: true,
  isCash: false,
);
Future<dynamic> getAllertsCall() => ApiManager.instance.makeApiCall(
  callName: 'Get HistoryCargos',
  apiDomain: 'api.mistral-korea.ru',
  apiEndpoint: 'allerts',
  callType: ApiCallType.GET,
  headers: {},
  params: {},
  returnResponse: true,
  isCash: false,
);
Future<dynamic> getCargosDetailListCall(String cargid) => ApiManager.instance.makeApiCall(
  callName: 'Get CurentCargos',
  apiDomain: 'api.mistral-korea.ru',
  apiEndpoint: 'cargosdetail',
  callType: ApiCallType.GET,
  headers: {},
  params: {
    'cargid': cargid,
  },
  returnResponse: true,
  isCash: false,
);


Future<dynamic> setCargoDelivery(String cargid) => ApiManager.instance.makeApiCall(
  callName: 'Get CurentCargos',
  apiDomain: 'api.mistral-korea.ru',
  apiEndpoint: 'cargodelivery',
  callType: ApiCallType.GET,
  headers: {},
  params: {
    'cargid': cargid,
  },
  returnResponse: true,
  isCash: false,
);

Future<dynamic> searchArtCall({
  String q = '',
}) =>
    ApiManager.instance.makeApiCall(
      callName: 'Search Art',
      apiDomain: 'collectionapi.metmuseum.org',
      apiEndpoint: 'public/collection/v1/search',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'q': q,
      },
      returnResponse: true,
    );

Future<dynamic> departmentHighlightsCall({
  int departmentId,
  bool isHighlight = true,
  String q = '*',
}) =>
    ApiManager.instance.makeApiCall(
      callName: 'Department Highlights',
      apiDomain: 'collectionapi.metmuseum.org',
      apiEndpoint: 'public/collection/v1/search',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'departmentId': departmentId,
        'isHighlight': isHighlight,
        'q': q,
      },
      returnResponse: true,
    );