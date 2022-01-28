extends Control


func _ready():
	Firebase.Auth.connect("login_succeeded", self, "on_FirebaseLoginSuccess")
	Firebase.Auth.connect("login_failed", self, "on_FirebaseLoginFailed")


func _on_Button_pressed():
	var email = $VBoxContainer/Email.text
	var password = $VBoxContainer/Password.text
	
	Firebase.Auth.login_with_email_and_password(email, password)

func on_FirebaseLoginSuccess(auth):
	print("Success")
	
func on_FirebaseLoginFailed(error_code, message):
	print(error_code)
	print(message)
