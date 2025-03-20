import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:portfolio/helpers/widgets/default_alert_dialog.dart';

class ContactRepo {
  Future<bool> sendEmail({
    required BuildContext context,
    required String name,
    required String email,
    required String subject,
    required String message,
}) async{
    try {
      Uri uri = Uri.parse("https://api.emailjs.com/api/v1.0/email/send");

      Response response = await post(
          uri,

          headers: {
            "Content-Type": "application/json"
          },

          body: json.encode({
            "service_id": "service_iqgzwgs",
            "template_id": "template_q2486l9",
            "user_id": "1Xv4blqQNHX1YdsSi",
            "template_params": {
              "name": name,
              "email": email,
              "subject": subject,
              "message": message
            },
          })
      );

      if(response.statusCode >= 200 && response.statusCode < 300) {
        if (context.mounted) {
          showDialog(context: context, builder: (context) => DefaultAlertDialog(
              context: context, title: "Success", description: "Email sent successfully"));
        }
        return true;
      }
      else {
        if (context.mounted) {
          showDialog(context: context, builder: (context) => DefaultAlertDialog(
              context: context, title: "Error", description: "Something went wrong. Please, try again later."));
        }
        return false;
      }
    }
    catch (_) {
      if (context.mounted) {
        showDialog(context: context, builder: (context) => DefaultAlertDialog(
            context: context, title: "Error", description: "Something went wrong. Please, try again later."));
      }
      return false;
    }
  }
}