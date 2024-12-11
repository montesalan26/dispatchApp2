//
//  cameraViewController.swift
//  Dispatch_app2
//
//  Created by Alan Montes on 12/10/24.
//

import UIKit
import AVFoundation




import UIKit
import AVFoundation
import MessageUI

class cameraViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate, MFMailComposeViewControllerDelegate {
    
    @IBOutlet weak var cameraBtn: UIButton!
    @IBOutlet weak var firstRowFirstImage: UIImageView!
    @IBOutlet weak var firstRowSecondImage: UIImageView!
    @IBOutlet weak var firstRowThirdImage: UIImageView!
    @IBOutlet weak var secondRowFirstImage: UIImageView!
    @IBOutlet weak var secondRowSecondImage: UIImageView!
    @IBOutlet weak var secondRowThirdImage: UIImageView!
    @IBOutlet weak var thirdRowFirstImage: UIImageView!
    @IBOutlet weak var thirdRowSecondImage: UIImageView!
    @IBOutlet weak var thirdRowThirdImage: UIImageView!
    @IBOutlet weak var sendImages: UIButton!
    
    var imageViews : [UIImageView] = []
    
    var imageCounter = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageViews = [firstRowFirstImage, firstRowSecondImage, firstRowThirdImage, secondRowFirstImage, secondRowSecondImage,
        secondRowThirdImage, thirdRowFirstImage, thirdRowSecondImage, thirdRowThirdImage]
        
        self.navigationItem.hidesBackButton = true
    }
    // Action triggered when the camera button is pressed
    @IBAction func openCamera(_ sender: UIButton) {
        // Check if the camera is available
        
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            let imagePickerController = UIImagePickerController()
            imagePickerController.sourceType = .camera  // Set source to the camera
            imagePickerController.delegate = self  // Set the delegate to handle image picking
            present(imagePickerController, animated: true, completion: nil)  // Present the camera
        } else {
            print("Camera is not available.")
            // Optionally, show an alert to the user informing them that the camera is not available.
        
            }
        }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            
            // Check if we have a valid image
            if let image = info[.originalImage] as? UIImage {
                // Update the appropriate image view based on the counter
                if imageCounter < imageViews.count {
                    imageViews[imageCounter].image = image
                    imageCounter += 1 // Move to the next image view
                }
            }
            
            // Dismiss the camera interface
            picker.dismiss(animated: true, completion: nil)
        }
        
        // Delegate method to handle cancellation of camera usage
        func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
            picker.dismiss(animated: true, completion: nil)  // Dismiss the camera interface
        }
    @IBAction func sendImages(_ sender: UIButton) {
        
        if MFMailComposeViewController.canSendMail() {
                   let mailComposeVC = MFMailComposeViewController()
                   mailComposeVC.mailComposeDelegate = self  // Assign the delegate to self
                   
                   mailComposeVC.setSubject("Captured Images")
                   mailComposeVC.setMessageBody("Here are the images I captured using the camera.", isHTML: false)
            
            mailComposeVC.setToRecipients(["montes.alan.26@gmail.com"])  // Replace with the recipient's email address
                   
                   
                   // Attach the images from the UIImageViews
                   if let firstImage = firstRowFirstImage.image, let firstImageData = firstImage.jpegData(compressionQuality: 1.0) {
                       mailComposeVC.addAttachmentData(firstImageData, mimeType: "image/jpeg", fileName: "image1.jpg")
                   }
                   if let secondImage = firstRowSecondImage.image, let secondImageData = secondImage.jpegData(compressionQuality: 1.0) {
                       mailComposeVC.addAttachmentData(secondImageData, mimeType: "image/jpeg", fileName: "image2.jpg")
                   }
                   if let thirdImage = firstRowThirdImage.image, let thirdImageData = thirdImage.jpegData(compressionQuality: 1.0) {
                       mailComposeVC.addAttachmentData(thirdImageData, mimeType: "image/jpeg", fileName: "image3.jpg")
                   }
                   if let fourthImage = secondRowFirstImage.image, let fourthImageData = fourthImage.jpegData(compressionQuality: 1.0) {
                       mailComposeVC.addAttachmentData(fourthImageData, mimeType: "image/jpeg", fileName: "image4.jpg")
                   }
                   if let fifthImage = secondRowSecondImage.image, let fifthImageData = fifthImage.jpegData(compressionQuality: 1.0) {
                       mailComposeVC.addAttachmentData(fifthImageData, mimeType: "image/jpeg", fileName: "image5.jpg")
                   }
                   if let sixthImage = secondRowThirdImage.image, let sixthImageData = sixthImage.jpegData(compressionQuality: 1.0) {
                       mailComposeVC.addAttachmentData(sixthImageData, mimeType: "image/jpeg", fileName: "image6.jpg")
                   }
                   if let seventhImage = thirdRowFirstImage.image, let seventhImageData = seventhImage.jpegData(compressionQuality: 1.0) {
                       mailComposeVC.addAttachmentData(seventhImageData, mimeType: "image/jpeg", fileName: "image7.jpg")
                   }
                   if let eighthImage = thirdRowSecondImage.image, let eighthImageData = eighthImage.jpegData(compressionQuality: 1.0) {
                       mailComposeVC.addAttachmentData(eighthImageData, mimeType: "image/jpeg", fileName: "image8.jpg")
                   }
                   if let ninthImage = thirdRowThirdImage.image, let ninthImageData = ninthImage.jpegData(compressionQuality: 1.0) {
                       mailComposeVC.addAttachmentData(ninthImageData, mimeType: "image/jpeg", fileName: "image9.jpg")
                   }
                   
                   present(mailComposeVC, animated: true, completion: nil)
               } else {
                   let alertController = UIAlertController(title: "Error", message: "Your device is not configured to send emails.", preferredStyle: .alert)
                   alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                   present(alertController, animated: true, completion: nil)
               }
           }
           
           func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
               controller.dismiss(animated: true, completion: nil)
               
               switch result {
               case .sent:
                   print("Email sent successfully.")
               case .saved:
                   print("Email saved as draft.")
               case .cancelled:
                   print("Email composition cancelled.")
               case .failed:
                   print("Email failed to send.")
               @unknown default:
                   break
               }
           }
       }
