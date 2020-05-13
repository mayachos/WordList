//
//  QuestionViewController.swift
//  WordList
//
//  Created by maya on 2020/05/13.
//  Copyright © 2020 maya. All rights reserved.
//

import UIKit

class QuestionViewController: UIViewController {
    
    @IBOutlet var answerLabel: UILabel!
    @IBOutlet var questionLabel: UILabel!
    @IBOutlet var nextButton: UIButton!
    
    var isAnswered: Bool = false //回答したか、次の質問に行くかの判定
    var wordArray: [Dictionary<String, String>] = [] //UserDefaultsからとる配列
    var nowNumber: Int = 0 //現在の回答数
    let saveData = UserDefaults.standard //UserDefaultsからデータを取得

    override func viewDidLoad() {
        super.viewDidLoad()
        //answerを空欄
        answerLabel.text = ""
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        //配列にデータを代入
        wordArray = saveData.array(forKey: "WORD") as! [Dictionary<String, String>]
        //問題をシャッフル
        wordArray.shuffle()
        //配列の中身(辞書)のEnglishを出力
        questionLabel.text = wordArray[nowNumber]["english"]
    }
    //次へのボタンを押した処理
    @IBAction func nextButtonTapped() {
        //回答したか(Bool型)
        if isAnswered {
            //次の問題へ
            nowNumber += 1
            //answerを空欄
            answerLabel.text = ""
            
            //次の問題を表示するか
            if nowNumber < wordArray.count {
                //次の問題を表示
                questionLabel.text = wordArray[nowNumber]["english"]
                //isAnsweredをfalseに
                isAnswered = false
                //ボタンのタイトルを変更する
                nextButton.setTitle("答えを表示", for: .normal)
            } else {
                //nowNumberを初期化
                nowNumber = 0
                //FinishViewへ遷移
                performSegue(withIdentifier: "toFinishView", sender: nil)
            }
        } else {
            //答えを表示
            answerLabel.text = wordArray[nowNumber]["japanese"]
            //isAnsweredをtrue
            isAnswered = true
            //ボタンのタイトルを変更
            nextButton.setTitle("次へ", for: .normal)
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
