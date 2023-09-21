import Foundation
import UIKit
import Firebase
class signinViewController: UIViewController, UITextFieldDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initializeHideKeyboard()
        email.delegate=self
        password.delegate=self
        email.tag=1
        password.tag=2
    }
    var flag:Int=0;
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var signin: UIButton!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var username: UITextField!
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
    }
    
    @IBOutlet weak var showError: UITextView!
    @IBOutlet weak var showMeMessage: UITextView!
    //this function will be called when we click on the signin button, it will make sure that we can't click on signup when the email and password textfiled are empty
    @objc func handleSignIn() {
        guard let email = email.text else { return }
        guard let pass = password.text else { return }
        
        Auth.auth().signIn(withEmail: email, password: pass) { user, error in
            if (error == nil && email != "" && pass != "" ){
                self.dismiss(animated: false, completion: nil)
                self.flag=1
                print("user logged in")
                self.performSegue(withIdentifier: "showBeaches", sender: nil)
            } else {
                print("Error logging in:      \(error!.localizedDescription)")
                self.flag=0
                
                self.showError.text=error!.localizedDescription
                self.showError.font=UIFont(name: "Times", size: 17)
                
                self . email.text=""
                self.password.text=""
            }
        }
    }
    //this is what happens when we click on signin button
    @IBAction func signinDidTapped(_ sender: UIButton) {
        
        if(email!.text != "" && password!.text != "" ){
            handleSignIn()
        }

    }
    func initializeHideKeyboard(){
        //Declare a Tap Gesture Recognizer which will trigger our dismissMyKeyboard() function
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(
            target: self,
            action: #selector(dismissMyKeyboard))
        //Add this tap gesture recognizer to the parent view
        view.addGestureRecognizer(tap)
    }
    @objc func dismissMyKeyboard(){
        //endEditing causes the view (or one of its embedded text fields) to resign the first responder status.
        //In short- Dismiss the active keyboard.
        view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
         if let nextField = self.view.viewWithTag(textField.tag + 1) as? UITextField {
         nextField.becomeFirstResponder()
         } else {
         textField.resignFirstResponder()
         }
         return false
         }
}

