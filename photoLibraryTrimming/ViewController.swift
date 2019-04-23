//
//  ViewController.swift
//  photoLibraryClipping
//

import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func setPicture(_ sender: Any) {
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.sourceType = UIImagePickerController.SourceType.photoLibrary
        imagePicker.allowsEditing = true // 画像のトリミングに必要
        self.present(imagePicker,animated: true, completion: nil)
    }

    @IBAction func startCamera(_ sender : AnyObject) {

        let sourceType:UIImagePickerController.SourceType =
            UIImagePickerController.SourceType.camera

        if UIImagePickerController.isSourceTypeAvailable(
            UIImagePickerController.SourceType.camera){
            let cameraPicker = UIImagePickerController()
            cameraPicker.sourceType = sourceType
            cameraPicker.delegate = self
            cameraPicker.allowsEditing = true // 画像のトリミングに必要
            self.present(cameraPicker, animated: true, completion: nil)
        }
        else{
            print("error")
        }
    }

    // 写真選択後、カメラ撮影後に呼ばれる
    // .allowsEditing = true にすると、
    // ユーザがトリミングした.editedImageが取得できる
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {

        if let editedImage = info[.editedImage] as? UIImage {
            imageView.image = editedImage
        }
        dismiss(animated: true,completion: nil)
    }
}
