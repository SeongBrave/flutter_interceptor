// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:collection';
import 'dart:convert';
import 'dart:core';

import 'package:flutter/foundation.dart';

enum Status { Requested, Complete, Failed }

base class HttpTransaction extends LinkedListEntry<HttpTransaction> {
  String? host;
  String? path;
  String? scheme;
  Uri? muri;
  int? id;
  DateTime? requestTime;
  DateTime? responseTime;
  int? duration;

  int? statusCode;
  bool? redirect;
  String? responseBody;
  Map<String, dynamic>? responseHeaders;
  Uri? realUri;

  bool error = false;

  String? method;
  bool? followRedirects;

  String? responseType;
  int? connectTimeout;
  int? sendTimeout;
  int? receiveTimeout;
  bool? receiveDataWhenStatusError;
  String? requestBody;
  Map<String, dynamic>? requestHeaders;
  Map<String, dynamic>? extra;
  HttpTransaction({
    this.host,
    this.path,
    this.scheme,
    this.muri,
    this.id,
    this.requestTime,
    this.responseTime,
    this.duration,
    this.statusCode,
    this.redirect,
    this.responseBody,
    this.responseHeaders,
    this.realUri,
    this.method,
    this.followRedirects,
    this.responseType,
    this.connectTimeout,
    this.sendTimeout,
    this.receiveTimeout,
    this.receiveDataWhenStatusError,
    this.requestBody,
    this.requestHeaders,
    this.extra,
  });

  Status get status {
    if (error) {
      return Status.Failed;
    } else if (statusCode == null) {
      return Status.Requested;
    } else {
      return Status.Complete;
    }
  }

  set uri(Uri uri) {
    muri = uri;
    host = uri.host;
    path = uri.path + (uri.hasQuery ? "?${uri.query}" : "");
    scheme = uri.scheme;
  }

  @override
  String toString() {
    return 'HttpTransaction(host: $host, path: $path, scheme: $scheme, muri: $muri, id: $id, requestTime: $requestTime, responseTime: $responseTime, duration: $duration, statusCode: $statusCode, redirect: $redirect, responseBody: $responseBody, responseHeaders: $responseHeaders, realUri: $realUri, error: $error, method: $method, followRedirects: $followRedirects, responseType: $responseType, connectTimeout: $connectTimeout, sendTimeout: $sendTimeout, receiveTimeout: $receiveTimeout, receiveDataWhenStatusError: $receiveDataWhenStatusError, requestBody: $requestBody, requestHeaders: $requestHeaders, extra: $extra)';
  }

  // Map<String, dynamic>? getRequestHeaders() {
  //   if(requestHeaders!=null){
  //     Map<String, dynamic> header = convert.jsonDecode(requestHeaders!);
  //     return header;
  //   }
  //   return null;
  // }
  //
  // Map<String, dynamic>? getResponseHeaders() {
  //   if(responseHeaders!=null){
  //     Map<String, dynamic> header = convert.jsonDecode(responseHeaders!);
  //     return header;
  //   }
  //   return null;
  // }
  //
  // Map<String, dynamic>? getExtra() {
  //   if(extra!=null){
  //     Map<String, dynamic> header = convert.jsonDecode(extra!);
  //     return header;
  //   }
  //   return null;
  // }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'host': host,
      'path': path,
      'scheme': scheme,
      'muri': muri?.path,
      'id': id,
      'requestTime': requestTime?.millisecondsSinceEpoch,
      'responseTime': responseTime?.millisecondsSinceEpoch,
      'duration': duration,
      'statusCode': statusCode,
      'redirect': redirect,
      'responseBody': responseBody,
      'responseHeaders': responseHeaders,
      'realUri': realUri?.path,
      'error': error,
      'method': method,
      'followRedirects': followRedirects,
      'responseType': responseType,
      'connectTimeout': connectTimeout,
      'sendTimeout': sendTimeout,
      'receiveTimeout': receiveTimeout,
      'receiveDataWhenStatusError': receiveDataWhenStatusError,
      'requestBody': requestBody,
      'requestHeaders': requestHeaders,
      'extra': extra,
    };
  }

  factory HttpTransaction.fromMap(Map<String, dynamic> map) {
    return HttpTransaction(
      host: map['host'] != null ? map['host'] as String : null,
      path: map['path'] != null ? map['path'] as String : null,
      scheme: map['scheme'] != null ? map['scheme'] as String : null,
      muri: null,
      id: map['id'] != null ? map['id'] as int : null,
      requestTime: map['requestTime'] != null
          ? DateTime.fromMillisecondsSinceEpoch(map['requestTime'] as int)
          : null,
      responseTime: map['responseTime'] != null
          ? DateTime.fromMillisecondsSinceEpoch(map['responseTime'] as int)
          : null,
      duration: map['duration'] != null ? map['duration'] as int : null,
      statusCode: map['statusCode'] != null ? map['statusCode'] as int : null,
      redirect: map['redirect'] != null ? map['redirect'] as bool : null,
      responseBody:
          map['responseBody'] != null ? map['responseBody'] as String : null,
      responseHeaders: null,
      realUri: null,
      method: map['method'] != null ? map['method'] as String : null,
      followRedirects: map['followRedirects'] != null
          ? map['followRedirects'] as bool
          : null,
      responseType:
          map['responseType'] != null ? map['responseType'] as String : null,
      connectTimeout:
          map['connectTimeout'] != null ? map['connectTimeout'] as int : null,
      sendTimeout:
          map['sendTimeout'] != null ? map['sendTimeout'] as int : null,
      receiveTimeout:
          map['receiveTimeout'] != null ? map['receiveTimeout'] as int : null,
      receiveDataWhenStatusError: map['receiveDataWhenStatusError'] != null
          ? map['receiveDataWhenStatusError'] as bool
          : null,
      requestBody:
          map['requestBody'] != null ? map['requestBody'] as String : null,
      requestHeaders: null,
      extra: null,
    );
  }

  String toJson() => jsonEncode(toMap());

  factory HttpTransaction.fromJson(String source) =>
      HttpTransaction.fromMap(jsonDecode(source) as Map<String, dynamic>);

  HttpTransaction copyWith({
    String? host,
    String? path,
    String? scheme,
    Uri? muri,
    int? id,
    DateTime? requestTime,
    DateTime? responseTime,
    int? duration,
    int? statusCode,
    bool? redirect,
    String? responseBody,
    Map<String, dynamic>? responseHeaders,
    Uri? realUri,
    bool? error,
    String? method,
    bool? followRedirects,
    String? responseType,
    int? connectTimeout,
    int? sendTimeout,
    int? receiveTimeout,
    bool? receiveDataWhenStatusError,
    String? requestBody,
    Map<String, dynamic>? requestHeaders,
    Map<String, dynamic>? extra,
  }) {
    return HttpTransaction(
      host: host ?? this.host,
      path: path ?? this.path,
      scheme: scheme ?? this.scheme,
      muri: muri ?? this.muri,
      id: id ?? this.id,
      requestTime: requestTime ?? this.requestTime,
      responseTime: responseTime ?? this.responseTime,
      duration: duration ?? this.duration,
      statusCode: statusCode ?? this.statusCode,
      redirect: redirect ?? this.redirect,
      responseBody: responseBody ?? this.responseBody,
      responseHeaders: responseHeaders ?? this.responseHeaders,
      realUri: realUri ?? this.realUri,
      method: method ?? this.method,
      followRedirects: followRedirects ?? this.followRedirects,
      responseType: responseType ?? this.responseType,
      connectTimeout: connectTimeout ?? this.connectTimeout,
      sendTimeout: sendTimeout ?? this.sendTimeout,
      receiveTimeout: receiveTimeout ?? this.receiveTimeout,
      receiveDataWhenStatusError:
          receiveDataWhenStatusError ?? this.receiveDataWhenStatusError,
      requestBody: requestBody ?? this.requestBody,
      requestHeaders: requestHeaders ?? this.requestHeaders,
      extra: extra ?? this.extra,
    );
  }

  @override
  bool operator ==(covariant HttpTransaction other) {
    if (identical(this, other)) return true;

    return other.host == host &&
        other.path == path &&
        other.scheme == scheme &&
        other.muri == muri &&
        other.id == id &&
        other.requestTime == requestTime &&
        other.responseTime == responseTime &&
        other.duration == duration &&
        other.statusCode == statusCode &&
        other.redirect == redirect &&
        other.responseBody == responseBody &&
        mapEquals(other.responseHeaders, responseHeaders) &&
        other.realUri == realUri &&
        other.error == error &&
        other.method == method &&
        other.followRedirects == followRedirects &&
        other.responseType == responseType &&
        other.connectTimeout == connectTimeout &&
        other.sendTimeout == sendTimeout &&
        other.receiveTimeout == receiveTimeout &&
        other.receiveDataWhenStatusError == receiveDataWhenStatusError &&
        other.requestBody == requestBody &&
        mapEquals(other.requestHeaders, requestHeaders) &&
        mapEquals(other.extra, extra);
  }

  @override
  int get hashCode {
    return host.hashCode ^
        path.hashCode ^
        scheme.hashCode ^
        muri.hashCode ^
        id.hashCode ^
        requestTime.hashCode ^
        responseTime.hashCode ^
        duration.hashCode ^
        statusCode.hashCode ^
        redirect.hashCode ^
        responseBody.hashCode ^
        responseHeaders.hashCode ^
        realUri.hashCode ^
        error.hashCode ^
        method.hashCode ^
        followRedirects.hashCode ^
        responseType.hashCode ^
        connectTimeout.hashCode ^
        sendTimeout.hashCode ^
        receiveTimeout.hashCode ^
        receiveDataWhenStatusError.hashCode ^
        requestBody.hashCode ^
        requestHeaders.hashCode ^
        extra.hashCode;
  }
}
