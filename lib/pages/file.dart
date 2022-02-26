import 'dart:developer';

import '../storage/storage_owncloud.dart';
import 'package:flutter/material.dart';

import '../storage/storage.dart';

class FilePage extends StatefulWidget {
  const FilePage({Key? key}) : super(key: key);

  @override
  State<FilePage> createState() => _FilePageState();
}

class _FilePageState extends State<FilePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        decoration: const BoxDecoration(color: Colors.black),
        child: const Center(),
      ),
    );
  }
}
