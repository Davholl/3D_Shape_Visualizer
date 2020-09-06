extends Spatial;

const function = "MultiSineFunction";

static func graph_function(x, z, t):
	var y = sin(PI * (x + t));
	y += sin(2.0 * PI * (x + t)) / 2.0;
	y *= 1.5;
	return y;
