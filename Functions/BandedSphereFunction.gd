extends Spatial

static func graph_function(x, z, t):
	var radius = 0.9 + 0.1 * sin(PI * (6.0 * x * 4.0 * z + t));
	var perturbation = radius * cos(0.5 * PI * z + t);
	var newX = perturbation * sin(PI * x)
	var newY = radius * sin(PI * 0.5 *z)
	var newZ = perturbation * cos(PI * x)
	return Vector3(newX, newY, newZ);
