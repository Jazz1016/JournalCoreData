//
//  EntryDetailViewController.swift
//  JournalCoreData
//
//  Created by James Lea on 4/26/21.
//

import UIKit

class EntryDetailViewController: UIViewController {
    
    // MARK: - Outlets
    @IBOutlet weak var entryTextField: UITextField!
    
    @IBOutlet weak var entryTextView: UITextView!
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews()
    }
    
    // MARK: - Properties
    var entry: Entry?
    
    // MARK: - Actions
    @IBAction func saveButtonTapped(_ sender: Any) {
        guard let title = entryTextField.text, !title.isEmpty,
              let body = entryTextView.text, !body.isEmpty else { return }
        if let entry = entry {
            EntryController.shared.updateEntry(entry: entry, title: title, body: body)
        } else {
            EntryController.shared.createEntry(title: title, bodyText: body)
        }
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func clearButtonTapped(_ sender: Any) {
        entryTextField.text = ""
        entryTextView.text = ""
    }
    
    // MARK: - Functions
    
    func updateViews() {
        guard let entry = entry else {return}
        entryTextField.text = entry.title
        entryTextView.text = entry.bodyText
    }

}
