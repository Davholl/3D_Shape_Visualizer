extends Graph

func set_up_graph(elements):
	set_up_vars(elements);
	var points = [];
	for bloco in range(elements):
		var point: MeshInstance = pointPrefab.instance();
		point.set_surface_material(0, point.get_surface_material(0).duplicate());
		add_child(point);
		myPosition.x = bloco * step + origin;
		myPosition.y = myPosition.x * myPosition.x;
		myPosition.z = origin;
		point.translation = myPosition;
		point.scale = myScale;
		point.get_surface_material(0).set_shader_param("worldPos", myPosition);
		points.push_back(point);
	return points;
