import 'package:flutter/material.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({Key? key}) : super(key: key);

  final List<Map<String, String>> friends = const [
    {'name': '小美', 'msg': '你好，小帅哥', 'avatar': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRw-omd2kdgDhia52UHUrhBDl6XeSqnEy1mNA&s', 'time': '12:01'},
    {'name': '阿狸', 'msg': '你好，小帅哥', 'avatar': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRw-omd2kdgDhia52UHUrhBDl6XeSqnEy1mNA&s', 'time': '11:58'},
    {'name': '小明', 'msg': '你好，小帅哥', 'avatar': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRw-omd2kdgDhia52UHUrhBDl6XeSqnEy1mNA&s', 'time': '11:55'},
    {'name': '小红', 'msg': '你好，小帅哥', 'avatar': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRw-omd2kdgDhia52UHUrhBDl6XeSqnEy1mNA&s', 'time': '11:50'},
    {'name': '小蓝', 'msg': '你好，小帅哥', 'avatar': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRw-omd2kdgDhia52UHUrhBDl6XeSqnEy1mNA&s', 'time': '11:45'},
    {'name': '小绿', 'msg': '你好，小帅哥', 'avatar': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRw-omd2kdgDhia52UHUrhBDl6XeSqnEy1mNA&s', 'time': '11:40'},
    {'name': '小紫', 'msg': '你好，小帅哥', 'avatar': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRw-omd2kdgDhia52UHUrhBDl6XeSqnEy1mNA&s', 'time': '11:35'},
    {'name': '小黄', 'msg': '你好，小帅哥', 'avatar': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRw-omd2kdgDhia52UHUrhBDl6XeSqnEy1mNA&s', 'time': '11:30'},
    {'name': '小黑', 'msg': '你好，小帅哥', 'avatar': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRw-omd2kdgDhia52UHUrhBDl6XeSqnEy1mNA&s', 'time': '11:25'},
    {'name': '小白', 'msg': '你好，小帅哥', 'avatar': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRw-omd2kdgDhia52UHUrhBDl6XeSqnEy1mNA&s', 'time': '11:20'},
  ];

  Future<void> _onRefresh() async {
    await Future.delayed(const Duration(seconds: 1));
    // TODO: 刷新逻辑
  }

  @override
  Widget build(BuildContext context) {
    final double itemHeight = MediaQuery.of(context).size.height / 9;
    return Container(
      color: const Color(0xFF161824),
      child: SafeArea(
        child: Column(
          children: [
            // 顶部栏
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('消息', style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold, color: Colors.white)),
                  Row(
                    children: [
                      IconButton(
                        icon: Icon(Icons.cleaning_services, color: Colors.white, size: 28),
                        tooltip: '清理全部已读消息',
                        onPressed: () {
                          // TODO: 清理全部已读消息逻辑
                        },
                      ),
                      IconButton(
                        icon: Icon(Icons.group, color: Colors.grey[300], size: 32),
                        tooltip: '好友',
                        onPressed: () {},
                      ),
                    ],
                  ),
                ],
              ),
            ),
            // 聊天列表
            Expanded(
              child: RefreshIndicator(
                onRefresh: _onRefresh,
                child: ListView.builder(
                  itemCount: friends.length > 9 ? 9 : friends.length,
                  itemBuilder: (context, i) {
                    final f = friends[i];
                    return SizedBox(
                      height: itemHeight,
                      child: Dismissible(
                        key: Key(f['name']!),
                        direction: DismissDirection.endToStart,
                        background: Container(
                          alignment: Alignment.centerRight,
                          color: Colors.redAccent,
                          padding: const EdgeInsets.symmetric(horizontal: 32),
                          child: const Icon(Icons.delete, color: Colors.white, size: 32),
                        ),
                        onDismissed: (direction) {
                          // TODO: 删除逻辑
                        },
                        child: ListTile(
                          contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
                          leading: CircleAvatar(
                            backgroundImage: NetworkImage(f['avatar']!),
                            radius: 34,
                          ),
                          title: Text(
                            f['name']!,
                            style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 22),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          subtitle: Text(
                            f['msg']!,
                            style: const TextStyle(color: Colors.white70, fontSize: 16),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          trailing: Text(
                            f['time'] ?? '--:--',
                            style: const TextStyle(color: Colors.white70, fontSize: 15),
                          ),
                          onTap: () {},
                          tileColor: Colors.transparent,
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class StarBackgroundPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = Colors.white.withOpacity(0.8);
    final random = [
      [0.1, 0.1, 2.0], [0.3, 0.2, 1.2], [0.7, 0.15, 1.5], [0.5, 0.3, 1.0],
      [0.8, 0.4, 1.8], [0.2, 0.5, 1.3], [0.6, 0.6, 1.7], [0.9, 0.7, 1.1],
      [0.4, 0.8, 1.4], [0.15, 0.9, 1.6], [0.75, 0.85, 1.2], [0.55, 0.75, 1.9],
      [0.35, 0.65, 1.1], [0.95, 0.55, 1.5], [0.85, 0.25, 1.3], [0.25, 0.35, 1.7],
    ];
    canvas.drawRect(Offset.zero & size, Paint()..color = Colors.black);
    for (var s in random) {
      canvas.drawCircle(Offset(size.width * s[0], size.height * s[1]), s[2], paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
} 