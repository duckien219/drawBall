//
//  ViewController.swift
//  drawBall
//
//  Created by Kien Nguyen Duc on 6/12/17.
//  Copyright © 2017 Kien Nguyen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var n: Int!
    var margin: CGFloat = 30 //LED cách lề màn hình theo phương x một khoảng có giá trị "margin"
    var tf: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        makeTextField()
        makeButton()
    }
    
    func drawBall() {
        for view in view.subviews{
            view.removeFromSuperview()
        }
        n = Int(tf.text!)
        
        for i in 1...n {
            for j in 1...n {
                
                // Kiểm tra nếu n = 1 thì vẽ 1 LED duy nhất giữa màn hình
                if (n == 1) {
                    let image = UIImage(named: "green")
                    let LED = UIImageView(image: image)
                    LED.frame = CGRect(x: 0, y: 0, width: 30, height: 30) //xác định size của LED
                    LED.center = CGPoint(x: view.bounds.size.width/2, y: view.bounds.size.height/2) //đặt toạ độ x,y cho LED
                    self.view.addSubview(LED)
                    makeTextField()
                    makeButton()
                    break
                }
                
                let image = UIImage(named: "green")
                let LED = UIImageView(image: image)
                LED.frame = CGRect(x: 0, y: 0, width: 30, height: 30) //xác định size của LED
                LED.center = CGPoint(x: margin + CGFloat(i-1)*spaceBallToBallx(), y: 100 + CGFloat(j-1)*spaceBallToBally()) //đặt toạ độ x,y cho LED
                self.view.addSubview(LED)
                makeTextField()
                makeButton()
            }
        }
        
    }
    
    func spaceBallToBallx() -> CGFloat {
        let space = ((self.view.bounds.size.width - 2*margin ) / CGFloat(n-1) )
        return space
    }
    
    func spaceBallToBally() -> CGFloat {
        let space = ((self.view.bounds.size.height - 2*100 ) / CGFloat(n-1) )
        return space
    }
    
    func makeTextField() {
        tf = UITextField(frame: CGRect(x: 30, y: 30, width: 100, height: 30))
        tf.backgroundColor = UIColor.white
        tf.borderStyle = UITextBorderStyle.line
        tf.placeholder = "n = "
        self.view.addSubview(tf)
    }
    
    func makeButton() {
        let btn: UIButton = UIButton(frame: CGRect(x: 150, y: 30, width: 50, height: 30))
        btn.backgroundColor = #colorLiteral(red: 0.2395173382, green: 1, blue: 0.100363549, alpha: 1)
        self.view.addSubview(btn)
        btn.setTitle("Draw", for: .normal)
        btn.addTarget(self, action: #selector(drawBall), for: .touchUpInside)
        self.view.addSubview(btn)
        
        
        
    }
    
    
    
}

