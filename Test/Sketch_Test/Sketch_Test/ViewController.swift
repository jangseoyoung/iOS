//
//  ViewController.swift
//  Sketch_Test
//
//  Created by 장서영 on 2021/01/22.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var redButton : UIButton!
    @IBOutlet weak var greenButton: UIButton!
    @IBOutlet weak var blackBubbon: UIButton!
    
    @IBOutlet var imgView: UIImageView!
    
    var lastPoint: CGPoint!
    var lineSize: CGFloat = 2.0
    var lineColor = UIColor.blue.cgColor

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.redButton.layer.cornerRadius = 15
        self.greenButton.layer.cornerRadius = 15
        self.blackBubbon.layer.cornerRadius = 15
        self.imgView.layer.borderColor = UIColor.black.cgColor
        self.imgView.layer.borderWidth = 3
    }
    
    @IBAction func clearImageView(_ sender: UIButton){
        imgView.image = nil
    }
    
    @IBAction func redButton(_ sender: UIButton){
        if lineColor == UIColor.red.cgColor {
            lineColor = UIColor.blue.cgColor
        } else {
            lineColor = UIColor.red.cgColor
        }
    }
    
    @IBAction func greenButton(_ sender: UIButton){
        if lineColor == UIColor.green.cgColor {
            lineColor = UIColor.blue.cgColor
        } else {
            lineColor = UIColor.green.cgColor
        }
    }
    
    @IBAction func blackButton(_ sender: UIButton){
        if lineColor == UIColor.black.cgColor {
            lineColor = UIColor.blue.cgColor
        } else {
            lineColor = UIColor.black.cgColor
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first! as UITouch
        
        lastPoint = touch.location(in: imgView)
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        UIGraphicsBeginImageContext(imgView.frame.size)
        UIGraphicsGetCurrentContext()?.setStrokeColor(lineColor)
        UIGraphicsGetCurrentContext()?.setLineCap(CGLineCap.round)
        UIGraphicsGetCurrentContext()?.setLineWidth(lineSize)
        
        let touch = touches.first! as UITouch
        let currPoint = touch.location(in: imgView)
        
        imgView.image?.draw(in: CGRect(x: 0, y: 0, width: imgView.frame.size.width, height: imgView.frame.size.height))
        
        UIGraphicsGetCurrentContext()?.move(to: CGPoint(x: lastPoint.x, y: lastPoint.y))
        UIGraphicsGetCurrentContext()?.addLine(to: CGPoint(x: currPoint.x, y: currPoint.y))
        UIGraphicsGetCurrentContext()?.strokePath()
        
        imgView.image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        lastPoint = currPoint
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        UIGraphicsBeginImageContext(imgView.frame.size)
        UIGraphicsGetCurrentContext()?.setStrokeColor(lineColor)
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
        if motion == .motionShake {
            imgView.image = nil
        }
    }


}

