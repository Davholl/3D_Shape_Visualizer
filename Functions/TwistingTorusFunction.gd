extends Spatial

static func graph_function(x, z, t):
	var radius_major = 0.7 + 0.1 * sin(PI * (6.0 * x + 0.5 * t));
	var radius_minor = 0.15 + 0.05 * sin(PI * (8.0 * x + 4.0 * z * 2.0 * t));
	var perturbation = radius_major + radius_minor * cos(PI * z);
	var newX = perturbation * sin(PI * x)
	var newY = radius_minor * sin(PI *z)
	var newZ = perturbation * cos(PI * x)
	return Vector3(newX, newY, newZ);
