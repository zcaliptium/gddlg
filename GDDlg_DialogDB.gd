# Copyright (c) 2019-2020 ZCaliptium.
extends Node

const PluginSettings = preload("GDDlg_Settings.gd");
const DialogLoader = preload("GDDlg_DialogLoader.gd");

var DIALOGS: Dictionary = {};
var DLGATTRIBUTES: Dictionary = {}
var OPTATTRIBUTES: Dictionary = {}
var CONDITIONS: Dictionary = {};

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var isLoadOnReady: bool = PluginSettings.get_option(PluginSettings.PROP_LOADONREADY);
	
	register_condition("true", GDDlg_ConditionBase.new());
	register_condition("false", GDDlg_ConditionFalse.new());
	register_condition("not", GDDlg_ConditionNot.new());
	register_condition("and", GDDlg_ConditionAnd.new());
	register_condition("or", GDDlg_ConditionOr.new());
	register_condition("nor", GDDlg_ConditionNor.new());
	
	if (isLoadOnReady):
		load_data();
		
func load_data():
	DialogLoader.load_data();

func register_dialog_attribute(identifier: String, instance: GDDlg_AttributeBase):
	DLGATTRIBUTES[identifier] = instance;
	
func register_option_attribute(identifier: String, instance: GDDlg_AttributeBase):
	OPTATTRIBUTES[identifier] = instance;

func register_condition(identifier: String, instance: GDDlg_ConditionBase):
	CONDITIONS[identifier] = instance;
	
# Getter by key for definition registry.
func get_dialog_by_id(dialog_id: String) -> GDDlg_DialogDefinition:
	return DIALOGS.get(dialog_id);

# Getter by key for attribute registry.
func get_dialog_attribute_by_id(attribute_id: String) -> GDDlg_AttributeBase:
	return DLGATTRIBUTES.get(attribute_id);
	
# Getter by key for attribute registry.
func get_option_attribute_by_id(attribute_id: String) -> GDDlg_AttributeBase:
	return OPTATTRIBUTES.get(attribute_id);

# Getter by key for condition registry.
func get_condition_by_id(condition_id: String) -> GDDlg_ConditionBase:
	return CONDITIONS.get(condition_id);
