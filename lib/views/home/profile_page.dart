import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:ggchat/views/home/edit_page.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const double boxHeight = 64; // 统一高度
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 顶部栏
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const SizedBox(width: 32), // 占位
                const Text('个人中心', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white)),
                IconButton(
                  icon: const Icon(Icons.edit, color: Colors.white, size: 28),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => const EditPage()),
                    );
                  },
                ),
              ],
            ),
          ),
          // 头像+昵称+VIP+ID
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 44,
                  backgroundImage: NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRw-omd2kdgDhia52UHUrhBDl6XeSqnEy1mNA&s'),
                  backgroundColor: Colors.grey[200],
                ),
                const SizedBox(width: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const Text('小明', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white)),
                        const SizedBox(width: 8),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            gradient: const LinearGradient(
                              colors: [Color(0xFFFFD700), Color(0xFFB8C6FF)],
                            ),
                          ),
                          child: const Text('Vip10', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.white)),
                        ),
                      ],
                    ),
                    const SizedBox(height: 6),
                    Row(
                      children: [
                        const Text('ID: 12345678', style: TextStyle(fontSize: 15, color: Colors.white)),
                        const SizedBox(width: 8),
                        GestureDetector(
                          onTap: () {
                            // TODO: 复制ID逻辑
                          },
                          child: const Text('复制', style: TextStyle(fontSize: 15, color: Colors.white, decoration: TextDecoration.underline)),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 18),
          // 钻石+会员中心
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Row(
              children: [
                // 钻石毛玻璃
                Expanded(
                  child: SizedBox(
                    height: boxHeight,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(18),
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 12, sigmaY: 12),
                        child: Container(
                          decoration: BoxDecoration(
                            gradient: const LinearGradient(
                              colors: [Color(0x80FFD700), Color(0x40B8C6FF)],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            ),
                            borderRadius: BorderRadius.circular(18),
                            border: Border.all(color: Colors.white.withOpacity(0.15)),
                          ),
                          padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 24),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Icon(Icons.diamond, color: Colors.blueAccent, size: 32),
                              SizedBox(width: 8),
                              Text('钻石', style: TextStyle(fontSize: 15, color: Colors.white)),
                              SizedBox(width: 8),
                              Text('66', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white)),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                // 会员中心毛玻璃
                Expanded(
                  child: SizedBox(
                    height: boxHeight,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(18),
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 12, sigmaY: 12),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.grey[900]?.withOpacity(0.7),
                            borderRadius: BorderRadius.circular(18),
                            border: Border.all(color: Colors.white.withOpacity(0.10)),
                          ),
                          padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 12),
                          child: const Center(
                            child: Text('开通立享10+ 特权', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.amber)),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 18),
          // 任务商城背包大毛玻璃
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(18),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 12, sigmaY: 12),
                child: Container(
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [Color(0x40B8C6FF), Color(0x20FFFFFF)],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.circular(18),
                    border: Border.all(color: Colors.white.withOpacity(0.10)),
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 12),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: const [
                      Icon(Icons.assignment, color: Colors.white, size: 28),
                      Text('任务', style: TextStyle(fontSize: 16, color: Colors.white)),
                      SizedBox(width: 18),
                      Icon(Icons.store, color: Colors.white, size: 28),
                      Text('商城', style: TextStyle(fontSize: 16, color: Colors.white)),
                      SizedBox(width: 18),
                      Icon(Icons.backpack, color: Colors.white, size: 28),
                      Text('背包', style: TextStyle(fontSize: 16, color: Colors.white)),
                    ],
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 18),
          // 访客、黑名单、设置
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              children: [
                ListTile(
                  leading: const Icon(Icons.visibility, color: Colors.white),
                  title: const Text('访客', style: TextStyle(fontSize: 17, color: Colors.white)),
                  trailing: const Icon(Icons.chevron_right, color: Colors.white),
                  onTap: () {},
                ),
                ListTile(
                  leading: const Icon(Icons.block, color: Colors.white),
                  title: const Text('黑名单', style: TextStyle(fontSize: 17, color: Colors.white)),
                  trailing: const Icon(Icons.chevron_right, color: Colors.white),
                  onTap: () {},
                ),
                ListTile(
                  leading: const Icon(Icons.settings, color: Colors.white),
                  title: const Text('设置', style: TextStyle(fontSize: 17, color: Colors.white)),
                  trailing: const Icon(Icons.chevron_right, color: Colors.white),
                  onTap: () {},
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
} 