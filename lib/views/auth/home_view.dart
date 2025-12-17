import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../app/controllers/home_controller.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  final HomeController controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // 🌟 Modern App Bar
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                const Color(0xFF121212).withOpacity(0.95),
                const Color(0xFF121212).withOpacity(0.7),
                Colors.transparent,
              ],
            ),
          ),
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(6),
              decoration: BoxDecoration(
                color: Colors.redAccent.withOpacity(0.2),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                    color: Colors.redAccent.withOpacity(0.4), width: 1),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: const [
                  Icon(Icons.security, color: Colors.redAccent, size: 18),
                  SizedBox(width: 8),
                  Text(
                    'AlertSafe',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w700),
                  ),
                ],
              ),
            )
          ],
        ),
        actions: [
          Stack(
            children: [
              IconButton(
                icon: Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: LinearGradient(
                      colors: [
                        Colors.grey.shade800.withOpacity(0.6),
                        Colors.grey.shade900.withOpacity(0.6),
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    border: Border.all(
                        color: Colors.grey.shade700.withOpacity(0.5), width: 1),
                  ),
                  child: const Icon(Icons.notifications_outlined,
                      color: Colors.white, size: 22),
                ),
                onPressed: () {},
              ),
              Obx(() => Positioned(
                right: 12,
                top: 12,
                child: controller.recentAlerts.isNotEmpty
                    ? Container(
                  width: 12,
                  height: 12,
                  decoration: const BoxDecoration(
                      color: Colors.redAccent,
                      shape: BoxShape.circle),
                )
                    : const SizedBox(),
              )),
            ],
          ),
          const SizedBox(width: 8),
        ],
      ),

      // 🎨 Body
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFF0A0A0A),
              Color(0xFF121212),
              Color(0xFF0A0A0A),
            ],
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            padding: const EdgeInsets.only(bottom: 100),
            child: Column(
              children: [
                const SizedBox(height: 20),

                // 👤 Profile Card
                Obx(
                      () => Container(
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          Colors.grey.shade900.withOpacity(0.7),
                          Colors.grey.shade800.withOpacity(0.5),
                        ],
                      ),
                      borderRadius: BorderRadius.circular(24),
                      border: Border.all(
                          color: Colors.grey.shade800.withOpacity(0.6), width: 1.5),
                    ),
                    child: Row(
                      children: [
                        Container(
                          width: 70,
                          height: 70,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            gradient: LinearGradient(
                              colors: [
                                Colors.blueAccent.withOpacity(0.9),
                                Colors.blue.shade800.withOpacity(0.9),
                              ],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            ),
                          ),
                          child: const Icon(Icons.person_outline,
                              size: 32, color: Colors.white),
                        ),
                        const SizedBox(width: 20),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                controller.userName.value,
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 22,
                                    fontWeight: FontWeight.w700),
                              ),
                              const SizedBox(height: 8),
                              Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 16, vertical: 8),
                                decoration: BoxDecoration(
                                  gradient: controller.isAlertActive.value
                                      ? const LinearGradient(
                                    colors: [Color(0xFFFF5252), Color(0xFFD32F2F)],
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight,
                                  )
                                      : LinearGradient(
                                    colors: [
                                      Colors.greenAccent.withOpacity(0.9),
                                      Colors.green.shade800.withOpacity(0.9),
                                    ],
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight,
                                  ),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Text(
                                  controller.isAlertActive.value
                                      ? 'EMERGENCY ACTIVE'
                                      : 'ALL SAFE',
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w700),
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),

                const SizedBox(height: 40),

                // 🔴 SOS Button
                Obx(() {
                  bool isActive = controller.isAlertActive.value;
                  bool isSending = controller.isSendingSOS.value;

                  return GestureDetector(
                    onTap: isSending ? null : controller.triggerSOS,
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      width: isActive ? 200 : 180,
                      height: isActive ? 200 : 180,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: isActive
                            ? const LinearGradient(
                          colors: [Color(0xFFFF5252), Color(0xFFD32F2F)],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        )
                            : RadialGradient(
                          colors: [
                            Colors.redAccent.withOpacity(0.8),
                            Colors.red.shade900,
                            Colors.red.shade900.withOpacity(0.9),
                          ],
                          stops: const [0.1, 0.7, 1.0],
                        ),
                      ),
                      child: Center(
                        child: isSending
                            ? const CircularProgressIndicator(
                          color: Colors.white,
                        )
                            : const Icon(Icons.emergency, size: 60, color: Colors.white),
                      ),
                    ),
                  );
                }),

                const SizedBox(height: 40),

                // ⚡ Quick Actions
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: GridView.count(
                    crossAxisCount: 4,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                    children: [
                      _ModernActionTile(
                          icon: Icons.location_pin,
                          title: 'Share\nLocation',
                          color: Colors.blueAccent,
                          isPrimary: true,
                          onTap: controller.shareLocation),
                      _ModernActionTile(
                          icon: Icons.contacts,
                          title: 'Emergency\nContacts',
                          color: Colors.greenAccent,
                          isPrimary: true,
                          onTap: () {}),
                      _ModernActionTile(
                          icon: Icons.video_call,
                          title: 'Video\nSOS',
                          color: Colors.purpleAccent,
                          isPrimary: true,
                          onTap: () {}),
                      _ModernActionTile(
                          icon: Icons.medical_services,
                          title: 'Medical\nInfo',
                          color: Colors.orangeAccent,
                          isPrimary: true,
                          onTap: () {}),
                    ],
                  ),
                ),

                const SizedBox(height: 40),

                // 📊 Status Cards
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            color: Colors.blueAccent.withOpacity(0.15),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Icon(Icons.security, color: Colors.blueAccent, size: 24),
                              SizedBox(height: 12),
                              Text('24/7 Active',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w700)),
                              SizedBox(height: 4),
                              Text('Always monitoring',
                                  style: TextStyle(color: Colors.grey))
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            color: Colors.greenAccent.withOpacity(0.15),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Icon(Icons.location_on,
                                  color: Colors.greenAccent, size: 24),
                              SizedBox(height: 12),
                              Text('GPS Active',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w700)),
                              SizedBox(height: 4),
                              Text('Real-time tracking',
                                  style: TextStyle(color: Colors.grey))
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// 🎨 Action Tile Widget
class _ModernActionTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final Color color;
  final bool isPrimary;
  final VoidCallback onTap;

  const _ModernActionTile(
      {required this.icon,
        required this.title,
        required this.color,
        required this.isPrimary,
        required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          gradient: isPrimary
              ? LinearGradient(
              colors: [color.withOpacity(0.15), color.withOpacity(0.05)])
              : LinearGradient(colors: [
            Colors.grey.shade900.withOpacity(0.6),
            Colors.grey.shade800.withOpacity(0.4)
          ]),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 28, color: Colors.white),
            const SizedBox(height: 8),
            Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(color: Colors.white, fontSize: 12),
            ),
          ],
        ),
      ),
    );
  }
}
