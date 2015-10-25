//
//  ResultViewController.swift
//  SyllableQuiz
//
//  Created by 矢吹祐真 on 2015/08/11.
//  Copyright (c) 2015年 矢吹祐真. All rights reserved.
//

import UIKit
import Social

class ResultViewController: UIViewController {

    //変数を宣言
    var correctAnswer:Int = 0
    var minusPoint:Int = 0
    var rank:String = "Beginner"
    var clearTimes:Int = 0
    
    //ラベルを宣言
    @IBOutlet var scoreLabel:UILabel!
    @IBOutlet var clearTimesLabel:UILabel!
    @IBOutlet var rankLabel:UILabel!
    
    //合否イメージの宣言
    @IBOutlet var clearImage:UIImageView!
    
    //背景イメージの宣言
    @IBOutlet var rankImage:UIImageView!
    
    //合格バッジイメージの宣言
    @IBOutlet var badge:UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        badge.hidden = true
        
        
        //合格回数を保存する変数
        let clearUd = NSUserDefaults.standardUserDefaults()
        //合格回数を呼び出す
        clearTimes = clearUd.integerForKey("goukaku")
        
        
        if correctAnswer >= 8{
            
            badge.hidden = false
            
            clearTimes++
            //合格回数を保存
            clearUd.setInteger(clearTimes, forKey: "goukaku")

            //正解数と合格の表示
            scoreLabel.text = "正解数は\(correctAnswer)問、合格です"
        } else {
            //正解数の表示
            scoreLabel.text = "正解数は\(correctAnswer)問、不合格です"
        }
        
        clearTimesLabel.text = "通算合格回数\(clearTimes)回"
        
        if correctAnswer == 8{
            clearImage.image = UIImage(named: "star01")
        }
        else if correctAnswer == 9{
            clearImage.image = UIImage(named: "star02")
        }
        else if correctAnswer == 10{
            clearImage.image = UIImage(named: "star03")
        }
        if clearTimes >= 100{
            rank = "師匠"
            rankLabel.text = "ランク：\(rank)"
        } else if clearTimes >= 50{
            rank = "1級"
            rankLabel.text = "ランク：\(rank)"
        } else if clearTimes >= 25{
            rank = "2級"
            rankLabel.text = "ランク：\(rank)"
        } else if clearTimes >= 15{
            rank = "3級"
            rankLabel.text = "ランク：\(rank)"
        } else if clearTimes >= 10{
            rank = "4級"
            rankLabel.text = "ランク：\(rank)"
        } else if clearTimes >= 5{
            rank = "5級"
            rankLabel.text = "ランク：\(rank)"
        } else {
            rank = "初心者"
            rankLabel.text = "ランク：\(rank)"
        }
        
    }
    
    
    //Facebook投稿メソッド
    @IBAction func postFacebook(sender: AnyObject) {
        //Facebook投稿用定数を作成
        let fbVC:SLComposeViewController = SLComposeViewController(forServiceType: SLServiceTypeFacebook)!
        //投稿テキストを設定
        fbVC.setInitialText("私のSyllableQuizランクは\(rank)! 合格回数は\(clearTimes)回です!")
        //投稿画像を設定
        fbVC.addImage(UIImage(named: "iconforupload.png"))
        //投稿コントローラーを起動
        self.presentViewController(fbVC, animated: true, completion: nil)
    }
    //Twitter投稿メソッド
    @IBAction func postTwitter(sender: AnyObject) {
        //Twitter投稿用定数を作成
        let twVC:SLComposeViewController = SLComposeViewController(forServiceType: SLServiceTypeTwitter)!
        //投稿テキストを設定
        twVC.setInitialText("私のSyllableQuizランクは\(rank)! 合格回数は\(clearTimes)回です!")
        //投稿画像を設定
        twVC.addImage(UIImage(named: "iconforupload.png"))
        //投稿コントローラーを起動
        self.presentViewController(twVC, animated: true, completion: nil)
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
