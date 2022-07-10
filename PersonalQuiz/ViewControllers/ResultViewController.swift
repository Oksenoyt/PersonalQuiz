//
//  ResultViewController.swift
//  PersonalQuiz
//
//  Created by Alexey Efimov on 07.07.2022.
//

import UIKit

class ResultViewController: UIViewController {
    
    @IBOutlet var animalLabel: UILabel!
    @IBOutlet var descriptionLabel: UILabel!
    
    var answers: [Answer]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        animalLabel.text = "\(findingAnimal()?.rawValue ?? " ")"
        descriptionLabel.text = "\(findingAnimal()?.definition ?? " ")"
        navigationItem.setHidesBackButton(true, animated: false)
    }
    
    @IBAction func doneButtonPressed(_ sender: UIBarButtonItem) {
        navigationController?.dismiss(animated: true)
    }
    
}

extension ResultViewController {

    private func findingAnimal() -> Animal? {
        
        var separetedAnswers: [Animal] = []
        for answer in answers {
            separetedAnswers.append(answer.animal)
        }
        
        let mappedAnswers = separetedAnswers.map { ($0, 1) }
        let finalAnimal = Dictionary(mappedAnswers, uniquingKeysWith: +)
        let sortedAnimals = finalAnimal.sorted { $0.value > $1.value }

        return sortedAnimals.first?.key
    }
}
