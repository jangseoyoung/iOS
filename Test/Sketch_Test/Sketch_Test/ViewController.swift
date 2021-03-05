//
//  ViewController.swift
//  Sketch_Test
//
//  Created by 장서영 on 2021/01/22.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var backgroundView: UIView!
    
    // 색 변경 버튼 아웃렛
    @IBOutlet weak var redButton : UIButton!
    @IBOutlet weak var greenButton: UIButton!
    @IBOutlet weak var yellowButton: UIButton!
    
    @IBOutlet weak var lineStepper: UIStepper!
    
    // 스케치북 (이미지뷰) 아웃렛
    @IBOutlet var imgView: UIImageView!
    
    @IBOutlet var clearButton : UIButton!
    
    var lastPoint: CGPoint! // 바로 전에 터치 or 이동한 위치
    var lineSize: CGFloat = 1.0 // 선 두께를 2.0으로 설정
    var lineColor = UIColor.black // 선 색상을 파란색으로 설정(기본값)

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
       
        self.imgView.layer.borderColor = UIColor.black.cgColor
        self.imgView.layer.borderWidth = 1
            
            
        
        buttonStyle(button: redButton)
        buttonStyle(button: greenButton)
        buttonStyle(button: yellowButton)
        
        self.lineStepper.minimumValue = 0.5
        self.lineStepper.maximumValue = 30.0
        self.lineStepper.stepValue = 1.0
        
        self.clearButton.layer.cornerRadius = 10
        
        self.lineStepper.layer.cornerRadius = 7
    
    }
    
    // 모두 지우기
    @IBAction func clearImageView(_ sender: UIButton){
        imgView.image = nil
    }
    
    // 빨간색 버튼이 눌렸을 때
    @IBAction func redButton(_ sender: UIButton){
        if lineColor == UIColor.red { //현재 펜 색이 빨간색일 때 누르면
            lineColor = UIColor.black // 펜 색을 다시 파랑으로 바꿈.
        } else { // 현재 펜 색이 다른 색일 때
            lineColor = UIColor.red // 펜 색을 빨간색으로 바꿈.
//            backgroundView.backgroundColor = UIColor.red
        }
    }
    
    // 초록색 버튼이 눌렸을 때
    @IBAction func greenButton(_ sender: UIButton){
        if lineColor == UIColor.green { // 현재 펜 색이 초록색일 때 누르면
            lineColor = UIColor.black // 펜 색을 다시 파랑으로 바꿈.
            
        } else { // 현재 펜 색이 다른 색일 때
            lineColor = UIColor.green // 펜 색을 초록색으로 바꿈.
//            backgroundView.backgroundColor = UIColor.green
        }
    }
    
    // 검은색 버튼이 눌렸을 때
    @IBAction func yellowButton(_ sender: UIButton){
        if lineColor == UIColor.yellow { //현재 펜 색이 검정일 때
            lineColor = UIColor.black // 펜 색을 파란색으로 바꿈.
        } else { // 현재 펜 색이 다를 때
            lineColor = UIColor.yellow // 펜 색을 검은색으로 바꿈
//            backgroundView.backgroundColor = UIColor.yellow
        }
    }
    
    @IBAction func lineStepper(_ sender: UIStepper){
        lineSize = CGFloat(lineStepper.value)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first! as UITouch // 현재 발생한 터치 이벤트를 가지고 옴
        
        lastPoint = touch.location(in: imgView) // 터치된 위치를 lastPoint에 할당
    }
    
   
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        UIGraphicsBeginImageContext(imgView.frame.size) // 그림을 그리기 위한 콘텍스트 생성
        UIGraphicsGetCurrentContext()?.setStrokeColor(lineColor.cgColor) // 선 색상 설정
        UIGraphicsGetCurrentContext()?.setLineCap(CGLineCap.round) // 선 끝 모양 라운드로 설정
        UIGraphicsGetCurrentContext()?.setLineWidth(lineSize) // 선 두께 설정
        
        let touch = touches.first! as UITouch // 현재 발생한 터치 이벤트를 가지고 옴
        let currPoint = touch.location(in: imgView) // 터치된 좌표를 currPoint로 가지고 옴
        
        imgView.image?.draw(in: CGRect(x: 0, y: 0, width: imgView.frame.size.width, height: imgView.frame.size.height)) // 현재 imgView에 있는 전체 이미지를 imgView의 크기로 그림
        
        UIGraphicsGetCurrentContext()?.move(to: CGPoint(x: lastPoint.x, y: lastPoint.y)) // lastPointd위치로 시작 위치를 이동
        UIGraphicsGetCurrentContext()?.addLine(to: CGPoint(x: currPoint.x, y: currPoint.y)) // lastPoint에서 currPoint까지 선을 추가
        UIGraphicsGetCurrentContext()?.strokePath() // 추가한 선을 콘텍스트에 그림
        
        imgView.image = UIGraphicsGetImageFromCurrentImageContext()// 현재 터치된 위치를 lastPoint라는 변수에 할당
        UIGraphicsEndImageContext()
        
        lastPoint = currPoint
    }
    
    // 위와 동일
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        UIGraphicsBeginImageContext(imgView.frame.size)
        UIGraphicsGetCurrentContext()?.setStrokeColor(lineColor.cgColor)
        UIGraphicsGetCurrentContext()?.setLineCap(CGLineCap.round)
        UIGraphicsGetCurrentContext()?.setLineWidth(lineSize)
        
        imgView.image?.draw(in: CGRect(x: 0, y: 0, width: imgView.frame.size.width, height: imgView.frame.size.height))
        
        UIGraphicsGetCurrentContext()?.move(to: CGPoint(x: lastPoint.x, y: lastPoint.y))
        UIGraphicsGetCurrentContext()?.addLine(to: CGPoint(x: lastPoint.x, y: lastPoint.y))
        UIGraphicsGetCurrentContext()?.strokePath()
        
        imgView.image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
    }
    
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        if motion == .motionShake { // 폰을 흔드는 모션이 발생할 시
            imgView.image = nil // 이미지 뷰의 이미지 삭제
        }
    }
    
    func buttonStyle(button: UIButton){
        button.layer.borderWidth = 2
        button.layer.borderColor = UIColor.white.cgColor
        button.layer.cornerRadius = 16
    }
    
}

