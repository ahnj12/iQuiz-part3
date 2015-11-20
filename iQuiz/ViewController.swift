//
//  ViewController.swift
//  iQuiz
//
//  Created by Jooneil Ahn on 11/3/15.
//  Copyright © 2015 Jooneil Ahn. All rights reserved.
//

import UIKit

struct Question {
    var question : String
    var answers : [String]
    var correctAnswer : String
}

class ViewController: UIViewController, UITableViewDataSource {
    
    let cellIdentifier = "quizCell"
    
    let quizzess = [
        ["Mathematics", "Test your math skills with this test", "math.png"],
        ["Marvel Super Heroes", "How much do you know about Marvel super heroes?", "marvel.png"],
        ["Science", "Check your knowledge of science", "science.png"]
    
    ]
    
    let quizPictures = ["science.png", "marvel.png", "math.png"]
    
    var newQuizzes = [Dictionary<String, AnyObject>]()
    
    let mathematicsQuiz = [Question(question: "2 + 2", answers: ["3", "4", "5", "6"], correctAnswer: "4"), Question(question: "2 * 2", answers: ["2","4","6","8"], correctAnswer: "4"), Question(question: "8 - 3", answers: ["4", "5","6","7"], correctAnswer: "5")]
    
    let marvelQuiz = [Question(question: "What is Thor's main weapon?", answers: ["sword", "mace", "hammer", "spear"], correctAnswer: "hammer"), Question(question: "What color is the Hulk's skin?", answers: ["blue", "green","purple","orange"], correctAnswer: "green"), Question(question: "Which super hero uses a shield?", answers: ["Captain America", "Wolverine", "Iron Man", "Spider Man"], correctAnswer: "Captain America")]
    
    let scienceQuiz = [Question(question: "Most common gas in Earth's atmosphere?", answers: ["oxygen", "nitrogen", "carbon", "hydrogen"], correctAnswer: "nitrogen"), Question(question: "The product of mass and velocity is?", answers: ["Kinetic energy", "Acceleration", "Momentum", "Force"], correctAnswer: "Momentum"), Question(question: "Which of these is NOT a simple machine?", answers: ["Pulley", "Screw", "Wedge", "Hammer"], correctAnswer: "Hammer")]
    
    @IBOutlet weak var quizTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let defaults = NSUserDefaults.standardUserDefaults()
        if let quizData = defaults.arrayForKey("quizData")
        {
            self.newQuizzes = quizData as! [Dictionary<String, AnyObject>]
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return newQuizzes.count
    }
    
    func tableView(tableView: UITableView,
        cellForRowAtIndexPath indexPath: NSIndexPath)
        -> UITableViewCell {
            let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath)
                as! quizCell
            let quiz = newQuizzes[indexPath.row]
            cell.cellTitle = quiz["title"] as! String
            cell.descript = quiz["desc"] as! String
            cell.imageSource?.image = UIImage(named: quizPictures[indexPath.row])
            return cell
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier! != "settings" {
            let cell = sender as! quizCell
            let questionController = segue.destinationViewController as! QuestionViewController
            
            switch cell.title.text! {
            case "Mathematics":
                questionController.questions = newQuizzes[2]["questions"] as! Array
            case "Marvel Super Heroes":
                questionController.questions = newQuizzes[1]["questions"] as! Array
            case "Science":
                questionController.questions = newQuizzes[0]["questions"] as! Array
            default :
                break
                
            }
        }
    }
    
    @IBAction func exit(segue: UIStoryboardSegue) {
        print("moved back to")
        self.quizTable.reloadData()
    }
    
}

