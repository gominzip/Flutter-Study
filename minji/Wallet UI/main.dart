import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'widgets/button.dart';
import 'widgets/currency_card.dart';

void main() {
  runApp(const App());
}

// root
class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    // 테마 선택 : Material은 구글 Cupertino는 ios, 그다지 중요하지는 않다
    return MaterialApp(
      home: Scaffold(
        backgroundColor: const Color(0xFF181818),
        body: AnnotatedRegion<SystemUiOverlayStyle>(
          // 상단 상태바 색상 변경
          value: SystemUiOverlayStyle.light,
          // 스크롤링
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 80,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end, // 기준(row) 정렬
                    children: [
                      Column(
                        crossAxisAlignment:
                            CrossAxisAlignment.end, // 기준(coloumn) 교차 정렬 = row
                        children: [
                          const Text(
                            'Hey, Minji',
                            style: TextStyle(
                              fontSize: 28,
                              fontWeight: FontWeight.w800,
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            'Welcome Back',
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.white.withOpacity(0.8),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 70,
                  ),
                  Text(
                    'Total Balance',
                    style: TextStyle(
                      fontSize: 22,
                      color: Colors.white.withOpacity(0.8),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    '\$5 194 382', // \를 이용해 $ 변수가 아님을 명시
                    style: TextStyle(
                      fontSize: 48,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Button(
                          text: 'Transfer',
                          bgColor: Color(0xFFF2B33A),
                          textColor: Colors.black),
                      Button(
                          text: 'Request',
                          bgColor: Color(0xFF1F2123),
                          textColor: Colors.white),
                    ],
                  ),
                  const SizedBox(
                    height: 100,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      const Text(
                        'Wallets',
                        style: TextStyle(
                          fontSize: 36,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        'View All',
                        style: TextStyle(
                          fontSize: 18,
                          color:
                              Colors.white.withOpacity(0.8), // 오파시티 const 사용 x
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const CurrencyCard(
                    name: 'Euro',
                    code: 'EUR',
                    amount: '6 428',
                    icon: Icons.euro_sharp,
                    isInverted: false,
                    order: 0,
                  ),
                  const CurrencyCard(
                    name: 'Bitcoin',
                    code: 'BTC',
                    amount: '9 274',
                    icon: Icons.currency_bitcoin_sharp,
                    isInverted: true,
                    order: 2,
                  ),
                  const CurrencyCard(
                    name: 'Dollar',
                    code: 'USD',
                    amount: '6 428',
                    icon: Icons.monetization_on_outlined,
                    isInverted: false,
                    order: 4,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
