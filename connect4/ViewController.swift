//
//  ViewController.swift
//  connect4
//
//  Created by YC on 10/26/17.
//  Copyright © 2017 Bright Beam. All rights reserved.
//

import UIKit

// First Player is Blue and second player is Red
enum Player:Equatable {
    case empty
    case firstP
    case secondP
}
class ViewController: UIViewController {
    @IBOutlet weak var imageR0C0: UIImageView!
    @IBOutlet weak var imageR0C1: UIImageView!
    @IBOutlet weak var imageR0C2: UIImageView!
    @IBOutlet weak var imageR0C3: UIImageView!
    @IBOutlet weak var imageR0C4: UIImageView!
    @IBOutlet weak var imageR0C5: UIImageView!
    @IBOutlet weak var imageR0C6: UIImageView!
    
    @IBOutlet weak var imageR1C0: UIImageView!
    @IBOutlet weak var imageR1C1: UIImageView!
    @IBOutlet weak var imageR1C2: UIImageView!
    @IBOutlet weak var imageR1C3: UIImageView!
    @IBOutlet weak var imageR1C4: UIImageView!
    @IBOutlet weak var imageR1C5: UIImageView!
    @IBOutlet weak var imageR1C6: UIImageView!
    
    @IBOutlet weak var imageR2C0: UIImageView!
    @IBOutlet weak var imageR2C1: UIImageView!
    @IBOutlet weak var imageR2C2: UIImageView!
    @IBOutlet weak var imageR2C3: UIImageView!
    @IBOutlet weak var imageR2C4: UIImageView!
    @IBOutlet weak var imageR2C5: UIImageView!
    @IBOutlet weak var imageR2C6: UIImageView!
    
    @IBOutlet weak var imageR3C0: UIImageView!
    @IBOutlet weak var imageR3C1: UIImageView!
    @IBOutlet weak var imageR3C2: UIImageView!
    @IBOutlet weak var imageR3C3: UIImageView!
    @IBOutlet weak var imageR3C4: UIImageView!
    @IBOutlet weak var imageR3C5: UIImageView!
    @IBOutlet weak var imageR3C6: UIImageView!
    
    @IBOutlet weak var imageR4C0: UIImageView!
    @IBOutlet weak var imageR4C1: UIImageView!
    @IBOutlet weak var imageR4C2: UIImageView!
    @IBOutlet weak var imageR4C3: UIImageView!
    @IBOutlet weak var imageR4C4: UIImageView!
    @IBOutlet weak var imageR4C5: UIImageView!
    @IBOutlet weak var imageR4C6: UIImageView!
    
    @IBOutlet weak var imageR5C0: UIImageView!
    @IBOutlet weak var imageR5C1: UIImageView!
    @IBOutlet weak var imageR5C2: UIImageView!
    @IBOutlet weak var imageR5C3: UIImageView!
    @IBOutlet weak var imageR5C4: UIImageView!
    @IBOutlet weak var imageR5C5: UIImageView!
    @IBOutlet weak var imageR5C6: UIImageView!
    
    var board = [[Player]]()
    let NUMC = 7
    let NUMR = 6
    var turn = true     // turn value keeps track of whose turn in the game
    
    override func viewDidLoad() {
        super.viewDidLoad()
        startGame()
    }
    
    func startGame(){
        initializeBoardArray()
        initializeColorImages()
    }
    func restartGame(){
        emptyBoardArray()
        initializeColorImages()
    }
    
    func initializeBoardArray(){
        for _ in 0..<NUMR {
            board.append(Array(repeating:Player.empty, count:NUMC))
        }
    }
    func emptyBoardArray(){
        for row in 0..<NUMR {
            for col in 0..<NUMC {
                self.board[row][col] = Player.empty
            }
        }
    }
    
