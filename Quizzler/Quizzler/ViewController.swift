import UIKit

class ViewController: UIViewController {

  private let questions = QuestionBank()
  private var answerPicked = false
  private var questionNumber = 0
  private var score = 0

  @IBOutlet weak var questionLabel: UILabel!
  @IBOutlet weak var scoreLabel: UILabel!
  @IBOutlet var progressBar: UIView!
  @IBOutlet weak var progressLabel: UILabel!

  override func viewDidLoad() {
    super.viewDidLoad()
    nextQuestion()
  }


  @IBAction func answerPressed(_ sender: AnyObject) {
    answerPicked = sender.tag == 1
    checkAnswer()

    questionNumber += 1
    nextQuestion()
  }


  func updateUI() {
    scoreLabel.text = "\(score)"
    progressLabel.text = "\(questionNumber + 1) / \(questions.list.count)"
    progressBar.frame.size.width = (view.frame.size.width / 13) * CGFloat(questionNumber)
  }


  func nextQuestion() {
    if (questionNumber < questions.list.count) {
      questionLabel.text = questions.list[questionNumber].questionText
    } else {
      let alert = UIAlertController(title: "GJ!", message: "You are done!", preferredStyle: .alert)
      let restartAction = UIAlertAction(title: "Again?", style: .default) { (UIAlertAction) in
        self.startOver()
      }
      alert.addAction(restartAction)
      present(alert, animated: true, completion: nil)
    }
  }


  func checkAnswer() {
    let correctAnswer = questions.list[questionNumber].answer
    if (correctAnswer == answerPicked) {
      ProgressHUD.showSuccess("Correct")
      score += 1
    } else {
      ProgressHUD.showError("Wrong")
    }
    updateUI()
  }


  func startOver() {
    score = 0
    questionNumber = 0
    nextQuestion()
  }
}
