import 'package:flutter/material.dart';

class DynamicPage extends StatefulWidget {
  const DynamicPage({Key? key}) : super(key: key);

  @override
  State<DynamicPage> createState() => _DynamicPageState();
}

class _DynamicPageState extends State<DynamicPage> {
  int tabIndex = 1; // 0:星友圈 1:广场
  int navIndex = 2; // 0:星空 1:酒馆 2:动态 3:消息 4:我的

  final List<Map<String, dynamic>> posts = [
    {
      'avatar': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSYl-KPvUQnEA_gBid3jY5uBLFNolLCjnbhxw&s',
      'name': '小∞',
      'gender': 'female',
      'time': '4分钟前',
      'content': '满嘴喷屎的人仔细看我动态的评论',
      'contentColor': Color(0xFFFFAEBF),
      'like': 0,
      'comment': 0,
      'gift': 0,
      'followed': false,
    },
    {
      'avatar': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSYl-KPvUQnEA_gBid3jY5uBLFNolLCjnbhxw&s',
      'name': '睡懒',
      'gender': 'female',
      'time': '5分钟前',
      'content': '我喜欢温柔叔叔款的霸道引导型强势男人，谢谢',
      'contentColor': Colors.white,
      'like': 2,
      'comment': 0,
      'gift': 0,
      'followed': false,
    },
    {
      'avatar': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSYl-KPvUQnEA_gBid3jY5uBLFNolLCjnbhxw&s',
      'name': '南瓜',
      'gender': 'male',
      'time': '4分钟前',
      'content': '为什么都是高跟鞋 你们不喜欢穿粗跟吗',
      'contentColor': Colors.white,
      'like': 0,
      'comment': 0,
      'gift': 0,
      'followed': false,
    },
    {
      'avatar': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSYl-KPvUQnEA_gBid3jY5uBLFNolLCjnbhxw&s',
      'name': 'sdsnt',
      'gender': 'female',
      'time': '5分钟前',
      'content': '今晚的雨下的好大啊\n就像刚考完试的我 内心的痛苦倾盆而出\n雨在水中生花 我在又中咆哮\n期末将至 无所谓事事\n唯愿前路坦荡 星光闪烁',
      'contentColor': Colors.white,
      'like': 0,
      'comment': 0,
      'gift': 0,
      'followed': false,
    },
    {
      'avatar': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSYl-KPvUQnEA_gBid3jY5uBLFNolLCjnbhxw&s',
      'name': '寒风萧瑟',
      'gender': 'female',
      'time': '2分钟前',
      'content': '新的一天，新的开始！',
      'contentColor': Colors.white,
      'like': 1,
      'comment': 1,
      'gift': 0,
      'followed': false,
    },
  ];

  Widget genderIcon(String gender) {
    return gender == 'male'
        ? const Icon(Icons.male, color: Color(0xFF6DB6FF), size: 20)
        : const Icon(Icons.female, color: Color(0xFFFF6DB6), size: 20);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF181922),
      body: SafeArea(
        child: Column(
          children: [
            // 顶部Tab
            Padding(
              padding: const EdgeInsets.only(top: 8, bottom: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () => setState(() => tabIndex = 0),
                    child: Text(
                      '星友圈',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: tabIndex == 0 ? FontWeight.bold : FontWeight.normal,
                        color: tabIndex == 0 ? Colors.white : Colors.white54,
                      ),
                    ),
                  ),
                  const SizedBox(width: 40),
                  GestureDetector(
                    onTap: () => setState(() => tabIndex = 1),
                    child: Text(
                      '广场',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: tabIndex == 1 ? FontWeight.bold : FontWeight.normal,
                        color: tabIndex == 1 ? Colors.white : Colors.white54,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // 动态列表
            Expanded(
              child: ListView.separated(
                padding: const EdgeInsets.only(top: 0, left: 0, right: 0, bottom: 12),
                itemCount: posts.length,
                separatorBuilder: (_, __) => const Divider(height: 1, color: Color(0xFF23243A)),
                itemBuilder: (context, i) {
                  final p = posts[i];
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                    child: Container(
                      color: Colors.transparent,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CircleAvatar(
                              radius: 32,
                              backgroundImage: NetworkImage(p['avatar']),
                            ),
                            const SizedBox(width: 16),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        p['name'],
                                        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
                                      ),
                                      const SizedBox(width: 6),
                                      genderIcon(p['gender']),
                                      const SizedBox(width: 10),
                                      Text(
                                        p['time'],
                                        style: const TextStyle(fontSize: 15, color: Colors.white54),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 8),
                                  Text(
                                    p['content'],
                                    style: TextStyle(fontSize: 17, color: p['contentColor'], height: 1.4),
                                    maxLines: 3,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  const SizedBox(height: 14),
                                  Row(
                                    children: [
                                      Icon(Icons.favorite_border, color: Colors.white54, size: 26),
                                      const SizedBox(width: 4),
                                      Text('${p['like']}', style: const TextStyle(color: Colors.white54, fontSize: 16)),
                                      const SizedBox(width: 24),
                                      Icon(Icons.mode_comment_outlined, color: Colors.white54, size: 26),
                                      const SizedBox(width: 4),
                                      Text('${p['comment']}', style: const TextStyle(color: Colors.white54, fontSize: 16)),
                                      const SizedBox(width: 24),
                                      Icon(Icons.card_giftcard, color: Colors.white54, size: 26),
                                      const SizedBox(width: 4),
                                      Text('${p['gift']}', style: const TextStyle(color: Colors.white54, fontSize: 16)),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(width: 16),
                            Container(
                              decoration: BoxDecoration(
                                color: const Color(0x22232A3A),
                                borderRadius: BorderRadius.circular(14),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                                child: Text(
                                  p['followed'] ? '已关注' : '关注',
                                  style: const TextStyle(color: Colors.white, fontSize: 17),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: const Color(0xFFFF4D6A),
        onPressed: () {},
        icon: const Icon(Icons.edit, color: Colors.white),
        label: const Text('发一条', style: TextStyle(color: Colors.white, fontSize: 16)),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
    );
  }

  Widget _buildNavItem(IconData icon, String label, int idx, {bool highlight = false}) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, color: highlight ? Colors.white : Colors.white54, size: 28),
        const SizedBox(height: 2),
        Text(
          label,
          style: TextStyle(
            color: highlight ? Colors.white : Colors.white54,
            fontSize: 13,
            fontWeight: highlight ? FontWeight.bold : FontWeight.normal,
          ),
        ),
      ],
    );
  }
} 