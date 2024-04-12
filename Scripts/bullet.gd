extends Area2D



#Armazena pocição inicial da bala quando criada
onready var initial_position = global_position
#define velocidade da bala
export var velocidade = 600
#armazena a informação se bala esta "viva" OU não
var live = true 
#armazena direção da bala
var direcao = Vector2() setget set_direcao

export var damage = 10
var tipo_elemental = "normal"
var tipo_de_bala = "normal"

var pronto = false

#cadencia de tiro
var cadencia = 0.5

#_____________________________________________________________________________________________________________________________
#função chamado no começo do jogo (NÃO USADO)
func _ready():
	pass
#_____________________________________________________________________________________________________________________________
#função chamada todo frame
func _physics_process(delta):
	translate(direcao * velocidade * delta)
	pass
#_____________________________________________________________________________________________________________________________
#desenha a bala
func _draw():
	draw_circle(Vector2(), 5 , Color (0 , 1, 0))
#_____________________________________________________________________________________________________________________________
#função destroi bala quando ela sai da tela
func _on_VisibilityNotifier2D_screen_exited():
	_AutoDestroy()

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



