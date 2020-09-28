extends Spatial
class_name Graph

onready var pointPrefab = preload("res://World/myCube.tscn");
var myPosition = Vector3(0, 0, 0);
var origin = -1;

var step;
var myScale;

func set_up_vars(elements):
	step = 2.0/elements;
	myScale = Vector3.ONE * step;
	
func set_up_graph(elements):
	set_up_vars(elements);
