//
//  ViewController.swift
//  BlackJack
//
//  Created by Alex Mathew on 2/16/15.
//  Copyright (c) 2015 Alex Mathew. All rights reserved.
//

import UIKit
import Darwin

class ViewController: UIViewController {

    @IBOutlet var dealerScore: UILabel!
    @IBOutlet var playerScore: UILabel!
    
    
    @IBOutlet var uiImageView1: UIImageView!
    @IBOutlet var uiImageView2: UIImageView!
    @IBOutlet var uiImageView3: UIImageView!
    @IBOutlet var uiImageView4: UIImageView!
    @IBOutlet var uiImageView5: UIImageView!
    
    @IBOutlet var uiImageView6: UIImageView!
    @IBOutlet var uiImageView7: UIImageView!
    @IBOutlet var uiImageView8: UIImageView!
    @IBOutlet var uiImageView9: UIImageView!
    @IBOutlet var uiImageView10: UIImageView!
    
    
    @IBOutlet var uiImageViewUser1: UIImageView!
    @IBOutlet var uiImageViewUser2: UIImageView!
    @IBOutlet var uiImageViewUser3: UIImageView!
    @IBOutlet var uiImageViewUser4: UIImageView!
    @IBOutlet var uiImageViewUser5: UIImageView!
    
    @IBOutlet var uiImageViewUser6: UIImageView!
    @IBOutlet var uiImageViewUser7: UIImageView!
    @IBOutlet var uiImageViewUser8: UIImageView!
    @IBOutlet var uiImageViewUser9: UIImageView!
    @IBOutlet var uiImageViewUser10: UIImageView!
    
    @IBOutlet var betText: UITextField!
    @IBOutlet var playerBalance: UILabel!
    
    @IBOutlet var betTextBox: UITextField!
    
    @IBOutlet var placeBetButton: UIButton!
    @IBOutlet var BetAmountLabel: UILabel!
   
    var dealerScoreVariable = 0
    var playerScoreVariable = 0
    var dealerAces = 0
    var playerAces = 0
    var dealerAcesScore = 0
    var playerAcesScore = 0
    
    var usedCards:[Int]=[]
    var balance = 100
    var betAmount = 0
    var playerCardCount = 2
    var dealerCardCount = 1
   
    
    
    //var random = 99
    
    
    var cardType:Dictionary<Int,String> = [1:"A",2:"2",3:"3",4:"4",5:"5",6:"6",7:"7",8:"8",9:"9",10:"Ten",11:"J",12:"K",13:"Q"]
    func startOver_New(alert: UIAlertAction!){
        dealerScoreVariable = 0
        playerScoreVariable = 0
        dealerAces = 0
        playerAces = 0
        dealerAcesScore = 0
        playerAcesScore = 0
        
        usedCards = []
        balance = 100
        betAmount = 0
        playerCardCount = 2
        dealerCardCount = 1
        
        
        dealerScore.text = "\(0)"
        playerScore.text = "\(0)"
        
        uiImageView1.image = nil
        uiImageView2.image = nil
        uiImageView3.image = nil
        uiImageView4.image = nil
        uiImageView5.image = nil
        
        uiImageView6.image = nil
        uiImageView7.image = nil
        uiImageView8.image = nil
        uiImageView9.image = nil
        uiImageView10.image = nil
        
        
        uiImageViewUser1.image = nil
        uiImageViewUser2.image = nil
        uiImageViewUser3.image = nil
        uiImageViewUser4.image = nil
        uiImageViewUser5.image = nil
        
        uiImageViewUser6.image = nil
        uiImageViewUser7.image = nil
        uiImageViewUser8.image = nil
        uiImageViewUser9.image = nil
        uiImageViewUser10.image = nil
        getBetAlert()
        initialDistribution()
        
        
        
    }

    func startOver(alert: UIAlertAction!){
         dealerScoreVariable = 0
         playerScoreVariable = 0
         dealerAces = 0
         playerAces = 0
         dealerAcesScore = 0
         playerAcesScore = 0
        
         usedCards = []
         //balance = 100
         betAmount = 0
         playerCardCount = 2
         dealerCardCount = 1
        
        
        dealerScore.text = "\(0)"
        playerScore.text = "\(0)"
        
        uiImageView1.image = nil
         uiImageView2.image = nil
         uiImageView3.image = nil
         uiImageView4.image = nil
         uiImageView5.image = nil
        
         uiImageView6.image = nil
         uiImageView7.image = nil
         uiImageView8.image = nil
         uiImageView9.image = nil
         uiImageView10.image = nil
        
        
         uiImageViewUser1.image = nil
         uiImageViewUser2.image = nil
         uiImageViewUser3.image = nil
         uiImageViewUser4.image = nil
         uiImageViewUser5.image = nil
        
         uiImageViewUser6.image = nil
         uiImageViewUser7.image = nil
         uiImageViewUser8.image = nil
         uiImageViewUser9.image = nil
         uiImageViewUser10.image = nil
        getBetAlert()
        initialDistribution()

        

    }
    
