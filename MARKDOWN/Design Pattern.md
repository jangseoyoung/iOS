## Design Pattern

### MVC (Model View Controller)

### ![image info](/Users/jangseoyoung/Documents/GitHub/iOS/MARKDOWN/Traditional MVC.png)

> Model : 데이터를 다루는 부분
>
> View : 화면에 보여지는 시각적인 부분(UI)
>
> Controller : Model과 View를 연결함.

- 장점 

  - 이해하기 더 쉬워짐.
  - 재사용성이 높아짐.
  - 독립적인 테스트 가능

- 일반적인 MVC는 너무 밀접하게 연관되어 있음

- 서로 독립성이 없기 때문에 재사용성이 떨어짐.

- ` 전통적인 MVC구조는 iOS개발에 부적합함.`

### Apple's MVC

- 기존의 MVC는 iOS개발에 부적합하므로 애플에서 CocoaMVC구조를 제시함.

> Apple's MVC
>
> ![image info](/Users/jangseoyoung/Documents/GitHub/iOS/MARKDOWN/Cocoa MVC.png)

> Real Apple's MVC
>
> ![image info](/Users/jangseoyoung/Documents/GitHub/iOS/MARKDOWN/Really CocoaMVC.png)

- MVC
  - Model
    - 앱이 무엇인지에 대해 관심을 가짐.
    - UI와 독립되어 있음.
  - Controller
    - 어떻게 화면에 표시할 것인지에 대해 관심을 가짐.
  - View
    - UIButton, UIViewController, UILabel와 같은 UI와 관련된 것이고 Controller의 통제를 받게 됨.

- MVC 안에서 Controller의 역할 
  - Model의 정보를 해석 & 구현해서 뷰에게 주는 것
  - = View & 사용자와의 상호작용을 Model에게 해석해 줌,
  - *Controller* 가 모든 커뮤니케이션의 중간임.
  
- 서로의 관계

  - Model & Controller
    - Controller는 Model에 직접적인 접근 가능
    - Model은 컨트롤러에 Notification & KVO방식을 통해 Model의 변화를 알림.
  - Model & View
    - Model은 UI에 독립적, View와 소통 불가능.
    - View 또한 불가능
  - View & Controller
    - Controller는 View에 대해 outlet을 이용해 View에게 직접적으로 접근할 수 있음.
    - View는 Controller에게 구조적으로 미리 정해진 방식으로 Controller에게 행위에 대한 요청(delegate)과 데이터에 대한 요청(data source)을 할 수 있다. 또, action(View) - target(controller)의 구조로 사용자의 행위에 따라 필요한 함수를 호출할 수도 있다.

  ![image info](/Users/jangseoyoung/Documents/GitHub/iOS/MARKDOWN/MVC_stanford.png)