import 'package:flutter/material.dart';

class CurrencyCard extends StatelessWidget {
  final String name, code, amount;
  final IconData icon;
  final bool isInverted;
  final double order;
  final double cardY;

  final _blackColor = const Color(0xFF1F2123); // 변수에 _를 붙이면 private으로 관리

  const CurrencyCard({
    super.key,
    required this.name,
    required this.code,
    required this.amount,
    required this.icon,
    required this.isInverted,
    required this.order,
  }) : cardY = order * -10; // 초기화

  @override
  Widget build(BuildContext context) {
    return Transform.translate(
      offset: Offset(0, cardY),
      child: (Container(
        clipBehavior: Clip.hardEdge, // overflow 처리
        decoration: BoxDecoration(
          color: isInverted ? Colors.white : _blackColor,
          borderRadius: BorderRadius.circular(25),
        ),
        child: Padding(
          padding: const EdgeInsets.all(30),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: TextStyle(
                      color: isInverted ? _blackColor : Colors.white,
                      fontSize: 32,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        amount,
                        style: TextStyle(
                          color: isInverted ? _blackColor : Colors.white,
                          fontSize: 22,
                        ),
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      Text(
                        code,
                        style: TextStyle(
                          color: isInverted ? _blackColor : Colors.white,
                          fontSize: 18,
                        ),
                      ),
                    ],
                  )
                ],
              ),
              Transform.scale(
                scale: 2.2, // 아이콘 크기 배로 키우기
                child: Transform.translate(
                  offset: const Offset(-5, 12), // 아이콘 위치 설정
                  child: Icon(
                    icon,
                    color: isInverted ? Colors.black : Colors.white,
                    size: 88,
                  ),
                ),
              ),
            ],
          ),
        ),
      )),
    );
  }
}