    func wordEntered(alert: UIAlertAction!){
        // store the new word
        if self.betText.text.isEmpty {
            betAmount = 0
            BetAmountLabel.text = "BET AMOUNT: \(betAmount)$"
        }
        else{
            
        
        balance = balance - self.betText.text.toInt()!
        playerBalance.text = "\(balance)$"
        betAmount = self.betText.text.toInt()!
        BetAmountLabel.text = "BET AMOUNT: \(betAmount)$"
        }
        
    }
    func addTextField(textField: UITextField!){
        // add the text field and make the result global
        textField.placeholder = "Bet Amount will be zero, if empty"
        self.betText = textField
    }

    
    func handleAcesDealer(){
            dealerAces++
            var temp = 0
            if(dealerScoreVariable - dealerAcesScore + dealerAces > 21)
            {
                dealerBusted()
            }
            for(var i = dealerAces ; i >= 0 ; i--)
            {
                
                if(dealerScoreVariable - dealerAcesScore + 11 * i + dealerAces - i < 21){
                    dealerScoreVariable = dealerScoreVariable - dealerAcesScore + 11 * i + dealerAces - i
                    dealerScore.text = "\(dealerScoreVariable)"
                    temp = 11 * i + dealerAces - i
                    break
                }
                
            }
            dealerAcesScore = temp
            
        }
        func handleAcesPlayer(){
            playerAces++
            var temp = 0
            if(playerScoreVariable - playerAcesScore + playerAces > 21)
            {
                playerBusted()
                
            }
            for(var i = playerAces ; i >= 0 ; i--)
            {
                
                if(playerScoreVariable - playerAcesScore + 11 * i + playerAces - i < 21){
                    playerScoreVariable = playerScoreVariable - playerAcesScore + 11 * i + playerAces - i
                    playerScore.text = "\(playerScoreVariable)"
                    temp = 11 * i + playerAces - i
                    break
                }
                
            }
            
            playerAcesScore = temp

            
        }
        
    
    
   
    
    func initialDistribution(){
        var random = Int(arc4random_uniform(UInt32(51)) + 1)
        usedCards.append(random)
        var cardIndex = random%13 + 1
        
        uiImageView1.image = UIImage(named: cardType[cardIndex]!)
        if(cardIndex >= 2 && cardIndex<=10){
            dealerScoreVariable += cardIndex
            dealerScore.text = "\(dealerScoreVariable)"
        }
        else if(cardIndex == 1){
            handleAcesDealer()
        }
        else if cardIndex > 10 {
            dealerScoreVariable += 10
            dealerScore.text = "\(dealerScoreVariable)"
            
        }
        
        uiImageView2.image = UIImage(named: "FaceDown")
        
        
        while contains(usedCards,random){
        random = Int(arc4random_uniform(UInt32(51)) + 1)
        }
        
        usedCards.append(random)
        cardIndex = random%13 + 1
        uiImageViewUser1.image = UIImage(named: cardType[cardIndex]!)
        if(cardIndex >= 2 && cardIndex<=10){
            playerScoreVariable += cardIndex
            playerScore.text = "\(playerScoreVariable)"
        }
        else if(cardIndex == 1){
            handleAcesPlayer()
        }
        else if cardIndex > 10 {
            playerScoreVariable += 10
            playerScore.text = "\(playerScoreVariable)"
            
        }

        
        while contains(usedCards,random){
            random = Int(arc4random_uniform(UInt32(51)) + 1)
        }
        
        usedCards.append(random)
        cardIndex = random%13 + 1
        uiImageViewUser2.image = UIImage(named: cardType[cardIndex]!)
        if(cardIndex >= 2 && cardIndex<=10){
            playerScoreVariable += cardIndex
            playerScore.text = "\(playerScoreVariable)"
        }
        else if(cardIndex == 1){
            handleAcesPlayer()
        }
        else if cardIndex > 10 {
            playerScoreVariable += 10
            playerScore.text = "\(playerScoreVariable)"
            
        }
        
        if(playerScoreVariable == 21)
        {
            blackJack()
        }

        
    }
    
