import 'package:flutter/material.dart';

void main() {
  runApp(WomenSafetyApp());
}

class WomenSafetyApp extends StatelessWidget {
  const WomenSafetyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Sashakti',
      theme: ThemeData(primarySwatch: Colors.pink),
      home: SplashScreen(),
    );
  }
}

// Splash Screen
class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 2), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => LoginPage()));
    });

    return Scaffold(
      body: Center(
        child: Text(
          'Sashakti',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}

// Login Page
class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Login')),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(decoration: InputDecoration(labelText: 'Email / Phone')),
            TextField(
                decoration: InputDecoration(labelText: 'Password'),
                obscureText: true),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacement(
                    context, MaterialPageRoute(builder: (context) => HomePage()));
              },
              child: Text('Login'),
            ),
            TextButton(onPressed: () {}, child: Text('Sign in with Google')),
          ],
        ),
      ),
    );
  }
}

// Home Page (Dashboard)
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dashboard'),
        actions: [
          IconButton(
            icon: CircleAvatar(
              backgroundImage: AssetImage('assets/girl_icon.png'),
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ProfilePage()),
              );
            },
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
              accountName: Text("Swati"),
              accountEmail: Text("user@example.com"),
              currentAccountPicture: CircleAvatar(child: CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage('assets/girl_icon.png'),
              ),),
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: Text("Profile"),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ProfilePage()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.logout),
              title: Text("Logout"),
              onTap: () {
                Navigator.pushReplacement(
                    context, MaterialPageRoute(builder: (context) => LoginPage()));
              },
            ),
          ],
        ),
      ),
      body: GridView.count(
        crossAxisCount: 2,
        children: [
          _buildCard(Icons.sos, 'SOS', Colors.red, context, SOSPage()),
          _buildCard(Icons.event, 'Events', Colors.blue, context, EventsPage()),
          _buildCard(Icons.map, 'Safe Routes', Colors.green, context, SafeRoutesPage()),
          _buildCard(Icons.report, 'File Complaint', Colors.orange, context, FileComplaintPage()),
          _buildCard(Icons.chat, 'Community', Colors.purple, context, CommunityPage()),
          _buildCard(Icons.health_and_safety, 'Therapist', Colors.pink, context, TherapistPage()),
        ],
      ),
    );
  }

  Widget _buildCard(IconData icon, String title, Color color, BuildContext context, Widget page) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => page));
      },
      child: Card(
        margin: EdgeInsets.all(16),
        color: color,
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(icon, size: 40, color: Colors.white),
              SizedBox(height: 10),
              Text(title, style: TextStyle(color: Colors.white, fontSize: 18)),
            ],
          ),
        ),
      ),
    );
  }
}

// Profile Page
class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Profile')),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage('assets/girl_icon.png'),
              ),
            ),
            SizedBox(height: 20),
            Text('Name: Swati', style: TextStyle(fontSize: 18)),
            Text('Email: user@example.com', style: TextStyle(fontSize: 18)),
            SizedBox(height: 20),
            Text('Emergency Contacts:', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            Text('1. Contact Name - 9800000000', style: TextStyle(fontSize: 16)),
            Text('2. Contact Name - 9100000000', style: TextStyle(fontSize: 16)),
            SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                onPressed: () {},
                child: Text('Edit Details'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Placeholder Pages
class SOSPage extends StatelessWidget {
  const SOSPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SOS'),
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Text(
            'Alert has been sent to emergency contacts and your location has been shared with the concerned authorities',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.red,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}



// Events Page
class EventsPage extends StatelessWidget {
  final List<String> events = [
    'Self-Defense Workshop - March 10',
    'Community Safety Meeting - March 15',
    'Mental Health Awareness - March 20',
    'Women Empowerment Talk - March 25',
    'Cyber Safety Training - March 30'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Events')),
      body: ListView.builder(
        padding: EdgeInsets.all(16.0),
        itemCount: events.length,
        itemBuilder: (context, index) {
          return Card(
            margin: EdgeInsets.symmetric(vertical: 8.0),
            child: ListTile(
              title: Text(events[index], style: TextStyle(fontSize: 18)),
              leading: Icon(Icons.event, color: Colors.blue),
            ),
          );
        },
      ),
    );
  }
}

class SafeRoutesPage extends StatelessWidget {
  const SafeRoutesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Safe Routes')),
      body: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.5,
            width: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/maps.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Nearby Safe Routes:',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8.0),
                Text('- Gurdwara Road', style: TextStyle(fontSize: 16)),
                Text('- Maharishi Valmiki Marg', style: TextStyle(fontSize: 16)),
                Text('- Maharaja Surajmal Marg', style: TextStyle(fontSize: 16)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// File Complaint Page
class FileComplaintPage extends StatelessWidget {
  final List<String> complaintOptions = [
    'Mahila Ayog',
    'Sexual Harassment electronic Box (SHe-Box)',
    'National Crime Records Bureau (NCRB)',
    'Women Helpline 1091',
    'Cyber Crime Portal'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('File Complaint')),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Complaints reported on this portal are dealt by law enforcement agencies such as:',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              'Mahila Ayog, Sexual Harassment electronic Box (SHe-Box), National Crime Records Bureau (NCRB), etc. All agencies are informed at once through our interactive form system, reducing the hassle of reaching out to multiple websites.',
              style: TextStyle(fontSize: 14),
            ),
            SizedBox(height: 20),
            Text(
              'It is imperative to provide correct and accurate details while filing a complaint for prompt action.',
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.red),
            ),
            SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: complaintOptions.length,
                itemBuilder: (context, index) {
                  return Card(
                    margin: EdgeInsets.symmetric(vertical: 8.0),
                    child: ListTile(
                      title: Text(complaintOptions[index], style: TextStyle(fontSize: 18)),
                      leading: Icon(Icons.report, color: Colors.orange),
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


// Community Page
class CommunityPage extends StatelessWidget {
  final List<String> communities = [
    'Women at Work',
    'Home Makers',
    'Students',
    'Self-Care & Wellness',
    'Legal Support Group'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Community Groups')),
      body: ListView.builder(
        padding: EdgeInsets.all(16.0),
        itemCount: communities.length,
        itemBuilder: (context, index) {
          return Card(
            margin: EdgeInsets.symmetric(vertical: 8.0),
            child: ListTile(
              title: Text(communities[index], style: TextStyle(fontSize: 18)),
              leading: Icon(Icons.group, color: Colors.purple),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ChatPage(groupName: communities[index]),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}

// Chat Page
class ChatPage extends StatelessWidget {
  final String groupName;
  ChatPage({required this.groupName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(groupName)),
      body: Center(
        child: Text(
          'Welcome to the $groupName community! Start chatting and sharing.',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}

//Therapist Page
class TherapistPage extends StatelessWidget {
  const TherapistPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> therapists = [
      'Dr. Anjali Sharma',
      'Dr. Ramesh Kumar',
      'Dr. Priya Desai',
      'Dr. Vikram Patel',
      'Dr. Neha Verma'
    ];

    return Scaffold(
      appBar: AppBar(title: Text('Therapist')),
      body: ListView.builder(
        padding: EdgeInsets.all(16.0),
        itemCount: therapists.length,
        itemBuilder: (context, index) {
          return Card(
            margin: EdgeInsets.symmetric(vertical: 8.0),
            child: ListTile(
              title: Text(therapists[index], style: TextStyle(fontSize: 18)),
              leading: Icon(Icons.person, color: Colors.pink),
              trailing: IconButton(
                icon: Icon(Icons.chat, color: Colors.blue),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ChatPage(groupName: therapists[index]),
                    ),
                  );
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
