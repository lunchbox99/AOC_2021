dim f as integer
dim file_name as string
dim lineIn as string
dim as integer counter_1 = 0
dim as integer counter_2 = 0
dim col as integer
dim row as integer
dim value as integer
dim  as integer grid(10,10)
dim change as boolean
dim popx as integer
dim popy as integer
dim flashes as integer

f = freefile

file_name = CurDir + "\input.txt"

If( Open( file_name For Input As #f ) ) Then
   Print "ERROR: opening file " ; file_name
   End -1
End If



do until EOF (f)
    input #f, lineIn 'everything
    counter_1 = counter_1 + 1
    for col = 1 to 10
        grid(col, counter_1) = ValInt(mid(lineIn,col,1))
    next col

loop

do
counter_2 = counter_2 + 1
'start cycle
'add 1 to each cell
for row = 1 to 10
    for col = 1 to 10
        grid(col, row) = grid(col, row) + 1
    next col
next row

'scan for more than 9
change = FALSE
do
    change = FALSE
    for row = 1 to 10
        for col = 1 to 10
            if grid(col, row) > 9 then
                change = TRUE
                grid(col, row) = -100
                flashes = flashes + 1
                for popy = (row - 1) to (row + 1)
                    for popx = (col - 1) to (col + 1)
                        if  (0 < popx) and (popx < 11) and (0 < popy) and (popy < 11) then
                            grid(popx, popy) = grid(popx, popy) + 1
                        end if
                    next popx
                next popy
            end if
        next col
    next row
loop until change = FALSE

for row = 1 to 10
    for col = 1 to 10
        if grid(col, row) < 0 then
            grid(col, row) = 0
        end if
    next col
next row


for row = 1 to 10
    for col = 1 to 10
        print grid(col, row);
    next col
    print
next row

flashes = 0
for row = 1 to 10
    for col = 1 to 10
        if grid(col, row) = 0 then
            flashes = flashes + 1
        end if
    next col
next row

loop until flashes = 100
print "Cycle: "; counter_2
close #f

