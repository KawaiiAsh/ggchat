import 'package:flutter/material.dart';

class HotPage extends StatefulWidget {
  const HotPage({Key? key}) : super(key: key);

  @override
  State<HotPage> createState() => _HotPageState();
}

class _HotPageState extends State<HotPage> {
  int tabIndex = 0;
  final PageController _pageController = PageController();

  final List<Map<String, String>> rooms = List.generate(10, (i) => {
    'avatar': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSYl-KPvUQnEA_gBid3jY5uBLFNolLCjnbhxw&s',
    'name': '房间${i+1}',
    'owner': '房主${i+1}',
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFF161824),
      child: Column(
        children: [
          const SizedBox(height: 56), // 保持顶部Tab适配刘海屏
          // 顶部Tab
          Center(
            child: Container(
              width: 260,
              padding: const EdgeInsets.symmetric(vertical: 0), // 去除多余高度
              decoration: BoxDecoration(
                color: const Color(0xFF23243A),
                borderRadius: BorderRadius.circular(22),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildTab('房间排行', 0),
                  _buildTab('人气排行', 1),
                ],
              ),
            ),
          ),
          const SizedBox(height: 1), // 缩小Tab和房间列表间距
          // PageView内容
          Expanded(
            child: PageView(
              controller: _pageController,
              onPageChanged: (i) => setState(() => tabIndex = i),
              children: [
                // 房间排行页
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 12),
                  child: GridView.builder(
                    itemCount: rooms.length,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 18,
                      crossAxisSpacing: 18,
                      childAspectRatio: 0.95,
                    ),
                    itemBuilder: (context, i) {
                      final r = rooms[i];
                      return ClipRRect(
                        borderRadius: BorderRadius.circular(18),
                        child: Stack(
                          children: [
                            // 图片全铺满
                            Positioned.fill(
                              child: Image.network(
                                r['avatar']!,
                                fit: BoxFit.cover,
                              ),
                            ),
                            // 下方半透明文字背景
                            Positioned(
                              left: 0,
                              right: 0,
                              bottom: 0,
                              child: Container(
                                padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                                decoration: BoxDecoration(
                                  color: Colors.black.withOpacity(0.45),
                                  borderRadius: const BorderRadius.only(
                                    bottomLeft: Radius.circular(18),
                                    bottomRight: Radius.circular(18),
                                  ),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                      r['name']!,
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        shadows: [Shadow(color: Colors.black54, blurRadius: 2)],
                                      ),
                                    ),
                                    const SizedBox(height: 2),
                                    Text(
                                      r['owner']!,
                                      style: const TextStyle(
                                        color: Colors.white70,
                                        fontSize: 13,
                                        fontWeight: FontWeight.normal,
                                        shadows: [Shadow(color: Colors.black45, blurRadius: 1)],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
                // 人气排行页
                const Center(
                  child: Text('这里是人气排行页面', style: TextStyle(color: Colors.white70, fontSize: 18)),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTab(String text, int idx) {
    final selected = tabIndex == idx;
    return Expanded(
      child: GestureDetector(
        onTap: () {
          setState(() => tabIndex = idx);
          _pageController.animateToPage(idx, duration: const Duration(milliseconds: 300), curve: Curves.ease);
        },
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 12),
          decoration: BoxDecoration(
            color: selected ? const Color(0xFF6D5BFF) : Colors.transparent,
            borderRadius: BorderRadius.circular(22),
          ),
          alignment: Alignment.center,
          child: Text(
            text,
            style: TextStyle(
              color: selected ? Colors.white : Colors.white54,
              fontSize: 16,
              fontWeight: selected ? FontWeight.bold : FontWeight.normal,
            ),
          ),
        ),
      ),
    );
  }
} 