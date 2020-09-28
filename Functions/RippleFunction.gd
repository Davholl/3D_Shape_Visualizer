extends Spatial

static func graph_function(x, z, t):
	var d = abs(x);
	var y = sin(PI * (4.0 * d - t));
	y = y/(1.0 + 10.0 *d);
	return Vector3(x, y, z);
