dim f as integer
dim file_name as string
dim lineIn as string
dim as integer counter_1
dim crabs(1000) as integer
dim as integer min = 2000000
dim as integer max = 0
dim temp as integer
dim as integer total = 0

f = freefile

file_name = CurDir + "\input.txt"

If( Open( file_name For Input As #f ) ) Then
   Print ";ERROR: opening file " ; file_name
   End -1
End If



do until EOF (f)
    input #f, lineIn 'everything
    counter_1 =  counter_1 + 1
    crabs(counter_1) = Valint(lineIn)
loop

for counter_1 = 0 to 1967
	for temp = 1 to 1000
		total = total + abs(counter_1 - crabs(temp))
	next temp
	if total > max then
			max = total
	end if
	if total < min then
		min = total
	end if
	total = 0	
next counter_1

print "Min: "; min
print "Max: "; max	

close #f