//
//  ResultsViewController.swift
//  Roshambo
//

import UIKit


class ResultsViewController: UIViewController {

    // MARK: - Outlets

    @IBOutlet private weak var resultImage: UIImageView!
    @IBOutlet private weak var resultLabel: UILabel!

    // MARK: - Choices
    
    var userChoice: String!
    var opponentChoice: String!

    // MARK: - View Lifecycle Methods

    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        // Generate a random choice for the oponent
        let choices = ["Rock", "Paper", "Scissors"]
        let randomIndex = Int(arc4random() % 3)
        opponentChoice = choices[randomIndex]
        
        displayResult()
    }

    // MARK: - UI

    // The displayResult method generates the image and message for the results of a match.
    
    private func displayResult() {

        var imageName: String
        var text: String
        var youWon: Bool = false
        let matchup = "\(userChoice) vs. \(opponentChoice)"
        
        // Handle the tie
        if userChoice == opponentChoice {
            resultImage.image = UIImage(named: "tie")
            resultLabel.text = "\(matchup): it's a tie!"
            return
        }

        // Otherwise, figure out if you won
        switch (userChoice) {
            
        case "Rock":
            youWon = opponentChoice == "Scissors"
        
        case "Paper":
            youWon = opponentChoice == "Rock"
            
        default: // Scissors
            youWon = opponentChoice == "Paper"
        }

        // Create the text
        if youWon {
            text = "You Won! \(matchup)"
            imageName = "\(userChoice)-\(opponentChoice)".lowercaseString
        } else {
            text = "You Lost! \(matchup)"
            imageName = "\(opponentChoice)-\(userChoice)".lowercaseString
        }
        
        // Update the UI components
        resultImage.image = UIImage(named: imageName)
        resultLabel.text = text
    }

    // When the user wants to play again, we want to dismiss the current view
    // controller (this resutls view controller) so that the choice view controller
    // is expsed, and the player can choose again. 
    
    @IBAction private func playAgain() {
        dismissViewControllerAnimated(true, completion: nil)
    }
}
