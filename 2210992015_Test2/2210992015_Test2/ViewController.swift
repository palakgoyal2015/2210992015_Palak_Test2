//
//  ViewController.swift
//  2210992015_Test2
//
//  Created by student-2 on 23/11/24.
//

import UIKit

class ViewController: UIViewController , UIImagePickerControllerDelegate {

    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func uploadPhotoButtonTapped(_ sender: Any) {
        let imagePicker = UIImagePickerController()
        
        let allertController = UIAlertController(title: "Choose Image Source", message: nil, preferredStyle: .actionSheet) // try other than action screen - explore
        
//         CANCEL ACTION
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel , handler: nil)  // we have used style as cancel because we want to cancel the alert action on its click. Rember default is different.
        allertController.addAction(cancelAction)
        
        
        
//        CAMERA ACTION
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            let cameraAction = UIAlertAction(title : "Camera" , style: .default , handler: {action in
                imagePicker.sourceType = .camera
                self.present(imagePicker , animated: true , completion: nil)
            })
            allertController.addAction(cameraAction)
        }
        
        
        
//      PHOTO ACTION
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
            let photoLibraryAction = UIAlertAction(title : "Photo Library" , style: .default , handler: {action in
                imagePicker.sourceType = .photoLibrary
                self.present(imagePicker , animated: true , completion: nil)
            })
            allertController.addAction(photoLibraryAction)
        }
        

        present(allertController , animated: true , completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let selectedImage = info[.originalImage] as? UIImage else {return}
        imageView.image = selectedImage
        dismiss(animated: true , completion: nil)
    }

    
    
    @IBAction func saveButtonTapped(_ sender: Any) {
    }
    
}

