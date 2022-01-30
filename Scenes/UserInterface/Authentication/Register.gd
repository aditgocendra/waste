extends Control

var collection : FirestoreCollection

func _ready():
	#Firebase Authentication
	Firebase.Auth.connect("signup_succeeded", self, "_on_FirebaseSuccessSignUP")
	Firebase.Auth.connect("signup_failed", self, "_on_FirebaseFailedSignUP")
	
	#Firebase Firestore
	collection = Firebase.Firestore.collection('users')
	collection.connect("get_document", self, "_on_get_document")


func _on_Register_pressed():
	var email = $Panel/VBoxContainer/Email.text
	var password = $Panel/VBoxContainer/Password.text
	var re_pass = $Panel/VBoxContainer/RePassword.text
	
	if password == re_pass:
		Firebase.Auth.signup_with_email_and_password(email, password)
	else:
		print("Pass and re-pass not same")


func _on_FirebaseSuccessSignUP(auth_info : Dictionary):
	print("success")
	
	collection.get('3iBLsUhdhGiIiu7M3Z9r')
	var document : FirestoreDocument = yield(collection, "get_document")
	
func _on_FirebaseFailedSignUP(error_code, message):
	print(error_code)
	print(message)

func _on_get_document(document : FirestoreDocument):
	print(document)


func _on_RedirectLogin_pressed():
	get_parent().slide_menu("Login")
