extends Spatial;

const function = "MultiSineFunction";

static func graph_function(x, z, t):
	var y = sin(PI * (x + 0.5 * t));
	y += 0.5 * sin(2.0 * PI * (x + t));
	return y;
