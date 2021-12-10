dim f as integer
dim file_name as string
dim lineIn as string
dim as integer counter_1 = 0
dim delimited as string
dim as integer digits = 0
dim position as integer
dim last_pos as integer
dim distance as integer

f = freefile

file_name = CurDir + "\input.txt"

If( Open( file_name For Input As #f ) ) Then
   Print "ERROR: opening file " ; file_name
   End -1
End If



do until EOF (f)
    input #f, lineIn 'everything
    counter_1 =  counter_1 + 1
    position = instr(lineIn,"|")
    position = instr(position,lineIn," ")
    last_pos = position
    do 
    		position = instr(position + 1,lineIn," ")
    		if position = 0 then
    			distance = len(lineIn) - last_pos
    		else 
    			distance = position - last_pos - 1
    		end if
    		last_pos = position	
    		if (distance = 2 or distance = 3 or distance = 4 or distance = 7) then
    			digits = digits + 1
    		end if
    loop until position = 0
	print digits    

loop


close #f