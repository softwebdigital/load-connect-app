import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:load_connect/backend/models/entities/chat_model.dart';
import 'package:load_connect/shared/colors.dart';
import 'package:load_connect/view/providers/chat_provider.dart';
import 'package:load_connect/view/screens/widgets/notification_icon.dart';
import 'package:load_connect/view/screens/widgets/spacer_widget.dart';
import 'package:provider/provider.dart';
import 'package:unicons/unicons.dart';

import '../chat_view.dart';

class MessagesTab extends StatelessWidget {
  const MessagesTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ChatProvider>(context);

    return NestedScrollView(
        // padding: const EdgeInsets.all(16.0),
        scrollBehavior: const ScrollBehavior().copyWith(overscroll: false),
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return [
            provider.isSearching
                ? SliverAppBar(
                    pinned: true,
                    toolbarHeight: kToolbarHeight.h,
                    // toolbarHeight: 80.0,
                    automaticallyImplyLeading: false,
                    backgroundColor: AppColor.white200,
                    title: TextField(
                      autofocus: true,
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.only(
                          top: 14.0,
                        ),
                        hintText: "Start typing to search...",
                        hintStyle: TextStyle(
                          color: Colors.black.withOpacity(0.3),
                        ),
                        prefixIcon: InkWell(
                            onTap: () {
                              // _isSearching.value = !_isSearching.value;
                              provider.toggleSearch();
                            },
                            child: const Icon(Icons.arrow_back_ios)),
                        suffixIcon: IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.close,
                            color: Colors.black.withOpacity(0.3),
                          ),
                        ),
                        enabledBorder: InputBorder.none,
                        focusedBorder: InputBorder.none,
                      ),
                    ),
                  )
                : SliverAppBar(
                    pinned: true,
                    automaticallyImplyLeading: false,
                    toolbarHeight: kToolbarHeight.h,
                    title: const Text("Messages"),
                    actions: [
                      IconButton(
                        onPressed: () {
                          provider.toggleSearch();
                        },
                        icon: const Icon(
                          UniconsLine.search,
                          // size: 24.0.h,
                        ),
                      ),
                      const NotificationIconWidget(),
                    ],
                  )
          ];
        },
        body: provider.isLoading ? const Center(
          child: CircularProgressIndicator.adaptive(),
        ) : provider.isError ? Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("You do not have any message yet."),
            ColumnSpace(10),
            TextButton(onPressed: () => provider.reload(), child: Text("Reload"))
          ],
        ) : ListView.separated(
          padding: const EdgeInsets.only(top: 16.0),
          itemBuilder: (_, index) {
            final chat = provider.chats[index];
            return _chatCard(index, chat);
          },
          separatorBuilder: (_, __) => const Divider(),
          itemCount: provider.chats.length,
        )
    );
  }

  Widget _chatCard(int index, ChatModel chat) {
    return ListTile(
      onTap: () {
        Get.to(ChatViewScreen(
          chat: chat,
        ));
      },
      leading: const CircleAvatar(
        // child: Text("BR"),
        backgroundImage: AssetImage("assets/images/icon.png"),
        radius: 24.0,
      ),
      title: Padding(
        padding: const EdgeInsets.only(bottom: 4.0),
        child: Text(
          "${chat.sentTo!.firstName} ${chat.sentTo!.lastName}",
          style: const TextStyle(
            fontSize: 16.0,
            color: Color(0XFF19352A),
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      subtitle: Text(
        "${chat.message}",
        style: const TextStyle(
          fontSize: 14.0,
          color: AppColor.darkGreen,
        ),
      ),
      trailing: index % 2 == 0
          ? const SizedBox.shrink()
          : const CircleAvatar(
              // backgroundImage: AssetImage("assets/images/icon.png"),
              backgroundColor: Color(0XFF19352A),
              child: Text(
                "2",
                style: TextStyle(fontSize: 12.0),
              ),
              foregroundColor: Colors.white,
              radius: 10.0,
            ),
    );
  }
}
