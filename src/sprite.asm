;-----------------------------------------------------------------------------
; sprite.inc
; Part of manic miner, the zx spectrum game, made for Apple II
;
; Stefan Wessels, 2020
; This is free and unencumbered software released into the public domain.

;-----------------------------------------------------------------------------
                            65816  OFF

                            copy   src/defs.s

SPRITE                      start

                            using  LOWMEM
                            using  ROSYSTEM
                            using  ROLEVELS
                            using  ROSPRITES

;-----------------------------------------------------------------------------
; Copy bytes from srcPtr to dstPtr
; IN:       - srcPtr - start of copy
; dstPtr    - start of non-overlapping destination
; size      - number of bytes to copy
; Clobbers: a,y 
spriteCopyMemSrcToDst       entry

                            ldy    #0
hiCopy                      anop
                            dec    sizeH
                            bmi    lowCopy
scm0                        lda    (srcPtrL),y
                            sta    (dstPtrL),y
                            dey
                            bne    scm0
                            inc    srcPtrH
                            inc    dstPtrH
                            bne    hiCopy

lowCopy                     anop
                            ldy    sizeL
                            dey
                            bmi    doneScm
scm1                        lda    (srcPtrL),y
                            sta    (dstPtrL),y
                            dey
                            bpl    scm1

doneScm                     anop
                            rts



;-----------------------------------------------------------------------------
; Look up the color, and apply those masks to the frames
; IN:   x = start frame
; y = num frames
; a = color index
; Clobbers: a,y 
spriteApplyMaskToFrames     entry

;instanceIdx0 equ tmpBot+0
colMaskL0                   equ    tmpBot+1
colMaskR0                   equ    tmpBot+2
numFrames                   equ    tmpBot+3

                            sty    numFrames                ; save y
                            tay                             ; put color index in y

                            lda    masksLeft,y              ; look up the masks for the color
                            sta    colMaskL0
                            lda    masksRight,y
                            sta    colMaskR0

                            lda    mult64L,x                ; build a pointer to the frame
                            sta    srcPtrL
                            lda    mult64H,x
                            adc    #>spriteInstances
                            sta    srcPtrH

                            ldy    numFrames                ; convert frames to bytes
                            lda    mult64H,y
                            sta    sizeH
                            lda    mult64L,y
                            sta    sizeL

                            ldy    #0                       ; do blocks of 256
hiPass                      anop
                            dec    sizeH                    ; see if there's a hi block to do
                            bmi    lowPass                  ; if none (remain) to do, move on
sam0                        lda    (srcPtrL),y              ; do a left hand byte
                            and    colMaskL0
                            sta    (srcPtrL),y
                            dey
                            lda    (srcPtrL),y              ; then a right hand byte
                            and    colMaskR0
                            sta    (srcPtrL),y
                            dey
                            bne    sam0                     ; for 256 bytes
                            inc    dstPtrH                  ; advance the dest ptr Hi
                            bne    hiPass                   ; BRA

lowPass                     anop
                            ldy    sizeL                    ; do bytes remaining lt 256
                            dey
                            bmi    doneSam                  ; keep going till all done
sam1                        lda    (srcPtrL),y
                            and    colMaskL0
                            sta    (srcPtrL),y
                            dey
                            lda    (srcPtrL),y
                            and    colMaskR0
                            sta    (srcPtrL),y
                            dey
                            bpl    sam1

doneSam                     anop
                            rts



;-----------------------------------------------------------------------------
; Copy one frame to another
; IN:
; originalFrame    = tmpBot+4
; newFrame         = tmpBot+5
; Clobbers: a,x,y 
spriteCopyFrameToFrame      entry

originalFrame0              equ    tmpBot+4
newFrame0                   equ    tmpBot+5

                            clc

                            ldx    originalFrame0           ; point srcPtr at the original frame
                            lda    mult64L,x
                            sta    srcPtrL
                            lda    mult64H,x
                            adc    #>spriteInstances
                            sta    srcPtrH

                            ldx    newFrame0                ; point dstPtr at the target frame
                            lda    mult64L,x
                            sta    dstPtrL
                            lda    mult64H,x
                            adc    #>spriteInstances
                            sta    dstPtrH

                            lda    #0                       ; 256 or less bytes (no Hi)
                            sta    sizeH
                            lda    #64                      ; just 64 bytes to copy
                            sta    sizeL
                            jsr    spriteCopyMemSrcToDst    ; use copymem to copy a 64 byte frame

                            rts



