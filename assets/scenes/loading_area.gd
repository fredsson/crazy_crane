extends Spatial


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var containerNodes = [];
var containerScene: PackedScene;
var spawnTimer: Timer;
var availableIndices = {};
var random = RandomNumberGenerator.new();

# Called when the node enters the scene tree for the first time.
func _ready():
	random.randomize();
	containerScene = load("res://assets/scenes/container/container.tscn");
	for c in self.get_children():
		if "container_point" in c.name:
			containerNodes.push_back(c);
			availableIndices[containerNodes.size() - 1] = true;
	spawnTimer = Timer.new();
	self.add_child(spawnTimer);
	spawnTimer.one_shot = false;
	spawnTimer.connect("timeout", self, "spawn_container");
	spawnTimer.start(2);

func spawn_container():
	var available = [];
	for key in availableIndices:
		if availableIndices[key]:
			available.push_back(key);
		
	if !available.empty():
		var index = random.randi_range(0, available.size() - 1);
		var key = available[index];
		containerNodes[key].add_child(containerScene.instance());
		availableIndices[key] = false;
	else:
		print('loading area full!');
		spawnTimer.stop();
		

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
