import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:load_connect/view/providers/blocked_user_provider.dart';
import 'package:provider/provider.dart';

class BlockedListScreen extends StatelessWidget {
  const BlockedListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<BlockedUserProvider>(context);
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
      body: (provider.isLoading) ? const Center(
        child: CircularProgressIndicator(),
    ) : (provider.isError) ? Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(provider.message, textAlign: TextAlign.center),
          SizedBox(height: 10.h,),
          TextButton(onPressed: () => provider.refresh(), child: const Text("Retry"))
        ],
      ) : (provider.blockedUsers.isEmpty) ? Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Text("You have not blocked any user", textAlign: TextAlign.center),
          SizedBox(height: 10.h,),
          TextButton(onPressed: () => provider.refresh(), child: const Text("Refresh"))
        ]
      ): ListView.separated(
        padding: EdgeInsets.symmetric(
          vertical: 24.0.h,
        ),
        itemCount: provider.blockedUsers.length,
        itemBuilder: (_, index) {
          final bU = provider.blockedUsers[index];
          return ListTile(
            leading: CircleAvatar(
              // child: Text("BR"),
              backgroundImage: NetworkImage(bU.blockeduser!.profilePhoto),
              radius: 24.0,
            ),
            title: Text(
              '${bU.blockeduser!.firstName} ${bU.blockeduser!.lastName}',
            ),
            trailing: TextButton(
              onPressed: () => provider.unBlockUser(context, bU.id!),
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
