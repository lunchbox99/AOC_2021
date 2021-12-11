dim f as integer
dim file_name as string
dim lineIn as string
dim as integer counter_1 = 0
dim shared grid(100,100) as integer
dim row as integer
dim col as integer
dim as integer total(3)
dim as integer switch = 10
dim as boolean change = FALSE
dim as integer last_switch = 10
dim count2 as integer
dim as integer count3 = 0


f = freefile

file_name = CurDir + "\input.txt"

If( Open( file_name For Input As #f ) ) Then
   Print "ERROR: opening file " ; file_name
   End -1
End If

function hit(col as integer, row as integer, test as integer) as boolean
    if col < 2 Then
        if row < 2 Then
            if test = grid(col,row + 1) or test = grid(col + 1,row) then
                    return TRUE
            end if
        elseif row > 99 then
            if test = grid(col,row - 1) or test = grid(col + 1,row) then
                return TRUE
            end if
        else
            if test = grid(col,row - 1) or test = grid(col + 1,row)  or test = grid(col,row + 1) then
                return TRUE
            end if
        end if
    elseif col > 99 Then
        if row < 2 Then
            if test = grid(col,row + 1) or test = grid(col - 1,row) then
                return TRUE
            end if
        elseif row > 99 then
            if test = grid(col,row - 1) or test = grid(col - 1,row) then
                return TRUE
            end if
        else
            if test = grid(col,row - 1) or test = grid(col - 1,row)  or test = grid(col,row + 1) then
                return TRUE
            end if
        end if
    else
        if row < 2 Then
            if test = grid(col - 1,row) or test = grid(col + 1,row)  or test = grid(col,row + 1) then
                return TRUE
            end if
        elseif row > 99 then
            if test = grid(col - 1,row) or test = grid(col + 1,row)  or test = grid(col,row - 1) then
                return TRUE
            end if
        else
            if test = grid(col - 1,row) or test = grid(col + 1,row)  or test = grid(col,row - 1) or test = grid(col,row + 1) then
                return TRUE
             end if
        end if
    end if
    return FALSE
end function


do until EOF (f)
    input #f, lineIn 'everything
    counter_1 = counter_1 + 1
    For col = 1 to 100
        grid(col,counter_1) = valint(mid(lineIn,col,1))
    Next col

loop

For row = 1 to 100
    For col = 1 to 100
        if grid(col,row) < 9 then
            grid(col,row) = 0
        end if
    Next col
Next row

do
    change = FALSE
    For row = 1 to 100
        For col = 1 to 100
                if grid(col,row) <> 9 Then
                    if switch > last_switch then
                        if hit(col, row, switch) then
                            grid(col,row) = switch
                            change = TRUE
                        end if
                    elseif grid(col,row) = 0 Then
                        switch = switch + 1
                        grid(col,row) = switch
                    end if
                end if
        Next col
    Next row
    For col = 1 to 100
        For row = 1 to 100
                if grid(col,row) <> 9 Then
                    if switch > last_switch then
                        if hit(col, row, switch) then
                            grid(col,row) = switch
                            change = TRUE
                        end if
                    end if
                end if
        Next row
    Next col
    For col = 100 to 1 step -1
        For row = 100 to 1 step -1
                if grid(col,row) <> 9 Then
                    if switch > last_switch then
                        if hit(col, row, switch) then
                            grid(col,row) = switch
                            change = TRUE
                        end if
                    end if
                end if
        Next row
    Next col
    For row = 100 to 1 step -1
        For col = 100 to 1 step -1
                if grid(col,row) <> 9 Then
                    if switch > last_switch then
                        if hit(col, row, switch) then
                            grid(col,row) = switch
                            change = TRUE
                        end if
                    end if
                end if
        Next col
    Next row

    last_switch = switch

loop while change = TRUE

for count2 = 10 to switch
    For row = 1 to 100
        For col = 1 to 100
            if grid(col,row) = count2 then
                count3 = count3 + 1
            end if
        Next col
    Next row
    if count3 >= total(3) then
        total(2) = total(3)
        total(3) = count3
    elseif count3 >= total(2) then
        total(1) = total(2)
        total(2) = count3
    elseif count3 >= total(1) then
        total(1) = count3
    end if
    print count3
    count3 = 0
next count2

print total(1); " ";total(2); " ";total(3); " "
print "Grand Total :"; total(1) * total(2) * total(3)

close #f

