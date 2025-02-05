import 'package:flutter/material.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'المحادثات',
          style: TextStyle(
              fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        backgroundColor: Colors.blue,
        elevation: 5,
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blue, Colors.white],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: ListView.builder(
          padding: const EdgeInsets.all(8),
          itemCount: chatList.length,
          itemBuilder: (context, index) {
            final chat = chatList[index];
            return ChatCard(
              name: chat['name']!,
              lastMessage: chat['lastMessage']!,
              // imageUrl: chat['imageUrl']!,
              lastMessageTime: chat['lastMessageTime']!,
              isOnline: chat['isOnline'] == 'true',
              onTap: () {
                // الانتقال إلى شاشة المحادثة عند الضغط على الكارد
                Navigator.pushNamed(context, '/chat_detail', arguments: chat);
              },
            );
          },
        ),
      ),
    );
  }
}

// نموذج بيانات المحادثة
final List<Map<String, String>> chatList = [
  {
    'name': 'محمود سالم',
    'lastMessage': 'تم الانتهاء من السباكة.',
    // 'imageUrl': 'assets/images/user1.png',
    'lastMessageTime': '10:30 ص',
    'isOnline': 'true',
  },
  {
    'name': 'خالد ابراهيم',
    'lastMessage': 'موعد الصيانة غدًا.',
    // 'imageUrl': 'assets/images/user2.png',
    'lastMessageTime': 'أمس',
    'isOnline': 'false',
  },
  {
    'name': 'أحمد الابيض',
    'lastMessage': 'أحتاج تفاصيل أكثر عن الخدمة.',
    // 'imageUrl': 'assets/images/user3.png',
    'lastMessageTime': '12:45 م',
    'isOnline': 'true',
  },
];

// كارد المحادثة
class ChatCard extends StatelessWidget {
  final String name;
  final String lastMessage;
  // final String imageUrl;
  final String lastMessageTime;
  final bool isOnline;
  final VoidCallback onTap;

  const ChatCard({
    required this.name,
    required this.lastMessage,
    // required this.imageUrl,
    required this.lastMessageTime,
    required this.isOnline,
    required this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 6, horizontal: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 3,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Row(
            children: [
              // صورة المستخدم مع حالة الاتصال
              Stack(
                children: [
                  const CircleAvatar(
                    radius: 25,
                    // backgroundImage: AssetImage(imageUrl),
                  ),
                  if (isOnline)
                    Positioned(
                      right: 0,
                      bottom: 0,
                      child: Container(
                        width: 12,
                        height: 12,
                        decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.circular(6),
                          border: Border.all(color: Colors.white, width: 2),
                        ),
                      ),
                    ),
                ],
              ),
              const SizedBox(width: 12),
              // تفاصيل المحادثة
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      lastMessage,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey.shade700,
                      ),
                    ),
                  ],
                ),
              ),
              // وقت آخر رسالة
              Text(
                lastMessageTime,
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.grey.shade600,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
