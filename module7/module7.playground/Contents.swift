import Foundation

struct Question {
    var text: String
    var type: ResponseType
    var answers: [Answer]
}

struct Answer {
    var text: String
    var type: AnimalType
}

enum ResponseType {
    case single, multiple, ranged
}

enum AnimalType: String {
    case dog = "Dog"
    case cat = "Cat"
    case rabbit = "Rabbit"
    case turtle = "Turtle"
    
    var definition: String {
        switch self {
        case .dog:
            return "You are incredibly outgoing. You surround yourself with the people you love and enjoy activities with your friends."
        case .cat:
            return "Mischievous, yet mild-tempered, you enjoy doing things on your own terms."
        case .rabbit:
            return "You love everything that's soft. You are healthy and full of energy."
        case .turtle:
            return "You are wise beyond your years, and you focus on the details. Slow and steady wins the race."
        }
    }
}
// Sample questions
func loadQuestions() -> [Question] {
    return [
        Question(
            text: "Which food do you like the most?",
            type: .single,
            answers: [
                Answer(text: "Steak", type: .dog),
                Answer(text: "Fish", type: .cat),
                Answer(text: "Carrots", type: .rabbit),
                Answer(text: "Corn", type: .turtle)
            ]),
        Question(
            text: "Which activities do you enjoy?",
            type: .multiple,
            answers: [
                Answer(text: "Swimming", type: .turtle),
                Answer(text: "Sleeping", type: .cat),
                Answer(text: "Cuddling", type: .rabbit),
                Answer(text: "Eating", type: .dog)
            ]),
        Question(
            text: "How much do you enjoy car rides?",
            type: .ranged,
            answers: [
                Answer(text: "I dislike them", type: .cat),
                Answer(text: "I get a little nervous", type: .rabbit),
                Answer(text: "I barely notice them", type: .turtle),
                Answer(text: "I love them", type: .dog)
            ])
    ]
}

var questions = loadQuestions()
var answersChosen: [Answer] = []

func displayQuestion(_ question: Question) {
    print(question.text)
    for (index, answer) in question.answers.enumerated() {
        print("\(index + 1): \(answer.text)")
    }
}
func simulateAnswer(for question: Question) {
    switch question.type {
    case .single:
        // Simulate selecting the first answer
        answersChosen.append(question.answers[0])
    case .multiple:
        // Simulate selecting the first and second answers
        answersChosen.append(contentsOf: [question.answers[0], question.answers[1]])
    case .ranged:
        // Simulate selecting the middle answer
        answersChosen.append(question.answers[question.answers.count / 2])
    }
}
func calculatePersonalityResult() {
    var frequencyOfAnswers: [AnimalType: Int] = [:]
    
    let responseTypes = answersChosen.map { $0.type }
    
    for response in responseTypes {
        frequencyOfAnswers[response] = (frequencyOfAnswers[response] ?? 0) + 1
    }
    
    let mostCommonAnswer = frequencyOfAnswers.sorted { $0.value > $1.value }.first!.key
    
    print("You are a \(mostCommonAnswer.rawValue)!")
    print(mostCommonAnswer.definition)
}
for question in questions {
    displayQuestion(question)
    simulateAnswer(for: question)
}

calculatePersonalityResult()
