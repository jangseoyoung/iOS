//
//  ViewController.swift
//  Alamofire_Test
//
//  Created by 장서영 on 2020/11/24.
//

import UIKit
import Alamofire // Alamofire

struct UserInfoKey {
  // 저장에 사용할 키
  static let loginId = "LOGINID"
  static let account = "ACCOUNT"
  static let name = "NAME"
  static let profile = "PROFILE"
  static let tutorial = "TUTORIAL"
}

class UserInfoManager {
  // 연산 프로퍼티 loginId 정의
  var loginid: Int {
    get {
      return UserDefaults.standard.integer(forKey: UserInfoKey.loginId)
    }
    set(v) {
      let ud = UserDefaults.standard
      ud.set(v, forKey: UserInfoKey.loginId)
      ud.synchronize()
    }
  }
  
  var account: String? {
    get {
      return UserDefaults.standard.string(forKey: UserInfoKey.account)
    }
    set (v) {
      let ud = UserDefaults.standard
      ud.set(v, forKey: UserInfoKey.account)
      ud.synchronize()
    }
  }
  
  var name: String? {
    get {
      return UserDefaults.standard.string(forKey: UserInfoKey.name)
    }
    set (v) {
      let ud = UserDefaults.standard
      ud.set(v, forKey: UserInfoKey.name)
      ud.synchronize()
    }
  }
  
 
  var isLogin: Bool {
    // 로그인 아이디가 0이거나 계정이 비어 있으면
    if self.loginid == 0 || self.account == nil {
      return false
    } else {
      return true
    }
  }
  
  func login(account: String, passwd: String, success: (()->Void)? = nil, fail:((String)->Void)? = nil) {
    // 1. URL과 전송할 값 준비
    let url = "http://swiftapi.rubypaper.co.kr:2029/userAccount/login"
    let param: Parameters = [
      "account": account,
      "passwd" : passwd
    ]
    // 2. API 호출
    let call = AF.request(url, method: .post, parameters: param,
                                 encoding: JSONEncoding.default)
    // 3. API 호출 결과 처리
    call.responseJSON { res in
      // 3-1. JSON 형식으로 응답했는지 확인
        let result = try! res.result.get()
        guard let jsonObject = result as? NSDictionary else {
        fail?("잘못된 응답 형식입니다:\(result)")
        return
      }
      // 3-2. 응답 코드 확인. 0이면 성공
      let resultCode = jsonObject["result_code"] as! Int
      if resultCode == 0 { // 로그인 성공
        // 3-3. 로그인 성공 처리 로직이 여기에 들어갑니다.
        // 3-3. user_info 이하 항목을 딕셔너리 형태로 추출하여 저장
        let user = jsonObject["user_info"] as! NSDictionary
        self.loginid = user["user_id"] as! Int
        self.account = user["account"] as? String
        self.name = user["name"] as? String
        
    
      } else { // 로그인 실패
        let msg = (jsonObject["error_msg"] as? String) ?? "로그인이 실패했습니다."
        fail?(msg)
      }
    }
  }
  
  
    
  }
