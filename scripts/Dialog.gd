extends RichTextLabel

class_name DialogText

var dialogue = []

func _ready() -> void:
	set_process_input(true)


func _input(event: InputEvent) -> void:
	if event.is_action_pressed("ui_accept"):
		handle_page()


func handle_page() -> void:
	if page_finished():
		handle_next_page()
	else:
		fast_forward()

func handle_next_page() -> void:
	if has_more_pages():
		show_next_page()
	else:
		remove_dialogue()

func show_page() -> void:
	show_next_page()


func show_next_page() -> void:
	bbcode_text = dialogue.pop_front()
	set_visible_characters(0)


func set_dialogue(_dialogue):
	dialogue = _dialogue


func fast_forward() -> void:
	set_visible_characters(get_total_character_count())


func page_finished() -> bool:
	return get_visible_characters() > get_total_character_count()


func has_more_characterse() -> bool:
	return !page_finished()


func has_more_pages() -> bool:
	return dialogue.size > 0


func remove_dialogue() -> void:
	get_parent().visible = false


func show_next_character():
	set_visible_characters(get_visible_characters() + 1)


func show_dialogue(_dialogue) -> void:
	get_parent().visible = true
	set_dialogue(_dialogue)
	show_page()