dim f as integer
dim file_name as string
dim lineIn as string
dim parse_line as string
dim str_pos as integer
dim stop_pos as integer
dim as integer counter_1 = 0
dim call_numbers(100) as integer
dim shared cards(100,5,5,2) as integer
dim shared bingos(100) as integer
dim as integer card_num = 0
dim as integer col_num = 1
dim as integer row_num = 0
dim as integer icol_num = 0
dim as integer irow_num = 0
dim as integer row_total = 0
dim as integer col_total = 0
dim all_test as integer
dim as integer flag = 1

f = freefile

file_name = CurDir + "\input.txt"

Sub Bingo (card as integer, last_num as integer)
    dim as integer unpicked = 0
    dim row_num as integer
    dim col_num as integer

    Print "Bingo!"
    Print "Card Number "; card
    For row_num = 1 to 5
        For col_num = 1 to 5
            if cards(card,col_num,row_num,2) <> 1 then
                unpicked = unpicked + cards(card,col_num,row_num,1)
            end if
        Next col_num
    Next row_num
    Print "Sum of all unpicked "; unpicked
    Print "Last Number called "; last_num
    Print "Final Score "; unpicked * last_num
    Print "Card"
    For row_num = 1 to 5
        For col_num = 1 to 5
            print cards(card,col_num,row_num,1); " ";
        Next col_num
        print
    Next row_num
    For row_num = 1 to 5
        For col_num = 1 to 5
            print cards(card,col_num,row_num,2); " ";
        Next col_num
        print
    Next row_num
    print
End Sub

If( Open( file_name For Input As #f ) ) Then
   Print "ERROR: opening file " ; file_name
   End -1
End If

do until EOF (f)
    input #f, lineIn 'everything
    counter_1 =  counter_1 + 1
    if counter_1 < 101 then
        call_numbers(counter_1) = ValInt(lineIn)
    else
        if (counter_1 - 101) Mod 6 <> 0 then
            if (counter_1 - 101) Mod 6 = 1 then
                card_num = card_num + 1
            end if
            parse_line = lineIn
            stop_pos = 0
            col_num = 1
            do
                str_pos = stop_pos + 1
                stop_pos = Instr(str_pos,parse_line," ")
                if (stop_pos - str_pos = 0) then
                    str_pos = str_pos + 1
                    stop_pos = Instr(str_pos,parse_line," ")
                end if
                cards(card_num,col_num,(counter_1 - 101) Mod 6,1) = ValInt(Mid(parse_line,str_pos,stop_pos - str_pos))
                col_num = col_num + 1
            loop until (stop_pos = 0)
            cards(card_num,col_num,(counter_1 - 101) Mod 6,1) = ValInt(Mid(parse_line,str_pos))
        end if
    end if

loop

'Initialize found numbers to 0.
For card_num = 1 to 100
    For row_num = 1 to 5
        For col_num = 1 to 5
            cards(card_num,col_num,row_num,2) = 0
        Next col_num
    Next row_num
Next card_num

For card_num = 1 to 100
    bingos(card_num) = 0
Next card_num

For counter_1 = 1 to 100
    For card_num = 1 to 100
        if bingos(card_num) = 1 then 'skip bingoed cards.
            card_num = card_num + 1
        end if
        For row_num = 1 to 5
            For col_num = 1 to 5
                if cards(card_num,col_num,row_num,1) = call_numbers(counter_1) Then
                    cards(card_num,col_num,row_num,2) = 1
                    row_total = 0
                    col_total = 0
                    For irow_num = 1 to 5
                        For icol_num = 1 to 5
                            col_total = col_total + cards(card_num,icol_num,irow_num,2)
                        Next icol_num
                        if col_total = 5 then
                            bingos(card_num) = 1
                            for all_test = 1 to 100
                                if bingos(all_test) = 0 then
                                    flag = 0
                                end if
                            next all_test
                            if flag = 1 then
                                Bingo(card_num, call_numbers(counter_1))
                                STOP
                            else
                                flag = 1
                            end if
                        end if
                        col_total = 0
                    Next irow_num
                    For icol_num = 1 to 5
                        For irow_num = 1 to 5
                            row_total = row_total + cards(card_num,icol_num,irow_num,2)
                        Next irow_num
                        if row_total = 5 then
                            bingos(card_num) = 1
                            for all_test = 1 to 100
                                if bingos(all_test) = 0 then
                                    flag = 0
                                end if
                            next all_test
                            if flag = 1 then
                                Bingo(card_num, call_numbers(counter_1))
                                STOP
                            else
                                flag = 1
                            end if
                        end if
                        row_total = 0
                    Next icol_num
                end if
            Next col_num
        Next row_num
    Next card_num
Next counter_1


/'
For card_num = 1 to 100
    For row_num = 1 to 5
        For col_num = 1 to 5
            print cards(card_num,col_num,row_num,1); " ";
        Next col_num
        print
    Next row_num
    print
Next card_num
'/

close #f

