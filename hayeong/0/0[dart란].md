# 0. dart란?

태그: flutter

![Untitled](0%20dart%E1%84%85%E1%85%A1%E1%86%AB%20257b6226ed96403b8b77bfb2011996a4/Untitled.png)

### 문장

- 명령 단위. 세미콜론 ;으로 끝남

### 변수

- 데이터를 담는 상자
- `int`, `double`, `String`, `bool`을 기본 제공하며, 사용자가 직접 타입을 정의가능함
- `in`t와 `double`은 `num`의 하위 집합

```java
int a = 1;
double b = 2.0;

num c = a;
```

**타입 추론**

- 위와 같이 type을 직접 명시하지 않고, `var`로 대체가능 → 일반적으로 많이 사용.

```java
var i = 10; //int
var d = 10.0 //double
var s = "hello"; //String
var b = true; //boolean
```

### 상수

- `final` → 제일 앞에 붙이면 값이 수정되지 않으며, 타입 생략 가능.

### 타입 검사

- `[변수] is [type]`으로 검사 가능

```java
int a = 1;
 
if (a is int){~}
if (a is! int){~}
```

### 함수 형태

대개 일반적인 C문법과 동일

입력 받는 문자 : 매개변수 parameter

실제로 입력 받는 문자 : 인수 argument

반환되는 값 : 반환 값 Return

- 변수 앞에 $를 붙여 문자열 내에 변수 삽입 가능
- 또한, ${~~}부분에 표현식 사용 가능

```java
String name = "이순신";
int age = 20;
 
void main(){
	print('$name은 $age살 입니다.');
    print("$name은 ${name.length}글자 입니다.");
}
```

### 익명 함수

anonymouse function

- `([인수명]) {[동작 or Return 값]}`

```java
(number) {
	return number % 2 == 0;
};
```

### 람다

- `([인수명]) ⇒ [동작 or Return 값]`

```java
(number) => number%2 == 0;
```

**→ 람다식에서는 return 키워드를 적지 않아도 값이 반환되는 반면, 익명 함수는 값을 반환하려면 return 키워드를 꼭 적어야 함**

### 선택 매개변수

정의에서 {}로 감싼 매개변수는 선택적으로 사용 가능.

Named parameter.

```java
void f(String name, {int age}) {}

void f(String name, {int age = 5}) {}
```

- 선택 매개변수에 값을 주고 싶다면 반드시 매개 변수의 이름을 붙여 age : 5로 넘겨주어야 함
- 또한 기본값 지정이 가능함

---

### 객체지향 프로그래밍 언어

- object / instance / class / property

### 접근 지정자

- java에서의 public, private와 같은 역할
- 기본이 public이고, private은 앞에 _을 붙여 구분

```java
class Person{
	String name;
    int _age;
    
    void addOneYear(){
    	_age++;
    }
}
 
//=====다른 Dart file
import 'person.dart';
 
void main(){
	var person = Person();
    person._age = 10; //error!
}
```

### 생성자

```java
class Person{
	String name;
    int _age;
    
    Person({this.name, this._age}); //constructor
}
 
var person = Person();
var person2 = Person(name : '홍길동', _age : 20);
```

### getter, setter

```java
class Person{
	String name;
  int _age;
    
  int get age => _age; //getter : lambda식
	set setAge(num value) => _age = value; //setter
}
```

### 상속

/콛,

```java
//부모 class
class Hero{
	String name = 'hero';
    
    void run() {}
}
 
//위를 상속받은 자식 클래스
class SuperHero extend Hero{
	@override //재정의
    void run(){
    	super.run(); //부모의 run실행
        this.fly(); //추가로 자식이 따로 정의한 fly도 실행.
    }
    
    void fly() {}
}
```

- 상속받은 자식 클래스는 extend로 상속
- 상속받은 메서드는 @override로 재정의 가능

### 추상 클래스

```java
abstract class Monster{
	void attack();
}
 
abstract class Flyable{
	void fly();
}
 
class Bat implements Monster, Flyable(
	@override
    void attack(){
    	print('할퀴기!');
    }
    
    @override
    void fly(){
    	print('펄럭펄럭');
    }
}
```

