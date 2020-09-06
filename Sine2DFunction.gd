extends Spatial;

const function = "Sine2DFunction";

static func graph_function(x, z, t):
	var y = sin(PI * (x + t));
	y += sin(PI * (z + t));
	y *= 0.5;
	return y;
