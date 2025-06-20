import 'dart:ui';
import 'package:flutter/material.dart';

import 'home_page.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  bool _showTransition = false;

  void _showAuthDialog(BuildContext context, bool isLogin) {
    showGeneralDialog(
      context: context,
      barrierDismissible: true,
      barrierLabel: '',
      transitionDuration: const Duration(milliseconds: 500),
      pageBuilder: (context, anim1, anim2) {
        return const SizedBox.shrink();
      },
      transitionBuilder: (context, anim1, anim2, child) {
        final curvedValue =
            Curves.easeInOutBack.transform(anim1.value) - 1.0;
        return Transform(
          transform: Matrix4.identity()
            ..setEntry(3, 2, 0.001)
            ..rotateY(curvedValue),
          alignment: Alignment.center,
          child: Opacity(
            opacity: anim1.value,
            child: _AuthDialog(
              isLogin: isLogin,
              onLoginSuccess: _startTransitionToHome,
            ),
          ),
        );
      },
    );
  }

  void _startTransitionToHome() async {
    setState(() {
      _showTransition = true;
    });
    await Future.delayed(const Duration(seconds: 2));
    if (mounted) {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) => const HomePage()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // 渐变背景
        Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Color(0xFFB8C6FF),
                Color(0xFF6D5BFF),
                Color(0xFF46C8FC),
              ],
            ),
          ),
        ),
        // 顶部卡通插画
        Positioned(
          top: 60,
          left: 0,
          right: 0,
          child: Center(
            child: Container(
              width: 120,
              height: 80,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(40),
                gradient: const LinearGradient(
                  colors: [Color(0xFFFFE082), Color(0xFFB8FFEB)],
                ),
              ),
              child: const Icon(Icons.emoji_nature, size: 60, color: Color(0xFF6D5BFF)),
            ),
          ),
        ),
        // 中间毛玻璃渐变卡片
        Center(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(36),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 18, sigmaY: 18),
              child: Container(
                width: 350,
                padding: const EdgeInsets.symmetric(vertical: 36, horizontal: 28),
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Color(0x80FFFFFF),
                      Color(0x40B8C6FF),
                      Color(0x40B8FFEB),
                    ],
                  ),
                  borderRadius: BorderRadius.circular(36),
                  border: Border.all(color: Colors.white.withOpacity(0.25)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.08),
                      blurRadius: 24,
                      offset: const Offset(0, 8),
                    ),
                  ],
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ShaderMask(
                      shaderCallback: (Rect bounds) {
                        return const LinearGradient(
                          colors: [Color(0xFF6D5BFF), Color(0xFF46C8FC)],
                        ).createShader(bounds);
                      },
                      child: const Text(
                        '欢迎回到 GGChat',
                        style: TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          letterSpacing: 2,
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      '和朋友一起畅聊、玩乐、分享',
                      style: TextStyle(
                        fontSize: 16,
                        color: Color(0xFF8888AA),
                      ),
                    ),
                    const SizedBox(height: 32),
                    SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.zero,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(24),
                          ),
                          elevation: 2,
                        ),
                        onPressed: () => _showAuthDialog(context, true),
                        child: Ink(
                          decoration: BoxDecoration(
                            gradient: const LinearGradient(
                              colors: [Color(0xFF6D5BFF), Color(0xFF46C8FC)],
                            ),
                            borderRadius: BorderRadius.circular(24),
                          ),
                          child: Container(
                            alignment: Alignment.center,
                            child: const Text(
                              '登录',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 14),
                    TextButton(
                      onPressed: () => _showAuthDialog(context, false),
                      child: const Text('注册', style: TextStyle(color: Color(0xFF6D5BFF), fontWeight: FontWeight.bold)),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        // 底部第三方登录
        Positioned(
          bottom: 40,
          left: 0,
          right: 0,
          child: Column(
            children: [
              const Text('其它登录方式', style: TextStyle(color: Colors.white70, fontSize: 14)),
              const SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  _iconButton(Icons.wechat, Colors.green, () {}),
                  const SizedBox(width: 24),
                  _iconButton(Icons.apple, Colors.black, () {}),
                  const SizedBox(width: 24),
                  _iconButton(Icons.alternate_email, Colors.orange, () {}),
                ],
              ),
            ],
          ),
        ),
        if (_showTransition)
          Positioned.fill(
            child: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [Color(0xFFB8C6FF), Color(0xFF6D5BFF), Color(0xFF46C8FC)],
                ),
              ),
              child: Center(
                child: TweenAnimationBuilder<double>(
                  tween: Tween(begin: 1.0, end: 2.5),
                  duration: const Duration(seconds: 2),
                  builder: (context, scale, child) {
                    return Transform.scale(
                      scale: scale,
                      child: child,
                    );
                  },
                  child: const Icon(Icons.emoji_nature, size: 80, color: Colors.white),
                ),
              ),
            ),
          ),
      ],
    );
  }

  static Widget _faceCircle(Color color) {
    return CircleAvatar(
      radius: 18,
      backgroundColor: color.withOpacity(0.8),
      child: const Icon(Icons.emoji_emotions, color: Colors.white, size: 20),
    );
  }

  static Widget _iconButton(IconData icon, Color color, VoidCallback onTap) {
    return Material(
      color: Colors.transparent,
      borderRadius: BorderRadius.circular(24),
      child: InkWell(
        borderRadius: BorderRadius.circular(24),
        onTap: onTap,
        child: Container(
          width: 44,
          height: 44,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(24),
            boxShadow: [
              BoxShadow(
                color: color.withOpacity(0.18),
                blurRadius: 8,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Icon(icon, color: color, size: 28),
        ),
      ),
    );
  }
}

class _AuthDialog extends StatefulWidget {
  final bool isLogin;
  final VoidCallback? onLoginSuccess;
  const _AuthDialog({Key? key, required this.isLogin, this.onLoginSuccess}) : super(key: key);

  @override
  State<_AuthDialog> createState() => _AuthDialogState();
}

class _AuthDialogState extends State<_AuthDialog> {
  bool isPhoneLogin = true;
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController accountController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Material(
        color: Colors.transparent,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(32),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 16, sigmaY: 16),
            child: Container(
              width: 330,
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Color(0x80FFFFFF),
                    Color(0x40B8C6FF),
                    Color(0x40B8FFEB),
                  ],
                ),
                borderRadius: BorderRadius.circular(32),
                border: Border.all(color: Colors.white.withOpacity(0.25)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.10),
                    blurRadius: 18,
                    offset: const Offset(0, 6),
                  ),
                ],
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // 顶部卡通icon
                  const Icon(Icons.emoji_emotions, color: Color(0xFF6D5BFF), size: 38),
                  const SizedBox(height: 8),
                  // 顶部切换
                  Container(
                    decoration: BoxDecoration(
                      color: const Color(0xFFF3F3FF),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Row(
                      children: [
                        _cuteTabButton(
                          context,
                          selected: isPhoneLogin,
                          text: '手机号登录',
                          icon: Icons.phone_iphone,
                          onTap: () => setState(() => isPhoneLogin = true),
                        ),
                        _cuteTabButton(
                          context,
                          selected: !isPhoneLogin,
                          text: '账号登录',
                          icon: Icons.account_circle,
                          onTap: () => setState(() => isPhoneLogin = false),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),
                  if (isPhoneLogin) ...[
                    // 手机号登录
                    TextField(
                      controller: phoneController,
                      decoration: InputDecoration(
                        labelText: '手机号',
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(16)),
                        prefixIcon: Container(
                          width: 80,
                          alignment: Alignment.center,
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: const [
                              Icon(Icons.flag, color: Color(0xFF7B5FFF), size: 18),
                              SizedBox(width: 4),
                              Text('中国 +86', style: TextStyle(fontSize: 14, color: Color(0xFF7B5FFF), fontWeight: FontWeight.bold)),
                            ],
                          ),
                        ),
                        prefixIconConstraints: const BoxConstraints(minWidth: 80, minHeight: 0),
                      ),
                      keyboardType: TextInputType.phone,
                    ),
                    const SizedBox(height: 16),
                    TextField(
                      controller: passwordController,
                      decoration: InputDecoration(
                        labelText: '密码',
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(16)),
                        prefixIcon: const Icon(Icons.lock_outline, color: Color(0xFF7B5FFF)),
                      ),
                      obscureText: true,
                    ),
                  ] else ...[
                    // 账号登录
                    TextField(
                      controller: accountController,
                      decoration: InputDecoration(
                        labelText: '账号',
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(16)),
                        prefixIcon: const Icon(Icons.account_circle, color: Color(0xFF7B5FFF)),
                      ),
                    ),
                    const SizedBox(height: 16),
                    TextField(
                      controller: passwordController,
                      decoration: InputDecoration(
                        labelText: '密码',
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(16)),
                        prefixIcon: const Icon(Icons.lock_outline, color: Color(0xFF7B5FFF)),
                      ),
                      obscureText: true,
                    ),
                  ],
                  const SizedBox(height: 24),
                  SizedBox(
                    width: double.infinity,
                    height: 44,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.zero,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        elevation: 2,
                      ),
                      onPressed: () {
                        Navigator.of(context).pop();
                        if (widget.onLoginSuccess != null && widget.isLogin) {
                          widget.onLoginSuccess!();
                        }
                      },
                      child: Ink(
                        decoration: BoxDecoration(
                          gradient: const LinearGradient(
                            colors: [Color(0xFF6D5BFF), Color(0xFF46C8FC)],
                          ),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Container(
                          alignment: Alignment.center,
                          child: Text(widget.isLogin ? '登录' : '注册',
                              style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              )),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _cuteTabButton(BuildContext context, {required bool selected, required String text, required IconData icon, required VoidCallback onTap}) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          padding: const EdgeInsets.symmetric(vertical: 10),
          decoration: BoxDecoration(
            gradient: selected
                ? const LinearGradient(
                    colors: [Color(0xFF6D5BFF), Color(0xFF46C8FC)],
                  )
                : null,
            color: selected ? null : Colors.transparent,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, color: selected ? Colors.white : const Color(0xFF7B5FFF), size: 18),
              const SizedBox(width: 6),
              Text(
                text,
                style: TextStyle(
                  color: selected ? Colors.white : const Color(0xFF7B5FFF),
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
} 