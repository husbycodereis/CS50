import UIKit

class PokemonListViewController: UITableViewController, UISearchBarDelegate {
    var pokemon: [PokemonListResult] = []
    //creating a variable that stores pokemon names so that we can make changes on it
    //putting ! to identify the variable and making it in such a way that we can put values later
    var filteredData: [PokemonListResult]!
    //adding search bar connection
    @IBOutlet weak var searchBar: UISearchBar!
    
    
    func capitalize(text: String) -> String {
        return text.prefix(1).uppercased() + text.dropFirst()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //delegating searchBar to itself
        searchBar.delegate = self
        //assing pokemon values to filteredData
        filteredData = pokemon
        guard let url = URL(string: "https://pokeapi.co/api/v2/pokemon?limit=151") else {
            return
        }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data else {
                return
            }
            
            do {
                let entries = try JSONDecoder().decode(PokemonListResults.self, from: data)
                self.pokemon = entries.results
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
            catch let error {
                print(error)
            }
        }.resume()
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredData.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PokemonCell", for: indexPath)
        cell.textLabel?.text = capitalize(text: filteredData[indexPath.row].name)
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowPokemonSegue",
                let destination = segue.destination as? PokemonViewController,
                let index = tableView.indexPathForSelectedRow?.row {
            destination.url = filteredData[index].url
        }
    }
    //MARK : Search Bar Config
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        filteredData = []
        if searchText == ""{
            filteredData = pokemon
        }
        else
        {
            for pokemons in pokemon{
                if pokemons.name.lowercased().contains(searchText.lowercased()) {
                    filteredData.append(pokemons)
                }
            }
        }
        self.tableView.reloadData()
    }
}
