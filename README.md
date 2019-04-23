# sample-swift-photoLibraryTrimming

# 概要
カメラで撮影した画像や、フォトライブラリで選択した画像をトリミングする方法です。

# 実装方法
トリミング処理をするために、UIImagePickerControllerのallowsEditingを
trueに設定します。

```
@IBAction func setPicture(_ sender: Any) {
    let imagePicker = UIImagePickerController()
    imagePicker.delegate = self
    imagePicker.sourceType = UIImagePickerController.SourceType.photoLibrary
    imagePicker.allowsEditing = true // 画像のトリミングに必要
    self.present(imagePicker,animated: true, completion: nil)
}
```

カメラで撮影した画像や、フォトライブラリで選択した画像をトリミングした画像は、
info[.editedImage]　に入ります。
info[.originalImage]　は、トリミングしていないオリジナルの画像が入ります。

```
func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
    if let editedImage = info[.editedImage] as? UIImage {
      // editedImageにトリミングした画像が入ります
    }
    dismiss(animated: true,completion: nil)
}
```

---
---
# 環境
- Xcode 10.2
- Swift 5

---
# 参考文献
- Apple公式マニュアル [UIImagePickerController](https://developer.apple.com/documentation/uikit/uiimagepickercontroller)
