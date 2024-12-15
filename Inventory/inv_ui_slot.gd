extends Panel

@onready var item_visual: Sprite2D = $CenterContainer/Panel/item_display
@onready var amount_text: Label = $CenterContainer/Panel/Label

func update(slot: InvSlot):
	if slot.item == null or slot.amount <= 0:
		# Hide visuals if no item or invalid amount
		item_visual.visible = false
		amount_text.visible = false
	else:
		# Update visuals and text for the slot
		item_visual.visible = true
		item_visual.texture = slot.item.texture if slot.item.texture else null
		amount_text.visible = true
		if slot.amount!=1:
			amount_text.text = "x" + str(slot.amount)
