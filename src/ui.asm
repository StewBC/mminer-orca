;-----------------------------------------------------------------------------
; ui.inc
; Part of manic miner, the zx spectrum game, made for Apple II
;
; Stefan Wessels, 2020
; This is free and unencumbered software released into the public domain.

;-----------------------------------------------------------------------------
                     65816           OFF

                     copy            src/defs.s
                     mcopy           src/ui.mac

UI                   start

                     using           ROSYSTEM
                     using           RODATA
                     using           ROTEXT
                     using           DATA

;-----------------------------------------------------------------------------
uiUpdateComponent    entry

                     ora             uiComponent
                     sta             uiComponent
                     lda             #2
                     sta             updateUICount

                     rts



;-----------------------------------------------------------------------------
uiUpdate             entry

                     lda             uiComponent

                     bit             bit0Mask                                                            ; UI_COMPONENT_NAME
                     beq             ud00
                     jsr             screenDrawLevelName
                     lda             uiComponent
ud00                 bit             bit1Mask                                                            ; UI_COMPONENT_AIR_NAME
                     beq             ud01
                     printXYlh       #0,#(17*8),#<roTextAir,#>roTextAir,#4,#2,1
                     jsr             screenDrawAirFrame
                     lda             uiComponent
ud01                 bit             bit2Mask                                                            ; UI_COMPONENT_AIR
                     beq             ud02
                     jsr             screenDrawAirRemaining
                     lda             uiComponent
ud02                 bit             bit3Mask                                                            ; UI_COMPONENT_SCORE_NAME
                     beq             ud03
                     printXYlh       #4,#(19*8),#<roTextHighScore,#>roTextHighScore,#3
                     printXYlh       #11,#(19*8),#<roTextScore,#>roTextScore,#4
                     lda             uiComponent
ud03                 bit             bit4Mask                                                            ; UI_COMPONENT_SCORE
                     beq             ud04
                     printXYlh       #11,#(20*8),#<score,#>score,#5
                     lda             uiComponent
ud04                 bit             bit5Mask                                                            ; UI_COMPONENT_LIVES
                     beq             ud05
                     jsr             screenDrawLives
                     lda             uiComponent
ud05                 bit             bit6Mask                                                            ; UI_COMPONENT_HIGHSCORE
                     beq             ud06
                     printXYlh       #3,#(20*8),#<highScore,#>highScore,#5
ud06                 dec             updateUICount
                     bne             ud07
                     lda             #0
                     sta             uiComponent
ud07                 rts



;-----------------------------------------------------------------------------
; 28209 cycle delay from start till after rts
uiDelay              entry

                     ldy             #$80
ySet                 entry
                     ldx             #0
udl0                 dex
                     bne             udl0
                     dey
                     bne             udl0

                     rts



;-----------------------------------------------------------------------------
; This routine shows the MANIC and MINER text on screen.
; the macro uiShowMMTextXY puts specific values appropriate for each right
; into the routine (such as the address of the character width array)
; The Manic & Miner words are stored in a "compressed" form, this also decodes
; that.  Each letter "pixel" is stored as a bit.
uiShowMMText         entry

row                  equ             srcPtrL
col                  equ             srcPtrH
offset               equ             dstPtrL
index                equ             dstPtrH
colMaskL             equ             sizeL
colMaskR             equ             sizeH
width                equ             tmpBot+0
height               equ             tmpBot+1
dataByte             equ             tmpBot+2
dr                   equ             tmpBot+3
dc                   equ             tmpBot+4
dw                   equ             tmpBot+5
pr                   equ             tmpBot+6

                     sty             row
                     stx             col
                     lda             #0
                     sta             offset
                     sta             index

strLoop              anop
                     ldx             index
colorLoc             entry
                     lda             PLACEHOLDER,x                                                       ; unpack the color masks
                     tay
                     lda             masksLeft,y
                     sta             colMaskL
                     lda             masksRight,y
                     sta             colMaskR
                     lda             #6                                                                  ; the text is 6 rows high
                     sta             height
                     lda             row
                     sta             dr                                                                  ; set the working counter to the row

charLoop             anop
                     lda             col
                     sta             dc                                                                  ; set the working counter to the column
                     ldx             index                                                               ; get the index to the character in the string
