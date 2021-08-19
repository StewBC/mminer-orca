;-----------------------------------------------------------------------------
; level.inc
; Part of manic miner, the zx spectrum game, made for Apple II
;
; Stefan Wessels, 2020
; This is free and unencumbered software released into the public domain.

;-----------------------------------------------------------------------------
                65816  OFF

                copy   src/defs.s

LEVEL           start

                using  LOWMEM
                using  ROSYSTEM
                using  ROLEVELS

;-----------------------------------------------------------------------------
; "decompress" the stored level into a usable level in levelLayout
levelUnpack     entry


value           equ    sizeL
len             equ    sizeH

                ldx    currLevel

                lda    #<levelLayout  ; point at the level decode area
                sta    store+1
                lda    #>levelLayout
                sta    store+2

                lda    levelsL,x      ; get the start of the level data intp srcPtr
                sta    srcPtrL
                lda    levelsH,x
                sta    srcPtrH

                ldx    #0             ; start at 0 in read and write area
                ldy    #0

loop            anop
                lda    (srcPtrL),y    ; read the first level byte (repeat counts)
                beq    done           ; $00 ends level
                pha                   ; save
                iny                   ; point y at next byte

                lsr    a              ; get high repeat nibble into low nibble
                lsr    a
                lsr    a
                lsr    a
                tax                   ; but result in X

                lda    (srcPtrL),y    ; read the next byte from level (values)
                sta    value          ; save
                iny                   ; advance y to next rep counts

                lsr    a              ; get high value nibble into low nibble
                lsr    a
                lsr    a
                lsr    a
                jsr    lu00           ; store value repeat times into level decode area

                pla                   ; restore the rep byte
                and    #$0f           ; only the low nibble
                tax                   ; put in x
                lda    value          ; restore values
                and    #$0f           ; only low nibble
                jsr    lu00           ; store value repeat times into level decode area
                jmp    loop           ; repeat

lu00            stx    len            ; save the repeat count
                tax                   ; value into x (value is a tile index)
                lda    mult16,x       ; mult value by 16 as that's how wide a tile is
                ldx    len            ; restore the repeat count
                dex                   ; store index is 0+ but count is 1+ so pre-dec

store           anop
                sta    PLACEHOLDER,x  ; store the tile offset into the level decode area
                dex                   ; from back to front and
                bpl    store          ; repeat for all repetitions

                lda    len            ; get the repeat length
                clc
                adc    store+1        ; advance the stor pointer by the length
                sta    store+1
                bcc    done
                inc    store+2

done            anop
                rts                   ; return to self or caller



;-----------------------------------------------------------------------------
levelPlaceKeys  entry

                lda    #0
                sta    keysToCollect  ; init to 0 keys to collect

                lda    currLevel
                asl    a              ; * 2
                asl    a              ; * 4
                adc    currLevel      ; * 5 - index into key table
                tax                   ; keep index in x

                lda    #4             ; Need to do 5 keys, 0-4
                sta    sizeL          ; save count in sizeL
                ldy    #0             ; keep offst from ptr at 0
lpk0            lda    keyyH,x        ; get the key Y hi (y=row*32 in key table)
                bmi    next           ; if $ff then skip
                inc    keysToCollect  ; count the key
                sta    dstPtrH        ; save the hi
                lda    keyyL,x        ; get the y lo
                adc    keyx,x         ; and add the x (no carry still)
                sta    dstPtrL        ; save as dst pointer
                lda    #>levelLayout  ; get the scratch hi (the lo is 0 as it's aligned)
                adc    dstPtrH        ; and add to the Y hi (and any carry)
                sta    dstPtrH        ; and save as the dst Pointer Hi
                lda    #8*16          ; key tile offset * width of a tile
                sta    (dstPtrL),y    ; poke into the unpacked level

next            anop
                inx                   ; next key
                dec    sizeL          ; one less key to do
                bpl    lpk0           ; all keys done?

                rts

                end

