; ===============================================================================================================================
; Hotkeys for Tibia
; Version: 1.0
;
; Author ....: Bruno Amado
; Dev Start .: 23.07.2020
; ===============================================================================================================================

#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.





;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; CONFIG ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

TibiaName := "Tibia - CharacterName" ; O nome da janela do Tibia quando seu char está logado. As hotkeys só irão funcionar caso esta janela esteja em primeiro plano e ativa.
TibiaControl := 3 ; 1 = Classic Controls, 2 = Regular Controls, 3 = Left Smart-Click ... WARNING: For Refular Controls, you NEED to configure as "Loot: Shift+Right" (This avoid attacking other players when looting)
CtrlToDrag := 0 ; "Press CTRL to Drag Complete Stacks" on Tibia Options. -> 1 = Checked, 0 = Unchecked

;................ HOTKEYS - CONFIGURATION ................
;;;;;;;; ^ = Ctrl / ! = Alt / + = Shift ;;;;;;;;
;;;;;;;; Example: ^5   You need to press Ctrl+5;
;Link to all key list: https://www.autohotkey.com/docs/KeyList.htm

AutolootHk := "XButton1" ; Auto-loot
DragHk := "XButton2" ; Arrastar item para a BP de cima
ObsidianHk := "MButton" ; Usar Obsidian/Blessed
TrashHk := "^'" ; Joga flor em todos SQM em volta
FlowerDropHk := "^1" ; Joga flor em todos SQM em volta
FlowerPickHk := "^2" ; Recolhe todas as flores dos SQM em volta
PickAllHk := "^3" ; Recolhe todos os itens dos SQM em volta e joga na BP onde está o mouse
TurnAroundHk := "^4" ; Fica girando o char até pressionar novamente ou pressionar esc
;................. Gui Special Config ...............
MouseRebind := false ; True: O Mouse4 e Mouse5 será remapeado.  False: O Script não irá alterar Mouse4 nem Mouse5
Mouse4Hk := "." ; Rebinda o botão do Mouse4 (botão lateral mouse). Exp: Ao apertar Mouse4, será enviado o input "."
Mouse5Hk := "," ; Rebinda o botão do Mouse5. Exemplo: Ao apertar Mouse5, será enviado o input ","
;..........................................................

;....................... MOUSE POSITIONS ..................
;...Run the Script and press Ctrl+p to see the mouse pos...
;; SQMs around your char:
SqmCenter := {x: 639, y: 350}
SqmTop := {x: 639, y: 292}
SqmTopRight := {x: 697, y: 293}
SqmRight := {x: 697, y: 350}
SqmBottomRight := {x: 697, y: 408}
SqmBottom := {x: 639, y: 408}
SqmBottomLeft := {x: 583, y: 408}
SqmLeft := {x: 583, y: 350}
SqmTopLeft := {x: 582, y: 293}
;;

BackpackFirstSlot := {x: 1300, y: 395} ; Pos do primeiro slot da BP principal
FlorFirstSlot := {x: 1300, y: 395} ; Pos do primeiro slot da BP/BAG de FLOR

;;HotkeyBar In-Game Positions
ObsidianKnife := {x: 1011, y: 729} ; Posicao da Obsidian Knife na barra de hotkey. Obs: Também pode ser usado com Blessed Wooden Stake







;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; CODIGO ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;....Persistents Variables.......
;........do NOT change...........
;#IfWinActive Tibia
Help := false
IsTurning := false
SporePosX := 0
SporePosY := 0

;...Mapping the Custom Hotkeys...
;........do NOT change...........
Hotkey,%AutolootHk%,AutolootHkOnPress
Hotkey,%DragHk%,DragHkOnPress
Hotkey,%ObsidianHk%,ObsidianHkOnPress
Hotkey,%FlowerDropHk%,FlowerDropHkOnPress
Hotkey,%TrashHk%,TrashHkOnPress
Hotkey,%FlowerPickHk%,FlowerPickHkOnPress
Hotkey,%PickAllHk%,PickAllHkOnPress
Hotkey,%TurnAroundHk%,TurnAroundHkOnPress
if MouseRebind {
Hotkey,XButton1,Mouse4HkOnPress
Hotkey,XButton2,Mouse5HkOnPress
}
return

;... Mouse Rebinds
Mouse4HkOnPress:
Send, %Mouse4Hk%
return
Mouse5HkOnPress:
Send, %Mouse5Hk%
return
;.................