widthLoc             entry
                     lda             PLACEHOLDER,x                                                       ; get the width of the character
                     sta             width                                                               ; save
                     sta             dw                                                                  ; and init the working width
                     ldx             offset                                                              ; the offset is into the encoded data
dataLoc              entry
                     lda             PLACEHOLDER,x                                                       ; get the next encoded character
                     inc             offset                                                              ; and move the index
                     sta             dataByte                                                            ; save the character
colLoop              anop
                     lda             dataByte                                                            ; load the character
                     asl             a                                                                   ; shift out the MSB to get the bit
                     sta             dataByte                                                            ; save the new shifted encoded character
                     bcc             skipPlot                                                            ; if bit was 0, blank, nothing to do
                     lda             #8                                                                  ; 1-bit to be drawn.  "pixel" is 8 pixel-rows high
                     sta             pr                                                                  ; save row draw counter
                     lda             dr                                                                  ; load the screen draw row where drawing should happen
                     asl             a                                                                   ; * 8
                     asl             a
                     asl             a
                     tay                                                                                 ; store the row in Y
                     lda             dc                                                                  ; get the column
                     and             #1                                                                  ; and see if the column is odd or even (for color mask)
                     tax
usm0                 lda             dc                                                                  ; start with the column
                     adc             rowL,y                                                              ; and calculate the hi-res row/col address
                     sta             write+1
                     lda             rowH,y
                     adc             currPageH                                                           ; add the page to draw to
                     sta             write+2
                     lda             #$ff                                                                ; assume all bits on
                     and             colMaskL,x                                                          ; but then mask to get appropriate color
write                anop
                     sta             PLACEHOLDER                                                         ; write to the screen
                     iny                                                                                 ; next hi-res pixel-row
                     dec             pr                                                                  ; and one less row to draw
                     bne             usm0                                                                ; do all 8 rows

skipPlot             anop
                     inc             dc                                                                  ; go to the next column
                     dec             dw                                                                  ; one less to do in the width of the character
                     bpl             colLoop                                                             ; if not done the whole character, keep going
                     inc             dr                                                                  ; move down to the next row of the character
                     dec             height                                                              ; one less row to do
                     bpl             charLoop                                                            ; keep going till the whole character height done
                     lda             width                                                               ; move the draw col by the width of the character just drawn
                     clc
                     adc             col
                     sta             col
                     inc             index                                                               ; and move the string index to the next character
                     lda             index
                     cmp             #6
                     bcc             strLoop                                                             ; if not all 5 characters (MANIC or MINER) done, keep going

                     rts



;-----------------------------------------------------------------------------
uiTitleScreen        entry

scrollPtrL           equ             0                                                                   ;tmpBot+0
scrollPtrH           equ             1                                                                   ;tmpBot+1
scrollLen            equ             2                                                                   ;tmpBot+2
scrollIdx            equ             3                                                                   ;tmpBot+3
titleState           equ             4                                                                   ;currLevel


                     lda             #0
                     sta             leftEdge                                                            ; reset the left edge

                     lda             #11*8                                                               ; position willy for the UI
                     sta             willyYPos
                     lda             #0
                     sta             willyFrame
                     lda             #18
                     sta             willyXPos

                     lda             #<titleMusic                                                        ; init the music ptr
                     sta             musicL
                     lda             #>titleMusic
                     sta             musicH

                     ldx             #1                                                                  ; do a full screen clear of both buffers
                     jsr             screenClear
                     jsr             screenSwap
                     ldx             #1
                     jsr             screenClear

                     lda             #0
                     sta             titleState                                                          ; set to bounce manic miner / audio
                     sta             uiComponent                                                         ; and init the ui update to nothing
                     lda             #UI_COMPONENT_SCORE_NAME+UI_COMPONENT_SCORE+UI_COMPONENT_HIGHSCORE
                     jsr             uiUpdateComponent                                                   ; add an update for bottom part of screen

                     jsr             screenDrawWilly                                                     ; show willy on this screen
                     uiShowMMTextXY  #6,#6,manicText,manicCharWidth,manicColors
                     printXYlh       #0,#22*8,#<roTextAppleIIVersion,#>roTextAppleIIVersion,#19
                     printXYlh       #0,#23*8,#<roTextend,#>roTextend,#19
                     jsr             uiUpdate                                                            ; show the UI on the Manic screen
                     jsr             screenSwap

                     jsr             screenDrawWilly                                                     ; show willy on the other screen
                     uiShowMMTextXY  #6,#6,minerText,minerCharWidth,minerColors
                     printXYlh       #0,#22*8,#<roTextAppleIIVersion,#>roTextAppleIIVersion,#19
                     printXYlh       #0,#23*8,#<roTextend,#>roTextend,#19
                     jsr             uiUpdate                                                            ; show the UI on the Miner screen

                     lda             KBDSTRB

