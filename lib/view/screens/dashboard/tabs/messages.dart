import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:get/get.dart';
import 'package:unicons/unicons.dart';

import '../../../../shared/colors.dart';
import '../../widgets/notification_icon.dart';
import '../chat_view.dart';

class MessagesTab extends HookWidget {
  const MessagesTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _isSearching = useState(false);
    return NestedScrollView(
        // padding: const EdgeInsets.all(16.0),
        scrollBehavior: const ScrollBehavior().copyWith(overscroll: false),
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return [
            _isSearching.value
                ? SliverAppBar(
                    pinned: true,
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
                              _isSearching.value = !_isSearching.value;
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
                    title: const Text("Messages"),
                    actions: [
                      IconButton(
                        onPressed: () {
                          _isSearching.value = !_isSearching.value;
                        },
                        icon: const Icon(
                          UniconsLine.search,
                        ),
                      ),
                      const NotificationIconWidget(),
                    ],
                  )
          ];
        },
        body: ListView.separated(
          padding: const EdgeInsets.only(top: 16.0),
          itemBuilder: (_, index) {
            return _chatCard(index);
          },
          separatorBuilder: (_, __) => const Divider(),
          itemCount: 5,
        ));
  }

  Widget _chatCard(int index) {
    return ListTile(
      onTap: () {
        Get.to(const ChatViewScreen());
      },
      leading: const CircleAvatar(
        // child: Text("BR"),
        backgroundImage: AssetImage("assets/images/icon.png"),
        radius: 24.0,
      ),
      title: const Padding(
        padding: EdgeInsets.only(bottom: 4.0),
        child: Text(
          "Babatunde Raji",
          style: TextStyle(
            fontSize: 16.0,
            color: Color(0XFF19352A),
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      subtitle: const Text(
        "Netus leo euismod tincidunt hendrerit.",
        style: TextStyle(
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
