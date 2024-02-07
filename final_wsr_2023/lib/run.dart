import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'core/app.dart';

Future<void> main() async {
  await Supabase.initialize(
    url: 'https://cfjtdxsfxtqxnymxrowo.supabase.co',
    anonKey: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImNmanRkeHNmeHRxeG55bXhyb3dvIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MDY0MzY5MjMsImV4cCI6MjAyMjAxMjkyM30.b-OTvUEowaQouYgmlWe91uBhlGh4wjmp8OQ6DRRwELg',
  );
  runApp(const MyApp());
}