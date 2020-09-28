extends Spatial;

static func graph_function(x, z, t):
	var y = sin(PI * (x + t));
	return Vector3(x, y, z);


