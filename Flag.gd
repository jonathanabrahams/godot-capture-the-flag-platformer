extends Area2D
signal captured
func _on_RigidBody2D_body_entered(body):
	(get_node("CollisionShape2D/84/83") as AnimationPlayer).play("captured")
	$CollisionShape2D/Timer.start()
	
func _on_Timer_timeout():
	emit_signal("captured")