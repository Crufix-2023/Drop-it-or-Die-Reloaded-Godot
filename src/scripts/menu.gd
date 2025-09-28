extends Node2D

@onready var anim_player = $AnimationPlayer

@onready var hide_cont = $"CanvasLayer/Second Container/Base/Name Container/Hide Container"
@onready var game_mode_cont = $"CanvasLayer/Second Container/Base/Game mode  Container"
@onready var settings_cont = $"CanvasLayer/Second Container/Base/Settings Container"
@onready var name_cont = $"CanvasLayer/Second Container/Base/Name Container/Name Container"

@onready var play_btn = $"CanvasLayer/Main Container/Buttons/Play"
@onready var settings_btn = $"CanvasLayer/Main Container/Buttons/Settings"

var sec_cont_anm = 0

var name_null = "Null"
var name_game_mode = "Выбор игрового режима"
var name_settings = "Настройки"

func _ready() -> void:
	name_cont.text = name_null
	hide_cont.disabled = true
	game_mode_cont.hide()
	settings_cont.hide()

func _on_play_pressed() -> void:
	if sec_cont_anm == 0:
		sec_cont_anm = 1
		play_btn.disabled = true
		settings_btn.disabled = true
		name_cont.text = name_game_mode
		game_mode_cont.show()
		anim_player.play("second container in")
		await wait(0.8)
		settings_btn.disabled = false
		hide_cont.disabled = false
	else:
		settings_btn.disabled = false
		play_btn.disabled = true
		name_cont.text = name_game_mode
		settings_cont.hide()
		game_mode_cont.show()


func _on_settings_pressed() -> void:
	if sec_cont_anm == 0:
		sec_cont_anm = 1
		play_btn.disabled = true
		settings_btn.disabled = true
		name_cont.text = name_settings
		settings_cont.show()
		anim_player.play("second container in")
		await wait(0.8)
		play_btn.disabled = false
		hide_cont.disabled = false
	else:
		play_btn.disabled = false
		settings_btn.disabled = true
		name_cont.text = name_settings
		game_mode_cont.hide()
		settings_cont.show()


func _on_clear_label_pressed() -> void:
	if sec_cont_anm == 1:
		play_btn.disabled = true
		settings_btn.disabled = true
		hide_cont.disabled = true
		###
		anim_player.play("second container out")
		await wait(0.8)
		sec_cont_anm = 0
		###
		name_cont.text = name_null
		game_mode_cont.hide()
		settings_cont.hide()
		###
		play_btn.disabled = false
		settings_btn.disabled = false

func wait(_time: float) -> Signal:
	return get_tree().create_timer(_time).timeout
