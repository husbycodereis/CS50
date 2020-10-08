import UIKit

class PokemonViewController: UIViewController {
    var url: String!
    //create a variable from PokemonCatch.isCatched to store bool value
    var catchPokemon = PokemonCatch.init(isCatched: [:])
    
    var storeCatchState = UserDefaults.standard
    
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var numberLabel: UILabel!
    @IBOutlet var type1Label: UILabel!
    @IBOutlet var type2Label: UILabel!
    //assigning a variable for the button
    @IBOutlet weak var catchButton: UIButton!
    //create and assign variable for UIimageView
    @IBOutlet weak var imageView: UIImageView!
    //create a variable for textView
    @IBOutlet weak var descriptionText: UITextView!
    
    //creating a function to the cactchButton that changes text when pressed
    @IBAction func toggleCatch(){
        if catchPokemon.isCatched[nameLabel.text!] == nil || catchPokemon.isCatched[nameLabel.text!] == false {
            catchButton.setTitle("Release", for: .normal)
            catchPokemon.isCatched[nameLabel.text!] = true
            storeCatchState.set(true, forKey: nameLabel.text!)

        }
        else if catchPokemon.isCatched[nameLabel.text!] == true{
            catchButton.setTitle("Catch", for: .normal)
            catchPokemon.isCatched[nameLabel.text!] = false
            storeCatchState.set(false, forKey: nameLabel.text!)
        }
    }
 
    
    func capitalize(text: String) -> String {
        return text.prefix(1).uppercased() + text.dropFirst()
    }
    

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        
        nameLabel.text = ""
        numberLabel.text = ""
        type1Label.text = ""
        type2Label.text = ""
        descriptionText.text = ""
        loadPokemon()
        loadSprites()
    }

    func loadPokemon() {
        URLSession.shared.dataTask(with: URL(string: url)!) { (data, response, error) in
            guard let data = data else {
                return
            }

            do {
                let result = try JSONDecoder().decode(PokemonResult.self, from: data)
                DispatchQueue.main.async { [self] in
                    self.navigationItem.title = self.capitalize(text: result.name)
                    self.nameLabel.text = self.capitalize(text: result.name)
                    self.numberLabel.text = String(format: "#%03d", result.id)

                    for typeEntry in result.types {
                        if typeEntry.slot == 1 {
                            self.type1Label.text = typeEntry.type.name
                        }
                        else if typeEntry.slot == 2 {
                            self.type2Label.text = typeEntry.type.name
                        }
                        
                    if storeCatchState.bool(forKey: self.nameLabel.text!) == true{
                        catchPokemon.isCatched[self.nameLabel.text!] = true
                    }
                        
                    }
                    if catchPokemon.isCatched[self.nameLabel.text!] == nil || catchPokemon.isCatched[self.nameLabel.text!] == false
                    {
                        self.catchButton.setTitle("Catch", for: .normal)
    

                    }
                    else if catchPokemon.isCatched[self.nameLabel.text!] == true{
                        self.catchButton.setTitle("Release", for: .normal)
                        
                    }
                }
                //creating a description by using result.id to get url with specified index for each selected pokemon
                URLSession.shared.dataTask(with: URL(string: "https://pokeapi.co/api/v2/pokemon-species/\(result.id)/")!) { (data, response, error) in
                    //making sure there is data within URL
                    guard let data = data else {
                        return
                    }
                    do {
                        //calling JSONDecoder method to decode PokemonDescription
                        let _result = try JSONDecoder().decode(PokemonDescription.self, from: data)
                        DispatchQueue.main.async {
                            for entry in _result.flavor_text_entries{
                                if entry.language.name == "en" {
                                    self.descriptionText.text = entry.flavor_text
                                    break
                                }
                            }
                          
                        }
                    }
                    catch let error {
                        print(error)
                    }
                }.resume()
            }
            catch let error {
                print(error)
            }
        }.resume()
        
    }
    //creating a new function to add images
    func loadSprites(){
        //calling url
        URLSession.shared.dataTask(with: URL(string: url)!) { (data, response, error) in
            //making sure there is data within URL
            guard let data = data else {
                return
            }
            //creating do-catch method for error handling
            do {
                //calling JSONDecoder method to decode PokemonImage
                let _result = try JSONDecoder().decode(PokemonImage.self, from: data)
                DispatchQueue.main.async {
                    //creating URL variable
                    let imageURL = URL(string: _result.sprites.front_default)
                    //turning URL into a data that image can be read from
                    let imageData = try? Data(contentsOf: imageURL!)
                    //.image method turns variable into image -- creating image with UIImage mehod
                    self.imageView.image = UIImage(data: imageData!)
                }
            }
            catch let error {
                print(error)
            }
        }.resume()
    }
    
    func loadDescription(){
       
    }
}
