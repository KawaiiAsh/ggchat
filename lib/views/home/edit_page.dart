import 'package:flutter/material.dart';

class EditPage extends StatefulWidget {
  const EditPage({Key? key}) : super(key: key);

  @override
  State<EditPage> createState() => _EditPageState();
}

class _EditPageState extends State<EditPage> {
  String avatarUrl = 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRw-omd2kdgDhia52UHUrhBDl6XeSqnEy1mNA&s';
  final TextEditingController nameController = TextEditingController();
  final TextEditingController signController = TextEditingController();
  String gender = '男';
  int age = 18;
  String star = '白羊座';
  String city = '北京';

  final List<String> genders = ['男', '女'];
  final List<String> stars = ['白羊座', '金牛座', '双子座', '巨蟹座', '狮子座', '处女座', '天秤座', '天蝎座', '射手座', '摩羯座', '水瓶座', '双鱼座'];
  final List<String> cities = ['北京', '上海', '广州', '深圳', '杭州', '成都', '重庆', '西安', '南京', '武汉', '苏州', '天津'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF161824),
      appBar: AppBar(
        backgroundColor: const Color(0xFF161824),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.close, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text('编辑资料', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.check, color: Colors.white),
            onPressed: () {
              // TODO: 保存逻辑
              Navigator.of(context).pop();
            },
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 18),
        children: [
          Center(
            child: Stack(
              children: [
                CircleAvatar(
                  radius: 48,
                  backgroundImage: NetworkImage(avatarUrl),
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: GestureDetector(
                    onTap: () {
                      // TODO: 上传头像逻辑
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.blueAccent,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      padding: const EdgeInsets.all(6),
                      child: const Icon(Icons.camera_alt, color: Colors.white, size: 20),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),
          _buildInput('昵称', nameController, hint: '请输入昵称'),
          const SizedBox(height: 18),
          _buildInput('签名', signController, hint: '请输入签名'),
          const SizedBox(height: 18),
          _buildDropdown('性别', gender, genders, (v) => setState(() => gender = v)),
          const SizedBox(height: 18),
          _buildAgePicker(),
          const SizedBox(height: 18),
          _buildDropdown('星座', star, stars, (v) => setState(() => star = v)),
          const SizedBox(height: 18),
          _buildDropdown('城市', city, cities, (v) => setState(() => city = v)),
        ],
      ),
    );
  }

  Widget _buildInput(String label, TextEditingController controller, {String? hint}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: const TextStyle(color: Colors.white70, fontSize: 15)),
        const SizedBox(height: 6),
        TextField(
          controller: controller,
          style: const TextStyle(color: Colors.white, fontSize: 16),
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: const TextStyle(color: Colors.white38),
            filled: true,
            fillColor: const Color(0xFF23243A),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide.none,
            ),
            contentPadding: const EdgeInsets.symmetric(vertical: 12, horizontal: 14),
          ),
        ),
      ],
    );
  }

  Widget _buildDropdown(String label, String value, List<String> items, ValueChanged<String> onChanged) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: const TextStyle(color: Colors.white70, fontSize: 15)),
        const SizedBox(height: 6),
        Container(
          decoration: BoxDecoration(
            color: const Color(0xFF23243A),
            borderRadius: BorderRadius.circular(12),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 14),
          child: DropdownButton<String>(
            value: value,
            isExpanded: true,
            icon: const Icon(Icons.arrow_drop_down, color: Colors.white38),
            dropdownColor: const Color(0xFF23243A),
            underline: const SizedBox(),
            style: const TextStyle(color: Colors.white, fontSize: 16),
            onChanged: (v) => onChanged(v!),
            items: items.map((e) => DropdownMenuItem(value: e, child: Text(e))).toList(),
          ),
        ),
      ],
    );
  }

  Widget _buildAgePicker() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('年龄', style: TextStyle(color: Colors.white70, fontSize: 15)),
        const SizedBox(height: 6),
        Container(
          decoration: BoxDecoration(
            color: const Color(0xFF23243A),
            borderRadius: BorderRadius.circular(12),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 14),
          child: Row(
            children: [
              Expanded(
                child: Slider(
                  value: age.toDouble(),
                  min: 10,
                  max: 80,
                  divisions: 70,
                  label: '$age',
                  onChanged: (v) => setState(() => age = v.round()),
                  activeColor: Colors.blueAccent,
                  inactiveColor: Colors.white24,
                ),
              ),
              Text('$age 岁', style: const TextStyle(color: Colors.white, fontSize: 16)),
            ],
          ),
        ),
      ],
    );
  }
} 