# Copyright (c) 2019-2020 ZCaliptium.
extends Object
class_name GDDlg_DialogDefinition

# Fields.
var identifier: String;
var attributes: Dictionary = {};
var options: Array = [];

# Constructor.
func _init(id: String) -> void:
	identifier = id;

func get_attribute(key: String, default = null):
	return attributes.get(key, default);

# Get stack data from the Dictionary.
#   For example you can get such dictionary from JSON.
func from_data(json_data: Dictionary):
	var item_id = json_data.get("id", "null");
	var item_attributes = json_data.get("attributes", {});
	var item_options = json_data.get("options", []);
	
	if (typeof(item_id) == TYPE_STRING):
		identifier = item_id;
		
	if (typeof(item_attributes) == TYPE_DICTIONARY):
		attributes = item_attributes;

	if (typeof(item_options) == TYPE_ARRAY):
		options = item_options;

# Returns Dictionary that represents this dialog definition.
#   Use to_json on result to get JSON string.
func to_data() -> Dictionary:
	var data: Dictionary = {};
	
	data["id"] = identifier;
	data["attributes"] = attributes;
	data["options"] = options;
	
	return data;
