;-----------------------------------------------------------------------------
; macro to take text address and split it into lo and hi (shorthand)
;        macro
;        printXY &xpos,&ypos,&text,&len,&colorMask,&inverse
;        printXYlh &xpos,&ypos,#<&text,#>&text,&len,&colorMask,&inverse
;        mend

;-----------------------------------------------------------------------------
; Macro that takes a lo and hi for the text with optional color and invert wanted
; sets up what's needed to call textShow which does the printing
            macro
            printXYlh       &xpos,&ypos,&textL,&textH,&len,&colorMask,&inverse
            aif             C:&colorMask>0,.cmgiven
            lda             #$ff                                                ; no color (white) is a mask of $ff left and right
            sta             dstPtrL
            sta             dstPtrL+1
            ago             .nocm
.cmgiven
            ldx             &colorMask                                          ; this is an index into mask[Left|Right]
            lda             masksLeft,x
            sta             dstPtrL
            lda             masksRight,x
            sta             dstPtrL+1
.nocm
            aif             C:&inverse>0,.invgiven
            lda             #0                                                  ; eor o is not inverse
            ago             .noinv
.invgiven
            lda             #$7f                                                ; eor $7f inverts the color (leave MSB)
.noinv

            sta             eorMask+1                                           ; set the eor in the code

            lda             &textL                                              ; set the string pointer in the code
            sta             read0+1
            lda             &textH
            sta             read0+2
            ldx             &len                                                ; 0 based
            stx             sizeL
            lda             &xpos                                               ; and x/y coords in x and y registers
            asl             a
            tax
            ldy             &ypos
            jsr             textShowText                                        ; print that string
            mend

;-----------------------------------------------------------------------------
; Prep uiShowMMText internal variables with data relevant for the
; specific text the macro is called with
            macro
            uiShowMMTextXY  &column,&row,&data,&widths,&colors

            lda             #<&data                                             ; MANIC or MINER bit-arrays
            sta             dataLoc+1
            lda             #>&data
            sta             dataLoc+2
            lda             #<&widths
            sta             widthLoc+1                                          ; array of letter-widths in MANIC or MINER
            lda             #>&widths
            sta             widthLoc+2
            lda             #<&colors                                           ; array of letter colors in the words
            sta             colorLoc+1
            lda             #>&colors
            sta             colorLoc+2
            ldx             &column                                             ; screen location passed in x/y
            ldy             &row
            jsr             uiShowMMText                                        ; show the word on-screen

            mend

