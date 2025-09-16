import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Profile Page',
      home: const ProfilePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  final String coverUrl =
      'https://images.unsplash.com/photo-1503264116251-35a269479413?auto=format&fit=crop&w=1400&q=80';
  final String avatarUrl =
      'https://lh3.googleusercontent.com/a/ACg8ocJOhDcrrZB6YMqZEarmxzmACJPNMuutyZPXY8knlpDFkywy68bn=s360-c-no';

  Widget _buildStatItem(String label, String value) {
    return Expanded(
      child: Column(
        children: [
          Text(value,
              style: const TextStyle(
                  fontSize: 16, fontWeight: FontWeight.bold)),
          const SizedBox(height: 4),
          Text(label, style: const TextStyle(color: Colors.grey)),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context);
    final coverHeight = mq.size.height * 0.20;
    final avatarRadius = 56.0;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              clipBehavior: Clip.none,
              alignment: Alignment.center,
              children: [
                // Banner Image
                SizedBox(
                  height: coverHeight,
                  width: double.infinity,
                  child: Image.network(
                    coverUrl,
                    fit: BoxFit.cover,
                    errorBuilder: (_, __, ___) => Container(
                      color: Colors.grey[300],
                    ),
                  ),
                ),
                // The avatar, positioned to hang off the bottom
                Positioned(
                  top: coverHeight - avatarRadius,
                  child: CircleAvatar(
                    radius: avatarRadius,
                    backgroundColor: Colors.white,
                    child: CircleAvatar(
                      radius: avatarRadius - 4,
                      backgroundImage: NetworkImage(avatarUrl),
                    ),
                  ),
                ),
              ],
            ),
            // Space for the bottom half of the avatar, then Name and Skill
            SizedBox(height: avatarRadius),
            const Text(
              'Arya Fayyadh',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 6),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 12),
              decoration: BoxDecoration(
                color: Colors.blue.shade100,
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Text('Flutter Developer', style: TextStyle(fontSize: 13)),
            ),
            const SizedBox(height: 16),
            // Stats row with normal padding
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                children: [
                  _buildStatItem('Followers', '2.3K'),
                  _buildStatItem('Following', '180'),
                  _buildStatItem('Posts', '58'),
                ],
              ),
            ),
            const SizedBox(height: 12),
            // Follow Button
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: SizedBox(
                width: double.infinity,
                child: TextButton.icon(
                  icon: const Icon(Icons.person_add_alt_1_outlined),
                  label: const Text('Follow'),
                  style: TextButton.styleFrom(
                    foregroundColor: Colors.blue.shade800,
                    backgroundColor: Colors.blue.shade100,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 12),
                  ),
                  onPressed: () {
                    // Aksi ketika tombol follow ditekan
                  },
                ),
              ),
            ),
            const SizedBox(height: 12),
            // Bio / description card
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Card(
                elevation: 2,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)),
                child: const Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Saya adalah mahasiswa informatika yang sedang belajar Flutter. Saya membuat halaman profil sederhana ini sebagai latihan.',
                        style: TextStyle(fontSize: 14, height: 1.4),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 12),
            // Menu / list tiles
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                children: [
                  ListTile(
                    leading: const Icon(Icons.email_outlined),
                    title: const Text('Contact Email'),
                    subtitle: const Text('m.aryafayyadhrazan@gmail.com'),
                    trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                    onTap: () {},
                  ),
                  const Divider(height: 1),
                  ListTile(
                    leading: const Icon(Icons.chat_bubble_outline),
                    title: const Text('Messages'),
                    subtitle: const Text('Direct messages'),
                    trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                    onTap: () {},
                  ),
                  const Divider(height: 1),
                  ListTile(
                    leading: const Icon(Icons.work_outline),
                    title: const Text('Works'),
                    subtitle: const Text('View portfolio and projects'),
                    trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                    onTap: () {},
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            // Gallery / posts sample (grid)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Photos',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 12),

                  GridView.count(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    crossAxisCount: 3,
                    mainAxisSpacing: 8,
                    crossAxisSpacing: 8,
                    children: List.generate(6, (i) {
                      final image = 'https://picsum.photos/seed/$i/200';
                      return ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.network(image, fit: BoxFit.cover),
                      );
                    }),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 36),
          ],
        ),
      ),
    );
  }
}