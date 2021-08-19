;-----------------------------------------------------------------------------
; audio.inc
; Part of manic miner, the zx spectrum game, made for Apple II
;
; Stefan Wessels, 2020
; This is free and unencumbered software released into the public domain.

;-----------------------------------------------------------------------------
                    65816  OFF

                    copy   src/defs.s

AUDIO               start

;-----------------------------------------------------------------------------
audioPlayTitleNote  entry

fixedDuration       equ    srcPtrL
noteDuration        equ    srcPtrH
freqTimer1          equ    dstPtrL
freqTimer2          equ    dstPtrH


                    ldy    #0             ; load the duration
                    lda    (musicL),y
                    beq    reset          ; on 0, the song is done
                    sta    noteDuration

                    lda    audioMask      ; see if the note should be played or simply delayed
                    and    #AUDIO_MUSIC
                    bne    apt0           ; audio is on, go play
                    jsr    uiDelay        ; waste time as though a note was played
                    jmp    leave          ; and move the audio pointer along

apt0                iny                   ; load the 1st timer
                    lda    (musicL),y
                    sta    freqTimer1
                    iny                   ; load the second timer
                    lda    (musicL),y
                    sta    freqTimer2

preplay             anop
                    lda    #$8A           ; repeat minimum this much
                    sta    fixedDuration
tplay               anop
                    lda    SPEAKER        ; toggle the speaker
                    dec    freqTimer1     ; timer1 down
                    bne    apt2           ; not zero, go to timer 2
                    ldy    #1             ; reset timer 1
                    lda    (musicL),y
                    sta    freqTimer1
                    ldx    #11            ; delay about 20 clock cycles
apt1                dex
                    bne    apt1
apt2                dec    freqTimer2     ; dec timer 2
                    bne    apt4           ; not zero?
                    ldy    #2             ; at zero, reset timer 2
                    lda    (musicL),y
                    sta    freqTimer2
                    ldx    #11            ; and waste 20 clock cycles
apt3                dex
                    bne    apt3
apt4                dec    fixedDuration  ; dec the fixed repeat count
                    bne    tplay          ; not zero, do another loop
                    dec    noteDuration   ; dec the note delay
                    bne    preplay        ; do more loops of at least fixedDuration

leave               anop
                    clc
                    lda    musicL         ; add 3 to the music pointer
                    adc    #3
                    sta    musicL
                    bcc    apt5
                    inc    musicH
                    clc                   ; leave with carry clear
apt5                rts

reset               anop
                    lda    #<titleMusic   ; played the whole tune
                    sta    musicL         ; reset to start of tune
                    lda    #>titleMusic
                    sta    musicH

                    sec                   ; and leave with carry set
                    rts



;-----------------------------------------------------------------------------
audioPlayNote       entry

delayTime           equ    tmpBot+0

                    lda    audioMask      ; see if the music is on
                    and    #AUDIO_MUSIC
                    beq    done

nplay               anop
                    ldx    musicL         ; get the index into the in-game music
                    inc    musicL         ; and advance that index
                    lda    inGameMusic,x  ; get the note at the index
                    bne    apn0           ; if non-zero it's a valid note
                    sta    musicL         ; reset the index to the start of the song
                    beq    nplay
apn0                ldy    #$08           ; fixed number of iterations

freq                entry                 ; external entry point for custom fixed iterations/delay
                    sta    delayTime      ; store it in a delay counter
                    lda    audioMask      ; see if
                    and    #AUDIO_SOUND   ; audio is enabled
                    beq    done           ; and play or ignore audio accordingly

loop                anop
                    lda    SPEAKER        ; toggle the speaker
                    ldx    delayTime      ; and load the delay
apn1                dex                   ; count down
                    bne    apn1           ; to zero
                    dey                   ; then repeat
                    bne    loop           ; for the fixed iterations

done                anop
                    rts                   ; and return

                    end

