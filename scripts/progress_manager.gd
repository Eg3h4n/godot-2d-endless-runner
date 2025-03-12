extends Node

static var total_progress_amount: int

signal on_progress_update
signal on_progress_updated

func _ready() -> void:
	on_progress_update.connect(update_progress)

func update_progress():
	total_progress_amount += 1
	
	on_progress_updated.emit(total_progress_amount)
