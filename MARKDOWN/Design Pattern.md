## Design Pattern

### MVC (Model View Controller)

### ![스크린샷 2020-09-30 오후 11.50.39](/Users/jangseoyoung/Library/Application Support/typora-user-images/스크린샷 2020-09-30 오후 11.50.39.png)

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
> ![스크린샷 2020-09-30 오후 11.49.35](/Users/jangseoyoung/Library/Application Support/typora-user-images/스크린샷 2020-09-30 오후 11.49.35.png)

> Real Apple's MVC
>
> ![스크린샷 2020-10-01 오후 11.49.01](/Users/jangseoyoung/Library/Application Support/typora-user-images/스크린샷 2020-10-01 오후 11.49.01.png)

- MVC 안에서 Controller의 역할 
  - 모델의 정보를 해석 & 구현해서 뷰에게 주는 것
  - = 뷰 & 사용자와의 상호작용을 모델에게 해석해 줌,
  - *Controller* 가 모든 커뮤니케이션의 중간임.
  
- 서로의 관계

  - Model & Controller
    - 컨트롤러는 모델에 직접적인 접근 가능
    - 모델은 컨트롤러에 Notification & KVO방식을 통해 모델의 변화를 알림.
  - Model & View
    - 모델은 UI에 독립적, View와 소통 불가능.
    - View 또한 불가능
  - View & Controller
    - Controller는 View에 대해 outlet을 이용해 View에게 직접적으로 접근할 수 있음.
    - View는 Controller에게 구조적으로 미리 정해진 방식으로 Controller에게 행위에 대한 요청(delegate)과 데이터에 대한 요청(data source)을 할 수 있다. 또, action(View) - target(controller)의 구조로 사용자의 행위에 따라 필요한 함수를 호출할 수도 있다.

  ![스크린샷 2020-10-05 오전 8.28.19](/Users/jangseoyoung/Library/Application Support/typora-user-images/스크린샷 2020-10-05 오전 8.28.19.png)