mainLoop             anop
                     jsr             screenSwap                                                          ; swap screens (manic/miner) or scroll text
                     jsr             inputUI                                                             ; read keys -1 - quit, 0 - no key, 1 - go to game
                     beq             stayInUI                                                            ; no key
                     bpl             playGame                                                            ; go to game
                     lda             #EVENT_EXIT_GAME                                                    ; quit
                     bne             exit
playGame             anop
                     lda             #EVENT_OK
exit                 anop
                     jmp             done

stayInUI             anop
                     lda             titleState                                                          ; get the state (bounce vs scroll)
                     beq             bounce
                     jmp             introScroll                                                         ; 0 - bounce, 1 - scroll

bounce               anop
                     jsr             audioPlayTitleNote                                                  ; play the tune
                     bcc             mainLoop                                                            ; tune done when carry is set, else bounce

                     lda             #2
                     sta             titleState                                                          ; use this as a temporary counter
uts0                 ldx             #0                                                                  ; clear the upper portion of the screen
                     jsr             screenClear                                                         ; show both manic & miner
                     uiShowMMTextXY  #6,#0,manicText,manicCharWidth,manicColors
                     uiShowMMTextXY  #6,#8,minerText,minerCharWidth,minerColors
                     jsr             screenDrawWilly                                                     ; show willy as well

                     jsr             screenSwap
                     dec             titleState                                                          ; do for both buffers
                     lda             titleState
                     bne             uts0

                     lda             #1                                                                  ; set the state to the scrolling screen
                     sta             titleState

                     lda             #<roTextIntro                                                       ;init the scrolling message text
                     sta             scrollPtrL
                     lda             #>roTextIntro
                     sta             scrollPtrH
                     lda             #0
                     sta             scrollLen
                     lda             #19
                     sta             scrollIdx

introScroll          anop                                                                                ; show the scrolling message
                     ldy             willyYPos                                                           ; start by erasing willy so the eor draw works
                     lda             #16                                                                 ; 16 rows from his Y
                     sta             sizeL                                                               ; track rows in sizeL
uts1                 clc
                     lda             willyXPos                                                           ; start with his X
                     asl             a                                                                   ; * 2 for screen coordinates
                     adc             rowL,y                                                              ; get the hires coordinates
                     sta             writeZero+1
                     lda             rowH,y
                     adc             currPageH
                     sta             writeZero+2
                     lda             #0                                                                  ; write 4 zero-bytes to each row
                     ldx             #3
writeZero            anop
                     sta             PLACEHOLDER,x
                     dex
                     bpl             writeZero
                     iny                                                                                 ; next hi-res row
                     dec             sizeL                                                               ; one more row done
                     bne             uts1

                     lda             willyFrame                                                          ; get the current frame
                     clc
                     adc             #2                                                                  ; advance by 2
                     and             #7                                                                  ; and keep in the frame range
                     sta             willyFrame                                                          ; update the frame
                     jsr             screenDrawWilly                                                     ; and draw willy in the new pose

