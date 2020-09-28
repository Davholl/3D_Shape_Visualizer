extends Spatial

static func graph_function(x, z, t):
	var radius = 0.5 + 0.5 * sin(PI * t);
	var perturbation = radius * cos(0.5 * PI * z);
	var newX = perturbation * sin(PI * x)
	var newY = radius * sin(PI * 0.5 *z)
	var newZ = perturbation * cos(PI * x)
	return Vector3(newX, newY, newZ);
