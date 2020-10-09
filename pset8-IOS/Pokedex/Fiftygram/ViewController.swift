//
//  ViewController.swift
//  Fiftygram
//
//  Created by Ali Riza Reisoglu on 8.10.2020.
//

import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    //add this variable for filter operations
    let context = CIContext()
    //create a variable to store original image
    var original: UIImage?
    //create a veriable for ImageView
    @IBOutlet weak var imageView: UIImageView!
    //add a method for choose Photo bar
    @IBAction func choosePhoto(){
    //making sure iphone permits accessing photos
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary){
            let picker = UIImagePickerController()
            //delegating picker to itself
            picker.delegate = self
            //adding photolibrary as the sourcetype
            picker.sourceType = .photoLibrary
            //navigate to display the image
            navigationController?.present(picker, animated: true, completion: nil)
        }
    }
    //function to save photos
    @IBAction func savePhoto(){
        UIImageWriteToSavedPhotosAlbum(imageView.image!,self,nil,nil)
        }

    //function that applies sepia filter
    @IBAction func applySepia(){
        if original == nil{
            return
        }
        //create an object that represents the filter
        let filter = CIFilter(name: "CISepiaTone")
        //appoint values to the filter object
        filter?.setValue(0.5, forKey: kCIInputIntensityKey)
        display(filter: filter!)
    }
    
    //function that applies noir filter
    @IBAction func applyNoir(){
        if original == nil{
            return
        }
        //create an object that represents the filter
        let filter = CIFilter(name: "CIPhotoEffectNoir")
        display(filter: filter!)
    }
    
    //function that applies vintage filter
    @IBAction func applyVintage(){
        if original == nil{
            return
        }
        //create an object that represents the filter
        let filter = CIFilter(name: "CIPhotoEffectProcess")
        display(filter: filter!)
    }
    
    @IBAction func applyFade(){
        if original == nil{
            return
        }
        //create an object that represents the filter
        let filter = CIFilter(name: "CIPhotoEffectFade")
        display(filter: filter!)
    }
    
    @IBAction func applyInstant(){
        if original == nil{
            return
        }
        //create an object that represents the filter
        let filter = CIFilter(name: "CIPhotoEffectInstant")
        display(filter: filter!)
    }
    
    
    //create a helper function to minimize code in apply functions
    func display(filter: CIFilter){
        //set the image we want to filter
        filter.setValue(CIImage(image: original!), forKey: kCIInputImageKey)
        //get the filtered image and appoint it to a variable
        let output = filter.outputImage
        //put filtered image into @IBOutlet variable
        imageView.image = UIImage(cgImage: self.context.createCGImage(output!, from: output!.extent)!)
    }
    
    
    
    
    
    //create a function to define what to do when an image is selected
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        //add a pop attribute back to main screen when the photo is selected
        navigationController?.dismiss(animated: true, completion: nil)
        //add a variable inside an if condition that creates an UIImage
        if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage{
            //imageView is the @IBoutlet variable, .image is to turn variable into image , = image is the variable thats appointed when the image is selected from gallery
            imageView.image = image
            original = image
        }
    }
}

