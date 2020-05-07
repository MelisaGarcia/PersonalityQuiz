//
//  ResultsViewController.swift
//  PersonalityQuiz
//
//  Created by Andrea Dancek on 2020-05-06.
//  Copyright © 2020 Melisa Garcia. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {
    
    @IBOutlet var resultAnswerLabel: UILabel!
    @IBOutlet var resultDefinitionLabel: UILabel!
    var responses : [Answer]!

    override func viewDidLoad() {
        super.viewDidLoad()

        calculatePersonalityResult()
        navigationItem.hidesBackButton = true
    }
    func calculatePersonalityResult(){
        var frequencyOfAnswers: [AnimalType: Int ] = [:]
        let responseTypes = responses.map{ $0.type}
        
        for response in responseTypes{
            let newCount: Int
            
            if let oldCount = frequencyOfAnswers[response]{
                newCount = oldCount + 1
            }else {
                newCount = 1
            }
            frequencyOfAnswers[response] = newCount
        }
        let frequentAnswerSorted = frequencyOfAnswers.sorted(by: { (pair1, pair2) -> Bool in
            return pair1.value>pair2.value
        })
        
        let mostcommonAnswer = frequentAnswerSorted.first!.key
        resultAnswerLabel.text = "You are a \(mostcommonAnswer.rawValue)!"
        resultDefinitionLabel.text = mostcommonAnswer.definition
    }

}
