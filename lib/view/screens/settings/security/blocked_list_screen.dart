import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class BlockedListScreen extends StatelessWidget {
  const BlockedListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leadingWidth: 36.0,
        leading: Padding(
          padding: const EdgeInsets.only(
            left: 12.0,
          ),
          child: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(Icons.arrow_back_ios),
          ),
        ),
        title: const Text("Blocked List"),
      ),
      body: ListView.separated(
        padding: EdgeInsets.symmetric(
          vertical: 24.0.h,
        ),
        itemCount: 3,
        itemBuilder: (_, index) {
          return ListTile(
            leading: const CircleAvatar(
              // child: Text("BR"),
              backgroundImage: AssetImage("assets/images/icon.png"),
              radius: 24.0,
            ),
            title: const Text(
              'Chris Oyakhilome Oyakhilome',
            ),
            trailing: TextButton(
              onPressed: () {},
              child: const Text(
                "Unblock",
              ),
            ),
          );
        },
        separatorBuilder: (_, __) => const SizedBox(
          height: 16.0,
        ),
      ),
    );
  }
}
