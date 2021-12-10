dim f as integer
dim file_name as string
dim lineIn as string
dim as integer counter_1 = 0
dim fish(9) as ulongint
dim fish_day as integer
dim day_count as integer
dim temp as ulongint

f = freefile

file_name = CurDir + "\input.txt"

If( Open( file_name For Input As #f ) ) Then
   Print "ERROR: opening file " ; file_name
   End -1
End If


do until EOF (f)
    input #f, lineIn 'everything
    counter_1 =  counter_1 + 1
    fish_day = Valint(lineIn)
    fish(fish_day) = fish(fish_day) + 1
    
loop

for day_count = 1 to 256
	temp = fish(0)
	fish(0) = fish(1)
	fish(1) = fish(2)
	fish(2) = fish(3)
	fish(3) = fish(4)
	fish(4) = fish(5)
	fish(5) = fish(6)
	fish(6) = fish(7) + temp
	fish(7) = fish(8)
	fish(8) = temp	
next day_count


temp = 0
for fish_day = 0 to 8
	temp = temp + fish(fish_day)
next fish_day

print temp

close #f