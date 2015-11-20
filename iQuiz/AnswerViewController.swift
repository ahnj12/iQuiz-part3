//
//  AnswerViewController.swift
//  iQuiz
//
//  Created by Jooneil Ahn on 11/12/15.
//  Copyright © 2015 Jooneil Ahn. All rights reserved.
//

import UIKit

class AnswerViewController: UIViewController {

    @IBOutlet weak var correctAnswer: UILabel!
    @IBOutlet weak var givenAnswer: UILabel!
    @IBOutlet weak var questionLabel: UILabel!
    
    var given = String()
    var question = Dictionary<String, AnyObject>()
    var questions = [Dictionary<String, AnyObject>]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let questionText = question["text"]!
        
        self.questionLabel.text = "The question was: \(questionText)"
        
        let answerIndex = Int(question["answer"] as! String)! - 1
        let answerArray = question["answers"] as! NSArray
        let answer = answerArray[answerIndex] as! String
        
        self.correctAnswer.text = "The correct answer is: \(answer)"
        
        if given == answer {
            
            self.givenAnswer.text = "You got it right!"
        } else {
            self.givenAnswer.text = "You got it wrong!"
        }

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let view = segue.destinationViewController as! QuestionViewController
        view.questions = questions
    }
    

}
