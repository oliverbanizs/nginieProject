import 'package:flutter/material.dart';
//colors
const primaryColor = Color(0xFF1C98E5);
const secondaryColor = Color(0xFFFFFFFF);
const contentColorLightTheme = Color(0xFF1D1D35);
const contentColorDarkTheme = Color(0xFFE5E8E8);
const warningColor = Color(0xFFF3BB1C);
const errorColor = Color(0xFFF03738);
const defaultPadding = 16.0;
//exceptions
const SUCCESS = 200;
const INVALID_RESPONSE = 100;
const NO_INTERNET = 101;
const INVALID_FORMAT = 102;
const UNKNOWN_ERROR = 103;
//api
const baseUrl = "http://olivers-macbook.local:8080/flutter_mysql";
//api endpoints
const fetchInboxData = "/fetch_messages.php";
const fetchActivityData = "/fetch_activity.php";
const fetchDocsData = "/fetch_docs.php";
const fetchProcedureData = "/fetch_procedures.php";

