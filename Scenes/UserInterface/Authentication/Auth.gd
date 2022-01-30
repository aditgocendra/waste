extends Control

onready var register = $Register
onready var login  = $Login
onready var tween = $Tween

func _ready():
	register.rect_position = Vector2(-500, register.rect_position.y)
	
	
func slide_menu(menu : String):
	
	if menu == "Login":
		tween.interpolate_property(login, "rect_position",
				login.rect_position, get_viewport_rect().size / 2, 0.7,
				Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
		tween.start()
		
		tween.interpolate_property(register, "rect_position",
				register.rect_position, Vector2(-500, register.rect_position.y), 0.7,
				Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
		tween.start()  
	else:
		tween.interpolate_property(register, "rect_position",
				register.rect_position, get_viewport_rect().size / 2, 0.7,
				Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
		tween.start()
		
		tween.interpolate_property(login, "rect_position",
				login.rect_position, Vector2(login.rect_position.x, get_viewport_rect().size.y + 500), 0.7,
				Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
		tween.start()  

