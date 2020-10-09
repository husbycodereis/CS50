import UIKit

class NoteViewController: UIViewController {
    @IBOutlet var contentTextView: UITextView!
    
    @IBOutlet weak var deleteButton: UIBarButtonItem!
    
    @IBAction func deleteNote(){
        if NoteManager.shared.delete(note: self.note!){
            self.navigationController?.popViewController(animated: true)
        }
    }
    
    
    var note: Note? = nil
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        contentTextView.text = note!.content
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        note!.content = contentTextView.text
        NoteManager.shared.saveNote(note: note!)
    }
}
