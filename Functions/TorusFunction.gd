extends Spatial

static func graph_function(x, z, t):
	var radius_major = 1.0;
	var radius_minor = 0.5;
	var perturbation = radius_major + radius_minor * cos(PI * z);
	var newX = perturbation * sin(PI * x)
	var newY = radius_minor * sin(PI *z)
	var newZ = perturbation * cos(PI * x)
	return Vector3(newX, newY, newZ);
