extends Spatial

const function = "WaveFunction";

static func graph_function(x, z, t):
	return sin(PI * (x + z + t));