- 추상 메서드를 포함하는 클래스
- 추상 메서드 : 선언만 되고 정의가 없는 메서드
- implements로 확장되며, 추상 클래스를 구현할 때는 모든 추상 메서드를 @override로 재정의.

### 믹스인

굳이 상속 받지 않고, 다른 클래스 기능을 쓰고 싶다면

- `with`를 사용하면 됨

```java
class Goblin implements Monster{
	@override
    void attack(){
    	print('고블린 공격');
    }
}
 
class DarkGoblin extends Goblin with Hero{
 
} //다크 고블린은 고블린이기도 하며, 히어로이기도 하며, 몬스터이기도 함. => 다형성!
```

### 열거형

```java
enum Status { login, logout }
 
var authStatus = Status.logout;
 
switch(authStatus){
	case Status.login:
    	print('login');
        break;
    case Status.logout:
    	print('logout');
        break;
}
```

## 컬렉션

list, map, set 등의 컬렉션 기본 제공.

### List

- 순서가 있는 자료를 담은
- array를 별도로 제공하지 않음

```java
List<String> items = ['a', 'b', 'c'];

var items = ['a', 'b', 'c'];
```

- `dynamic` : 모든 타입을 대변하는 특수 타입. **여러 타입을 한 리스트에 넣거나 일반 변수를 선언할 때 사용 가능.**
- `…` : spread. 컬렉션을 펼쳐주며, 다른 컬렉션 안에 컬렉션을 삽입할 때 사용.

### Map

- key-value : dictionary 타입

```java
//Map<String, String> cityMap = {...} 과 같음.
var cityMap = {
	'korea': 'busan',
    'japan': 'tokyo',
    'china': 'Beijing'
};

cityMap['korea'] = 'seoul';
 
print(cityMap.length); //3
 
cityMap['America'] = 'Washington'; //새 값 추가
```

### Set

- 집합 표현 → 중복 X

```java
// Set<String> citySet = {}과 같음
var citySet = {'서울', '부산', '광주', '대전', '울산'}
 
citySet.add('대구');
citySet.remove('서울');
 
print(citySet.contatins('울산'); // true
```

---

### 함수형 프로그래밍

dart는 객체지향 프로그래밍과 함수형 프로그래밍의 특징 모두를 제공

### 일급 객체

함수를 값으로 취급하여, 다른 변수에 함수 대입이 가능함

```java
void greeting(String text){
	print(text);
}
 
void main(){ // 함수를 다른 변수에 대입할 수 있음
	var f = greeting;
    f('hello');
}
```

- 함수를 매개변수로 전달, 수정, 변수에 대입하기가 가능한 객체를 first-class object라고 함.

### for vs forEach() 함수

- `for` : 외부 반복
- `forEach()` : 내부 반복 → (E element : elements) 형태의 함수를 인수로 받음
    - 내부 객체로 바로 접근이 가능하다는 듯

### where

- 조건을 필터링 할 때 사용
- 함수형 프로그래밍을 지원하는 함수들은 결과를 반복 가능한 타입으로 반환하여 메서드 체인으로 연결하여 사용 가능.

```java
items.where((e) => e % 2 == 0).forEach(print); //2, 4
```

### toList, toSet

- 함수형 프로그래밍을 지원하는 함수 대부분은 iterable<T> 인터페이스 타입 인스턴스를 반환
- 하지만 실제 사용할 때 리스트 형태로 변환해야 하는 경우가 많아 list로 변환해야 함/

```java
final result = itmes.where((e) => e % 2 == 0).toList();
final result = itmes.where((e) => e % 2 == 0).toSet().toList(); //중복 제거
```

### null 처리

- 다트는 null을 처리할 수 있는 여러가지 방법을 제공.
    - 다트에서는 모든 것이 객체이기 때문에, 모두 null을 가질 수 있기 때문
    - java에서는 int, bool, double → 원시형이기 때문에 null을 가질 수 없음 → 차이
- ? : null 여부 파악 가능
- ?? : null일 때 작동을 간단히 구현하는데 사용

```java
print(name?.lentgh); //null출력
print(name?.length ?? 0); //name이 null이면 0을 출력
```