;-----------------------------------------------------------------------------
; Invert the pixels of a frame
; IN:
; x = frame number
spriteInvertFrame           entry

                            clc
                            lda    mult64L,x                ; make srcPtr point at the frame
                            sta    srcPtrL
                            lda    mult64H,x
                            adc    #>spriteInstances
                            sta    srcPtrH

                            ldy    #SPRITE_BYTES-1          ; do for a whole frame (0 based)
sif0                        lda    (srcPtrL),y              ; get the frame byte
                            eor    #%01111111               ; invert except for the MSB
                            sta    (srcPtrL),y              ; and save the byte
                            dey                             ; one less byte to do
                            bpl    sif0                     ; do for all bytes

                            rts



;-----------------------------------------------------------------------------
; Clear all the pixels of a frame
; IN:
; x = frame number
; y = number of frames to clear
spriteClearFrames           entry

count0                      equ    sizeL

                            lda    mult64L,y                ; turn the number of frames into num bytes
                            sta    count0                   ; save as a count

                            clc                             ; and clear carry
                            lda    mult64L,x                ; make srcPtr point at the
                            sta    srcPtrL
                            lda    mult64H,x
                            adc    #>spriteInstances
                            sta    srcPtrH

                            ldy    count0                   ; how many bytes to clear
                            dey                             ; make zero based
                            lda    #0                       ; value to write
scf0                        sta    (srcPtrL),y              ; write 0 to frame
                            dey                             ; previous byte in frame
                            bpl    scf0                     ; do for all, incl. zero'th byte

                            rts



;-----------------------------------------------------------------------------
; Make an instance of the bitmap (index in a) into the spriteInstance buffer
; while expanding the bitmap from 32 byte 1bpp into 64 byte 2bpp and masking
; the instance for the required color.
; IN:
; a - bitmapIdx
; x - instanceIdx
spriteInstanceSpriteFrames  entry

; count       = tmpBot+0
; spriteIdx   = tmpBot+1
instanceIdx1                equ    tmpBot+2
srcIdx                      equ    tmpBot+3
dstIdx                      equ    tmpBot+4
colMaskL1                   equ    tmpBot+5
colMaskR1                   equ    tmpBot+6

                            ldy    #0
                            sty    srcPtrH
                            sty    dstPtrH

                            ldy    #5                       ; mult * 32 (shl 5 times) since each src frame is 32 bytes
sis0                        asl    a                        ; shift the low
                            rol    srcPtrH                  ; and the hi, and move carry into hi if needed
                            dey                             ; do for all 6 iterations
                            bne    sis0

                            adc    #<sprite08               ; add the memory offset off the non-willy src sprites
                            sta    srcPtrL
                            lda    #>sprite08
                            adc    srcPtrH
                            sta    srcPtrH                  ; src ptr now points at the 1st frame

                            lda    spriteFramesIdx,x        ; get the sprite dest frame
                            ldy    #6                       ; mult * 64 (shl 6 times) since each frame is 64 bytes
sis1                        asl    a                        ; shift the lo
                            rol    dstPtrH                  ; and the hi, and move carry into hi if needed
                            dey                             ; do for all 6 iterations
                            bne    sis1
                            sta    dstPtrL                  ; save the lo
                            lda    dstPtrH                  ; get the hi
                            adc    #>spriteInstances        ; and make relative to the buffer
                            sta    dstPtrH                  ; and save the hi

                            lda    #1                       ; assume 4 frames equ 256 bytes
                            sta    sizeH
                            lda    spriteClass,x            ; get the class
                            bit    bit1Mask                 ; CLASS_FOUR_FRAME is it 4 frames
                            bne    sis2                     ; yes, all set
                            inc    sizeH                    ; 8 frames = 512 bytes equ 2 Hi

sis2                        ldy    instanceIdx1             ; get the instance
                            lda    spriteColor,y            ; and get the color for the instance
                            tay                             ; put the color index in y
                            lda    masksLeft,y              ; get the color mask
                            sta    colMaskL1
                            lda    masksRight,y             ; do the same for the right
                            sta    colMaskR1                ; SQW - look at comments but save for second (inverse) buffer

                            ldy    #0
                            sty    dstIdx                   ; set the src and dst indices to start at 0
                            sty    srcIdx                   ; srcIndex moves at 1/2 of dstIndex

