extends Control


func _ready():
	Firebase.Auth.connect("signup_succeeded", self, "_on_FirebaseSuccessSignUP")
	Firebase.Auth.connect("signup_failed", self, "_on_FirebaseFailedSignUP")



func _on_Register_pressed():
	var email = $VBoxContainer/Email.text
	var password = $VBoxContainer/Password.text
	var re_pass = $VBoxContainer/RePassword.text
	
	
	if password == re_pass:
		Firebase.Auth.signup_with_email_and_password(email, password)
	else:
		print("error")


func _on_FirebaseSuccessSignUP(auth_info : Dictionary):
	print("success")
	
func _on_FirebaseFailedSignUP(error_code, message):
	print(error_code)
	print(message)
