extends MarginContainer

var job_scene = null


func update_job_ui(job_data):
	job_scene = job_data
	# nodes needed
	var description_label = $"VBoxContainer/Discription label"
	var title_label = $"VBoxContainer/MarginContainer/Job title"
	var repeat_checkbox = $VBoxContainer/repeat
	
	# data needed
	var job_name = job_data.job_name
	var job_description = job_data.job_description
	var repeat_job = job_data.job_on_repeat
	
	title_label.text = "Job: " + job_name
	
	if job_description.length() > 0:
		description_label.custom_minimum_size.y = 40
		description_label.text = job_description
	else:
		description_label.custom_minimum_size.y = 0
		description_label.text = job_description
		
	repeat_checkbox.button_pressed = repeat_job
	
	update_work_and_time()


func update_work_and_time():
	# nodes used
	var workers_label = $VBoxContainer/VBoxContainer/HBoxContainer/workers
	var job_time_label = $"VBoxContainer/VBoxContainer/job time"
	var progressbar = $"VBoxContainer/ProgressBar"
	
	# data used
	var workers:int = job_scene.number_of_workers
	var worker_cap:int = job_scene.worker_cap
	var job_time:float = job_scene.job_time
	
	var job_true_time = job_time / workers
	
	workers_label.text = "Workers: %s / %s" % [workers, worker_cap]
	job_time_label.text = "Job time: %s" % job_true_time


# Called when the node enters the scene tree for the first time.
func _ready():
	# nodes needed
	var color_rect = $"ColorRect"
	var description_label = $"VBoxContainer/Discription label"
	var title_label = $"VBoxContainer/MarginContainer/Job title"
	var less_button = $"VBoxContainer/VBoxContainer/controller box/less"
	var more_button = $"VBoxContainer/VBoxContainer/controller box/more"
	var start_button = $"VBoxContainer/HBoxContainer2/start job"
	var stop_button = $"VBoxContainer/HBoxContainer2/stop job"
	
	if job_scene == null:
		color_rect.color = "#c90500"
		description_label.visible = false
		title_label.text = "Could not find job node"
		for job_button in [less_button, more_button, start_button, stop_button]:
			job_button.disabled = true
	elif job_scene.job_in_session:
		deactivate_buttons()
	
	job_scene.job_stopped.connect(func(): reactivate_buttons())


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	# nodes used
	var progressbar = $"VBoxContainer/ProgressBar"
	
	# data needed
	var timer =  job_scene.get_node("JobTimer")
	# code by Average Godot Enjoyer
	if timer.get_time_left() > 0:
		var percent_in_time = (
			1 - timer.get_time_left() / timer.get_wait_time()) * 100
		progressbar.value = percent_in_time
	

func _on_less_pressed():
	job_scene.change_workers(-1)
	update_work_and_time()


func _on_more_pressed():
	job_scene.change_workers(1)
	update_work_and_time()


func reactivate_buttons():
	var less_button = $"VBoxContainer/VBoxContainer/controller box/less"
	var more_button = $"VBoxContainer/VBoxContainer/controller box/more"
	var start_button = $"VBoxContainer/HBoxContainer2/start job"
	less_button.disabled = false
	more_button.disabled = false
	start_button.disabled = false
	
func deactivate_buttons():
		var less_button = $"VBoxContainer/VBoxContainer/controller box/less"
		var more_button = $"VBoxContainer/VBoxContainer/controller box/more"
		var start_button = $"VBoxContainer/HBoxContainer2/start job"
		less_button.disabled = true
		more_button.disabled = true
		start_button.disabled = true

func _on_start_job_pressed():
	# nodes needed
	var repeat_checkbox = $"VBoxContainer/repeat"
	
	if job_scene.number_of_workers > 0:
		deactivate_buttons()
		job_scene.start_job(repeat_checkbox.button_pressed)


func _on_stop_job_pressed():
	job_scene.stop_job()
	reactivate_buttons()
