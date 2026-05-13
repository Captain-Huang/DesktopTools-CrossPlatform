import 'package:desktop_tools_flutter/presentation/pages/calendar_page.dart';
import 'package:desktop_tools_flutter/presentation/pages/calculator_page.dart';
import 'package:desktop_tools_flutter/presentation/pages/ip_page.dart';
import 'package:desktop_tools_flutter/presentation/pages/pomodoro_page.dart';
import 'package:desktop_tools_flutter/presentation/pages/settings_page.dart';
import 'package:desktop_tools_flutter/presentation/pages/todos_page.dart';
import 'package:desktop_tools_flutter/presentation/pages/weather_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeShell extends StatelessWidget {
  const HomeShell({super.key, required this.module});

  final String module;

  static const _tabs = [
    ('ip', '网络归属地', Icons.public),
    ('pomodoro', '番茄钟', Icons.timer),
    ('calculator', '计算器', Icons.calculate),
    ('todos', '待办', Icons.checklist),
    ('calendar', '日历', Icons.calendar_month),
    ('weather', '天气', Icons.cloud),
    ('settings', '设置', Icons.settings),
  ];

  @override
  Widget build(BuildContext context) {
    final index = _tabs.indexWhere((t) => t.$1 == module).clamp(0, _tabs.length - 1);
    final title = _tabs[index].$2;
    final subtitle = switch (_tabs[index].$1) {
      'ip' => '查询公网 IP、归属地、运营商与代理风险',
      'pomodoro' => '专注计时、休息切换、会话统计',
      'calculator' => '科学计算与常用表达式运算',
      'todos' => '待办管理、筛选与到期提醒',
      'calendar' => '月历、节假日与农历信息',
      'weather' => '城市天气、7日预报与空气质量',
      _ => '系统参数与平台能力设置',
    };
    final page = switch (_tabs[index].$1) {
      'ip' => const IpPage(),
      'pomodoro' => const PomodoroPage(),
      'calculator' => const CalculatorPage(),
      'todos' => const TodosPage(),
      'calendar' => const CalendarPage(),
      'weather' => const WeatherPage(),
      _ => const SettingsPage(),
    };

    return LayoutBuilder(
      builder: (context, constraints) {
        final wide = constraints.maxWidth >= 900;
        if (wide) {
          return Scaffold(
            body: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [Color(0xFFF4FAFF), Color(0xFFEAF5FF)],
                ),
              ),
              child: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Row(
                    children: [
                      _Sidebar(
                        tabs: _tabs,
                        selectedIndex: index,
                        onSelect: (i) => context.go('/${_tabs[i].$1}'),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(12),
                                border: Border.all(color: const Color(0xFFDDEBFA)),
                              ),
                              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          title,
                                          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                                            fontWeight: FontWeight.w800,
                                            color: const Color(0xFF102A4D),
                                          ),
                                        ),
                                        const SizedBox(height: 4),
                                        Text(
                                          subtitle,
                                          style: const TextStyle(color: Color(0xFF6A7B96)),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 12),
                            Expanded(
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(12),
                                  border: Border.all(color: const Color(0xFFDDEBFA)),
                                ),
                                padding: const EdgeInsets.all(16),
                                child: page,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        }
        return Scaffold(
          appBar: AppBar(title: Text(title)),
          body: Padding(
            padding: const EdgeInsets.all(12),
            child: page,
          ),
          bottomNavigationBar: NavigationBar(
            selectedIndex: index,
            onDestinationSelected: (i) => context.go('/${_tabs[i].$1}'),
            destinations: [
              for (final tab in _tabs)
                NavigationDestination(icon: Icon(tab.$3), label: tab.$2),
            ],
          ),
        );
      },
    );
  }
}

class _Sidebar extends StatelessWidget {
  const _Sidebar({
    required this.tabs,
    required this.selectedIndex,
    required this.onSelect,
  });

  final List<(String, String, IconData)> tabs;
  final int selectedIndex;
  final ValueChanged<int> onSelect;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 230,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14),
        gradient: const LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Color(0xFF162A46), Color(0xFF0E1B2F)],
        ),
        boxShadow: const [
          BoxShadow(
            color: Color(0x22000000),
            blurRadius: 12,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(12, 14, 12, 14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  width: 36,
                  height: 36,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    gradient: const LinearGradient(
                      colors: [Color(0xFF2DD4BF), Color(0xFF16A34A)],
                    ),
                  ),
                  child: const Icon(Icons.timer, color: Colors.white, size: 22),
                ),
                const SizedBox(width: 10),
                const Expanded(
                  child: Text(
                    '轻工具箱',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 4),
            const Text(
              '桌面效率小工具',
              style: TextStyle(color: Color(0xFF9BB1CF), fontSize: 12),
            ),
            const SizedBox(height: 18),
            for (var i = 0; i < tabs.length; i++) ...[
              _SidebarItem(
                label: tabs[i].$2,
                icon: tabs[i].$3,
                selected: i == selectedIndex,
                onTap: () => onSelect(i),
              ),
              const SizedBox(height: 6),
            ],
          ],
        ),
      ),
    );
  }
}

class _SidebarItem extends StatelessWidget {
  const _SidebarItem({
    required this.label,
    required this.icon,
    required this.selected,
    required this.onTap,
  });

  final String label;
  final IconData icon;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(10),
      child: Container(
        height: 42,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: selected ? const Color(0xFF1F3C63) : Colors.transparent,
        ),
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          children: [
            Icon(icon, color: selected ? const Color(0xFF66E0D0) : const Color(0xFFB7C8DE), size: 18),
            const SizedBox(width: 10),
            Text(
              label,
              style: TextStyle(
                color: selected ? Colors.white : const Color(0xFFB7C8DE),
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
