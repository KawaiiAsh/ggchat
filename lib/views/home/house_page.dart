import 'package:flutter/material.dart';

const List<String> navTabs = [
  '关注', '热门', '交友', '游戏', '音乐', 'FN', '娱乐', '学习', '运动', '美食', '旅游', '其他'
];

class HousePage extends StatefulWidget {
  const HousePage({Key? key}) : super(key: key);

  @override
  State<HousePage> createState() => _HousePageState();
}

class _HousePageState extends State<HousePage> {
  int tabIndex = 1; // 默认选中"热门"

  final List<Map<String, String>> banners = const [
    {'title': '充值活动', 'desc': '限时充值返利，快来参与！', 'color': '0xFF7C4DFF'},
    {'title': '礼物活动', 'desc': '送礼物赢好礼', 'color': '0xFF46C8FC'},
    {'title': '大学生认证', 'desc': '认证享专属特权', 'color': '0xFFFFA726'},
  ];

  final List<Map<String, dynamic>> rooms = List.generate(20, (i) => {
    'avatar': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSYl-KPvUQnEA_gBid3jY5uBLFNolLCjnbhxw&s',
    'name': '房间名${i+1}',
    'tag': i % 2 == 0 ? '方块大师' : '生日',
    'desc': i % 2 == 0 ? 'EL' : '"答案"',
    'gender': i % 3 == 0 ? 'male' : 'female',
    'status': i % 4 == 0 ? '正在召集' : '',
    'count': 5 + i,
    'owner': i % 2 == 0 ? 'EL' : '欣欣',
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        color: const Color(0xFF161824),
        child: Column(
          children: [
            const SizedBox(height: 18),
            // 搜索框+活动+创建
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  // 搜索框
                  Expanded(
                    child: Container(
                      height: 44,
                      decoration: BoxDecoration(
                        color: const Color(0xFF23243A),
                        borderRadius: BorderRadius.circular(22),
                      ),
                      child: Row(
                        children: const [
                          SizedBox(width: 12),
                          Icon(Icons.search, color: Colors.white38, size: 22),
                          SizedBox(width: 6),
                          Expanded(
                            child: Text(
                              '搜索星空ID或房号',
                              style: TextStyle(color: Colors.white38, fontSize: 16),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  // 活动框
                  Container(
                    height: 44,
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                      color: const Color(0xFF7C4DFF),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Row(
                      children: const [
                        Icon(Icons.local_activity, color: Colors.white, size: 22),
                        SizedBox(width: 4),
                        Text('活动', style: TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.w500)),
                      ],
                    ),
                  ),
                  const SizedBox(width: 8),
                  // 创建房间
                  Container(
                    height: 44,
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                      color: const Color(0xFF7C4DFF),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Row(
                      children: const [
                        Icon(Icons.add_box, color: Colors.white, size: 22),
                        SizedBox(width: 4),
                        Text('创建', style: TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.w500)),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 18),
            // 公告栏轮播图
            SizedBox(
              height: 90,
              child: PageView.builder(
                controller: PageController(viewportFraction: 0.88),
                itemCount: banners.length,
                itemBuilder: (context, i) {
                  final b = banners[i];
                  return Container(
                    margin: const EdgeInsets.symmetric(horizontal: 8),
                    decoration: BoxDecoration(
                      color: Color(int.parse(b['color']!)),
                      borderRadius: BorderRadius.circular(18),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(b['title']!, style: const TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
                          const SizedBox(height: 8),
                          Text(b['desc']!, style: const TextStyle(color: Colors.white70, fontSize: 14)),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 18),
            // 横向Tab栏
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 0),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: List.generate(navTabs.length, (i) {
                    final selected = i == tabIndex;
                    return GestureDetector(
                      onTap: () => setState(() => tabIndex = i),
                      child: Padding(
                        padding: EdgeInsets.only(left: i == 0 ? 16 : 0, right: 24),
                        child: Text(
                          navTabs[i],
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: selected ? FontWeight.bold : FontWeight.normal,
                            color: selected ? Colors.white : Colors.white54,
                          ),
                        ),
                      ),
                    );
                  }),
                ),
              ),
            ),
            const SizedBox(height: 10),
            // 房间列表
            Expanded(
              child: ListView.separated(
                padding: const EdgeInsets.only(top: 0, left: 0, right: 0, bottom: 0),
                itemCount: rooms.length,
                separatorBuilder: (_, __) => const Divider(height: 1, color: Color(0xFF23243A)),
                itemBuilder: (context, i) {
                  final r = rooms[i];
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                    child: Container(
                      color: Colors.transparent,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(12),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(12),
                              child: Image.network(
                                r['avatar'],
                                width: 64,
                                height: 64,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(top: 14, bottom: 14, right: 12),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        r['name'],
                                        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
                                      ),
                                      const SizedBox(width: 8),
                                      if (r['tag'] != null && r['tag'].toString().isNotEmpty)
                                        Container(
                                          padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                                          decoration: BoxDecoration(
                                            color: const Color(0xFF23243A),
                                            borderRadius: BorderRadius.circular(8),
                                          ),
                                          child: Text(
                                            r['tag'],
                                            style: const TextStyle(fontSize: 13, color: Color(0xFFFFD700)),
                                          ),
                                        ),
                                    ],
                                  ),
                                  const SizedBox(height: 6),
                                  Row(
                                    children: [
                                      if (r['desc'] != null && r['desc'].toString().isNotEmpty)
                                        Text(
                                          r['desc'],
                                          style: const TextStyle(fontSize: 14, color: Colors.white70),
                                        ),
                                      if (r['gender'] == 'male')
                                        const Padding(
                                          padding: EdgeInsets.only(left: 8),
                                          child: Icon(Icons.male, color: Color(0xFF6DB6FF), size: 18),
                                        ),
                                      if (r['gender'] == 'female')
                                        const Padding(
                                          padding: EdgeInsets.only(left: 8),
                                          child: Icon(Icons.female, color: Color(0xFFFF6DB6), size: 18),
                                        ),
                                    ],
                                  ),
                                  const SizedBox(height: 6),
                                  Row(
                                    children: [
                                      if (r['status'] != null && r['status'].toString().isNotEmpty)
                                        Container(
                                          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                                          decoration: BoxDecoration(
                                            color: Colors.amber.withOpacity(0.15),
                                            borderRadius: BorderRadius.circular(8),
                                          ),
                                          child: Row(
                                            children: const [
                                              Icon(Icons.warning_amber_rounded, color: Colors.amber, size: 16),
                                              SizedBox(width: 4),
                                              Text('正在召集', style: TextStyle(fontSize: 13, color: Colors.amber)),
                                            ],
                                          ),
                                        ),
                                      const Spacer(),
                                      Icon(Icons.graphic_eq, color: Colors.white38, size: 18),
                                      const SizedBox(width: 2),
                                      Text('${r['count']}', style: const TextStyle(color: Colors.white38, fontSize: 15)),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
} 