    func getBetAlert(){
        var placeBetAlert = UIAlertController(title: "Place bet" ,message: "Enter your bet amount.",preferredStyle:UIAlertControllerStyle.Alert)
        placeBetAlert.addTextFieldWithConfigurationHandler(addTextField)
        placeBetAlert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: wordEntered))
        presentViewController(placeBetAlert, animated: true, completion: nil)

    }
    
    
    @IBAction func standButtonClicked(sender: AnyObject) {
        while(dealerScoreVariable < 17){
            
            var random = Int(arc4random_uniform(UInt32(51)) + 1)
            while contains(usedCards,random){
                random = Int(arc4random_uniform(UInt32(51)) + 1)
            }
            
            
            
            usedCards.append(random)
            var cardIndex = random%13+1
            
            if(cardIndex >= 2 && cardIndex<=10){
                dealerScoreVariable += cardIndex
                dealerScore.text = "\(dealerScoreVariable)"
            }
            else if(cardIndex == 1){
                handleAcesDealer()
            }
            else if cardIndex > 10 {
                dealerScoreVariable += 10
                dealerScore.text = "\(dealerScoreVariable)"
                
            }
            
            if dealerScoreVariable > 21 {
                dealerBusted()
            }
            
            
            if dealerCardCount == 2{
                uiImageView3.image = UIImage(named: cardType[cardIndex]!)
                dealerCardCount++
                
            }
            else if dealerCardCount == 1{
                uiImageView2.image = UIImage(named: cardType[cardIndex]!)
                dealerCardCount++
            }
            else if dealerCardCount == 3{
                uiImageView4.image = UIImage(named: cardType[cardIndex]!)
                dealerCardCount++
            }
            else if dealerCardCount == 4{
                uiImageView5.image = UIImage(named: cardType[cardIndex]!)
                dealerCardCount++
            }
            else if dealerCardCount == 5{
                uiImageView6.image = UIImage(named: cardType[cardIndex]!)
                dealerCardCount++
            }
            else if dealerCardCount == 6{
                uiImageView7.image = UIImage(named: cardType[cardIndex]!)
                dealerCardCount++
            }
            else if dealerCardCount == 7{
                uiImageView8.image = UIImage(named: cardType[cardIndex]!)
                dealerCardCount++
            }
            else if dealerCardCount == 8{
                uiImageView9.image = UIImage(named: cardType[cardIndex]!)
                dealerCardCount++
            }
            else if dealerCardCount == 9{
                uiImageView10.image = UIImage(named: cardType[cardIndex]!)
                dealerCardCount++
            }
            
            
            if(dealerScoreVariable>21)
            {
                dealerBusted()
            }

            
        }
        if(dealerScoreVariable > playerScoreVariable)
        {
            dealerWins()
        }
        else if(dealerScoreVariable < playerScoreVariable){
            playerWins()
        }
        else
        {
            tie()
        }
        
        
        
    }
    
    
    
    @IBAction func hitButtonClicked(sender: AnyObject) {
        var random = Int(arc4random_uniform(UInt32(51)) + 1)
        while contains(usedCards,random){
            random = Int(arc4random_uniform(UInt32(51)) + 1)
        }
        
        
        
        usedCards.append(random)
        var cardIndex = random%13+1
        
        if(cardIndex >= 2 && cardIndex<=10){
            playerScoreVariable += cardIndex
            playerScore.text = "\(playerScoreVariable)"
        }
        else if(cardIndex == 1){
            handleAcesPlayer()
        }
        else if cardIndex > 10 {
            playerScoreVariable += 10
            playerScore.text = "\(playerScoreVariable)"
            
        }
        
        if playerScoreVariable > 21 {
            playerBusted()
        }
        
        
        if playerCardCount == 2{
        uiImageViewUser3.image = UIImage(named: cardType[cardIndex]!)
            playerCardCount++
            
        }
        else if playerCardCount == 3{
            uiImageViewUser4.image = UIImage(named: cardType[cardIndex]!)
            playerCardCount++
        }
        else if playerCardCount == 4{
            uiImageViewUser5.image = UIImage(named: cardType[cardIndex]!)
            playerCardCount++
        }
        else if playerCardCount == 5{
            uiImageViewUser6.image = UIImage(named: cardType[cardIndex]!)
            playerCardCount++
        }
        else if playerCardCount == 6{
            uiImageViewUser7.image = UIImage(named: cardType[cardIndex]!)
            playerCardCount++
        }
        else if playerCardCount == 7{
            uiImageViewUser8.image = UIImage(named: cardType[cardIndex]!)
            playerCardCount++
        }
        else if playerCardCount == 8{
            uiImageViewUser9.image = UIImage(named: cardType[cardIndex]!)
            playerCardCount++
        }
        else if playerCardCount == 9{
            uiImageViewUser10.image = UIImage(named: cardType[cardIndex]!)
            playerCardCount++
        }
        
        
        
    }
    
    func playerBusted()
    {
        balance = balance - betAmount;
        playerBalance.text = "\(balance)"
        if balance <= 0
        {
            balance = 100;
            playerBalance.text = "\(balance)"
            var placeBetAlert = UIAlertController(title: "Game Over!!" ,message: "You do not have enough balance to play!!",preferredStyle:UIAlertControllerStyle.Alert)
            placeBetAlert.addAction(UIAlertAction(title: "Play Again", style: UIAlertActionStyle.Default, handler: startOver_New))
            presentViewController(placeBetAlert, animated: true, completion: nil)
        }

       var placeBetAlert = UIAlertController(title: "Player busted" ,message: "Dealer Wins!!",preferredStyle:UIAlertControllerStyle.Alert)
        placeBetAlert.addAction(UIAlertAction(title: "Play Again", style: UIAlertActionStyle.Default, handler: startOver))
        presentViewController(placeBetAlert, animated: true, completion: nil)

        
    }
    func dealerBusted()
    {
        balance = balance + 2*betAmount;
        playerBalance.text = "\(balance)"
        var placeBetAlert = UIAlertController(title: "Dealer busted" ,message: "Player Wins!!",preferredStyle:UIAlertControllerStyle.Alert)
         placeBetAlert.addAction(UIAlertAction(title: "Play Again", style: UIAlertActionStyle.Default, handler: startOver))
        presentViewController(placeBetAlert, animated: true, completion: nil)
        
    }
    
    func playerWins()
    {
        balance = balance + 2*betAmount;
        playerBalance.text = "\(balance)"
        var placeBetAlert = UIAlertController(title: "Congrats!" ,message: "Player Wins!!",preferredStyle:UIAlertControllerStyle.Alert)
         placeBetAlert.addAction(UIAlertAction(title: "Play Again", style: UIAlertActionStyle.Default, handler: startOver))
        presentViewController(placeBetAlert, animated: true, completion: nil)
        
    }
    
    func blackJack()
    {
        balance = balance + 2*betAmount;
        playerBalance.text = "\(balance)"
        var placeBetAlert = UIAlertController(title: "Black Jack" ,message: "Player wins double bet amount!!!",preferredStyle:UIAlertControllerStyle.Alert)
        placeBetAlert.addAction(UIAlertAction(title: "Play Again", style: UIAlertActionStyle.Default, handler: startOver))
        presentViewController(placeBetAlert, animated: true, completion: nil)
    }
    
    
    func tie()
    {
        balance = balance + betAmount;
        playerBalance.text = "\(balance)"
        var placeBetAlert = UIAlertController(title: "Tie" ,message: "It's a Tie!!!",preferredStyle:UIAlertControllerStyle.Alert)
        placeBetAlert.addAction(UIAlertAction(title: "Play Again", style: UIAlertActionStyle.Default, handler: startOver))
        presentViewController(placeBetAlert, animated: true, completion: nil)
        
    }
    
    func dealerWins()
    {
        balance = balance - betAmount;
        playerBalance.text = "\(balance)"
        if balance <= 0
        {
            balance = 100;
            playerBalance.text = "\(balance)"
            var placeBetAlert = UIAlertController(title: "Game Over!!" ,message: "You do not have enough balance to play!!",preferredStyle:UIAlertControllerStyle.Alert)
            placeBetAlert.addAction(UIAlertAction(title: "Play Again", style: UIAlertActionStyle.Default, handler: startOver_New))
            presentViewController(placeBetAlert, animated: true, completion: nil)
        }
        var placeBetAlert = UIAlertController(title: "Bad Luck!!" ,message: "Dealer Wins!!",preferredStyle:UIAlertControllerStyle.Alert)
         placeBetAlert.addAction(UIAlertAction(title: "Play Again", style: UIAlertActionStyle.Default, handler: startOver))
        presentViewController(placeBetAlert, animated: true, completion: nil)
        
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        initialDistribution()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    override func viewDidAppear(animated: Bool) {
        
        getBetAlert()
    }


}

