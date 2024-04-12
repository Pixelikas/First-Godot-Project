extends Area2D


#armazena direção do golpe
var direcao = Vector2() setget set_direcao

export var damage = 10
var tipo_elemental = "normal"
var tipo_de_bala = "normal"

var pronto = false

#cadencia de golpe
var cadencia = 0.5

#_____________________________________________________________________________________________________________________________
#função chamado no começo do jogo (NÃO USADO)
func _ready():
	pass
#_____________________________________________________________________________________________________________________________
#função chamada todo frame
func _physics_process(delta):
	pass

#_____________________________________________________________________________________________________________________________
#Destroy objetos quando chamada
func _AutoDestroy():
	queue_free()
	pass

#_____________________________________________________________________________________________________________________________
#função difine direção da bala
func set_direcao(val):
	direcao = val
	rotation = direcao.angle()
	pass






