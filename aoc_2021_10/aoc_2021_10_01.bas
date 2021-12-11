dim f as integer
dim file_name as string
dim lineIn as string
dim as integer counter_1 = 0
dim as integer counter_2 = 0
dim expected as string
dim found as string
dim as integer points = 0
dim Open_Hash(200) as string

f = freefile

file_name = CurDir + "\input.txt"

If( Open( file_name For Input As #f ) ) Then
   Print "ERROR: opening file " ; file_name
   End -1
End If



do until EOF (f)
    input #f, lineIn 'everything

    For counter_1 = 1 to len(lineIn)
        counter_2 = counter_2 + 1
        Open_Hash(counter_2) = trim(mid(lineIn,counter_1,1))
        if counter_1 > 1 Then
            if Open_Hash(counter_2) = ")" Then
                if Open_Hash(counter_2 - 1) <> "(" Then
                    found = Open_Hash(counter_2)
                    points = points + 3
                    print "Found: "; found; " Points: "; points
                    exit for
                else
                    Open_Hash(counter_2) = ""
                    Open_Hash(counter_2 - 1) = ""
                    counter_2 = counter_2 - 2
                end if
            elseif Open_Hash(counter_2) = "]" Then
                if Open_Hash(counter_2 - 1) <> "[" Then
                    found = Open_Hash(counter_2)
                    points = points + 57
                    print "Found: "; found; " Points: "; points
                    exit for
                else
                    Open_Hash(counter_2) = ""
                    Open_Hash(counter_2 - 1) = ""
                    counter_2 = counter_2 - 2
                end if
            elseif Open_Hash(counter_2) = "}" Then
                if Open_Hash(counter_2 - 1) <> "{" Then
                    found = Open_Hash(counter_2)
                    points = points + 1197
                    print "Found: "; found; " Points: "; points
                    exit for
                else
                    Open_Hash(counter_2) = ""
                    Open_Hash(counter_2 - 1) = ""
                    counter_2 = counter_2 - 2
                end if
            elseif Open_Hash(counter_2) = ">" Then
                if Open_Hash(counter_2 - 1) <> "<" Then
                    found = Open_Hash(counter_2)
                    points = points + 25137
                    print "Found: "; found; " Points: "; points
                    exit for
                else
                    Open_Hash(counter_2) = ""
                    Open_Hash(counter_2 - 1) = ""
                    counter_2 = counter_2 - 2
                end if
            end if
        end if
    Next counter_1
    counter_2 = 0
loop


close #f

