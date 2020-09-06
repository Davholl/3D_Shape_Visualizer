extends Spatial

onready var pointPrefab = preload("res://myCube.tscn");
export var elements = 20;
enum graphEnum {
	SINEFUNCTION,
	SINE2DFUNCTION,
	MULTISINEFUNCTION
};
export(graphEnum) var currentGraph;
var graph;
var myPosition = Vector3(0, 0, 0);
onready var step = 2.0/elements;
onready var myScale = Vector3.ONE * step;
var origin = -1;
var points = [];
var timer = 0;

# Called when the node enters the scene tree for the first time.
func _ready():
	for linha in range(elements):
		for bloco in range(elements):
			var point = pointPrefab.instance();
			add_child(point);
			myPosition.x = bloco * step + origin;
			myPosition.y = myPosition.x * myPosition.x;
			myPosition.z = linha * step;
			point.translation = myPosition;
			point.scale = myScale;
			point.get_surface_material(0).set_shader_param("xPosition", myPosition.x);
			point.get_surface_material(0).set_shader_param("yPosition", myPosition.y);
			points.push_back(point);
		pass
	pass # Replace with function body.


func _process(delta):
	for n in range(points.size()):
		var point = points[n];
		choose_graph_function();
		point.translation.y = graph.graph_function(point.translation.x, point.translation.z, timer);
		point.get_surface_material(0).set_shader_param("yPosition", point.translation.y);
		pass
	timer+=delta;

func choose_graph_function():
	match currentGraph:
		graphEnum.SINEFUNCTION:
			graph = get_node("SineFunction");
		graphEnum.SINE2DFUNCTION:
			graph = get_node("Sine2DFunction");
		graphEnum.MULTISINEFUNCTION:
			graph = get_node("MultiSineFunction");

	
