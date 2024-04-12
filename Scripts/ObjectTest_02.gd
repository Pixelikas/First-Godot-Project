extends KinematicBody2D

#constante que define o valor minimo de velocidade do jogador ()
const VELOCIDADE_MINIMA = 0
#variavel boleana usada que define se o jogador esta se movendo ou não
var jogador_se_movendo = false
#variavel publica que define velocidade em tempo real do jogador
export var velocidade_atual = 0
#variavel publica define a velocidade ( ela interage junto com a aceleração na hora de calcular a mudança de velocidade) 
export var velocidade = 50
#variavel publica que define a velocidade maxima que o jogador pode atingir
export var velocidade_maxima = 500
#variavel publica que define o grao de acelerção (ela interage junto com a velocidade na hora de calcular a mudança de velocidade)
export var acerecao = 5
#define vida do objeto
export var hp = 50

export var ready_to_hit = true




#_____________________________________________________________________________________________________________________________
#Função chamada sempre que o jogo começa (NÃO UTILIZADA NO CODIGO)
func _ready():
	pass
#_____________________________________________________________________________________________________________________________
#função chamada todo frame 
func _physics_process(delta):
	
	$Hit_Area.look_at(get_global_mouse_position())
	
	#Condição checa se o jogador estever se movendo, caso nao esteja ele reduz a velocidade_atual gradativamente até chegar a zero
	if jogador_se_movendo == false:
		#redução gradativo da velocidade_atual
		velocidade_atual -= velocidade * acerecao * delta
		#codição para limitar velocidade minimado jogador (assim sempre que a velocidade atual chegar ao valor da velocidade maxima ele vai parar de aumentar)
		if velocidade_atual <= VELOCIDADE_MINIMA:
			velocidade_atual = VELOCIDADE_MINIMA
	
	if Input.is_action_pressed("hit") and ready_to_hit:
		_GolpeDoJogador()
	
	#Condição checa se qualquer botão de movimento estiver sendo apertado, caso qualquer um deles de TRUE 
	if Input.is_action_pressed("move_down") or Input.is_action_pressed("move_up") or Input.is_action_pressed("move_right") or Input.is_action_pressed("move_left"):
		jogador_se_movendo = true
		_MovimentoDoJogador(delta)
	#condiçaõ else server pra "resetar" a varivael jogador_se_movendo para false caso nenhum botão de movimento esteja sendo apertado
	else:
		jogador_se_movendo = false
		
	#print usada pra fazer debug da velocidade atual do jogador
	#print(velocidade_atual)
	pass
#_____________________________________________________________________________________________________________________________
#Função desenha aparencia do jogador
func _draw():
	draw_circle(Vector2(), 30 , Color (1 , 0 , 0))

#_____________________________________________________________________________________________________________________________
#Função usada para definir direção de movimento do jogador baseado no botão apertado e o aumento gradual da velocidade do jogador quando se movimentando
func _MovimentoDoJogador(delta):
	
	#aumento gradativo da velocidade_atual
	velocidade_atual += velocidade * acerecao * delta
	#codição para limitar velocidade maxima do jogador (assim sempre que a velocidade atual chegar ao valor da velocidade maxima ele vai parar de aumentar)
	if velocidade_atual >= velocidade_maxima:
			velocidade_atual = velocidade_maxima
	
	#botão que move pra direita
	if Input.is_action_pressed("move_right"):
		move_and_slide(Vector2(1, 0) * velocidade_atual)
		
	#botão que move pra esquerda
	if Input.is_action_pressed("move_left"):
		move_and_slide(Vector2(-1, 0) * velocidade_atual)
		
	#botão que move pra cima
	if Input.is_action_pressed("move_up"):
		move_and_slide(Vector2(0, -1) * velocidade_atual)
		
	#botão que move pra baixo
	if  Input.is_action_pressed("move_down"):
		move_and_slide(Vector2(0 , 1) * velocidade_atual)
		
#_____________________________________________________________________________________________________________________________

func _GolpeDoJogador():

	pass
	
	
	
func _on_CadenciaDeTiro_timeout():
	ready_to_hit = true
	pass 



#Destroy objeto
#func _AutoDestroy():
#	queue_free()
	
	

	




