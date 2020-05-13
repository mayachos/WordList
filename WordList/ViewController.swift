//
//  ViewController.swift
//  WordList
//
//  Created by maya on 2020/05/13.
//  Copyright © 2020 maya. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    // Finishからスタートに戻る
    @IBAction func back(sender: UIStoryboardSegue) {
        
    }
    // startボタンの処理
    @IBAction func startButtonTapped() {
        //saveData(UserDefaults型)
        let saveData = UserDefaults.standard
        //WORDキーを使って配列があるか調べる
        if saveData.array(forKey: "WORD") != nil {
            //あれば、質問の画面へ
            if saveData.array(forKey: "WORD")!.count > 0 {
                performSegue(withIdentifier: "toQuestionView", sender: nil)
            }
        } else {
            //なければ、単語登録alert
            let alert = UIAlertController(
                title: "単語",
                message: "まずは「単語一覧」をタップして単語登録してください",
                preferredStyle: .alert
            )
            alert.addAction(UIAlertAction(
                title: "OK",
                style: .default,
                handler: nil
            ))
            
            self.present(alert, animated: true, completion: nil)
        }
    }

}

