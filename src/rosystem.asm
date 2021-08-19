;-----------------------------------------------------------------------------
; rosystem.inc
; Part of manic miner, the zx spectrum game, made for Apple II
;
; Stefan Wessels, 2020
; This is free and unencumbered software released into the public domain.

;-----------------------------------------------------------------------------
ROSYSTEM     data

;-----------------------------------------------------------------------------
; the lo byte for the memory at the start of every screen row
rowL         anop
;        .repeat $C0, Row
;            .byte   Row & $08 << 4 | Row & $C0 >> 1 | Row & $C0 >> 3
;        .endrep
             dc    h'00000000'
             dc    h'00000000'
             dc    h'80808080'
             dc    h'80808080'
             dc    h'00000000'
             dc    h'00000000'
             dc    h'80808080'
             dc    h'80808080'
             dc    h'00000000'
             dc    h'00000000'
             dc    h'80808080'
             dc    h'80808080'
             dc    h'00000000'
             dc    h'00000000'
             dc    h'80808080'
             dc    h'80808080'
             dc    h'28282828'
             dc    h'28282828'
             dc    h'A8A8A8A8'
             dc    h'A8A8A8A8'
             dc    h'28282828'
             dc    h'28282828'
             dc    h'A8A8A8A8'
             dc    h'A8A8A8A8'
             dc    h'28282828'
             dc    h'28282828'
             dc    h'A8A8A8A8'
             dc    h'A8A8A8A8'
             dc    h'28282828'
             dc    h'28282828'
             dc    h'A8A8A8A8'
             dc    h'A8A8A8A8'
             dc    h'50505050'
             dc    h'50505050'
             dc    h'D0D0D0D0'
             dc    h'D0D0D0D0'
             dc    h'50505050'
             dc    h'50505050'
             dc    h'D0D0D0D0'
             dc    h'D0D0D0D0'
             dc    h'50505050'
             dc    h'50505050'
             dc    h'D0D0D0D0'
             dc    h'D0D0D0D0'
             dc    h'50505050'
             dc    h'50505050'
             dc    h'D0D0D0D0'
             dc    h'D0D0D0D0'
;-----------------------------------------------------------------------------
; the hi byte for the memory at the start of every screen row
rowH         anop
;        .repeat $C0, Row
;            .byte   >$0000 | Row & $07 << 2 | Row & $30 >> 4
;        .endrep
             dc    h'0004080C'
             dc    h'1014181C'
             dc    h'0004080C'
             dc    h'1014181C'
             dc    h'0105090D'
             dc    h'1115191D'
             dc    h'0105090D'
             dc    h'1115191D'
             dc    h'02060A0E'
             dc    h'12161A1E'
             dc    h'02060A0E'
             dc    h'12161A1E'
             dc    h'03070B0F'
             dc    h'13171B1F'
             dc    h'03070B0F'
             dc    h'13171B1F'
             dc    h'0004080C'
             dc    h'1014181C'
             dc    h'0004080C'
             dc    h'1014181C'
             dc    h'0105090D'
             dc    h'1115191D'
             dc    h'0105090D'
             dc    h'1115191D'
             dc    h'02060A0E'
             dc    h'12161A1E'
             dc    h'02060A0E'
             dc    h'12161A1E'
             dc    h'03070B0F'
             dc    h'13171B1F'
             dc    h'03070B0F'
             dc    h'13171B1F'
             dc    h'0004080C'
             dc    h'1014181C'
             dc    h'0004080C'
             dc    h'1014181C'
             dc    h'0105090D'
             dc    h'1115191D'
             dc    h'0105090D'
             dc    h'1115191D'
             dc    h'02060A0E'
             dc    h'12161A1E'
             dc    h'02060A0E'
             dc    h'12161A1E'
             dc    h'03070B0F'
             dc    h'13171B1F'
             dc    h'03070B0F'
             dc    h'13171B1F'

;-----------------------------------------------------------------------------
; Jump table for screen tile rendering, per row - unrolled loops
rowDrawL     anop
             dc    s1<'tileDrawP0R0'
             dc    s1<'tileDrawP0R1'
             dc    s1<'tileDrawP0R2'
             dc    s1<'tileDrawP0R3'
             dc    s1<'tileDrawP0R4'
             dc    s1<'tileDrawP0R5'
             dc    s1<'tileDrawP0R6'
             dc    s1<'tileDrawP0R7'
             dc    s1<'tileDrawP0R8'
             dc    s1<'tileDrawP0R9'
             dc    s1<'tileDrawP0RA'
             dc    s1<'tileDrawP0RB'
             dc    s1<'tileDrawP0RC'
             dc    s1<'tileDrawP0RD'
             dc    s1<'tileDrawP0RE'
             dc    s1<'tileDrawP0RF'
             dc    s1<'tileDrawP1R0'  ; Page 1
             dc    s1<'tileDrawP1R1'
             dc    s1<'tileDrawP1R2'
             dc    s1<'tileDrawP1R3'
             dc    s1<'tileDrawP1R4'
             dc    s1<'tileDrawP1R5'
             dc    s1<'tileDrawP1R6'
             dc    s1<'tileDrawP1R7'
             dc    s1<'tileDrawP1R8'
             dc    s1<'tileDrawP1R9'
             dc    s1<'tileDrawP1RA'
             dc    s1<'tileDrawP1RB'
             dc    s1<'tileDrawP1RC'
             dc    s1<'tileDrawP1RD'
             dc    s1<'tileDrawP1RE'
             dc    s1<'tileDrawP1RF'

