extends CanvasLayer

@onready var progress_amount: Label = $MarginContainer/VBoxContainer/HBoxContainer/ProgressAmount

func _ready() -> void:
	ProgressManager.on_progress_updated.connect(on_progress_updated)
	
func on_progress_updated(total_amount: int):
	progress_amount.text = str(total_amount)
