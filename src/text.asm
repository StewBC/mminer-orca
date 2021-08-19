;-----------------------------------------------------------------------------
; text.inc
; Part of manic miner, the zx spectrum game, made for Apple II
;
; Stefan Wessels, 2020
; This is free and unencumbered software released into the public domain.

;-----------------------------------------------------------------------------
                    65816  OFF

                    copy   src/defs.s

TEXT                start

                    using  LOWMEM
                    using  ROSYSTEM
                    using  ROFONT
                    using  ROTEXT
                    using  DATA

;-----------------------------------------------------------------------------
textShowText        entry

xpos0               equ    srcPtrL
ypos0               equ    srcPtrH
rows                equ    sizeH
strIndex            equ    sizeL
color0              equ    dstPtrL                  ; and H
fontL               equ    charGfx+1
fontH               equ    charGfx+2

                    stx    xpos0
                    sty    ypos0

loop0               anop
                    lda    #0
                    sta    fontH                    ; init the pointer hi to 0 for later mult rol's
                    ldx    strIndex                 ; get the index into the string

read0               entry
                    lda    PLACEHOLDER,x            ; get the character in the string
                    sec
                    sbc    #32                      ; the font only starts at space (char 32 or $20)
                    beq    tst0
                    sbc    #9                       ; gap after space
                    asl    a                        ; mult by 16 as that's how wide a char is in bytes
                    asl    a
                    rol    fontH
                    asl    a
                    rol    fontH
                    asl    a
                    rol    fontH                    ; srcPtr now points at the char but $0000 based
tst0                adc    #<font                   ; add the font start
                    sta    fontL
                    lda    fontH
                    adc    #>font
                    sta    fontH                    ; srcPtr now point at the actual character memory

                    lda    #8                       ; font is 8 rows high
                    sta    rows
                    ldy    ypos0                    ; start each character on the same line

iLoop               anop
                    lda    strIndex                 ; strIndex is also col offset from xpos
                    asl    a                        ; but font is 2 cols wide
                    adc    xpos0                    ; add the xpos to get screen col
                    adc    rowL,y                   ; and add the row
                    sta    write0+1                 ; lo byte of where to write to screen buffer
                    lda    currPageH                ; get the hi page
                    adc    rowH,y                   ; add the row
                    sta    write0+2                 ; and complete the screen buffer write address

                    ldx    #1                       ; set up for copying 2 font bytes (1 char)
charGfx             anop
                    lda    PLACEHOLDER,x            ; get the font
eorMask             entry
                    eor    #$00                     ; eor to invert if necessary
                    and    color0,x                 ; and to get the color needed
write0              anop
                    sta    PLACEHOLDER,x            ; and write to screen memory
                    dex                             ; go left a byte
                    bpl    charGfx                  ; and repeat to do 2 bytes
                    dec    rows                     ; done one of the 8 rows needed
                    beq    nextChar                 ; repeat for all 8 rows, then done
                    iny                             ; more rows - next row in y
                    lda    fontL                    ; move along 2 in the font
                    adc    #2
                    sta    fontL
                    bcc    iLoop
                    inc    fontH
                    bcs    iLoop                    ; BRA

nextChar            anop
                    dec    strIndex                 ; string done from the back, so move left in string
                    bpl    loop0                    ; if not all of string done, loop

;done0 anop
                    rts

;-----------------------------------------------------------------------------
; Build a memory cache of the level name since this is re-drawn much more -
; every time the level scrolls left or right and copying from a cache is
; much faster than doing a text print
textSetLevelText    entry

                    lda    #0
                    sta    sizeL                    ; index into string
                    sta    read1+2                  ; hi byte of string address

                    lda    currLevel                ; start with the level
                    asl    a                        ; multiply by 32
                    asl    a
                    asl    a
                    asl    a
                    rol    read1+2
                    asl    a
                    rol    read1+2
                    adc    #<roTextLevel            ; add the base address of the string
                    sta    read1+1
                    lda    #>roTextLevel
                    adc    read1+2
                    sta    read1+2                  ; read+1 as a ptr now points at the string for this level

                    lda    #<levelNameGfx0          ; start at the top of the name cache
                    sta    write1+1                 ; and make write+1 be a pointer to the cache
                    lda    #>levelNameGfx0
                    sta    write1+2

                    lda    #32                      ; These strings are 32 characters wide
                    sta    dstPtrL

loop1               anop
                    lda    #0
                    sta    srcPtrH                  ; init the pointer hi to 0 for later mult rol's
                    ldx    sizeL                    ; get the index into the string
read1               anop
                    lda    PLACEHOLDER,x            ; get the character in the string
                    sec
                    sbc    #32                      ; the font only starts at space (char 32 or $20)
                    beq    tsl0                     ; gap after space
                    sbc    #9
                    asl    a                        ; mult by 16 as that's how wide a char is in bytes
                    asl    a
                    rol    srcPtrH
                    asl    a
                    rol    srcPtrH
                    asl    a
                    rol    srcPtrH                  ; srcPtr now points at the char but $0000 based
