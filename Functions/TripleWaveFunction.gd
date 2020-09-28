extends Spatial

static func graph_function(x, z, t):
	var y = sin(PI * (x + 0.5 * t));
	y += 0.5 * sin(2.0 * PI * (z + t));
	y += sin(PI * (x + z + 0.25 * t));
	y=  y * (1.0 / 2.5);
	return Vector3(x, y, z);
