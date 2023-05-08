extends Node

var job_name:String = ""
var job_description:String = ""

var job_in_session:bool = false
var job_on_repeat:bool = false

var number_of_workers:int = 0
var worker_cap:int = 4

var job_time:float = 1.0
var rewards:Array = []

signal job_completed
signal job_stopped


func set_job(job_data):
	job_name = job_data.get("name")
	job_description = job_data.get("description")
	worker_cap = job_data.get("worker cap")
	job_time = float(job_data.get("time"))
	rewards = job_data.get("rewards")


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
		var global_worker_change = number * -1
		if new_total_workers < 0: # number will be negative, but adds to population
			number_of_workers = 0
			global_worker_change = number_of_workers
		elif new_total_workers > worker_cap: # number will be positive, but takes from population
			number_of_workers = worker_cap
			global_worker_change = number_of_workers - worker_cap
		else:
			number_of_workers = new_total_workers
		
		print(global_worker_change)
		GameData.change_resource("population", global_worker_change)


func stop_job():
	job_in_session = false
	$JobTimer.stop()
	emit_signal("job_stopped")


func start_job(repeat_on):
	$JobTimer.wait_time = job_time/ number_of_workers
	job_in_session = true
	job_on_repeat = repeat_on
	$JobTimer.start()


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


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
	for reward in rewards:
		var item = reward[0]
		var quantity = reward[1]
		#GameData.change_resource_number(item, quantity)
