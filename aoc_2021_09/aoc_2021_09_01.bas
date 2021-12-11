dim f as integer
dim file_name as string
dim lineIn as string
dim as integer counter_1 = 0
dim shared grid(100,100) as integer
dim row as integer
dim col as integer
dim X1 as integer
dim Y1 as integer
dim X2 as integer
dim Y2 as integer
dim as integer total = 0

f = freefile

file_name = CurDir + "\input.txt"

If( Open( file_name For Input As #f ) ) Then
   Print "ERROR: opening file " ; file_name
   End -1
End If


do until EOF (f)
    input #f, lineIn 'everything
    counter_1 = counter_1 + 1
    For col = 1 to 100
        grid(col,counter_1) = valint(mid(lineIn,col,1))
    Next col

loop

For row = 1 to 100
    For col = 1 to 100
        if col < 2 Then
            if row < 2 Then
                if grid(col,row) < grid(col,row + 1) and grid(col,row) < grid(col + 1,row) then
                    total = total + grid(col,row) + 1
                end if
            elseif row > 99 then
                if grid(col,row) < grid(col,row - 1) and grid(col,row) < grid(col + 1,row) then
                    total = total + grid(col,row) + 1
                end if
            else
                if grid(col,row) < grid(col,row - 1) and grid(col,row) < grid(col + 1,row)  and grid(col,row) < grid(col,row + 1) then
                    total = total + grid(col,row) + 1
                end if
            end if
        elseif col > 99 Then
            if row < 2 Then
                if grid(col,row) < grid(col,row + 1) and grid(col,row) < grid(col - 1,row) then
                    total = total + grid(col,row) + 1
                end if
            elseif row > 99 then
                if grid(col,row) < grid(col,row - 1) and grid(col,row) < grid(col - 1,row) then
                    total = total + grid(col,row) + 1
                end if
            else
                if grid(col,row) < grid(col,row - 1) and grid(col,row) < grid(col - 1,row)  and grid(col,row) < grid(col,row + 1) then
                    total = total + grid(col,row) + 1
                end if
            end if
        else
            if row < 2 Then
                if grid(col,row) < grid(col - 1,row) and grid(col,row) < grid(col + 1,row)  and grid(col,row) < grid(col,row + 1) then
                    total = total + grid(col,row) + 1
                end if
            elseif row > 99 then
                if grid(col,row) < grid(col - 1,row) and grid(col,row) < grid(col + 1,row)  and grid(col,row) < grid(col,row - 1) then
                    total = total + grid(col,row) + 1
                end if
            else
                if grid(col,row) < grid(col - 1,row) and grid(col,row) < grid(col + 1,row)  and grid(col,row) < grid(col,row - 1) and grid(col,row) < grid(col,row + 1) then
                    total = total + grid(col,row) + 1
                end if
            end if
        end if
    Next col
Next row

print total

close #f

