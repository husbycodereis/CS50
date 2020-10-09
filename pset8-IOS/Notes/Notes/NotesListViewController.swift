import UIKit

class NotesListViewController: UITableViewController {
    var notes: [Note] = []
    
    @IBAction func createNote() {
        let _ = NoteManager.shared.create()
        reload()
    }
    
    func reload() {
        notes = NoteManager.shared.getNotes()
        tableView.reloadData()
    }
    //slide to delete a note
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
     if editingStyle == .delete {
        self.notes.remove(at: indexPath.row)
        tableView.deleteRows(at: [indexPath], with: .fade)
     }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        reload()
    }
    //create section
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    //add number of rows to the section
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return notes.count
    }
    //add cell's for each row
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "NoteCell", for: indexPath)
        //cell value will be taken from the contents of the notes in the given row index number
        cell.textLabel?.text = notes[indexPath.row].content
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "NoteSegue",
                let destination = segue.destination as? NoteViewController,
                let index = tableView.indexPathForSelectedRow?.row {
            destination.note = notes[index]
        }
    }
}