; Auto-Loot
;*XButton1::
AutolootHkOnPress:
MouseGetPos, InitXpos, InitYpos ; Salva a posicao inicial do mouse
Switch (TibiaControl){
Case 1:
	MouseMove, SqmCenter.x, SqmCenter.y
	Send {Shíft Down}{RButton}{Shift Up} ; Shift+RightClick
	Sleep, 10
	MouseMove, SqmTop.x, SqmTop.y
	Send {Shíft Down}{RButton}{Shift Up}
	Sleep, 10
	MouseMove, SqmTopRight.x, SqmTopRight.y
	Send {Shíft Down}{RButton}{Shift Up}
	Sleep, 10
	MouseMove, SqmRight.x, SqmRight.y
	Send {Shíft Down}{RButton}{Shift Up}
	Sleep, 10
	MouseMove, SqmBottomRight.x, SqmBottomRight.y
	Send {Shíft Down}{RButton}{Shift Up}
	Sleep, 10
	MouseMove, SqmBottom.x, SqmBottom.y
	Send {Shíft Down}{RButton}{Shift Up}
	Sleep, 10
	MouseMove, SqmBottomLeft.x, SqmBottomLeft.y
	Send {Shíft Down}{RButton}{Shift Up}
	Sleep, 10
	MouseMove, SqmLeft.x, SqmLeft.y
	Send {Shíft Down}{RButton}{Shift Up}
	Sleep, 10
	MouseMove, SqmTopLeft.x, SqmTopLeft.y
	Send {Shíft Down}{RButton}{Shift Up}
Case 2:
    MouseMove, SqmCenter.x, SqmCenter.y
	Send {Shíft Down}{RButton}{Shift Up} ; Shift+RightClick
	Sleep, 10
	MouseMove, SqmTop.x, SqmTop.y
	Send {Shíft Down}{RButton}{Shift Up}
	Sleep, 10
	MouseMove, SqmTopRight.x, SqmTopRight.y
	Send {Shíft Down}{RButton}{Shift Up}
	Sleep, 10
	MouseMove, SqmRight.x, SqmRight.y
	Send {Shíft Down}{RButton}{Shift Up}
	Sleep, 10
	MouseMove, SqmBottomRight.x, SqmBottomRight.y
	Send {Shíft Down}{RButton}{Shift Up}
	Sleep, 10
	MouseMove, SqmBottom.x, SqmBottom.y
	Send {Shíft Down}{RButton}{Shift Up}
	Sleep, 10
	MouseMove, SqmBottomLeft.x, SqmBottomLeft.y
	Send {Shíft Down}{RButton}{Shift Up}
	Sleep, 10
	MouseMove, SqmLeft.x, SqmLeft.y
	Send {Shíft Down}{RButton}{Shift Up}
	Sleep, 10
	MouseMove, SqmTopLeft.x, SqmTopLeft.y
	Send {Shíft Down}{RButton}{Shift Up}
Case 3:
	MouseMove, SqmCenter.x, SqmCenter.y
	Send {Alt Down}
	Click ; Alt+LeftClick
	Sleep, 10
	MouseMove, SqmTop.x, SqmTop.y
	Click
	Sleep, 10
	MouseMove, SqmTopRight.x, SqmTopRight.y
	Click
	Sleep, 10
	MouseMove, SqmRight.x, SqmRight.y
	Click
	Sleep, 10
	MouseMove, SqmBottomRight.x, SqmBottomRight.y
	Click
	Sleep, 10
	MouseMove, SqmBottom.x, SqmBottom.y
	Click
	Sleep, 10
	MouseMove, SqmBottomLeft.x, SqmBottomLeft.y
	Click
	Sleep, 10
	MouseMove, SqmLeft.x, SqmLeft.y
	Click
	Sleep, 10
	MouseMove, SqmTopLeft.x, SqmTopLeft.y
	Click
	Send {Alt Up}
}
Sleep, 10
MouseMove, InitXpos, InitYpos ; Retorna o mouse para a posição inicial
return


; Usar Blessed Wooden Stake na posição do mouse
;MButton::
ObsidianHkOnPress:
MouseGetPos, InitXpos, InitYpos ; Salva a posicao inicial do mouse, que é o sqm onde a stake será usada
MouseMove, ObsidianKnife.x, ObsidianKnife.y
Sleep, 50
Click
Sleep, 50
MouseMove, InitXpos, InitYpos
Sleep, 50
Click
return


; Arrastar item da bp debaixo para a bp de cima
;*XButton2::
DragHkOnPress:
MouseGetPos, InitXpos, InitYpos ; Salva a posicao inicial do mouse, que é o sqm onde a stake será usada
while, getkeystate("" . DragHk, "p")
{
MouseClickDrag, Left, InitXpos, InitYpos, InitXpos, (InitYpos - 70)
Sleep, 50
MouseMove, InitXpos, InitYpos
Sleep, 50
}
return


; Joga flor no sqm que está o mouse
;^1::
FlowerDropHkOnPress:
MouseGetPos,InitXpos, InitYpos ; Salva a posicao inicial do mouse, para restaurar no final
Send {Shift Down} ; Segura o shift apertado, para jogar somente 1 item caso use potion ou gold
MouseClickDrag, Left, FlorFirstSlot.x, FlorFirstSlot.y, InitXpos, InitYpos
Sleep, 120
Send {Shift Up} ; Libera a tecla Shift
return

; Trasha o pé 
;^'::
TrashHkOnPress:
MouseGetPos,InitXpos, InitYpos ; Salva a posicao inicial do mouse, para restaurar no final
Send {Shift Down} ; Segura o shift apertado, para jogar somente 1 item caso use potion ou gold
MouseClickDrag, Left, FlorFirstSlot.x, FlorFirstSlot.y, SqmCenter.x, SqmCenter.y
MouseMove, InitXpos, InitYpos
Sleep, 120
Send {Shift Up} ; Libera a tecla Shift
return


