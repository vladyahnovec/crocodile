import Foundation

class ViewModel: ObservableObject {
    @Published var currentView = "HomeView"
    @Published var score = 0
    @Published var time: Int = 200
    var timer: Timer?
    
    @Published var word: Dictionary = Dictionary(word: "wehrwherj", image: "kot")
    
    @Published var dictionary: [Dictionary] = [
        Dictionary(word: "Кошка", image: "kot"),
        Dictionary(word: "Собака", image: "sobaka"),
        Dictionary(word: "Машина", image: "mashina"),
        Dictionary(word: "Дерево", image: "derevo"),
        Dictionary(word: "Книга", image: "kniga"),
        Dictionary(word: "Рыба", image: "riba"),
        Dictionary(word: "Дом", image: "dom"),
        Dictionary(word: "Море", image: "more"),
        Dictionary(word: "Птица", image: "ptica"),
        Dictionary(word: "Гора", image: "gora")
    ]
    
    func randomWord() {
        word = dictionary[Int.random(in: 0..<dictionary.count)]
    }
    
    func plusScore() {
        score += 1
    }
    
    func minusScore() {
        score -= 1
    }
    
    func startTimer() {
        timer?.invalidate()
        
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { [weak self] _ in
            guard let self = self else { return }
            
            if self.time > 0 {
                self.time -= 1
            } else {
                self.timer?.invalidate()
            }
        }
    }
    
    func stopTimer() {
        timer?.invalidate()
    }
}
