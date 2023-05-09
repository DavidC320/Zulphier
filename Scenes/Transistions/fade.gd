extends CanvasLayer

var gamescreen = preload("res://Scenes/GameScreen/GameScreen.tscn")

func change_scene(target: String):
	$AnimationPlayer.play("fade")
	await $AnimationPlayer.animation_finished
	get_tree().change_scene_to_file(target)
	$AnimationPlayer.play_backwards("fade")

func start_game(map_size, padding, n_scale, altidude):
	$AnimationPlayer.play("fade")
	$AnimationPlayer.play("fade")
	await $AnimationPlayer.animation_finished
	var game = gamescreen.instantiate()
	game.update_map(map_size, padding, n_scale, altidude)
	get_tree().change_scene_to_packed(game)
	$AnimationPlayer.play_backwards("fade")
