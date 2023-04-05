#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
; SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.






;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; CONFIG ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
SetKeyDelay 70, 45 ; Delay das teclas - SetKeyDelay [, Delay, PressDuration]

passwordX=712 ; Janela de password do Tibia
passwordY=354

tokenPosX=682 ; Janela do Token do Tibia
tokenPosY=389

refreshX=575 ; Posição do botão "Refresh" no app do E-mail
refreshY=63

firstEmailX=459 ; Posição do primeiro E-mail na janela do E-mail (Local onde fica o e-mail do Token quando acaba de chegar)
firstEmailY=178

tokenInicialX=752 ; Começo do Token no E-mail para copiar
tokenInicialY=350

tokenFinalX=703 ; Final do Token no E-mail para copiar
tokenFinalY=350

Password=password ; Password da sua account (A opção Remember Email deve ser marcada pois o macro não preenche o e-mail, sendo necessário o usuario preencher na primeira vez)

DirDoTibia=C:\Users\yourUserName\AppData\Local\Tibia ; Diretorio onde está o Tibia.exe

JanelaDoTibia=Tibia - CharacterName ; Nome da janela do Tibia quando o char que irá runar está ONLINE

JanelaEmail=Caixa de entrada - ; Nome da janela do Email

JanelaTinyTasker=Runar.rec ; Nome da janela do TinyTasker quando você já deu load no script do Tiny, mas ainda não deu Play (Precisa terminar com .rec)

PosCharList=8 ; Qual posição do seu char na sua Character List. Caso seja o primeiro, coloque 0. Caso seja o segundo coloque 1, e assim por diante.

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;




;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;CODIGO;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;



IfWinNotExist, Tibia ; Verifica se o Tibia.exe está aberto
{
	MsgBox 0, Cooldown: 5seg, Vamos abrir o Tibia, 5
   	RunWait, Tibia.exe, % DirDoTibia, max
	Sleep, 16000
	MsgBox 0, Cooldown: 5seg, Abrimos o Tibia, 5
}

IfWinNotExist, Tibia - ; Verifica se algum char já está logado
{
	MsgBox 0, Cooldown: 5seg, Vamos logar o char, 5

	WinActivate, Tibia
	WinWaitActive, Tibia

	Send, {Esc}
	Sleep, 1000
	Send, {Esc}

	MouseMove, passwordX, passwordY, 30
	Click
	Send, % Password
	Sleep, 1000
	Send, {Enter}
	Sleep, 2500

	WinActivate, % JanelaEmail
	WinWaitActive, % JanelaEmail
	Sleep, 5000
	MouseMove, refreshX, refreshY, 30
	Click
	Sleep, 20000

	MouseMove, firstEmailX, firstEmailY, 30
	Click
	Sleep, 5000

	MouseClickDrag, Right, tokenInicialX, tokenInicialY, tokenFinalX, tokenFinalY, 40
	Sleep, 1000
	Send, {Ctrl down}c{Ctrl up}
	Sleep, 1000

	WinActivate, Tibia
	WinWaitActive, Tibia

	MouseMove, tokenPosX, tokenPosY, 30
	Click
	Sleep, 1000
	Send, {Ctrl down}v{Ctrl up}
	Sleep, 1000
	Send, {Enter}
	Sleep, 6000

	Loop, % PosCharList
	{
		Send, {down}
		Sleep, 500
	}

	Send, {Enter}
	Sleep, 20000
	MsgBox 0, Cooldown: 5seg, Vamos começar a Runar, 5
	Sleep, 1000
	Send {Ctrl down}{Shift down}{Alt down}{p down}{p up}{Alt up}{Shift up}{Ctrl up}
}else{ ; Caso você tenha executado o Script com o char JÁ LOGADO
	IfWinNotExist, % JanelaDoTibia ; Verifica se o char logado é o char que desejamos runar
	{
		WinActivate, Tibia - ; Altera para a janela do Tibia
		MsgBox 0, Cooldown: 3seg, Auto-Reconnect ligado! O char logado não é o correto. Vamos deslogar!, 3
		Send, {Ctrl down}{q down}{q up}{Ctrl up}; Desloga o char
	}else{
		IfWinNotExist, % JanelaTinyTasker ; Verifica se o TinyTasker está ligado
		{
			WinActivate, Tibia - ; Altera para a janela do Tibia
			MsgBox 0, Cooldown: 2seg, Auto-Reconnect ligado! Detectei que o TinyTasker já está ligado, 2
		}else{
			WinActivate, Tibia - ; Altera para a janela do Tibia
			MsgBox 0, Cooldown: 2seg, Auto-Reconnect ligado! Ligando o Tiny Tasker.., 2
			Sleep, 1500
			Send {Ctrl down}{Shift down}{Alt down}{p down}{p up}{Alt up}{Shift up}{Ctrl up} ; Liga o Tiny Tasker
		}
	}
}

Loop {
	IfWinNotExist, % JanelaDoTibia ; Verifica se o char está logado
	{
		IfWinNotExist, % JanelaTinyTasker ; Verifica se o TinyTasker estava ligado
		{
			Send {Ctrl down}{Shift down}{Alt down}{p down}{p up}{Alt up}{Shift up}{Ctrl up} ; Desliga o Tiny Tasker
			MsgBox 0, Cooldown: 2seg, TinyTasker foi desligado, 2
		}else{
			MsgBox 0, Cooldown: 2seg, TinyTasker já estava desligado. Vamos recarregar o script, 2
		}
		Sleep, 1000
		Reload ; Recarrega o Script
	}
		Sleep, 300000 ; Faz o check de 5 em 5 minutos
}

^j::
IfWinNotExist, % JanelaTinyTasker ; Verifica se o TinyTasker estava ligado
	{
		Send {Ctrl down}{Shift down}{Alt down}{p down}{p up}{Alt up}{Shift up}{Ctrl up} ; Desliga o Tiny Tasker
		MsgBox 0, Cooldown: 2seg, TinyTasker e AutoReconnect foram desligados, 2
	}else{
		MsgBox 0, Cooldown: 2seg, TinyTasker ja estava desligado. Desligamos o Script, 2
	}
Sleep, 500
ExitApp
