
import 'package:material_ui/material_ui.dart';

void main() {
  runApp(const AirStudentPortal());
}

class AirStudentPortal extends StatelessWidget {
  const AirStudentPortal({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Air Student Portal',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF17365D),
        ),
        scaffoldBackgroundColor: const Color(0xFFF5F7FA),
      ),
      home: const PortalHome(),
    );
  }
}

class PortalHome extends StatefulWidget {
  const PortalHome({super.key});

  @override
  State<PortalHome> createState() => _PortalHomeState();
}

class _PortalHomeState extends State<PortalHome> {
  int selectedIndex = 0;

  final List<String> pages = [
    'Dashboard',
    'Student Portal',
    'Attendance',
    'Grades & GPA',
    'Timetable',
    'Fee Information',
  ];

  final List<IconData> icons = [
    Icons.dashboard_outlined,
    Icons.language,
    Icons.fact_check_outlined,
    Icons.grade_outlined,
    Icons.calendar_month_outlined,
    Icons.account_balance_wallet_outlined,
  ];

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isDesktop = constraints.maxWidth >= 700;

        return Scaffold(
          body: Row(
            children: [
              if (isDesktop)
                NavigationRail(
                  extended: constraints.maxWidth >= 1000,
                  selectedIndex: selectedIndex,
                  onDestinationSelected: (index) {
                    setState(() => selectedIndex = index);
                  },
                  leading: const Padding(
                    padding: EdgeInsets.symmetric(vertical: 24),
                    child: Icon(
                      Icons.school,
                      size: 36,
                      color: Color(0xFF17365D),
                    ),
                  ),
                  destinations: List.generate(
                    pages.length,
                    (index) => NavigationRailDestination(
                      icon: Icon(icons[index]),
                      label: Text(pages[index]),
                    ),
                  ),
                ),

              Expanded(
                child: Column(
                  children: [
                    AppBar(
                      title: Text(pages[selectedIndex]),
                      backgroundColor: Colors.white,
                      surfaceTintColor: Colors.transparent,
                    ),
                    Expanded(
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              icons[selectedIndex],
                              size: 64,
                              color: const Color(0xFF17365D),
                            ),
                            const SizedBox(height: 20),
                            Text(
                              pages[selectedIndex],
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineMedium,
                            ),
                            const SizedBox(height: 8),
                            const Text(
                              'Air University Student Portal',
                            ),
                            const SizedBox(height: 20),
                            const Text(
                              'This section is under development.',
                              style: TextStyle(color: Colors.grey),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          bottomNavigationBar: isDesktop
              ? null
              : NavigationBar(
                  selectedIndex: selectedIndex,
                  onDestinationSelected: (index) {
                    setState(() => selectedIndex = index);
                  },
                  destinations: List.generate(
                    pages.length,
                    (index) => NavigationDestination(
                      icon: Icon(icons[index]),
                      label: pages[index],
                    ),
                  ),
                ),
        );
      },
    );
  }
}
