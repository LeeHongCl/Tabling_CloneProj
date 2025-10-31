import 'package:flutter/material.dart';
import './pages/store_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainScreen(),
    );
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 2; // 현재 선택된 탭 인덱스
  final List<String> _menuNames = ['홈', '리뷰', '내주변', '찜', '내정보'];

  final List<String> _filterButtons = [
    '민생소비쿠폰',
    '일식',
    '한식',
    '육류',
    '양식',
    '이자카야',
    '카페',
    '해산물',
    '중식',
    '뷔페',
    '아시아식',
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: _selectedIndex == 2
            ? Stack(
                children: [
                  Container(
                    color: Colors.grey[300],
                    child: const Center(
                      child: Text(
                        '지도 표시 영역 (네이버지도 들어올 자리)',
                        style: TextStyle(color: Colors.black54),
                      ),
                    ),
                  ),
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const SearchScreen(),
                              ),
                            );
                          },
                          child: Container(
                            height: 45,
                            alignment: Alignment.centerLeft,
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(30),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.1),
                                  blurRadius: 3,
                                  offset: const Offset(0, 2),
                                ),
                              ],
                            ),
                            child: const Text(
                              '매장, 지역으로 검색해 보세요.',
                              style: TextStyle(color: Colors.black54),
                            ),
                          ),
                        ),
                      ),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        child: Row(
                          children: _filterButtons
                              .map(
                                (label) => Padding(
                                  padding: const EdgeInsets.only(right: 8),
                                  child: OutlinedButton(
                                    onPressed: () {},
                                    child: Text(label),
                                  ),
                                ),
                              )
                              .toList(),
                        ),
                      ),
                    ],
                  ),
                  DraggableScrollableSheet(
                    initialChildSize: 0.15,
                    minChildSize: 0.15,
                    maxChildSize: 0.6,
                    builder: (context, scrollController) {
                      return Container(
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.vertical(
                            top: Radius.circular(20),
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black26,
                              blurRadius: 6,
                              offset: Offset(0, -2),
                            ),
                          ],
                        ),
                        child: ListView(
                          controller: scrollController,
                          children: [
                            const SizedBox(height: 8),
                            Center(
                              child: Container(
                                width: 40,
                                height: 4,
                                decoration: BoxDecoration(
                                  color: Colors.grey[400],
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                            ),
                            const SizedBox(height: 12),
                            const Center(
                              child: Text(
                                '여기에 매장 리스트 / 필터 메뉴 등이 들어갈 예정',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.black54,
                                ),
                              ),
                            ),
                            const SizedBox(height: 40),
                          ],
                        ),
                      );
                    },
                  ),
                ],
              )
            : Center(
                child: Text(
                  _menuNames[_selectedIndex],
                  style: const TextStyle(fontSize: 24),
                ),
              ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: '홈'),
          BottomNavigationBarItem(icon: Icon(Icons.rate_review), label: '리뷰'),
          BottomNavigationBarItem(icon: Icon(Icons.location_on), label: '내주변'),
          BottomNavigationBarItem(icon: Icon(Icons.favorite), label: '찜'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: '내정보'),
        ],
      ),
    );
  }
}

// 검색 화면
class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _controller = TextEditingController();
  String _query = '';

  final List<Map<String, String>> _stores = [
    {'name': '해목 서촌점', 'address': '서울 종로구 자하문로 26-1'},
    {'name': '해목 해운대점', 'address': '부산 해운대구 구남로24번길 8 (우동)'},
    {'name': '해목 논현점', 'address': '서울 강남구 선릉로145길 14 (논현동)'},
    {'name': '해목 롯데월드몰점', 'address': '서울 송파구 올림픽로 300'},
    {'name': '해목 대구신세계점', 'address': '대구 동구 동부로 149'},
    {'name': '해목정 석남점', 'address': '인천 서구 신석로 84'},
    {'name': '해목정 X 덕담집 부평직영점', 'address': '인천 부평구 화랑로 4'},
  ];

  final List<String> recentSearches = ['빕스', '런던베이글'];
  final List<String> popularSearches = [
    '빕스',
    '청와옥',
    '피킹',
    '해목',
    '수변',
    '신라제면',
    '이재모',
    '빕스 일산',
    '스시히어로',
    '빕스 가든',
  ];

  @override
  Widget build(BuildContext context) {
    final filteredStores = _stores
        .where(
          (store) =>
              store['name']!.contains(_query) ||
              store['address']!.contains(_query),
        )
        .toList();

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: true,
        title: TextField(
          controller: _controller,
          decoration: const InputDecoration(
            hintText: '매장, 지역으로 검색해 보세요.',
            border: InputBorder.none,
          ),
          autofocus: true,
          onChanged: (value) {
            setState(() {
              _query = value;
            });
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: _query.isEmpty
            ? SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 100,
                      color: Colors.grey[300],
                      alignment: Alignment.center,
                      child: const Text('추천 배너 영역'),
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      '최근 검색어',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: recentSearches
                            .map(
                              (item) => Container(
                                margin: const EdgeInsets.only(right: 8),
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 12,
                                  vertical: 6,
                                ),
                                decoration: BoxDecoration(
                                  border: Border.all(color: Colors.grey),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Text(item),
                              ),
                            )
                            .toList(),
                      ),
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      '인기 검색어',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: List.generate(
                        popularSearches.length,
                        (index) => Padding(
                          padding: const EdgeInsets.symmetric(vertical: 4.0),
                          child: Text(
                            '${index + 1}. ${popularSearches[index]}',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: index < 3
                                  ? FontWeight.bold
                                  : FontWeight.normal,
                              color: index < 3 ? Colors.orange : Colors.black87,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            : filteredStores.isEmpty
            ? const Center(
                child: Text(
                  '검색 결과가 없습니다.',
                  style: TextStyle(fontSize: 18, color: Colors.grey),
                ),
              )
            : ListView.builder(
                itemCount: filteredStores.length,
                itemBuilder: (context, index) {
                  final store = filteredStores[index];
                  return ListTile(
                    leading: const CircleAvatar(
                      backgroundColor: Colors.orange,
                      child: Text('해', style: TextStyle(color: Colors.white)),
                    ),
                    title: Text(
                      store['name']!,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.orange,
                      ),
                    ),
                    subtitle: Text(store['address']!),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              const StorePage(), // ← 값 전달 없이 호출
                        ),
                      );
                    },
                  );
                },
              ),
      ),
    );
  }
}
