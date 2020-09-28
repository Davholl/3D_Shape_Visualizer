extends Camera

enum cameraEnum {
	SIDEVIEW,
	TOPVIEW,
	DEFAULTVIEW
};
export(cameraEnum) var currentView;

var defaultTranslation: Vector3;
var defaultRotation: Vector3;

func _ready():
	defaultTranslation = translation;
	defaultRotation = rotation;

func _process(delta):
	choose_view();

func choose_view():
	match currentView:
		cameraEnum.SIDEVIEW:
			translation = Vector3(0, 0, 4);
			rotation = Vector3(0, 0, 0);
		cameraEnum.TOPVIEW:
			translation = Vector3(0, 2, -1);
			rotation = Vector3(-90, 0, 0);
		cameraEnum.DEFAULTVIEW:
			translation = defaultTranslation;
			rotation = defaultRotation;
