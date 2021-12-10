dim f as integer
dim file_name as string
dim lineIn as string
dim as integer counter_1 = 0
dim delimited as string
dim as integer digits = 0
dim position as integer
dim last_pos as integer
dim distance as integer
dim numbers(10) as string
dim num_count as integer
dim stop_pos as integer
dim new_num as string
dim change as integer
dim out_num(4) as integer
dim out_index as integer
dim short_total as integer
dim as unsigned long total = 0

f = freefile

file_name = CurDir + "\input.txt"

function is_group(haystack as string,needle as string) as boolean
dim as integer needle_pos = 0
dim as integer hit_count = 0

for needle_pos = 1 to len(needle)
	if (instr(haystack,mid(needle,needle_pos,1)) > 0) then
		hit_count = hit_count + 1
	end if
next needle_pos
	if hit_count = len(needle) then
		return TRUE
	else
		return FALSE
	end if
end function


If( Open( file_name For Input As #f ) ) Then
   Print "ERROR: opening file " ; file_name
   End -1
End If



do until EOF (f)
    input #f, lineIn 'everything
    counter_1 =  counter_1 + 1

	for num_count = 1 to 10
    	numbers(num_count) = ""
	next num_count
  do
  	 	change = 0
    	position = 0
    	last_pos = 1
    	stop_pos = instr(lineIn,"|") - 2
    	do until position > stop_pos
    		position = instr(position + 1,lineIn," ")
    		if position >= stop_pos then
    			new_num = trim(mid(lineIn,last_pos,stop_pos - last_pos + 1))
    		else
    			new_num = trim(mid(lineIn,last_pos, position - last_pos))
    		end if
    		last_pos = position
    		if len(new_num) = 2 then
    			numbers(1) = new_num
    		elseif len(new_num) = 3 then
    			numbers(7) = new_num
    		elseif len(new_num) = 7 then
    			numbers(8) = new_num
    		elseif len(new_num) = 4 then
    			numbers(4) = new_num
    		end if
    		if (len(new_num) = 6) andalso (len(numbers(1)) > 0) andalso (len(numbers(4)) > 0) andalso (len(numbers(7)) > 0) andalso (len(numbers(8)) > 0) then
    			if is_group(new_num, numbers(4)) then
    				numbers(9) = new_num
    			elseif is_group(new_num, numbers(1)) then
    				numbers(10) = new_num
    			else
    				numbers(6) = new_num
    			end if
    		end if
    		if (len(new_num) = 5) and (len(numbers(6)) > 0) and (len(numbers(1)) > 0) and (len(numbers(4)) > 0) and (len(numbers(7)) > 0) and (len(numbers(8)) > 0) then
    			if is_group(numbers(6),new_num) then
    				numbers(5) = new_num
	    		elseif is_group(new_num,numbers(1)) then
    				numbers(3) = new_num
    			else
    				numbers(2) = new_num
    			end if
    		end if
    	loop
    for num_count = 1 to 10
    	if numbers(num_count) = "" then
    		change = change + 1
    	end if
    next num_count
   loop while change > 0

	for num_count = 1 to 10
    	print num_count; " ";numbers(num_count); " ";
   	next num_count

    position = instr(lineIn,"|")
    position = instr(position,lineIn," ")
    last_pos = position
	out_index = 1
    do
    	position = instr(position + 1,lineIn," ")
    	if position = 0 then
			new_num = trim(mid(lineIn,last_pos,len(lineIn) - last_pos + 1))
    	else
			new_num = trim(mid(lineIn,last_pos,position - last_pos))
    	end if
		distance = len(new_num)
    	last_pos = position
    	if (distance = 2) then out_num(out_index) = 1
		if (distance = 3) then out_num(out_index) = 7
		if (distance = 4) then out_num(out_index) = 4
		if (distance = 7) then out_num(out_index) = 8
		if (distance = 6) then
			if is_group(new_num, numbers(9)) then
    				out_num(out_index) = 9
    		elseif is_group(new_num, numbers(10)) then
    				out_num(out_index) = 0
    		else
    				out_num(out_index) = 6
    		end if
		end if
		if (distance = 5) then
    		if is_group(new_num, numbers(5)) then
    			out_num(out_index) = 5
	    	elseif is_group(new_num,numbers(3)) then
    			out_num(out_index) = 3
    		else
    			out_num(out_index) = 2
    		end if
    	end if
    	last_pos = position
		out_index = out_index + 1
		print new_num;" ";
    loop until position = 0

	out_num(1) = out_num(1) * 1000
	out_num(2) = out_num(2) * 100
	out_num(3) = out_num(3) * 10
	short_total = out_num(1) + out_num(2) + out_num(3) + out_num(4)
	print short_total
	total = total + short_total
	print

loop

print "TOTAL: "; total
close #f