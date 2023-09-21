
import Foundation
import UIKit
import Firebase
class signupViewController: UIViewController,UITextFieldDelegate{

    override func viewDidLoad() {
        super.viewDidLoad()
       email.delegate=self
        pass.delegate=self
        user.delegate=self
        initializeHideKeyboard()
    }
   //IB outlets for user signup email and password
    @IBOutlet weak var user: UITextField!
    @IBOutlet weak var signup: UIButton!
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var pass: UITextField!
   //this is to adjust the size of the signup button
    func setSignupButton(enabled:Bool) {
        if enabled {
            self.signup.alpha = 1.0
        } else {
            signup.alpha = 1.0
        }
    }
    var flag:Int=0//flag to call segue
    @IBOutlet weak var showError: UITextView!
    //this function will be called when clicked on the sign up button on the butoon of the page
    @objc func handleSignup(){
        //    guard let username = username.text else { return }
        guard let emailtext = email.text else { return }
        guard let pass = pass.text else { return }
        setSignupButton(enabled: false)
        Auth.auth().createUser(withEmail: emailtext, password: pass) { user, error in
            if error == nil && user != nil  && emailtext != "" && pass != ""{
                self.dismiss(animated: false, completion: nil)
                print("User creat!")
                self.flag=0;//no error
                self.showError.text="Welcome to California Beaches"
                self.performSegue(withIdentifier: "goSignIn", sender:nil)
                 
            }
            else if error != nil{
                print("Error logging in:      \(error!.localizedDescription)")
                self.showError.text=error!.localizedDescription
                self.showError.font=UIFont(name: "Times", size: 17)
                self . email.text=""
                self.pass.text=""
                self.user.text=""
                self.flag=1//error is true
            }
        }
    }
    //IB action to handle the click on the button, it sholdn't go to the next page whent the text fileds are empty
    @IBAction func signupDidTapped(_ sender: UIButton) {
      //  if(user.text != nil && email.text != "" && pass.text != ""){
            handleSignup()
            signup.isEnabled=true
           
        }
    //this function dismisses the keyboard when we click somewhere else
    func initializeHideKeyboard(){
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(
            target: self,
            action: #selector(dismissMyKeyboard))
        view.addGestureRecognizer(tap)
    }
    @objc func dismissMyKeyboard(){
        view.endEditing(true)
    }
    //dismiss keyboard when clikced the return on keyboard
     func textFieldShouldReturn(_ textField: UITextField) -> Bool {
         if let nextField = self.view.viewWithTag(textField.tag + 1) as? UITextField {
             nextField.becomeFirstResponder()
         } else {
             textField.resignFirstResponder()
         }
            return false
         }
}