;sqw        printXYlh scrollIdx, #16*8, scrollPtrL, scrollPtrH, scrollLen

                     lda             #$ff                                                                ; no color (white) is a mask of $ff left and right
                     sta             dstPtrL
                     sta             dstPtrL+1
                     lda             #0                                                                  ; eor o is not inverse
                     sta             eorMask+1                                                           ; set the eor in the code

                     lda             scrollPtrL                                                          ; set the string pointer in the code
                     sta             read0+1
                     lda             scrollPtrH
                     sta             read0+2
                     ldx             scrollLen                                                           ; 0 based
                     stx             sizeL
                     lda             scrollIdx                                                           ; and x/y coords in x and y registers
                     asl             a
                     tax
                     ldy             #16*8
                     jsr             textShowText                                                        ; print that string

                     lda             scrollIdx                                                           ; see if scrolled all the way into the screen
                     beq             uts2                                                                ; if printing at 0, then scrolled all the way in
                     dec             scrollIdx                                                           ; not scrolled in all the way, so move the start left
                     inc             scrollLen                                                           ; and increase the length to print by 1
                     bne             uts3                                                                ; and skip moving the start of the message
uts2                 inc             scrollPtrL                                                          ; move the scroller so the left disappears off
                     bne             uts3                                                                ; the left end of the screen
                     inc             scrollPtrH
uts3                 jsr             uiDelay                                                             ; wait a bit so the message can be read

                     ldy             scrollLen                                                           ; see if this is the end of the message
                     lda             (scrollPtrL),y
                     bne             uts4                                                                ; if not a zero, still in message
                     dec             scrollLen                                                           ; start printing less of the message so the tail scrolls across
                     bmi             demoTime                                                            ; when completely done, go to demo mode
uts4                 jmp             mainLoop                                                            ; repeat till fully scrolled

demoTime             anop
                     lda             #DEMO_TIMER_INITAL                                                  ; set up the demo variables
                     sta             demoTimer
                     lda             #1
                     sta             demoDirection

done                 anop
                     sta             demoMode
                     rts



;-----------------------------------------------------------------------------
uiWaitForIntroEnter  entry

iter                 equ             tmpBot+0                                                            ; how many times to loop
color                equ             tmpBot+1                                                            ; the starting color for the string
xPos                 equ             tmpBot+2                                                            ; x for string
yPos                 equ             tmpBot+3                                                            ; y for string
textL                equ             tmpBot+4                                                            ; string pointer
textH                equ             tmpBot+5
len                  equ             tmpBot+6                                                            ; how many characters (0 based)

                     lda             KBDSTRB                                                             ; clear the keyboard

                     jsr             valueSwap
                     printXYlh       #0,#22*8,#<roTextPressEnter,#>roTextPressEnter,#19
                     lda             #$28                                                                ; intentionally outside the range
                     sta             color                                                               ; it gives an interesting "materialize" effect
                     lda             #22*8
                     sta             yPos

cycleLoop            anop
                     lda             #6                                                                  ; print ENTER at x 4
                     sta             xPos
                     lda             #<roTextEnter                                                       ; point at ENTER text
                     sta             textL
                     lda             #>roTextEnter
                     sta             textH
                     lda             #5
                     sta             len
                     jsr             textColorCycle                                                      ; show the text in color
                     ldy             #$40
                     jsr             ySet

                     lda             KBD                                                                 ; hold the load screen graphic till a key is pressed
                     bpl             cycleLoop

                     lda             KBDSTRB                                                             ; clear the keyboard
                     jsr             valueSwap

                     ldx             #1                                                                  ; for clear-screen,x = 1 is all clear,x equ 0 is partial
                     jsr             screenClear
                     jsr             screenSwap                                                          ; swap to see page 1
                     ldx             #1
                     jmp             screenClear                                                         ; all clear page 2

                     end

;-----------------------------------------------------------------------------
RODATA               data

manicText            anop
                     dc              h'88D8A888880000'
                     dc              h'00708888F88800'
                     dc              h'88C8A898880000'
                     dc              h'0000E0404040E0'
                     dc              h'00708880887000'

manicCharWidth       anop
                     dc              h'0606060405'

manicColors          anop
                     dc              h'0201000304'

;-----------------------------------------------------------------------------
minerText            anop
                     dc              h'000088D8A88888'
                     dc              h'E0404040E00000'
                     dc              h'0088C8A8988800'
                     dc              h'F880F880F80000'
                     dc              h'0000F088F0A098'

minerCharWidth       anop
                     dc              h'0604060605'

minerColors          anop
                     dc              h'0304020100'

                     end

