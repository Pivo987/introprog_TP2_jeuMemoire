//======================================================
import UIKit
//======================================================
class ViewController: UIViewController {
    //------------------
    
    //Vues de face et arrière
    @IBOutlet weak var back_01: UIView!
    @IBOutlet weak var front_01: UIView!
    @IBOutlet weak var back_02: UIView!
    @IBOutlet weak var front_02: UIView!
    @IBOutlet weak var back_03: UIView!
    @IBOutlet weak var front_03: UIView!
    @IBOutlet weak var back_04: UIView!
    @IBOutlet weak var front_04: UIView!
    @IBOutlet weak var back_05: UIView!
    @IBOutlet weak var front_05: UIView!
    @IBOutlet weak var back_06: UIView!
    @IBOutlet weak var front_06: UIView!
    @IBOutlet weak var back_07: UIView!
    @IBOutlet weak var front_07: UIView!
    @IBOutlet weak var back_08: UIView!
    @IBOutlet weak var front_08: UIView!
    
    //Images des animaux se trouvant dans chaque arrière
    @IBOutlet weak var imgView01: UIImageView!
    @IBOutlet weak var imgView02: UIImageView!
    @IBOutlet weak var imgView03: UIImageView!
    @IBOutlet weak var imgView04: UIImageView!
    @IBOutlet weak var imgView05: UIImageView!
    @IBOutlet weak var imgView06: UIImageView!
    @IBOutlet weak var imgView07: UIImageView!
    @IBOutlet weak var imgView08: UIImageView!
    
    //Cartes contenant faces et arrières
    @IBOutlet weak var card_01: UIView!
    @IBOutlet weak var card_02: UIView!
    @IBOutlet weak var card_03: UIView!
    @IBOutlet weak var card_04: UIView!
    @IBOutlet weak var card_05: UIView!
    @IBOutlet weak var card_06: UIView!
    @IBOutlet weak var card_07: UIView!
    @IBOutlet weak var card_08: UIView!
    
    //variables pour la fonction incrementationNombreVerification(), showResetButtonCongratulations() et reset()
    var nombreVerification = 0
    @IBOutlet weak var resetButton: UIButton!
    @IBOutlet weak var congratulations: UIImageView!

    var cards: [UIView]!
    
    var arrayOfImageViews: [UIImageView]!
    var arrayOfAnimalNames: [String] = ["cochon.png", "cochon.png", "mouton.png", "mouton.png", "singe.png", "singe.png", "vache.png", "vache.png"]
    var arrayOfRandomAnimalNames = [String]()
    
    var arrayOfChosenCards = [String]()
    var arrayOfChosenViews = [UIView]()
    
    var arrayOfShowingBacks = [UIView]()
    var arrayOfHidingFronts = [UIView]()
    
    //------------------
    override func viewDidLoad() {
        super.viewDidLoad()
        cards = [card_01, card_02, card_03, card_04, card_05, card_06, card_07, card_08]
        arrayOfImageViews = [imgView01, imgView02, imgView03, imgView04, imgView05, imgView06, imgView07, imgView08]
        randomAnimalNames()
        setImagesToCard()
    }
    
    //------------------
    //affichage des cartes
    @IBAction func showCard(_sender: UIButton) {
        
        if arrayOfHidingFronts.count == 2 {
            return
        }
        switch _sender.tag {
            case 0:
                flipCard(from: front_01, to: back_01)
                arrayOfChosenCards.append(arrayOfRandomAnimalNames[0])
                arrayOfChosenViews.append(card_01)
                arrayOfHidingFronts.append(front_01)
                arrayOfShowingBacks.append(back_01)
            case 1:
                flipCard(from: front_02, to: back_02)
                arrayOfChosenCards.append(arrayOfRandomAnimalNames[1])
                arrayOfChosenViews.append(card_02)
                arrayOfHidingFronts.append(front_02)
                arrayOfShowingBacks.append(back_02)
            case 2:
                flipCard(from: front_03, to: back_03)
                arrayOfChosenCards.append(arrayOfRandomAnimalNames[2])
                arrayOfChosenViews.append(card_03)
                arrayOfHidingFronts.append(front_03)
                arrayOfShowingBacks.append(back_03)
            case 3:
                flipCard(from: front_04, to: back_04)
                arrayOfChosenCards.append(arrayOfRandomAnimalNames[3])
                arrayOfChosenViews.append(card_04)
                arrayOfHidingFronts.append(front_04)
                arrayOfShowingBacks.append(back_04)
            case 4:
                flipCard(from: front_05, to: back_05)
                arrayOfChosenCards.append(arrayOfRandomAnimalNames[4])
                arrayOfChosenViews.append(card_05)
                arrayOfHidingFronts.append(front_05)
                arrayOfShowingBacks.append(back_05)
            case 5:
                flipCard(from: front_06, to: back_06)
                arrayOfChosenCards.append(arrayOfRandomAnimalNames[5])
                arrayOfChosenViews.append(card_06)
                arrayOfHidingFronts.append(front_06)
                arrayOfShowingBacks.append(back_06)
            case 6:
                flipCard(from: front_07, to: back_07)
                arrayOfChosenCards.append(arrayOfRandomAnimalNames[6])
                arrayOfChosenViews.append(card_07)
                arrayOfHidingFronts.append(front_07)
                arrayOfShowingBacks.append(back_07)
            case 7:
                flipCard(from: front_08, to: back_08)
                arrayOfChosenCards.append(arrayOfRandomAnimalNames[7])
                arrayOfChosenViews.append(card_08)
                arrayOfHidingFronts.append(front_08)
                arrayOfShowingBacks.append(back_08)
            
            default:
                break
        }
        verification()
    }
    
