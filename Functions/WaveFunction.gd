extends Spatial

static func graph_function(x, z, t):
	var y = sin(PI * (x + z + t));
	return Vector3(x, y, z);
