extends Spatial

onready var pointPrefab = preload("res://myCube.tscn");
var elements = 100;
var myPosition = Vector3(0, 0, 0);
onready var step = 2.0/elements;
onready var myScale = Vector3.ONE * step;
var origin = -1;
var points = [];
var timer = 0;

# Called when the node enters the scene tree for the first time.
func _ready():
	for n in range(elements):
		var point = pointPrefab.instance();
		add_child(point);
		myPosition.x = n * step + origin;
		myPosition.y = myPosition.x * myPosition.x;
		point.translation = myPosition;
		point.scale = myScale;
		point.get_surface_material(0).set_shader_param("xPosition", myPosition.x);
		point.get_surface_material(0).set_shader_param("yPosition", myPosition.y);
		points.push_back(point);
	pass # Replace with function body.


func _process(delta):
	for n in range(points.size()):
		var point = points[n];
		point.translation.y = sin(PI * (point.translation.x + timer));
		point.get_surface_material(0).set_shader_param("yPosition", point.translation.y);
		pass
	timer+=delta;
