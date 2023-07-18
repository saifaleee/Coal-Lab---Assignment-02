.286  ; interpreter changed
.model small
.stack 0200h  ; set stack size

.data

counter dw 0
number dw 6

line1 dw 2
line_2 dw 2
row1 dw 0
row2 dw 0

.code

main proc 
     mov ax, @data ; connect Data Segment
     mov ds,ax
	 mov ax, 0

mov cx, number ; printting till number

printing_pattern : ; prints above pattern

    inc row1
	mov bx, row1
    mov bx, cx   ; make a backup of cx , bcz of nested loop
	cmp cx, 1
	je skip ; dont print spaces on last line
	; prints spaces
    sub cx, 1
	cmp cx, 0
		 je skip 

	 print_space:
	     mov dx, ' ' ; prints space
		 mov ah , 2
		 int 21h
		 
		 ;inc counter
	 loop print_space

	 skip:
	  
	 ; prints numbers 
	 mov di, row1; 1
	 mov cx,row1 	 

	 printing_numbers1 : ; print till number reaches 0
	       ; thisfunction prints left trianlge
           mov dx, row1 
		   add dx, 48 ; add 48 to convert to suitiable datatype
		   mov ah, 2
		   int 21h
		   dec row1

	 loop printing_numbers1
	 
	 mov row1, di
	 
	 ; prints number 2 pyramid  ; print 
     mov dx, row1 ; prints right triangle
	 sub dx , 1
	 mov cx, dx
	 mov si, line1
	 cmp cx, 0
	 je skip2

	 opposite_number : ; increase number till rx number
           mov dx ,line1 
		   add dx, 48
		   mov ah, 2
		   int 21h
		   inc line1 	 
	 loop opposite_number
	 skip2:
	 mov line1, si
	 
	 ; move to next line1
	 
	 mov dl, 10 ; shift cursor to next starting line
	 mov ah, 2
	 int 21h

	 mov dl, 13
	 mov ah, 2
	 int 21h
	 
	 
	 mov cx, bx


; ############################################################################
loop printing_pattern 
 
 
 
 
 mov dx, number 
 sub dx, 1
 mov row1, dx; row1 = 3
 mov cx, dx	
 ; now print the triangle in reverse order

printing_lower_pattern :
  inc row2

  mov bx, cx
  mov cx, row2

    space1: ; print spaces before number
	     mov dx, ' '
		 mov ah , 2
		 int 21h
	
	loop space1
 
 
 mov si, row1
 mov cx, row1
 
 
 number2: ; print number after spaces
           mov dx,row1
		   add dx, 48
		   mov ah, 2
		   int 21h
		   dec row1
 
 loop number2
 mov row1, si
 
 ; row1 = 3
 mov dx, row1 
 sub dx, 1
 mov cx, dx
 mov si, line1; make a bacckup value in memory 
 cmp cx, 0
 je nextline_jump


 opposite_number2 : ; now print right side of bottom triangle 
     mov dx, line1
	 add dx, 48
	 mov ah, 2
	 int 21h
	 inc line1

loop opposite_number2  
nextline_jump:
 mov line1, si
 
 
   ; move to next line1
	 
	 mov dl, 10
	 mov ah, 2 ;shifting curosr postion
	 int 21h
	 mov dl, 13
	 mov ah, 2
	 int 21h
	 
	   dec row1
	 mov cx, bx
 
loop printing_lower_pattern
 
	
main endp
	 
;##################################################### TERMINATE PROGRAM	 
mov ah, 4ch
int 21h

end