    func initializeColorImages(){
        let colorName = "white"
        // row 0
        self.imageR0C0.image = UIImage(named: colorName)
        self.imageR0C1.image = UIImage(named: colorName)
        self.imageR0C2.image = UIImage(named: colorName)
        self.imageR0C3.image = UIImage(named: colorName)
        self.imageR0C4.image = UIImage(named: colorName)
        self.imageR0C5.image = UIImage(named: colorName)
        self.imageR0C6.image = UIImage(named: colorName)
        
        // row 1
        self.imageR1C0.image = UIImage(named: colorName)
        self.imageR1C1.image = UIImage(named: colorName)
        self.imageR1C2.image = UIImage(named: colorName)
        self.imageR1C3.image = UIImage(named: colorName)
        self.imageR1C4.image = UIImage(named: colorName)
        self.imageR1C5.image = UIImage(named: colorName)
        self.imageR1C6.image = UIImage(named: colorName)
        
        // row 2
        self.imageR2C0.image = UIImage(named: colorName)
        self.imageR2C1.image = UIImage(named: colorName)
        self.imageR2C2.image = UIImage(named: colorName)
        self.imageR2C3.image = UIImage(named: colorName)
        self.imageR2C4.image = UIImage(named: colorName)
        self.imageR2C5.image = UIImage(named: colorName)
        self.imageR2C6.image = UIImage(named: colorName)
        
        // row 3
        self.imageR3C0.image = UIImage(named: colorName)
        self.imageR3C1.image = UIImage(named: colorName)
        self.imageR3C2.image = UIImage(named: colorName)
        self.imageR3C3.image = UIImage(named: colorName)
        self.imageR3C4.image = UIImage(named: colorName)
        self.imageR3C5.image = UIImage(named: colorName)
        self.imageR3C6.image = UIImage(named: colorName)
        
        // row 4
        self.imageR4C0.image = UIImage(named: colorName)
        self.imageR4C1.image = UIImage(named: colorName)
        self.imageR4C2.image = UIImage(named: colorName)
        self.imageR4C3.image = UIImage(named: colorName)
        self.imageR4C4.image = UIImage(named: colorName)
        self.imageR4C5.image = UIImage(named: colorName)
        self.imageR4C6.image = UIImage(named: colorName)
        
        // row 5
        self.imageR5C0.image = UIImage(named: colorName)
        self.imageR5C1.image = UIImage(named: colorName)
        self.imageR5C2.image = UIImage(named: colorName)
        self.imageR5C3.image = UIImage(named: colorName)
        self.imageR5C4.image = UIImage(named: colorName)
        self.imageR5C5.image = UIImage(named: colorName)
        self.imageR5C6.image = UIImage(named: colorName)
        
    }
    
    func userTappedColumn(col:Int){
        let user = self.turn ? Player.firstP : Player.secondP
        userAction(userType:user, col: col)
        self.turn = !self.turn
    }
    @IBAction func column0Tapped(_ sender: Any) {
        userTappedColumn(col: 0)
    }
    @IBAction func column1Tapped(_ sender: Any) {
        userTappedColumn(col: 1)
    }
    @IBAction func column2Tapped(_ sender: Any) {
        userTappedColumn(col: 2)
    }
    @IBAction func column3Tapped(_ sender: Any) {
        userTappedColumn(col: 3)
    }
    @IBAction func column4Tapped(_ sender: Any) {
        userTappedColumn(col: 4)
    }
    @IBAction func column5Tapped(_ sender: Any) {
        userTappedColumn(col: 5)
    }
    @IBAction func column6Tapped(_ sender: Any) {
        userTappedColumn(col: 6)
    }
    func userAction(userType: Player,col:Int) {
        var row = 0
        if userType != Player.empty {
            while (row < NUMR){
                if board[row][col] == Player.empty{
                    board[row][col] = userType
                    fillBoard(userType: userType, row: row, col: col)
                    checkBoard(row: row, col: col)
                    break
                } else {
                    row += 1
                }
            }
        }
    }
    
