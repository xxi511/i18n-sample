//
//  ViewController.swift
//  i18nTest
//
//  Created by 陳建佑 on 2020/1/3.
//  Copyright © 2020 Qnap. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var descLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        titleLabel.text = L10n.Welcome.title.localiz()
        descLabel.text = L10n.Welcome.description.localiz()
    }

    @IBAction func clickEngBtn(_ sender: Any) {
        changeLanguageTo(lang: .en)
    }
    
    @IBAction func clickZhTWBtn(_ sender: Any) {
        changeLanguageTo(lang: .zhHant)
    }
    
    private func changeLanguageTo(lang: Languages) {
        LanguageManager.shared.currentLanguage = lang
        LanguageManager.shared.setLanguage(language: lang, viewControllerFactory: { (title) -> UIViewController in
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            // the view controller that you want to show after changing the language
            return storyboard.instantiateInitialViewController()!
        }) { (view) in
            view.transform = CGAffineTransform(scaleX: 2, y: 2)
            view.alpha = 0
        }
    }
}

