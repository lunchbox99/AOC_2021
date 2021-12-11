dim f as integer
dim file_name as string
dim lineIn as string
dim as integer counter_1 = 0
dim as integer counter_2 = 0
dim st_string as string
dim end_string as string
dim as ulongint points = 0
dim change as boolean

f = freefile

file_name = CurDir + "\in3.txt"

If( Open( file_name For Input As #f ) ) Then
   Print "ERROR: opening file " ; file_name
   End -1
End If



do until EOF (f)
    input #f, lineIn 'everything
    counter_2 = 0
    do
    change = FALSE
    if counter_2 > len(lineIn) Then
        counter_2 = 0
    end if
    counter_2 = counter_2 + 1
    if trim(mid(lineIn,counter_2,1)) = ")" Then
        if trim(mid(lineIn,counter_2 - 1, 1)) = "(" Then
            change = TRUE
            st_string = trim(mid(lineIn, 1, counter_2 - 2))
            end_string = trim(mid(lineIn, counter_2 + 1 ))
            lineIn = st_string + end_string
            counter_2 =  counter_2 - 2
        end if
    elseif trim(mid(lineIn,counter_2,1)) = "]" Then
        if trim(mid(lineIn,counter_2 - 1, 1)) = "[" Then
            change = TRUE
            st_string = trim(mid(lineIn, 1, counter_2 - 2))
            end_string = trim(mid(lineIn, counter_2 + 1))
            lineIn = st_string + end_string
            counter_2 =  counter_2 - 2
        end if
    elseif trim(mid(lineIn,counter_2,1)) = "}" Then
        if trim(mid(lineIn,counter_2 - 1, 1)) = "{" Then
            change = TRUE
            st_string = trim(mid(lineIn, 1, counter_2 - 2))
            end_string = trim(mid(lineIn, counter_2 + 1))
            lineIn = st_string + end_string
            counter_2 =  counter_2 - 2
        end if
    elseif trim(mid(lineIn,counter_2,1)) = ">" Then
        if trim(mid(lineIn,counter_2 - 1, 1)) = "<" Then
            change = TRUE
            st_string = trim(mid(lineIn, 1, counter_2 - 2))
            end_string = trim(mid(lineIn, counter_2 + 1))
            lineIn = st_string + end_string
            counter_2 =  counter_2 - 2
        end if
    end if
    loop until change = FALSE and counter_2 > len(lineIn)

    end_string = ""
    points = 0
    for counter_1 = len(lineIn) to 1 step - 1
        st_string = trim(mid(lineIn, counter_1, 1))
        if st_string = "(" then
            end_string = end_string + ")"
            points = points * 5
            points = points + 1
        elseif st_string = "[" then
            end_string = end_string + "]"
            points = points * 5
            points = points + 2
        elseif st_string = "{" then
            end_string = end_string + "}"
            points = points * 5
            points = points + 3
        elseif st_string = "<" then
            end_string = end_string + ">"
            points = points * 5
            points = points + 4
        end if
    next counter_1

    print points
loop


close #f