    func printAlert (winner:String){
        let alert = UIAlertController(title: "Game over", message: "Winner is \(winner)", preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title:"Ok", style: UIAlertActionStyle.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
        
        let when = DispatchTime.now() + 3
        DispatchQueue.main.asyncAfter(deadline: when) {
            self.restartGame()
        }
    }
    
    func checkBoard(row:Int, col:Int){
        let value = board[row][col]
        let winner = (value == Player.firstP) ? "Blue" : "Red"
        
        // go right
        var r = row
        var c = col
        var count = 1
        while (c < NUMC-1 ) && board[r][c+1] == value {
            count += 1
            c += 1
            if count == 4 {
                print("player \(value) wins in row:\(row), col:\(col)")
                printAlert(winner: winner)
            }
        }
        
        // go left
        r = row
        c = col
        count = 1
        while (c > 0 ) && board[r][c-1] == value {
            count += 1
            c -= 1
            if count == 4 {
                print("player \(value) wins in row:\(row), col:\(col)")
                printAlert(winner: winner)
            }
        }
        
        // go down
        count = 1
        r = row
        c = col
        while (r > 0 ) && board[r-1][c] == value {
            count += 1
            r -= 1
            if count == 4 {
                print("player \(value) wins in row:\(row), col:\(col)")
                printAlert(winner: winner)
            }
        }
        
        // go right-down
        count = 1
        r = row
        c = col
        while (r > 0 ) && (c < NUMC-1 ) && board[r-1][c+1] == value {
            count += 1
            r -= 1
            c += 1
            if count == 4 {
                print("player \(value) wins in row:\(row), col:\(col)")
                printAlert(winner: winner)
            }
        }
        
        // go left-down
        count = 1
        r = row
        c = col
        while (r > 0 ) && (c > 0 ) && board[r-1][c-1] == value {
            count += 1
            r -= 1
            c -= 1
            if count == 4 {
                print("player \(value) wins in row:\(row), col:\(col)")
                printAlert(winner: winner)
            }
        }
        
        // go right-up
        count = 1
        r = row
        c = col
        while (r < NUMR-1 ) && (c < NUMC-1 ) && board[r+1][c+1] == value {
            count += 1
            r += 1
            c += 1
            if count == 4 {
                print("player \(value) wins in row:\(row), col:\(col)")
                printAlert(winner: winner)
            }
        }
        
        // go left-up
        count = 1
        r = row
        c = col
        while (r < NUMR-1 ) && (c > 0 ) && board[r+1][c-1] == value {
            count += 1
            r += 1
            c -= 1
            if count == 4 {
                print("player \(value) wins in row:\(row), col:\(col)")
                printAlert(winner: winner)
            }
        }
    }
    
    func fillBoard(userType:Player, row:Int, col:Int){
        let colorName = (userType == Player.firstP) ? "blue":"red"
        
            // row 0
        if row == 0 && col == 0 {
            self.imageR0C0.image = UIImage(named: colorName)
        }
        else if row == 0 && col == 1 {
            self.imageR0C1.image = UIImage(named: colorName)
        }
        else if row == 0 && col == 2 {
            self.imageR0C2.image = UIImage(named: colorName)
        }
        else if row == 0 && col == 3 {
            self.imageR0C3.image = UIImage(named: colorName)
        }
        else if row == 0 && col == 4 {
            self.imageR0C4.image = UIImage(named: colorName)
        }
        else if row == 0 && col == 5 {
            self.imageR0C5.image = UIImage(named: colorName)
        }
        else if row == 0 && col == 6 {
            self.imageR0C6.image = UIImage(named: colorName)
        }
        
            // row 1
        else if row == 1 && col == 0 {
            self.imageR1C0.image = UIImage(named: colorName)
        }
        else if row == 1 && col == 1 {
            self.imageR1C1.image = UIImage(named: colorName)
        }
        else if row == 1 && col == 2 {
            self.imageR1C2.image = UIImage(named: colorName)
        }
        else if row == 1 && col == 3 {
            self.imageR1C3.image = UIImage(named: colorName)
        }
        else if row == 1 && col == 4 {
            self.imageR1C4.image = UIImage(named: colorName)
        }
        else if row == 1 && col == 5 {
            self.imageR1C5.image = UIImage(named: colorName)
        }
        else if row == 1 && col == 6 {
            self.imageR1C6.image = UIImage(named: colorName)
        }
            
            // row 2
        else if row == 2 && col == 0 {
            self.imageR2C0.image = UIImage(named: colorName)
        }
        else if row == 2 && col == 1 {
            self.imageR2C1.image = UIImage(named: colorName)
        }
        else if row == 2 && col == 2 {
            self.imageR2C2.image = UIImage(named: colorName)
        }
        else if row == 2 && col == 3 {
            self.imageR2C3.image = UIImage(named: colorName)
        }
        else if row == 2 && col == 4 {
            self.imageR2C4.image = UIImage(named: colorName)
        }
        else if row == 2 && col == 5 {
            self.imageR2C5.image = UIImage(named: colorName)
        }
        else if row == 2 && col == 6 {
            self.imageR2C6.image = UIImage(named: colorName)
        }
            
            // row 3
        else if row == 3 && col == 0 {
            self.imageR3C0.image = UIImage(named: colorName)
        }
        else if row == 3 && col == 1 {
            self.imageR3C1.image = UIImage(named: colorName)
        }
        else if row == 3 && col == 2 {
            self.imageR3C2.image = UIImage(named: colorName)
        }
        else if row == 3 && col == 3 {
            self.imageR3C3.image = UIImage(named: colorName)
        }
        else if row == 3 && col == 4 {
            self.imageR3C4.image = UIImage(named: colorName)
        }
        else if row == 3 && col == 5 {
            self.imageR3C5.image = UIImage(named: colorName)
        }
        else if row == 3 && col == 6 {
            self.imageR3C6.image = UIImage(named: colorName)
        }
            
            // row 4
        else if row == 4 && col == 0 {
            self.imageR4C0.image = UIImage(named: colorName)
        }
        else if row == 4 && col == 1 {
            self.imageR4C1.image = UIImage(named: colorName)
        }
        else if row == 4 && col == 2 {
            self.imageR4C2.image = UIImage(named: colorName)
        }
        else if row == 4 && col == 3 {
            self.imageR4C3.image = UIImage(named: colorName)
        }
        else if row == 4 && col == 4 {
            self.imageR4C4.image = UIImage(named: colorName)
        }
        else if row == 4 && col == 5 {
            self.imageR4C5.image = UIImage(named: colorName)
        }
        else if row == 4 && col == 6 {
            self.imageR4C6.image = UIImage(named: colorName)
        }
            
            // row 5
        else if row == 5 && col == 0 {
            self.imageR5C0.image = UIImage(named: colorName)
        }
        else if row == 5 && col == 1 {
            self.imageR5C1.image = UIImage(named: colorName)
        }
        else if row == 5 && col == 2 {
            self.imageR5C2.image = UIImage(named: colorName)
        }
        else if row == 5 && col == 3 {
            self.imageR5C3.image = UIImage(named: colorName)
        }
        else if row == 5 && col == 4 {
            self.imageR5C4.image = UIImage(named: colorName)
        }
        else if row == 5 && col == 5 {
            self.imageR5C5.image = UIImage(named: colorName)
        }
        else if row == 5 && col == 6 {
            self.imageR5C6.image = UIImage(named: colorName)
        }
        
    }
    
}
