extends Control



func _ready():
	Firebase.Auth.connect("login_succeeded", self, "_on_LoginSuccess")
	Firebase.Auth.connect("login_failed", self, "_on_LoginFailed")
	
func _on_Button_pressed():
	var email = $Panel/VBoxContainer/Email.text
	var password = $Panel/VBoxContainer/Password.text
	
	Firebase.Auth.login_with_email_and_password(email, password)
	

func _on_LoginSuccess(user : Dictionary):
	print("Success")
	
func _on_LoginFailed(error_code, message):
	print(error_code)
	print(message)




func _on_RedirectRegist_pressed():
	get_parent().slide_menu("Register")
