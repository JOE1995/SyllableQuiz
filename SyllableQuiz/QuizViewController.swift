//
//  QuizViewController.swift
//  SyllableQuiz
//
//  Created by 矢吹祐真 on 2015/08/11.
//  Copyright (c) 2015年 矢吹祐真. All rights reserved.
//

import UIKit

class QuizViewController: UIViewController {
    
    //表示するクイズと答えを入れる配列を宣言
    var quizArray = [AnyObject]()
    
    //変数を宣言
    var correctAnswer:Int = 0
    var minusPoint:Int = 0
    var numberOfQuiz = 1
    var minus:Int = 0
    var lives:Int = 3
    var time:Int = 5
    var timer: NSTimer = NSTimer()
    
    //クイズを表示するラベルの宣言
    @IBOutlet var quizLabel:UILabel!
    
    //選択肢ボタンの宣言
    @IBOutlet var choiceButton1: UIButton!
    @IBOutlet var choiceButton2: UIButton!
    @IBOutlet var choiceButton3: UIButton!
    
    //Nextボタンの宣言
    @IBOutlet var nextButton: UIButton!
    
    
    //タイマー表示するためのラベルの宣言
    @IBOutlet var timerLabel: UILabel!
    
    //何問目か表示するためのラベルの宣言
    @IBOutlet var label:UILabel!
    
    //背景の宣言
    @IBOutlet var backImage:UIImageView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // Do any additional setup after loading the view.
        var tmpArray = [AnyObject]()
        tmpArray.append(["comfortable","3","4","5",2,"com-for-ta-ble"])
        tmpArray.append(["idea","1","2","3",3,"i-de-a"])
        tmpArray.append(["water","1","2","3",2,"wa-ter"])
        tmpArray.append(["beautiful","2","3","4",2,"beau-ti-ful"])
        tmpArray.append(["snake","1","2","3",1,"snake"])
        tmpArray.append(["strong","1","2","3",1,"stong"])
        tmpArray.append(["complicated","3","4","5",2,"com-pli-cat-ed"])
        tmpArray.append(["practice","2","3","4",2,"prac-tice"])
        tmpArray.append(["English","2","3","4",1,"Eng-lish"])
        tmpArray.append(["understand","3","4","5",1,"un-der-stand"])
        tmpArray.append(["follower","1","2","3",3,"fol-low-er"])
        tmpArray.append(["twitter","1","2","3",2,"twit-ter"])
        tmpArray.append(["experience","3","4","5",2,"ex-pe-ri-ence"])
        tmpArray.append(["abillity","2","3","4",3,"a-bil-li-ty"])
        tmpArray.append(["toilet","2","3","4",1,"toi-let"])
        tmpArray.append(["wrong","1","2","3",1,"wrong"])
        tmpArray.append(["wonderful","3","4","5",1,"wond-er-ful"])
        tmpArray.append(["alien","2","3","4",1,"a-lien"])
        tmpArray.append(["dictionary","2","3","4",3,"dic-tio-na-ry"])
        tmpArray.append(["night","1","2","3",1,"night"])
        tmpArray.append(["society","2","3","4",3,"so-ci-e-ty"])
        tmpArray.append(["apple","1","2","3",2,"ap-ple"])
        tmpArray.append(["especially","4","5","6",2,"es-pe-cial-ly"])
        tmpArray.append(["medicine","2","3","4",2,"med-i-cine"])
        tmpArray.append(["hierarchy","4","5","6",1,"hi-er-ar-chy"])
        tmpArray.append(["essential","3","4","5",1,"es-sen-tial"])
        tmpArray.append(["egg","1","2","3",1,"egg"])
        tmpArray.append(["eight","1","2","3",1,"eight"])
        tmpArray.append(["elementary","4","5","6",2,"ele-men-ta-ry"])
        tmpArray.append(["biology","2","3","4",3,"bi-ol-o-gy"])
        tmpArray.append(["physic","2","3","4",1,"phys-ics"])
        tmpArray.append(["classmate","2","3","4",1,"class-mate"])
        tmpArray.append(["bicycle","2","3","4",2,"bi-cy-cle"])
        tmpArray.append(["moral","2","3","4",1,"mor-al"])
        tmpArray.append(["foreign","2","3","4",1,"for-eign"])
        tmpArray.append(["japan","2","3","4",1,"ja-pan"])
        tmpArray.append(["strawberry","3","4","5",1,"st-raw-berry"])
        tmpArray.append(["respect","2","3","4",1,"re-spect"])
        tmpArray.append(["identitiy","3","4","5",2,"i-den-ti-ty"])
        tmpArray.append(["special","2","3","4",1,"spe-cial"])
        tmpArray.append(["rainbow","2","3","4",1,"rain-bow"])
        tmpArray.append(["diary","2","3","4",2,"di-a-ry"])
        tmpArray.append(["lose","1","2","3",1,"lose"])
        tmpArray.append(["proud","1","2","3",1,"proud"])
        tmpArray.append(["child","1","2","3",1,"child"])
        tmpArray.append(["great","1","2","3",1,"great"])
        tmpArray.append(["computer","2","3","4",2,"com-put-er"])
        tmpArray.append(["scary","1","2","3",2,"scar-y"])
        tmpArray.append(["moisture","2","3","4",1,"mois-ture"])
        tmpArray.append(["graduate","2","3","4",2,"gra-du-ate"])
        tmpArray.append(["responsible","3","4","5",2,"re-spon-si-ble"])
        tmpArray.append(["able","1","2","3",2,"able"])
        tmpArray.append(["difference","3","4","5",1,"dif-fer-ence"])
        
        
        while (tmpArray.count > 0){
            
            //tmpArrayの総数内でランダムに整数を生成
            let index = Int(arc4random_uniform(UInt32(tmpArray.count)))
            
            //ランダムに選ばれたtmpArrayをquizArrayに格納
            quizArray.append(tmpArray[index])
            
            //ランダムに選ばれたtmpArrayを消去
            tmpArray.removeAtIndex(index)
        }
        