copyFrames                  anop
                            ldy    srcIdx                   ; get the source index
                            lda    (srcPtrL),y              ; get a (left) src byte at the source index
                            pha                             ; save so the right nibble can be expanded later
                            lsr    a                        ; make the left nibble the low nibble
                            lsr    a
                            lsr    a
                            lsr    a
                            tax                             ; put the value in x
                            lda    binDouble,x              ; look up the "pixel doubled" value
                            ora    #$80                     ; and set the color msb "on"
                            and    colMaskL1                ; mask it with appropriate color
                            ldy    dstIdx                   ; get the destination offset
                            sta    (dstPtrL),y              ; and save to instance destination
                            iny                             ; move the destination along one
                            pla                             ; get the source byte
                            and    #$0f                     ; mask so only right nibble
                            tax                             ; put it in x
                            lda    binDouble,x              ; and look up the "doubled" pixel values
                            sec                             ; set carry so a rotate will be equiv to or #$80
                            ror    a                        ; and rotate, making it a "right" byte
                            and    colMaskR1                ; mask it with appropriate color
                            sta    (dstPtrL),y              ; and save to instance destination
                            iny                             ; move the dest index along again
                            sty    dstIdx                   ; and save the index
                            bne    sis3                     ; if the index rolled over
                            inc    dstPtrH                  ; move the hi byte along
                            dec    sizeH                    ; check if moved all required 4 * 32 src byte blocks
                            beq    doneSis
sis3                        inc    srcIdx                   ; move the src index along
                            bne    copyFrames               ; do max 256 bytes equ 8 * 32 byte src frames

doneSis                     anop
                            rts



;-----------------------------------------------------------------------------
; Copy the door frame, invert the copy, mask both and combine
spriteDoorSetup             entry

originalFrame1              equ    tmpBot+4
newFrame1                   equ    tmpBot+5

                            ldx    numSprites               ; numSprites is the door sprite index
                            lda    spriteFramesIdx,x
                            tax
                            stx    originalFrame1
                            inx
                            stx    newFrame1
                            jsr    spriteCopyFrameToFrame   ; make a copy y = instanceIdx, a = srcFrame,x equ dstFrame

                            ldx    newFrame1
                            jsr    spriteInvertFrame        ; invert the instance frame bits (leave msb alone)

                            ldx    currLevel
                            lda    door_color1,x
                            beq    sds0
                            ldx    originalFrame1
                            ldy    #1
                            jsr    spriteApplyMaskToFrames

                            ldx    currLevel
                            lda    door_color2,x
                            beq    sds0
                            ldx    newFrame1
                            ldy    #1
                            jmp    spriteApplyMaskToFrames

sds0                        rts



;-----------------------------------------------------------------------------
; Make 4 copies of Eugene frame 0 into frames 1-4 and apply a different
; color mask to the additional frames
spriteEugeneSetup           entry

originalFrame2              equ    tmpBot+4
newFrame2                   equ    tmpBot+5
count1                      equ    tmpBot+6

                            ldx    numSprites
                            dex                             ; eugene is sprite before the door

                            lda    spriteFramesIdx,x        ; get the frame where eugene is
                            tax                             ; put in x
                            stx    originalFrame2           ; and call it the original
                            inx                             ; and go to the next frame
                            stx    newFrame2                ; and call it the new frame
                            ldx    #3                       ; and set the loop count to 3
                            stx    count1
ses0                        jsr    spriteCopyFrameToFrame   ; make a copy of eugene,x = ori,y equ new

                            lda    count1                   ; get the count in a (as a color mask index)
                            ldx    newFrame2                ; the frame in x
                            ldy    #1                       ; and the number of frames to process in Y
                            jsr    spriteApplyMaskToFrames  ; mask the new eugene to the "count" color

                            inc    newFrame2                ; go up a frame
                            dec    count1                   ; and dec the loop counter
                            bne    ses0                     ; and do for the number of loops (3)

                            rts                             ; there are now 4 eugenes, White, Green, Orange & Purple

                            end

