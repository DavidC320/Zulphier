extends Node

var job_name:String = ""
var job_description:String = ""

var job_in_session:bool = false
var job_on_repeat:bool = false

var number_of_workers:int = 0
var worker_cap:int = 4

var job_time:float = 1.0
var rewards:Array = []
var job_exp:int
var job_show_reqs:Array

var parent_data

signal job_completed
signal job_stopped


func set_job(job_data):
	job_name = job_data.get("name")
	job_description = job_data.get("description")
	worker_cap = job_data.get("worker cap")
	job_time = float(job_data.get("time"))
	rewards = job_data.get("rewards")
	var show_reqs = job_data.get("show")
	if show_reqs == null:
		show_reqs = []
	job_show_reqs = show_reqs

	var _exp = job_data.get("exp")
	if _exp == null:
		_exp = 0
	job_exp = _exp


func update_job(workers:int, repeat:bool):
	number_of_workers = workers
	job_on_repeat = repeat


func change_workers(number):
	"changes the number of workers in this job then adds or subtracts from global population"
	var available_workers = GameData.population
	var check_if_a_population = available_workers >= number
	
	if check_if_a_population:
		# changing the number of workers in this job
		var new_total_workers = number_of_workers + number
		var true_worker_cap = worker_cap + parent_data.worker_cap_bonus

		var global_worker_change = number * -1
		if new_total_workers < 0: # number will be negative, but adds to population
			number_of_workers = 0
			global_worker_change = number_of_workers
		elif new_total_workers > true_worker_cap: # number will be positive, but takes from population
			number_of_workers = true_worker_cap
			global_worker_change = number_of_workers - true_worker_cap
		else:
			number_of_workers = new_total_workers
		GameData.change_resource("population", global_worker_change)


func stop_job():
	job_in_session = false
	$JobTimer.stop()
	emit_signal("job_stopped")


func start_job(repeat_on):
	#nodes
	var job_timer = $JobTimer

	#data
	var time_bonus = parent_data.job_time_decrease

	var time_length = time_bonus * (job_time/ number_of_workers)

	job_timer.wait_time = time_length
	job_in_session = true
	job_on_repeat = repeat_on
	job_timer.start()


# Called when the node enters the scene tree for the first time.
func _ready():
	parent_data = get_parent().get_parent()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_job_timer_timeout():
	emit_signal("job_completed")
	give_reward()
	if not job_on_repeat:
		stop_job()

func give_reward():
	"This will give the player a reward for compelting a job"
	var resource_bonus = parent_data.resource_bonus

	for reward in rewards:
		var item = reward[0]
		var quantity = reward[1] * resource_bonus
		GameData.change_resource(item, quantity)
