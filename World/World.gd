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
	SPHEREFUNCTION,
	SCALINGSPHEREFUNCTION,
	BANDEDSPHEREFUNCTION,
	HORIZONTALBANDSPHEREFUNCTION,
	VERTICALBANDSPHEREFUNCTION,
	TORUSFUNCTION,
	TWISTINGTORUSFUNCTION,
};
export(functionEnum) var currentfunction;
var function;

enum graphEnum {
	LINEGRAPH,
	SQUAREGRAPH,
	DIAMONDGRAPH,
};
var currentGraph = graphEnum.SQUAREGRAPH;
var graph: Graph;

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
	choose_function();
	timer+=delta;
	var x = 0;
	var z = 0;
	for n in range(points.size()):
		var point = points[n];
		
		if (currentGraph == graphEnum.SQUAREGRAPH):
			if x == elements:
				x = 0;
				z +=1;
				
		var u = (x + 0.5) * graph.step - 1.0;
		var v = (z + 0.5) * graph.step - 1.0;
		point.translation = function.graph_function(u, v, timer);
		point.get_surface_material(0).set_shader_param("worldPos", point.translation);
		x+=1;
		
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
		functionEnum.SPHEREFUNCTION:
			function = $Functions/SphereFunction;
		functionEnum.SCALINGSPHEREFUNCTION:
			function = $Functions/ScalingSphereFunction;
		functionEnum.BANDEDSPHEREFUNCTION:
			function = $Functions/BandedSphereFunction;	
		functionEnum.HORIZONTALBANDSPHEREFUNCTION:
			function = $Functions/HorizontalBandSphereFunction;	
		functionEnum.VERTICALBANDSPHEREFUNCTION:
			function = $Functions/VerticalBandSphereFunction;	
		functionEnum.TORUSFUNCTION:
			function = $Functions/TorusFunction;	
		functionEnum.TWISTINGTORUSFUNCTION:
			function = $Functions/TwistingTorusFunction;		
		_:
			function = $Functions/SineFunction;

	