tsl0                adc    #<font                   ; add the font start
                    sta    srcPtrL
                    lda    srcPtrH
                    adc    #>font
                    sta    srcPtrH                  ; srcPtr now point at the actual character memory

                    lda    #8                       ; copy 8 rows / character
                    sta    sizeH
                    ldy    #1                       ; start at the right hand side character
lrLoop              anop
                    ldx    #1                       ; load x for the right hand side as well
copyLoop            anop
                    lda    (srcPtrL),y              ; get the line pixel
                    eor    #$7f                     ; invert
maskName            anop
                    and    maskGreen,x              ; mask for color (always green but left vs right hand side)
write1              anop
                    sta    PLACEHOLDER,x            ; store to the cache
                    dey                             ; back up a byte
                    dex
                    bpl    copyLoop                 ; do 2 bytes, right and left hand
                    lda    write1+1                 ; get the cache ptr low
                    clc
step                anop
                    adc    #64                      ; step to the next line - 64 bytes along
                    sta    write1+1                 ; update the pointer
                    bcc    tsl1
                    inc    write1+2                 ; if it wrapped, update the hi byte
tsl1                iny                             ; y is now at minus 1 the last byte written
                    iny                             ; so advance it by 4 to get to the next right hand side byte
                    iny
                    iny
                    dec    sizeH                    ; done one line
                    bne    lrLoop                   ; if any lines left, keep going

                    sec
                    lda    write1+1
                    sbc    #<((64*8)-2)
                    sta    write1+1
                    lda    write1+2
                    sbc    #>((64*8)-2)
                    sta    write1+2
                    clc

                    inc    sizeL                    ; move to the next character in the string
                    dec    dstPtrL                  ; see if 32 characters were done
                    bne    loop1                    ; if not, keep going

;done anop
                    rts



;-----------------------------------------------------------------------------
; x has digit (5 means 1's, 4 means 10's, etc)
; a is the number to add 0..9
textAddScore        entry

                    clc
                    adc    score,x                  ; get the current digit
                    cmp    #'9'+1                   ; has it rolled over
                    bcc    okay                     ; then simply increment
                    sec
                    sbc    #10
                    sta    score,x                  ; and save over the 9
                    lda    #1
                    dex                             ; previous digit
                    bmi    over                     ; if it rolls over 999999
                    cpx    #1                       ; if the digit is now the 010000 (1)
                    bne    textAddScore             ; no, then work with this digit
                    ldy    lives
                    cpy    #9                       ; max out at 9 lives (keeps cheat boot on-screen)
                    bcs    textAddScore
                    inc    lives                    ; yes, then add a life
                    bne    textAddScore             ; and then work with this digit
okay                anop
                    sta    score,x                  ; and store it
over                anop
                    lda    #UI_COMPONENT_SCORE      ; mark the score texts as needing an update
                    jmp    uiUpdateComponent

;done anop
                    rts



;-----------------------------------------------------------------------------
textCheckHighScore  entry

                    ldx    #0                       ; start at the most significant digit
tch0                lda    score,x                  ; get the score
                    cmp    highScore,x              ; compare to the high score
                    bcc    done0                    ; if smaller then highscore gt score
                    bne    newHigh                  ; if ne then highscore gt score
                    inx                             ; digits equal so check next digit
                    cpx    #6                       ; compare x to max digits (+ 1)
                    bcc    tch0                     ; x is 5 or less, keep checking digits

done0               anop
                    rts

newHigh             anop
                    ldx    #5                       ; copy the 6 score digits over the highscore digits
tch1                lda    score,x
                    sta    highScore,x
                    dex
                    bpl    tch1
                    lda    #UI_COMPONENT_HIGHSCORE
                    jmp    uiUpdateComponent



;-----------------------------------------------------------------------------
textColorCycle      entry

color1              equ    tmpBot+1
xPos                equ    tmpBot+2
yPos                equ    tmpBot+3
textL               equ    tmpBot+4
textH               equ    tmpBot+5
len                 equ    tmpBot+6

prntLoop            anop
;       printXYlh xPos,yPos,textL,textH,#0,color macro included here
                    ldx    color1                   ; this is an index into mask[Left|Right]
                    lda    masksLeft,x
                    sta    dstPtrL
                    lda    masksRight,x
                    sta    dstPtrL+1
                    lda    #0                       ; eor o is not inverse
                    sta    eorMask+1                ; set the eor in the code
                    lda    textL                    ; set the string pointer in the code
                    sta    read0+1
                    lda    textH
                    sta    read0+2
                    ldx    #0                       ; 0 based
                    stx    sizeL
                    lda    xPos                     ; and x/y coords in x and y registers
                    asl    a
                    tax
                    ldy    yPos
                    jsr    textShowText             ; print that string

                    dec    len                      ; one less character to color
                    beq    done1                    ; all characters done?
                    inc    xPos                     ; move to the next character on screen
                    inc    textL                    ; and move to the next character in the sting
                    bne    tcc0                     ; did the string wrap a buffer
                    inc    textH                    ; yes, up the Hi
tcc0                dec    color1                   ; prev color
                    bpl    tcc1                     ; still ge 0
                    lda    #4                       ; no, wrap to index 4
                    sta    color1                   ; and save that as the color
tcc1                jmp    prntLoop                 ;and print this character

done1               anop
                    rts

                    end