    //------------------
    //Retourne les cartes lorsque l'on clique dessus
    func flipCard(from: UIView, to: UIView) {
        
        let transitionOptions: UIViewAnimationOptions = [.transitionFlipFromBottom, .showHideTransitionViews]
        
        UIView.transition(with: from, duration: 0.5, options: transitionOptions, animations: {
            from.isHidden = true
        })
        
        UIView.transition(with: to, duration: 0.5, options: transitionOptions, animations: {
            to.isHidden = false
        })
    }
    
    //------------------
    //Assigne les images aux cartes
    func setImagesToCard() {
        var number = 0
        for imgView in arrayOfImageViews {
            imgView.image = UIImage(named: arrayOfRandomAnimalNames[number])
            number = number + 1
        }
    }
    
    //------------------
    //Place les images des animaux de manière aléatoire
    func randomAnimalNames() {
        let numberOfAnimals = arrayOfAnimalNames.count
        
        for _ in 1...numberOfAnimals {
            let randomNumber = Int(arc4random_uniform(UInt32(arrayOfAnimalNames.count)))
            arrayOfRandomAnimalNames.append(arrayOfAnimalNames[randomNumber])
            arrayOfAnimalNames.remove(at: randomNumber)
        }
    }
    
    //------------------
    //Vérifie si les deux cartes sélectionnées ont une image (animal) semblable
    func verification() {
        if arrayOfChosenCards.count == 2 {
            if arrayOfChosenCards[0] == arrayOfChosenCards[1] {
                Timer.scheduledTimer(timeInterval: 1.5,
                                     target: self,
                                     selector: (#selector(hidecards)),
                                     userInfo: nil,
                                     repeats: false)
                incrementationNombreVerification()
            }  else {
                arrayOfChosenViews = []
            }
            arrayOfChosenCards = []
        }
        resetCards()
    }
    
    //------------------
    /*Incremente le nombre de vérifications de 1 si la fonction verification est vraie et appelle showResetButtonCongratulations()*/
    func incrementationNombreVerification() {
        nombreVerification += 1
        if nombreVerification == 4 {
            nombreVerification = 0
            Timer.scheduledTimer(timeInterval: 2,
                                 target: self,
                                 selector: (#selector(showResetButtonCongratulations)),
                                 userInfo: nil,
                                 repeats: false)
        }
    }
    
    //------------------
    //Affiche le bouton reset et l'image congratulations
    func showResetButtonCongratulations() {
        resetButton.isHidden = false
        congratulations.isHidden = false
    }
    
    //------------------
    //Si les deux cartes sont pareilles, appelle la fonction reflip dans 2 secondes
    func resetCards() {
        if arrayOfShowingBacks.count == 2 {
        Timer.scheduledTimer(timeInterval: 2,
                             target: self,
                             selector: (#selector(reflip)),
                             userInfo: nil,
                             repeats: false)
        }
    }
    
    //------------------
    //Retourne les cartes face cachée (forêt)
    @objc func reflip() {
        for index in 0..<arrayOfShowingBacks.count {
            flipCard(from: arrayOfShowingBacks[index], to: arrayOfHidingFronts[index])
        }
        arrayOfHidingFronts = []
        arrayOfShowingBacks = []
    }
    //------------------
    //Cache les vues choisies et vide le tableau arrayOfChosenViews
    @objc func hidecards () {
        arrayOfChosenViews[0].isHidden = true
        arrayOfChosenViews[1].isHidden = true
        arrayOfChosenViews = []
    }
    //------------------
    //Remet le jeu avec toutes les cartes faces cachées, prêt à rejouer
    @IBAction func reset(_ sender: UIButton) {
        resetButton.isHidden = true
        congratulations.isHidden =  true
        for card in cards {
            card.isHidden = false
        }
        arrayOfAnimalNames = ["cochon.png", "cochon.png", "mouton.png", "mouton.png", "singe.png", "singe.png", "vache.png", "vache.png"]
        arrayOfRandomAnimalNames = []
        randomAnimalNames()
        setImagesToCard()
    }
    //------------------
}

