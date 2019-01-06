//
//  ViewController.swift
//  WhatsNew
//
//  Created by Prashant G on 1/5/19.
//  Copyright © 2019 Prashant G. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        whatsNewIfNeeded()
    }
    
    func whatsNewIfNeeded() {
        let items = [WhatsNew.Item(
                         title: "Video Search",
                         subtitle: "Show me the top ios features that are mostly used",
                         image: UIImage(named: "feature1")),
                     WhatsNew.Item(
                        title: "Transcription",
                        subtitle: "Get the latest information used by the users recently",
                        image: UIImage(named: "feature2")),
                     WhatsNew.Item(
                        title: "Really Awesome",
                        subtitle: "Getting new updates in ios 12 feels so awesome",
                        image: UIImage(named: "feature3")),
                     WhatsNew.Item(
                        title: "iOS Developers",
                        subtitle: "Lets follow some of the top ios devs now",
                        image: UIImage(named: "feature4")),
                     WhatsNew.Item(
                        title: "Transcription",
                        subtitle: "Get the latest information used by the users recently",
                        image: UIImage(named: "feature2")),
                     WhatsNew.Item(
                        title: "Really Awesome",
                        subtitle: "Getting new updates in ios 12 feels so awesome",
                        image: UIImage(named: "feature3"))
        ]
        
        // Initialize DetailButton with title and open website at url
        let detailButton = WhatsNewViewController.DetailButton(
            title: "Read more",
            action: .website(url: "https://github.com/PrashantGaikwad-iOS")
        )
        
//        // Initialize DetailButton with title and custom action
//        let detailButton = WhatsNewViewController.DetailButton(
//            title: "Read more",
//            action: .custom(action: { [weak self] whatsNewViewController in
//                // Perform custom action on detail button pressed
//            })
//        )
        
        let theme = WhatsNewViewController.Theme { configuration in
            configuration.apply(animation: .fade)
            configuration.backgroundColor = UIColor.black
            configuration.titleView.titleColor = UIColor.white
            configuration.itemsView.titleColor = UIColor.white
            configuration.itemsView.subtitleColor = UIColor.lightGray
            configuration.completionButton.backgroundColor = UIColor.darkGray
            configuration.detailButton = detailButton
            configuration.detailButton?.titleColor = .red
        }
        
        let config = WhatsNewViewController.Configuration(theme: theme)
        
        let whatsNew = WhatsNew(title: "Whats New", items: items)
        
        let keyValueVersionStore = KeyValueWhatsNewVersionStore(keyValueable: UserDefaults.standard)
        
        let whatsNewVC = WhatsNewViewController(whatsNew: whatsNew, configuration: config, versionStore: keyValueVersionStore)
        
        if let vc = whatsNewVC {
            self.present(vc, animated: true, completion: nil)
        }
    }


}