; Puxar todos itens dos SQM em volta para a BP de flor
;^2::
FlowerPickHkOnPress:
MouseGetPos,InitXpos, InitYpos ; Salva a posicao inicial do mouse, para restaurar no final
Send {Ctrl Up} ; Libera a tecla Ctrl (Ja que uso o ctrl+2 para ativar este macro)
MouseClickDrag, Left, SqmCenter.x, SqmCenter.y, FlorFirstSlot.x, FlorFirstSlot.y
Sleep, 120
MouseClickDrag, Left, SqmTop.x, SqmTop.y, FlorFirstSlot.x, FlorFirstSlot.y
Sleep, 120
MouseClickDrag, Left, SqmTopRight.x, SqmTopRight.y, FlorFirstSlot.x, FlorFirstSlot.y
Sleep, 120
MouseClickDrag, Left, SqmRight.x, SqmRight.y, FlorFirstSlot.x, FlorFirstSlot.y
Sleep, 120
MouseClickDrag, Left, SqmBottomRight.x, SqmBottomRight.y, FlorFirstSlot.x, FlorFirstSlot.y
Sleep, 120
MouseClickDrag, Left, SqmBottom.x, SqmBottom.y, FlorFirstSlot.x, FlorFirstSlot.y
Sleep, 120
MouseClickDrag, Left, SqmBottomLeft.x, SqmBottomLeft.y, FlorFirstSlot.x, FlorFirstSlot.y
Sleep, 120
MouseClickDrag, Left, SqmLeft.x, SqmLeft.y, FlorFirstSlot.x, FlorFirstSlot.y
Sleep, 120
MouseClickDrag, Left, SqmTopLeft.x, SqmTopLeft.y, FlorFirstSlot.x, FlorFirstSlot.y
MouseMove, InitXpos, InitYpos
return

; Puxar todos itens dos SQM em volta para a BP embaixo do CURSOR
;^3::
PickAllHkOnPress:
MouseGetPos,InitXpos, InitYpos ; Salva a posicao inicial do mouse, que é onde os items do chão serão jogados
MouseClickDrag, Left, SqmCenter.x, SqmCenter.y, InitXpos, InitYpos
Sleep, 120
MouseClickDrag, Left, SqmTop.x, SqmTop.y, InitXpos, InitYpos
Sleep, 120
MouseClickDrag, Left, SqmTopRight.x, SqmTopRight.y, InitXpos, InitYpos
Sleep, 120
MouseClickDrag, Left, SqmRight.x, SqmRight.y, InitXpos, InitYpos
Sleep, 120
MouseClickDrag, Left, SqmBottomRight.x, SqmBottomRight.y, InitXpos, InitYpos
Sleep, 120
MouseClickDrag, Left, SqmBottom.x, SqmBottom.y, InitXpos, InitYpos
Sleep, 120
MouseClickDrag, Left, SqmBottomLeft.x, SqmBottomLeft.y, InitXpos, InitYpos
Sleep, 120
MouseClickDrag, Left, SqmLeft.x, SqmLeft.y, InitXpos, InitYpos
Sleep, 120
MouseClickDrag, Left, SqmTopLeft.x, SqmTopLeft.y, InitXpos, InitYpos
return


; Fica girando o char
TurnAroundHkOnPress:
IsTurning := !IsTurning
While(IsTurning){
	Send, {Ctrl down}{Up}{Ctrl up}
	Sleep, 150
	Send, {Ctrl down}{Right}{Ctrl up}
	Sleep, 150
	Send, {Ctrl down}{Down}{Ctrl up}
	Sleep, 150
	Send, {Ctrl down}{Left}{Ctrl up}
	Sleep, 150
}
return

; Usa uma BP inteira de "gnomish spore gatherer" no spore onde está o mouse (Task da Warzone)
; Obs: Sempre deixar a bp de sporte aberta de forma que o primeiro slot, seja a variavel "BackpackFirstSlot" que você setou aqui nas config
; DESATIVADO


; Desativa todas hotkeys Toogle
~Esc::
IsTurning := !IsTurning ; Se o personagem estiver rodando, ele para
return

; Exibe a posição do cursor para a configuração do script
^p::
MouseGetPos, xpos, ypos
MsgBox, 0, Posição do cursor, Posição atual do cursor: X: %xpos% Y: %ypos%`nUse estas posicoes para configurar as variaveis do Script.
return


; Exibe a Tooltip box com as hotkeys disponiveis
^j::
if !Help { ;; Verifica se a janela já não estava aberta
	ToolTip, HOTKEYS:`nMouse3: Usar Obsidian`nMouse4: Auto-Loot`nMouse5: Push Backpack`nCtrl+1: Jogar flor em volta`nCtrl+2: Recolhe flor para Bp de flor`nCtrl+3: Puxa tudo do chão pra bp embaixo do mouse`nCtrl+P: Mostra a pos do cursor`nPara fechar aperte Ctrl+J
	Help := true
}else{
ToolTip ; Fecha a janela
Help := false
}
return