        displayQuiz()
        timerSetUp()
    }
    
    //問題文をラベルに、選択肢をボタンに表示するメソッド
    func displayQuiz(){
        
        //quizaOfNumberを表示
        label.text = "\(numberOfQuiz)/10 問目"
        
        //quizArrayの中身を消去
        quizArray.removeAtIndex(0)
        choiceButton1.hidden = false
        choiceButton2.hidden = false
        choiceButton3.hidden = false
        
        //Quizをボタンに表示
        quizLabel.text = quizArray[0][0] as? String
        choiceButton1.setTitle(quizArray[0][1] as? String, forState: .Normal)
        choiceButton2.setTitle(quizArray[0][2] as? String, forState: .Normal)
        choiceButton3.setTitle(quizArray[0][3] as? String, forState: .Normal)
        numberOfQuiz++
        nextButton.hidden = true
        //背景変更
        backImage.image = UIImage(named: "Syllable UIM.png")
        
        //タイマー再開
        if !timer.valid{
            //タイマーが作動していなかったら動かす
            timer = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: "up", userInfo: nil, repeats: true)
        }
        
    }
    
    
    @IBAction func choiceAnswer(sender: UIButton){
        
        print("sender.tag:\(sender.tag)")
        
        
        if quizArray[0][4] as! Int == sender.tag
            
            //選んだ選択肢が正解だった場合
        {
            //正解数を増やす
            correctAnswer++
            
            //背景変更
            backImage.image = UIImage(named: "Syllable UIG.png")
            
            hideChoiceButton()
            showTheAnswer()
        } else
            
            //選んだ選択肢が不正解だった場合
        {
            //minusPointが１減る
            minusPoint--
            
            //背景変更
            backImage.image = UIImage(named: "Syllable UIR.png")
            
            //livesが１減る
            lives--
            
            
            hideChoiceButton()
            showTheAnswer()
        }
        
/*        //livesが０になったら、ゲームオーバー画面にいくメソッドを呼ぶ
        if lives == 0{
            timer.invalidate()
            performSegueToStart()
            
        }
*/        
        
    }
    
    @IBAction func goToNext(sender: UIButton){
        
        //問題が10コ終わったら、結果画面にいくメソッドを呼ぶ
        if numberOfQuiz > 10{
            timer.invalidate()
            performSegueToReslt()
        } else {
            displayQuiz()
        }
    }
    
    
    //toResulViewセグエを呼び出すメソッド
    func performSegueToReslt(){
        performSegueWithIdentifier("toResultView", sender: nil)
    }
    
    //toStartViewセグエを呼び出すメソッド
    func performSegueToStart(){
        performSegueWithIdentifier("toStartView", sender: nil)
    }
    
    //タイマーをセットするメソッド
    func timerSetUp(){
        time  = 30
        if !timer.valid{
            //タイマーが作動していなかったら動かす
            timer = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: "up", userInfo: nil, repeats: true)
        }
    }
    
    //タイマーを動かすupメソッド
    func up(){
        //timeを時間経過した分(1秒)引く
        time = time - 1
        //time(残り時間)をtimeLableに表示
        timerLabel.text = String(time)
        
        if time == 0
            //timeが０のとき（制限時間オーバー）
        {
            //タイマーのストップ
            timer.invalidate()
            
            
            //アラートの設置
            let alert = UIAlertController(title: "時間切れ", message: "もう一度やってみよう", preferredStyle: UIAlertControllerStyle.Alert)
            alert.addAction(UIAlertAction(title: "スタート画面に戻る", style: UIAlertActionStyle.Default, handler: {action in self.performSegueToStart()}))
            presentViewController(alert, animated: true, completion:nil)
            
        }
    }
    func showTheAnswer(){
        quizLabel.text = quizArray[0][5] as? String
        //解説表示中はタイマーをストップ
        timer.invalidate()
    }
    
    func hideChoiceButton(){
        choiceButton1.hidden = true
        choiceButton2.hidden = true
        choiceButton3.hidden = true
        nextButton.hidden = false
    }
    
    //correctPointとminusPointの受け渡し
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "toResultView"{
            let resultView = segue.destinationViewController as! ResultViewController
            resultView.correctAnswer = self.correctAnswer
            resultView.minusPoint = self.minusPoint
        }
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
