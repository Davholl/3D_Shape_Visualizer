extends Spatial

func graph_function (x, z, t) :
	var d = sqrt(x * x + z * z);
	var y = sin(PI * (4.0 * d - t));
	return y / (1.0 + 10.0 * d);
