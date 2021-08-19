;-----------------------------------------------------------------------------
; mminer.asm
; Part of manic miner, the zx spectrum game, made for Apple II
;
; Stefan Wessels, 2020
; This is free and unencumbered software released into the public domain.

;-----------------------------------------------------------------------------
            65816  OFF

            align  $100

            ORG    $4000

            copy   src/logo.s
            copy   src/defs.s                ; globally used defines (Incl. MLI)

MMINER      start


;-----------------------------------------------------------------------------
main        entry

            jsr    mainInit                  ; do some one-time global init
            jsr    uiWaitForIntroEnter       ; color cycle ENTER and wait for key

loop        anop
            jsr    uiTitleScreen             ; go to the ui
            and    #EVENT_EXIT_GAME          ; see if event to exit game is set
            bne    quit
            jsr    gameLoop                  ; not quit, so run the gameplay (or demo)
            jmp    loop                      ; go back to the ui

quit        anop
            jsr    MLI                       ; quit using the prodos mli
            dc     h'65'                     ; ProDOS Quit request
            dc     s2'*+2'
            dc     h'04000000000000'

mainInit    entry

            lda    #0                        ; init some one-time globals
            sta    backPage
            sta    leftEdge
            sta    cameraMode
            sta    uiComponent
            sta    cheatActive
            sta    cheatIndex
            sta    monochrome

            lda    #AUDIO_MUSIC+AUDIO_SOUND  ; turn the music and in-game sounds on
            sta    audioMask

            lda    #>HGRPage1                ; set the current hidden (back) page to page 1
            sta    currPageH                 ; (page 2 was made visible by the loader)

            lda    #$80                      ; make a zero-page bit mask area for checking bits
            ldx    #7                        ; from 1 to 128, set each bit (backwards)
mi00        sta    bitMasks,x                ; set the bits in the area called bitMasks
            lsr    a
            dex
            bpl    mi00

            rts

            end

