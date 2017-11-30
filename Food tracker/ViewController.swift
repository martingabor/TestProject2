//
//  ViewController.swift
//  Food tracker
//
//  Created by Martin Gábor on 30.11.17.
//  Copyright © 2017 Martin Gábor. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    
    //MARK: Properties
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var photoImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //text delegate = viewcontroller
        nameTextField.delegate = self
    }
    
    //MARK: UITextFieldDelegate
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        //Hide keyboard
        textField.resignFirstResponder()
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        nameLabel.text = nameTextField.text
    }
    
    //MARK: UIImagePickerControllerDelegate
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        //dissmis the picker if user canceled
        dismiss(animated: true, completion: nil)
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        guard let selectedImage = info[UIImagePickerControllerOriginalImage] as?
            UIImage else {
                fatalError("Expected something different wtf is this: \(info)")
        }
        //set photo Image View to selected image
        photoImageView.image = selectedImage
        //dismiss picker
        dismiss(animated: true, completion: nil)
    }
    //MARK: Actions
    
    @IBAction func setDefaultLabelText(_ sender: UIButton) {
        nameLabel.text = "Default text"
    }
    @IBAction func selectImageFromPhotoLibrary(_ sender: UITapGestureRecognizer) {
        //Hide keyboard if its displayed
        nameTextField.resignFirstResponder()
        
        //UIImageController lets me pick pictures from gallery
        let imagePickerController = UIImagePickerController()
        
        //only picking from gallery not taking pic
        imagePickerController.sourceType = .photoLibrary
        
        // make sure view controller knows when the user pics image
        imagePickerController.delegate = self
        present(imagePickerController, animated:  true, completion: nil)
        
    }
}

