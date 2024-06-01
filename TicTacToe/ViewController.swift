import UIKit // Импортирует UIKit, фреймворк для разработки пользовательского интерфейса для iOS.

class ViewController: UIViewController { // Объявляет класс ViewController, который наследуется от UIViewController.

    enum Mark: String { // Определяет перечисление Mark с типом String.
        case X = "X" // Определяет значение X для Mark.
        case O = "O" // Определяет значение O для Mark.
    }
    
    @IBOutlet weak var lblTurn: UILabel! // Объявляет метку lblTurn, которая будет отображать текущий ход.
    
    // Объявляет кнопки btn0 - btn8, которые представляют ячейки игрового поля.
    @IBOutlet weak var btn0: UIButton!
    @IBOutlet weak var btn1: UIButton!
    @IBOutlet weak var btn2: UIButton!
    @IBOutlet weak var btn3: UIButton!
    @IBOutlet weak var btn4: UIButton!
    @IBOutlet weak var btn5: UIButton!
    @IBOutlet weak var btn6: UIButton!
    @IBOutlet weak var btn7: UIButton!
    @IBOutlet weak var btn8: UIButton!
    
    var board: [UIButton] = [] // Объявляет массив board, который будет содержать все кнопки игрового поля.

    var turn: Mark = Mark.X // Объявляет переменную turn, которая будет хранить текущий ход.
    var crosses: Int = 0 // Объявляет переменную crosses, которая будет хранить количество побед крестиков.
    var noughts: Int = 0 // Объявляет переменную noughts, которая будет хранить количество побед ноликов.
    
    override func viewDidLoad() { // Этот метод вызывается после загрузки представления.
        super.viewDidLoad() // Вызывает метод viewDidLoad суперкласса.
        
        createBoard() // Вызывает метод createBoard для создания игрового поля.
    }
    
    func createBoard() { // Этот метод создает игровое поле.
        board.append(contentsOf: [btn0, btn1, btn2, btn3, btn4, btn5, btn6, btn7, btn8]) // Добавляет все кнопки в массив board.
    }
    
    func isBoardFull()->Bool { // Этот метод проверяет, заполнено ли игровое поле.
        for btn in board { // Перебирает все кнопки в массиве board.
            if btn.attributedTitle(for: .normal)?.string == nil { // Если у кнопки нет заголовка, то возвращает false.
                return false
            }
        }
        return true // Если все кнопки имеют заголовок, то возвращает true.
    }
    
    func checkForVictory(checkFor mark: Mark)-> Bool { // Этот метод проверяет, есть ли победа для указанного знака.
        /// Победа по горизонтали
        if hasThisMark(btn0, mark) && hasThisMark(btn1, mark) && hasThisMark(btn2, mark) {
            return true
        }
        if hasThisMark(btn3, mark) && hasThisMark(btn4, mark) && hasThisMark(btn5, mark) {
            return true
        }
        if hasThisMark(btn6, mark) && hasThisMark(btn7, mark) && hasThisMark(btn8, mark) {
            return true
        }
        
        /// Победа по вертикали
        if hasThisMark(btn0, mark) && hasThisMark(btn3, mark) && hasThisMark(btn6, mark) {
            return true
        }
        if hasThisMark(btn1, mark) && hasThisMark(btn4, mark) && hasThisMark(btn7, mark) {
            return true
        }
        if hasThisMark(btn2, mark) && hasThisMark(btn5, mark) && hasThisMark(btn8, mark) {
            return true
        }
        
        /// Победа по диагонали
        if hasThisMark(btn0, mark) && hasThisMark(btn4, mark) && hasThisMark(btn8, mark) {
            return true
        }
        if hasThisMark(btn2, mark) && hasThisMark(btn4, mark) && hasThisMark(btn6, mark) {
            return true
        }
        
        return false // Если нет победы, то возвращает false.
    }
    
    func hasThisMark(_ button: UIButton, _ mark: Mark)->Bool { // Этот метод проверяет, имеет ли указанная кнопка указанный знак.
        return button.attributedTitle(for: .normal)?.string == mark.rawValue // Возвращает true, если заголовок кнопки равен значению знака.
    }
    
    func play(_ sender: UIButton) { // Этот метод выполняет ход.
        sender.setAttributedTitle(NSAttributedString(string: turn.rawValue, attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 60, weight: .heavy), NSAttributedString.Key.foregroundColor: UIColor.black]), for: .normal) // Устанавливает заголовок кнопки в значение текущего хода.

        sender.isEnabled = false // Делает кнопку неактивной.

        changeTurn() // Вызывает метод changeTurn для смены хода.
    }
    
    func changeTurn() { // Этот метод меняет ход.
        turn = turn == Mark.X ? Mark.O : Mark.X // Меняет значение turn на противоположное.
        lblTurn.text = turn.rawValue // Обновляет текст метки lblTurn.
    }
    
    func resetBoard() { // Этот метод сбрасывает игровое поле.
        for btn in self.board { // Перебирает все кнопки в массиве board.
            btn.isEnabled = true // Делает кнопку активной.
            btn.setAttributedTitle(NSAttributedString(string: ""), for: .normal) // Удаляет заголовок кнопки.
            btn.setNeedsLayout() // Запрашивает перерисовку макета кнопки.
            btn.layoutIfNeeded() // Выполняет перерисовку макета кнопки.
            btn.setNeedsDisplay() // Запрашивает перерисовку кнопки.
            btn.setAttributedTitle(nil, for: .normal) // Удаляет заголовок кнопки.
        }
    }

    func resultAlert(_ title: String) { // Этот метод отображает результат игры.
        let alertController = UIAlertController(title: title, message: "Crosses: \(crosses)\nNoughts: \(noughts)", preferredStyle: .actionSheet) // Создает контроллер представления для отображения результатов.
        
        alertController.addAction(UIAlertAction(title: "Reset", style: .default, handler: {(_) in // Добавляет действие "Reset" к контроллеру представления.
            self.resetBoard() // Вызывает метод resetBoard при выборе действия "Reset".
        }))
        
        present(alertController, animated: true) // Отображает контроллер представления.
    }
    
    @IBAction func btnCell_TUI(_ sender: UIButton) { // Этот метод вызывается при нажатии на ячейку игрового поля.
        guard sender.attributedTitle(for: .normal) == nil else {return} // Если у кнопки уже есть заголовок, то возвращает из функции.
        
        play(sender) // Вызывает метод play с кнопкой в качестве аргумента.
        
        if checkForVictory(checkFor: Mark.X) { // Если есть победа для крестиков, то...
            crosses += 1 // Увеличивает количество побед крестиков.
            resultAlert("Crosses Won!") // Отображает результат игры.
        }
        else if checkForVictory(checkFor: Mark.O) { // Если есть победа для ноликов, то...
            noughts += 1 // Увеличивает количество побед ноликов.
            resultAlert("Noughts Won!") // Отображает результат игры.
        }
        else if isBoardFull() { // Если игровое поле заполнено, то...
            resultAlert("It's a draw!") // Отображает результат игры.
        }
    }
}
