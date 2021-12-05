dim f as integer
dim file_name as string
dim lineIn as string
dim coordinates(4) as integer
dim as integer counter_1 = 0
dim shared grid(1000,1000) as integer
dim row as integer
dim col as integer
dim X1 as integer
dim Y1 as integer
dim X2 as integer
dim Y2 as integer
dim temp as integer

f = freefile

file_name = CurDir + "\input.txt"

If( Open( file_name For Input As #f ) ) Then
   Print "ERROR: opening file " ; file_name
   End -1
End If

'Zero out the grid.
For row = 1 to 1000
    For col = 1 to 1000
        grid(col,row) = 0
    Next col
Next row

do until EOF (f)
    input #f, lineIn 'everything
    counter_1 =  counter_1 + 1
    coordinates((counter_1 Mod 4) + 1) = Valint(lineIn)
    if ((counter_1 Mod 4) + 1) = 1 Then
        X1 = coordinates(2)
        Y1 = coordinates(3)
        X2 = coordinates(4)
        Y2 = coordinates(1)
        if (X1 = X2) Then
            if (Y1 > Y2) Then 'make low to high
                temp = Y2
                Y2 = Y1
                Y1 = temp
            end if
            for temp = Y1 to Y2
                grid(X1, temp) = grid(X1, temp) + 1
            next temp
        end if
        if (Y1 = Y2) Then
            if (X1 > X2) Then 'make low to high
                temp = X2
                X2 = X1
                X1 = temp
            end if
            for temp = X1 to X2
                grid(temp, Y1) = grid(temp, Y1) + 1
            next temp
        end if
    end if

loop

counter_1 = 0
For row = 1 to 1000
    For col = 1 to 1000
        if (grid(col,row) > 1) Then
            counter_1 = counter_1 + 1
        end if
    Next col
Next row

print counter_1

close #f

