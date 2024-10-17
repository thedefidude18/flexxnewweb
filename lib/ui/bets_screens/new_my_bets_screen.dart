import 'package:flexx_bet/chat/chat_controller.dart';
import 'package:flexx_bet/chat/widgets/my_groups.dart';
import 'package:flexx_bet/chat/widgets/notifiactionIcon.dart';
import 'package:flexx_bet/ui/profile/widget/EarningWidget.dart';
import 'package:flexx_bet/ui/wallet/widget/confirm_transfer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../chat/widgets/MyEvents.dart';
import '../../constants/colors.dart';
import '../../constants/images.dart';
import '../../controllers/wallet_controller.dart';
import '../notifications_and_bethistory/notifications.dart';
import '../wallet/wallet.dart';

class NewMyBetsScreen extends StatefulWidget {
  const NewMyBetsScreen({super.key});

  @override
  State<NewMyBetsScreen> createState() => _NewMyBetsScreenState();
}

class _NewMyBetsScreenState extends State<NewMyBetsScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController; // Define TabController

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this); // Initialize TabController
  }

  @override
  void dispose() {
    _tabController.dispose(); // Dispose TabController when not needed
    super.dispose();
  }

  String formatCurrency(double amount) {
    if (amount >= 1e9) {
      return '₦${(amount / 1e9).toStringAsFixed(2)}B'; // Billion
    } else if (amount >= 1e6) {
      return '₦${(amount / 1e6).toStringAsFixed(2)}M'; // Million
    } else if (amount >= 1e3) {
      return '₦${(amount / 1e3).toStringAsFixed(2)}K'; // Thousand
    } else {
      return '₦${amount.toStringAsFixed(2)}'; // Less than 1000
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        toolbarHeight: 80,
        title: const Text(
          "My Events",
          style: TextStyle(
            color: Colors.white,
            fontSize: 22,
            fontWeight: FontWeight.w600,
          ),
        ),
        iconTheme: IconThemeData(color: ColorConstant.whiteA700),

        actions: [

          const NotificationIcon(
            defaultType: 'messages',
            iconPaths: {
              'messages': 'assets/images/messagenoti.png',
              'request': 'assets/images/requestnoti.png',
              'Generation': 'assets/images/notification_new.png',
            },
            fallbackIcon: Icons.notifications, // Fallback icon


          ),
          const SizedBox(width: 6),
          GestureDetector(
            onTap: () {
              Get.to(() => WalletScreen());
            },
            child: Container(
              height: 35,
              width: 97,
              margin: const EdgeInsets.only(top: 14, bottom: 14),
              padding: const EdgeInsets.only(left: 18, right: 18),
              decoration: BoxDecoration(
                  color: ColorConstant.whiteA700,
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(50),
                      bottomLeft: Radius.circular(50))),
              child: Center(
                child: GetBuilder<WalletContoller>(builder: (controller) {
                  return Text(
                    formatCurrency(double.parse("${controller.totalAmount}")),
                    style: TextStyle(
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w600,
                        color: ColorConstant.primaryColor),
                  );
                }),
              ),
            ),
          )
        ],
        leading: BackButton(
          onPressed: () {
            Get.back();
          },
        ),
      ),
      body: Column(
        children: [
          Container(
            color: Colors.white, // Set background color of the TabBar
            child: TabBar(
              controller: _tabController,
              indicatorColor: ColorConstant.primaryColor, // Customize indicator color
              labelColor: ColorConstant.primaryColor, // Set selected tab text color
              unselectedLabelColor: ColorConstant.black900C4, // Set unselected tab text color
              tabs: const [
                Tab(text: 'Joined Events'),
                Tab(text: 'My Events'),
                Tab(text:"My Earning"),
              ],
            ),
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: const [
                MyGroups(), // Replace with your Joined Events widget
                MyEvents(), // Replace with your My Events widget
                MyEarnings(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
