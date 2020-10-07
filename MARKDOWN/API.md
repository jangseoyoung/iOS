## API(Application Programing Interface)

- 응용 프로그램에서 사용할 수 있도록 운영 체제나 프로그래밍 언어가 제공하는 기능을 제어할 수 있게 만든 인터페이스
- 프로그램과 또 다른 프로그램을 연결해 주는 일종의 매개체 역할을 한다.

---

## REST API

### Rest(REpresentational State Transfer)

- HTTP 기반으로 한 `자원`에 접근하기 위한 방식을 정해놓은 아키텍처이다.

  - `자원` : 저장된 데이터, 모든 파일, 서비스를 모두 포함함.

- **REST의 4가지 속성**

  > 1. 서버에 존재하는 모든 자원은 각 자원당 클라이언트가 바로 접근이 가능한 고유의 URI(Uniform Resource Identifier, 통합 자원 식별자)가 존재함.
  > 2. 클라이언트의 요청에 따라 필요한 정보를 제공하기 때문에 서버에서는 세션 정보를 보관할 필요가 없음. -> 서비스에 자유도가 높아짐 & 유연한 아키텍처의 적응 가능
  > 3. HTTP 메소드를 이용함. 모든 자원은 HTTP의 인터페이스 GET, POST, PUT, DELETE 메소드를 통해 접근
  > 4. 서비스 내 하나의 자원은 연관된 자원과 연결되어 표현이 가능해야 함.

- REST는 HTTP URI를 통해 자원을 명시하고, HTTP Method(GET, POST, PUT, DELETE)를 통해 자원에 접근함.

- **RESTful**

  - RESTful은 일반적으로 REST라는 아키텍처를 구현해 서비스를 나타내기 위해 사용되는 용어임.
  - 'REST API'를 제공하는 웹 서비스를 RESTful하다고 할 수 있음.
    - = REST의 원리를 따르는 시스템은 RESTful이란 용어로 지칭됨.