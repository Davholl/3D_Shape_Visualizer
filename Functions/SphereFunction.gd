extends Spatial

static func graph_function(x, z, t):
	var radius = cos(0.5 * PI * z);
	var newX = sin(PI * x) * radius
	var newY = sin(PI * 0.5 *z)
	var newZ = cos(PI * x) * radius
	return Vector3(newX, newY, newZ);
