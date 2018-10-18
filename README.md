# LoginPageTvOS

# Overview
The Optimizely tvOS app allows developers to test Login page containig username. The goal of this project is to validate the Login Page of Apple TV.

TestCases in Login senerios assumed are:-<br /> 

Username should not be empty.<br />
Username should have atleast 2 characters.<br />



# Prerequisites
Make sure you have all of the following setup before walking through the demo apps.
1. Make sure you have the latest macOS installed. Your macOS version must be at least OS X 10.11 El Capitan.
2. Make sure that the latest Xcode is installed. Your Xcode version must be at least Xcode 9.0 for the full tvOS simulator runtime. 
3. Make sure you have a tvOS simulator installed. To download a simulator:
    * In Xcode, choose Xcode > Preferences
    * In the preferences window, click Downloads
    * In Components, find the tvOS simulator version you want to add, and click he Install button.
4. No dependency manager for tvOS.

# Getting Started
Clone the project<br />
Run the Project<br />
Launch the simulator<br />
Run Testcases in LoginPageTvOSUITests file by clicking gray diamond button<br />
Test Case executes successfully if green diamond button appears<br />

# How it works(Step Definition)
I would have a ViewController which looks like the following

```ruby
class ViewController: UIViewController {

    @IBOutlet weak var userName: UITextField!

    @IBOutlet weak var loginBtn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func loginBtnClick(_ sender: Any) {
        
        let result = validate(username: userName.text!)
        switch result {
        case .failure(let error):
            self.showAlert(status: error.localizedDescription, title: "This is Failure Alert!")
            //error
            return
        case .success(_):
            self.showAlert(status:"Success", title: "This is Alert!")
            break
            
        }
        
    }
    
```


UserName texfield is used to take input (username) from user.After click on login button validate function is responsible for 
validating the user input.If data is validated successfully success Alert will appear otherwise error prompt will be Shown.
For testing & validating user data we have extended the XCTestCase class


```ruby
class LoginPageTvOSUITests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        XCUIApplication().launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
```ruby

   The viewcontroller is set up in the XCUIApplication() function. This setUp() function is called before the execution of the every tests.
In Test cases we have tested
Whether usename textfield exists

```ruby
func testUernameExists() {
        
        let myTextField = XCUIApplication().textFields["user_name"]
        XCTAssert(myTextField.exists)
        
        
        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
   ```
    
This test determinses whether username is empty empty on click of button login
  
  ```ruby

    func testUernameisEmpty() {
        
        let myTextField = XCUIApplication().textFields["user_name"]
        XCTAssert(myTextField.hasFocus)
        XCUIRemote.shared.press(.select)
        myTextField.typeText("")
        XCUIRemote.shared.press(.select)
        XCTAssert(myTextField.exists)
        XCTAssert(myTextField.label.isEmpty)
        
        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    This test case deteremines whether button for login exists
 
  ```ruby
  
    func testLoginBtnExists() {
        
        let mybutton = XCUIApplication().buttons["login_button"]
        XCTAssert(mybutton.exists)
        
        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    ```
   
   Next is to check whether user name length is valid according to defined scenerio.<br />
     
     ```ruby

      func testLoginBtnClick() {
        
        let myTextField = XCUIApplication().textFields["user_name"]
        XCTAssert(myTextField.hasFocus)
        XCUIRemote.shared.press(.select)
        myTextField.typeText("string")
        
        XCUIRemote.shared.press(.down)
        XCUIRemote.shared.press(.down)
        XCUIRemote.shared.press(.down)
        XCUIRemote.shared.press(.select)
        
        let mybutton = XCUIApplication().buttons["login_button"]
        XCTAssert(mybutton.exists)

        XCUIRemote.shared.press(.down)
        if(mybutton.hasFocus){
            XCUIRemote.shared.press(.select)

       }
      ```
    The testcase will get executed when folling XUElement become focussed on screen by using breakpoints.<br />    
    
    
# Unit Tests
Unit tests are written using XCTest.

To run the unit tests simply hit Cmd + U in Xcode.

# Configuration
No configuration is needed.
    