rowDrawH     anop
             dc    s1>'tileDrawP0R0'
             dc    s1>'tileDrawP0R1'
             dc    s1>'tileDrawP0R2'
             dc    s1>'tileDrawP0R3'
             dc    s1>'tileDrawP0R4'
             dc    s1>'tileDrawP0R5'
             dc    s1>'tileDrawP0R6'
             dc    s1>'tileDrawP0R7'
             dc    s1>'tileDrawP0R8'
             dc    s1>'tileDrawP0R9'
             dc    s1>'tileDrawP0RA'
             dc    s1>'tileDrawP0RB'
             dc    s1>'tileDrawP0RC'
             dc    s1>'tileDrawP0RD'
             dc    s1>'tileDrawP0RE'
             dc    s1>'tileDrawP0RF'
             dc    s1>'tileDrawP1R0'  ; Page 1
             dc    s1>'tileDrawP1R1'
             dc    s1>'tileDrawP1R2'
             dc    s1>'tileDrawP1R3'
             dc    s1>'tileDrawP1R4'
             dc    s1>'tileDrawP1R5'
             dc    s1>'tileDrawP1R6'
             dc    s1>'tileDrawP1R7'
             dc    s1>'tileDrawP1R8'
             dc    s1>'tileDrawP1R9'
             dc    s1>'tileDrawP1RA'
             dc    s1>'tileDrawP1RB'
             dc    s1>'tileDrawP1RC'
             dc    s1>'tileDrawP1RD'
             dc    s1>'tileDrawP1RE'
             dc    s1>'tileDrawP1RF'

;-----------------------------------------------------------------------------
mult64H      anop
;.repeat MAX_SPRITE_IFRAMES, Row
;        .byte >(Row * 64)
;.endrep
             dc    h'00000000'
             dc    h'01010101'
             dc    h'02020202'
             dc    h'03030303'
             dc    h'04040404'
             dc    h'05050505'
             dc    h'06060606'
             dc    h'07070707'
             dc    h'08080808'

mult64L      anop
;.repeat MAX_SPRITE_IFRAMES, Row
;        dc s1<'(Row * 64)
;.endrep
             dc    h'004080C0'
             dc    h'004080C0'
             dc    h'004080C0'
             dc    h'004080C0'
             dc    h'004080C0'
             dc    h'004080C0'
             dc    h'004080C0'
             dc    h'004080C0'
             dc    h'004080C0'

mult32H      anop
;.repeat 15, Row
;        .byte >(Row * 32)
;.endrep
             dc    h'00000000'
             dc    h'00000000'
             dc    h'01010101'
             dc    h'010101'

mult32L      anop
;.repeat 15, Row
;        dc s1<'(Row * 32)
;.endrep
             dc    h'00204060'
             dc    h'80A0C0E0'
             dc    h'00204060'
             dc    h'80A0C0'

mult16       anop
;.repeat 9, Row
;        .byte Row * 16
;.endrep
             dc    h'00102030'
             dc    h'40506070'
             dc    h'80'

mult8        anop
;.repeat 24, Row
;        .byte Row * 8
;.endrep
             dc    h'00081018'
             dc    h'20283038'
             dc    h'40485058'
             dc    h'60687078'
             dc    h'80889098'
             dc    h'A0A8B0B8'

;-----------------------------------------------------------------------------
; color masks
masksLeft    anop
             dc    b'11111111'  ; 00 MSB-BITS-11..1 White
             dc    b'00101010'  ; 01   0-BITS-01..0 Green
             dc    b'10101010'  ; 04   1-BITS-01..0 Orange
             dc    b'01010101'  ; 01   0-BITS-10..1 Purple
             dc    b'11010101'  ; 02   1-BITS-10..1 Blue

masksRight   anop
             dc    b'11111111'  ; 00  MSB-BITS-11 White
             dc    b'01010101'  ; 01    0-BITS-10..1 Green
             dc    b'11010101'  ; 04    1-BITS-10..1 Orange
             dc    b'00101010'  ; 01    0-BITS-01..0 Purple
             dc    b'10101010'  ; 02    1-BITS-01..0 Blue

maskGreen    anop
             dc    b'00101010 01010101'  ; Green

maskOrange   anop
             dc    b'10101010 11010101'  ; Orange

maskGreenHi  anop
             dc    b'00100000 01000000'  ; Green

maskNewTip   anop
             dc    b'01011111 00111111'  ; White air graph tip (reversed order)
;-----------------------------------------------------------------------------
; sprite 32 to 64 byte bit-double helper table
binDouble    anop
             dc    b'00000000'
             dc    b'00000011'
             dc    b'00001100'
             dc    b'00001111'
             dc    b'00110000'
             dc    b'00110011'
             dc    b'00111100'
             dc    b'00111111'
             dc    b'11000000'
             dc    b'11000011'
             dc    b'11001100'
             dc    b'11001111'
             dc    b'11110000'
             dc    b'11110011'
             dc    b'11111100'
             dc    b'11111111'

             end

