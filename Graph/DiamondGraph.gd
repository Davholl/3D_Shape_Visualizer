extends Graph

func set_up_graph(elements):
	set_up_vars(elements);
	var points = [];
	for linha in range(elements):
		var posicaoXLinha = linha * step + origin;
		var blocosNaLinha: int = round(elements - abs(posicaoXLinha) * elements);
		print(blocosNaLinha) 
		for bloco in range(blocosNaLinha):
			var point: MeshInstance = pointPrefab.instance();
			point.set_surface_material(0, point.get_surface_material(0).duplicate());
			add_child(point);
			myPosition.x = posicaoXLinha;
			myPosition.y = myPosition.x * myPosition.x;
			myPosition.z = bloco * step - (blocosNaLinha/2*step);
			point.translation = myPosition;
			point.scale = myScale;
			point.get_surface_material(0).set_shader_param("worldPos", myPosition);
			points.push_back(point);
	return points;
