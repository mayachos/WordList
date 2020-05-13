//
//  AddViewController.swift
//  WordList
//
//  Created by maya on 2020/05/13.
//  Copyright © 2020 maya. All rights reserved.
//

import UIKit

class AddViewController: UIViewController {
    // 入力単語
    @IBOutlet var englishTextField: UITextField!
    @IBOutlet var japaneseTextField: UITextField!
    
    var wordArray: [Dictionary<String, String>] = []
    
    let saveData = UserDefaults.standard

    override func viewDidLoad() {
        super.viewDidLoad()
        if saveData.array(forKey: "WORD") != nil {
            wordArray = saveData.array(forKey: "WORD") as! [Dictionary<String, String>]
        }

        // Do any additional setup after loading the view.
    }
    
    //保存ボタン
    @IBAction func saveWord() {
        
        let wordDictionary = ["english": englishTextField.text!, "japanese": japaneseTextField.text!] //辞書
        if englishTextField.text != "" && japaneseTextField.text != ""{
        wordArray.append(wordDictionary) //ArrayにDictionaryを追加
        saveData.set(wordArray, forKey: "WORD")
        
        let alert = UIAlertController(
            title: "保存完了",
            message: "単語の登録が完了しました",
            preferredStyle: .alert
        )
        alert.addAction(UIAlertAction(
            title: "OK",
            style: .default,
            handler: nil
        ))
        present(alert, animated: true, completion: nil)
        englishTextField.text = ""
        japaneseTextField.text = ""
        } else if englishTextField.text == "" || japaneseTextField.text == ""{
            let alert = UIAlertController(
                title: "エラー",
                message: "単語を入力してください",
                preferredStyle: .alert
            )
            alert.addAction(UIAlertAction(
                title: "OK",
                style: .default,
                handler: nil
            ))
        present(alert, animated: true, completion: nil)
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
