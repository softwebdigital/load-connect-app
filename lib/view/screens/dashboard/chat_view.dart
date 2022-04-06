import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:load_connect/shared/colors.dart';
import 'package:load_connect/view/utils/helper.dart';
import 'package:unicons/unicons.dart';

class ChatViewScreen extends StatelessWidget {
  const ChatViewScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leadingWidth: 36.0,
        leading: Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(
              Icons.arrow_back_ios,
            ),
          ),
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Babatunde Doe",
              style: TextStyle(
                fontSize: 16.0,
              ),
            ),
            SizeMargin.size(height: 4.0),
            const Text(
              "5 Loads delivered",
              style: TextStyle(
                fontSize: 12.0,
                fontWeight: FontWeight.w400,
              ),
            )
          ],
        ),
        actions: [
          PopupMenuButton(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(
                  10.0,
                ),
              ),
              itemBuilder: (_) {
                return [
                  const PopupMenuItem(
                    child: Text("Block user"),
                  )
                ];
              })
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              itemCount: 12,
              itemBuilder: (_, index) {
                final type = index % 3 == 0 ? "sender" : "receiver";
                return _ChatViewDetail(
                  message: index % 2 == 0
                      ? "Faucibus non augue mauris morbi nisi et sit rutrum ullamcorper."
                      : "Hi",
                  type: type,
                );
              },
            ),
          ),
          TextField(
            minLines: 1,
            maxLines: 4,
            decoration: InputDecoration(
                filled: true,
                fillColor: const Color(0XFFF2F2F2),
                border: InputBorder.none,
                enabledBorder: InputBorder.none,
                prefixIcon: IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.image,
                    color: AppColor.lightgrey,
                    size: 30.0,
                  ),
                ),
                suffixIcon: InkWell(
                  onTap: () {},
                  child: Container(
                    margin: const EdgeInsets.all(6.0),
                    height: 40.0,
                    width: 40.0,
                    decoration: ShapeDecoration(
                      color: AppColor.darkGreen,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                          20.0,
                        ),
                      ),
                    ),
                    child: const Icon(
                      UniconsLine.message,
                      color: AppColor.white100,
                      size: 20.0,
                    ),
                  ),
                )

                // const CircleAvatar(
                //   backgroundColor: AppColor.darkGreen,
                //   radius: 28.0,
                //   // minRadius: 14.0,
                //   child: Icon(
                //     UniconsLine.message,
                //     color: AppColor.white100,
                //     size: 20.0,
                //   ),
                // ),
                ),
          )
        ],
      ),
    );
  }
}

class _ChatViewDetail extends StatelessWidget {
  const _ChatViewDetail({Key? key, required this.message, required this.type})
      : super(key: key);
  final String message;
  final String type;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 14.0),
      child: Align(
        alignment:
            (type == "receiver" ? Alignment.topLeft : Alignment.topRight),
        child: Container(
          constraints: BoxConstraints(maxWidth: width * 0.7),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            color: type == "receiver"
                ? const Color(0XFFDFDFDF)
                : const Color(0XFF8DDCA4),
          ),
          padding: const EdgeInsets.fromLTRB(10.0, 8.0, 10.0, 6.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                message,
                style: const TextStyle(fontSize: 16.0),
              ),
              SizeMargin.size(height: 2.0),
              Padding(
                padding: const EdgeInsets.only(left: 0.0),
                child: Text(
                  "4:10 pm",
                  style: TextStyle(
                    fontSize: 10.0,
                    color: AppColor.black300.withOpacity(0.5),
                  ),
                  textAlign: TextAlign.right,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
