

subject struct
		obtained_Mark db 0
		max_Mark db 0
subject ends

database struct
		subjects db 5(subject)

database ends

testing struct
	obtained_Marks db 5(0)
		max_Marks db 5(0)
testing ends

.model small
.stack 0100h
.data


enter_marks db "Please Enter Marks of Student $"
enter_total db "Please Enter total Marks of Student $"

teststruct testing 5 DUP(<>) ; make object

.code
mov ax,@data ; initialize data segment
mov ds,ax
mov ax,0


Main proc

	; load address of the string 
 mov DX, offset enter_marks 
 ;output the string
 ;loaded in dx 
 MOV AH,09H
 INT 21H 

MOV dl, 10; move cursor to next line
MOV ah, 02h
INT 21h


mov cx,5 ; total 5 subjects

enter_subject_marks:

	scanNum:

      mov ah, 01h
      int 21h

      cmp al, 13   ; Check if user pressed ENTER KEY
      je  next 

      mov ah, 0  
      sub al, 48   ; ASCII to DECIMAL

      mov cl, al
      mov al, bl   ; Store the previous value in AL

      mul dl       ; multiply the previous value with 10

      add al, cl   ; previous value + new value ( after previous value is multiplyed with 10 )
      mov bl, al

      jmp scanNum    

next:
	mov teststruct[0].obtained_Marks , bl
	
loop enter_subject_marks


main endp


mov ah, 4ch
int 21h
end