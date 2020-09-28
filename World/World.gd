extends Spatial

export var elements = 20;
enum functionEnum {
	SINEFUNCTION,
	SINE2DFUNCTION,
	MULTISINEFUNCTION,
	RIPPLEFUNCTION,
	WAVEFUNCTION,
	TRIPLEWAVEFUNCTION,
	RIPPLE2DFUNCTION,
};
export(functionEnum) var currentfunction;
var function;

enum graphEnum {
	LINEGRAPH,
	SQUAREGRAPH,
	DIAMONDGRAPH,
};
export(graphEnum) var currentGraph;
var graph;

var points = [];
var timer = 0;

func set_up_graph_type():
	match currentGraph:
		graphEnum.LINEGRAPH:
			graph = $Graphs/LineGraph;
		graphEnum.SQUAREGRAPH:
			graph = $Graphs/SquareGraph;
		graphEnum.DIAMONDGRAPH:
			graph = $Graphs/DiamondGraph;
		_:
			graph = $Graphs/LineGraph;
	pass

func _ready():
	set_up_graph_type();
	points = graph.set_up_graph(elements);

func _process(delta):
	for n in range(points.size()):
		var point = points[n];
		choose_function();
		point.translation.y = function.graph_function(point.translation.x, point.translation.z, timer);
		point.get_surface_material(0).set_shader_param("worldPos", point.translation);
	timer+=delta;

func choose_function():
	match currentfunction:
		functionEnum.SINEFUNCTION:
			function = $Functions/SineFunction;
		functionEnum.SINE2DFUNCTION:
			function = $Functions/Sine2DFunction;
		functionEnum.MULTISINEFUNCTION:
			function = $Functions/MultiSineFunction;
		functionEnum.RIPPLEFUNCTION:
			function = $Functions/RippleFunction;
		functionEnum.WAVEFUNCTION:
			function = $Functions/WaveFunction;
		functionEnum.TRIPLEWAVEFUNCTION:
			function = $Functions/TripleWaveFunction;
		functionEnum.RIPPLE2DFUNCTION:
			function = $Functions/Ripple2DFunction;
		_:
			function = $Functions/SineFunction;

	
