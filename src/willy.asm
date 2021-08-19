;-----------------------------------------------------------------------------
; willy.inc
; Part of manic miner, the zx spectrum game, made for Apple II
;
; Stefan Wessels, 2020
; This is free and unencumbered software released into the public domain.

;-----------------------------------------------------------------------------
                     65816  OFF

                     copy   src/defs.s

WILLY                start

                     using  LOWMEM
                     using  ROSYSTEM
                     using  ROLEVELS

;-----------------------------------------------------------------------------
; Moves willy.  Incorporates user desire (userKeyMask) and conveyor direction
; in movement and does movement and collision resolution. This code was juggled a
; whole lot to make the outcome match that of the original game.  It's quite
; possibly sub-optimal, but it does what it is meant to do.
willyMove            entry

willyYPosBackup      equ    tmpBot+1
willyXPosBackup      equ    tmpBot+2
willyFrameBackup     equ    tmpBot+3
willyFloor           equ    tmpBot+4

                     lda    movementMask
                     bit    bit2Mask              ; MASK_AIR
                     beq    checkHorzKeys         ; on ground - check horizontal keys
                     jmp    selectDirection       ; in air - check horizontal motion

checkHorzKeys        anop
                     lda    userKeyMask           ; get the user Key
                     ldx    conveyorMask          ; and get the conveyor direction
                     beq    notOnConveyor         ; ignore conveyor code if not on a conveyor

                     and    conveyorMask          ; and user desire with conveyor
                     bne    onConveyor            ; if same, user conveyor direction for actual
                     lda    userKeyMask           ; get the user mask and
                     and    #$FB                  ; <~MASK_AIR                             ; if it's got no horizontal component
                     beq    onConveyor            ; willy is following the conveyor

                     lda    movementMask          ; user key horiz and not same as conveyor
                     jmp    selectDirection       ; so simply keep the current movement going

onConveyor           anop
                     lda    movementMask          ; actual is now conveyor direction
                     and    #$FC                  ;<~(MASK_LEFT | MASK_RIGHT)             ; clear current
                     ora    conveyorMask          ; add conveyor direction
                     sta    movementMask          ; store as actual
                     jmp    selectDirection       ; use the conveyor for sideways

notOnConveyor        anop
                     and    #$FB                  ; <~MASK_AIR                             ; clear the jump desire
                     sta    movementMask          ; make actual user desire

selectDirection      anop
                     and    #3                    ;(MASK_LEFT | MASK_RIGHT)               ; see if willy is moving horizontally
                     bne    wm00                  ; yes - handle horizontal movement
                     jmp    vertical
wm00                 and    #MASK_RIGHT           ; check MASK_RIGHT
                     bne    right                 ; if set, move to the right

left                 anop
                     lda    willyDir              ; see if already heading left
                     bne    moveLeft              ; if so, keep moving left
                     lda    #0                    ; when turning, no direction
                     sta    movementMask
                     lda    #1                    ; was facing right, so turn around
                     sta    willyDir
                     lda    willyFrame            ; flip the facing frame to left
                     ora    #4
                     sta    willyFrame
                     bne    vertical

moveLeft             anop
                     ldx    willyFrame            ; get the frame
                     stx    willyFrameBackup      ; back it up
                     dex                          ; move one left
                     cpx    #4                    ; wrapped?
                     bcc    wm01                  ; yes, move to previous column
                     stx    willyFrame            ; not wrapped, save the frame
                     bcc    wm01
                     jmp    vertical
wm01                 ldx    #7                    ; keep going, load right most frame
                     stx    willyFrame            ; set frame
                     ldx    willyXPos             ; get the column
                     stx    willyXPosBackup       ; save it
                     dex                          ; previous column
                     stx    willyXPos             ; make that current
                     ldy    #0                    ; check side (left) collisions column
                     beq    hCollision            ; BRA

right                anop
                     lda    willyDir              ; see if willy's already facing right
                     beq    moveRight             ; if so, move
                     lda    #0                    ; turn willy to the right
                     sta    willyDir
                     sta    movementMask          ; and clear the movement mask
                     lda    willyFrame
                     and    #3                    ; set right facing frame
                     sta    willyFrame
                     jmp    vertical

moveRight            anop
                     ldx    willyFrame            ; back up the animation frame
                     stx    willyFrameBackup
                     inx                          ; next frame (to the right)
                     cpx    #4                    ; wrapped?
                     bcs    wm02                  ; yes, move to next (right) column
                     stx    willyFrame            ; save the frame
                     bcc    vertical
wm02                 ldx    #0
                     stx    willyFrame            ; set frame 0
                     ldx    willyXPos             ; back up the column
                     stx    willyXPosBackup
                     inx                          ; move right
                     stx    willyXPos             ; save this column
                     ldy    #1                    ; check the right-hand column for collisions

hCollision           anop
                     jsr    willySetWorldPtr      ; set up the world pointer to check collisions
                     ldx    #2                    ; assume checking 2 rows
                     lda    willyYPos             ; get the height in pixels
                     and    #7                    ; see if willy is aligned
                     beq    colLoop               ; yes, go with 2 rows
                     inx                          ; if not aligned, willy crosses 3 rows
colLoop              anop
                     lda    (srcPtrL),y           ; load the world byte
                     beq    wm03                  ; if air then no collision
                     jsr    willyWorldCollision   ; resolve the collision if needed
                     bcc    wm03                  ; if carry clear, can move (didn't hit a wall)
                     lda    willyXPosBackup       ; hit a wall, so restore position (column)
                     sta    willyXPos
                     lda    willyFrameBackup      ; and also restore the frame
                     sta    willyFrame
                     jmp    vertical
wm03                 tya                          ; Y is 0 or 1 (left or right), put in a
                     adc    #32                   ; move down a row
                     tay                          ; and put back in y
                     dex                          ; x has the number of rows remaining to check
                     bne    colLoop               ; do till all rows checked

vertical             anop
                     lda    movementMask
                     bit    bit2Mask              ; MASK_AIR
                     bne    vertMove              ; in the air already then move vertically

                     lda    userKeyMask           ; get the user desire
                     bit    bit2Mask              ; MASK_AIR see if user wants to jump
                     beq    willyCollisionFeet    ; if not then check feet

                     and    #$FB                  ; <~MASK_AIR                             ; clear jump from desire
                     sta    userKeyMask           ; and save

                     lda    movementMask          ; update actual
                     ora    #MASK_AIR             ; by adding a jump
                     sta    movementMask

                     lda    #1                    ; mark this as a fall starting
                     sta    willyFallFromJump     ; from a jump - willy dies easier

vertMove             anop
                     lda    willyYPos             ; save the current Y position
                     sta    willyYPosBackup

                     lda    willyJumpCounter      ; get the current jump counter for height calculation
                     cmp    #18                   ; see sbc #4 below for why 18 (up/down curve length)
                     bcs    falling               ; if jump counter gt 17 then falling (0-17 is jump)

                     lsr    a                     ; / 2
                     sec
                     sbc    #4                    ; -4, so -4, -4, -3, -3, -2, -2, -1, -1, 0, 0, 1, 1, 2, 2, 3, 3, 4, 4
                     clc
                     adc    willyYPos             ; adjust willy height
                     sta    willyYPos

                     ldx    willyJumpCounter      ; get the current jump counter for height calculation
                     lda    jumpFreq,x
                     ldy    #$08                  ; duration for the freq
                     jsr    freq                  ; make a sound of this freq and duration
                     inc    willyJumpCounter

                     lda    willyJumpCounter
                     cmp    #9
                     bcs    willyCollisionFeet    ; and move the jump counter along

willyCollisionTop    anop
                     lda    willyYPosBackup       ; see where willy was
                     and    #7                    ; if aligned with a row, now entering a new row so check collision
                     bne    willyCollisionFeet    ; not aligned, no collision, go to feet check
                     jsr    willySetWorldPtr      ; set the srcPtr to point into the world
                     ldy    #0                    ; start with the head left
                     lda    (srcPtrL),y           ; read the world byte
                     beq    wm04                  ; if air then do nothing
                     jsr    willyWorldCollision   ; not air so handle the potential collision
                     bcs    hitHead               ; carry set means wall collision, so fall
wm04                 ldy    #1                    ; check the right as well
                     lda    (srcPtrL),y
                     beq    willyCollisionFeet    ; if air, ignore
                     jsr    willyWorldCollision
                     bcc    willyCollisionFeet    ; carry clear means no collision

hitHead              anop
                     lda    willyYPosBackup
                     sta    willyYPos
                     lda    #18
                     sta    willyJumpCounter
                     jmp    willyCollisionFeet    ; and check for landing immediately

falling              anop
                     lda    willyJumpCounter      ; get the current jump counter for height calculation
                     and    #$0f
                     tax
                     lda    fallFreq,x
                     ldy    #$08                  ; duration for the freq
                     jsr    freq                  ; make a sound of this freq and duration
                     inc    willyJumpCounter      ; and move the jump counter along

                     lda    movementMask          ; strip horizontal from actual
                     and    #$FC                  ; <~(MASK_LEFT | MASK_RIGHT)
                     sta    movementMask
                     lda    willyYPos             ; get willy's height
                     clc
                     adc    #4                    ; move him 4 down (fall speed)
                     sta    willyYPos

willyCollisionFeet   anop
                     lda    #0                    ; assume not on a conveyor
                     sta    conveyorMask

                     lda    willyYPos             ; see if willy is level with a floor
                     and    #7
                     bne    positionScreen        ; if not, don't check the feet

                     lda    willyJumpCounter      ; see if still going up in jump
                     beq    wm05                  ; if 0 then not jumping
                     cmp    #10                   ; if still going up in the jump, don't check the feet
                     bcc    positionScreen

wm05                 jsr    willySetWorldPtr      ; set up the world pointer
                     ldy    #64                   ; check the ground below willy, left
                     lda    (srcPtrL),y
                     sta    willyFloor            ; store the byte
                     beq    wm06                  ; if air, don't resolve
                     jsr    willyFloorCollision   ; resolve the collision
wm06                 ldy    #65                   ; check the floor right
                     lda    (srcPtrL),y
                     beq    checkFloor            ; if air, done with feet
                     tax                          ; save the byte
                     ora    willyFloor            ; and update the floor
                     sta    willyFloor
                     txa                          ; restore the world byte
                     jsr    willyFloorCollision   ; and resolve it

checkFloor           anop
                     lda    willyFloor            ; was there something under willy's feet
                     bne    positionScreen        ; if yes, then position willy

                     lda    willyJumpCounter      ; see if willy is in a jump or fall
                     bne    positionScreen        ; yes, position screen

                     lda    #18                   ; willy was walking, so set him to fall
                     sta    willyJumpCounter
                     lda    movementMask          ; strip horizontal from actual
                     and    #$FC                  ; <~(MASK_LEFT | MASK_RIGHT)             ; clear left and right
                     ora    #MASK_AIR             ; set the mask that he's now in the air (fall)
                     sta    movementMask


positionScreen       entry                        ; this is also called from gameInitStage
                     lda    cameraMode            ; see which "camera mode" is active
                     bne    cameraScroll          ; non zero is scroll mode

camera3Zone          anop                         ; zone 1: 0-19, 2: 6-25, 3: 12-31
                     lda    willyXPos             ; see where Willy is
                     cmp    #10                   ; 10 divides zones 1 and 2
                     bcs    zone2or3              ; ge 10 means zone 2 or 3
                     lda    leftEdge              ; zone 1 - see where the edge is
                     cmp    #0                    ; if it's at 0 all is well
                     beq    done0
cameraLess           anop
                     dec    leftEdge              ; edge is gt 0, so move it left
                     bpl    moveName              ; BRA
zone2or3             anop
                     cmp    #20                   ; 20 divides zones 2 and 3
                     bcs    cameraRight           ; ge 20 means zone 3
                     lda    leftEdge              ; see where the edge is (in zone 2)
                     cmp    #6                    ; zone 2 edge wants to be at 6
                     beq    done0                 ; if it's there, all is well
                     bcs    cameraLess            ; if it's gt 6, then move it left
                     inc    leftEdge              ; move the edge right
                     bne    moveName              ; BRA
cameraRight          anop
                     lda    leftEdge              ; zone 3, see where the edge is
                     cmp    #$0c                  ; if it's at 12
                     beq    done0                 ; then it's all good
                     inc    leftEdge              ; otherwise move it right towards 12

moveName             anop                         ; if the edge moves the text needs to move as well
                     lda    #UI_COMPONENT_NAME    ; and mark the name as needing to scroll too
                     jsr    uiUpdateComponent

                     rts

cameraScroll         anop
                     lda    willyXPos
                     sec                          ; col is in accumulator
                     sbc    #$0a                  ; see if willy is past column 10
                     bcs    wm07
                     lda    #0                    ; not, so set the left edge to the left
                     bne    wm08                  ; BRA
wm07                 cmp    #$0d                  ; see if the col is less than 13
                     bcc    wm08
                     lda    #$0c                  ; col is 13 or greater, so clamp to 12
wm08                 cmp    leftEdge              ; see if the edge needs to move
                     beq    done0                 ; don't move
                     sta    leftEdge              ; set the new left edge
                     lda    #UI_COMPONENT_NAME    ; and mark the name as needing to scroll too
                     jsr    uiUpdateComponent
done0                anop
                     rts                          ; done with willy's movement



;-----------------------------------------------------------------------------
; resolves collisions for willy.  Used by feet but foot collision entry is
; from willyFloorCollision.  on exit, carry set means wall collision
willyWorldCollision  entry

                     clc
                     cmp    #DATA_BUSH            ; bushes kill willy
                     beq    willyDies
                     cmp    #DATA_ROCK            ; rocks kill willy
                     bne    wwc0

willyDies            entry
                     lda    #EVENT_DIED           ; simply set the die event
                     ora    eventState
                     sta    eventState
                     rts

wwc0                 cmp    #DATA_WALL            ; walls block willy
                     bne    wwc1
                     rts                          ; carry was set by the cmp and equality.  set means wall collision

wwc1                 cmp    #DATA_KEY             ; key's need to be counted
                     bne    wwc2
                     jmp    willyHitKey           ; clears carry

wwc2                 cmp    #DATA_DOOR            ; added dynamically when last key found
                     bne    wwc3
                     lda    #EVENT_NEXT_LEVEL     ; set event to move to next cavern/level
                     ora    eventState
                     sta    eventState
                     rts

wwc3                 cmp    #DATA_SWITCH1         ; added at level init for kong screens
                     bne    wwc4
                     jmp    willyHitSwitch1

wwc4                 cmp    #DATA_SWITCH2         ; added at level init for kong screens
                     bne    done1
                     jmp    willyHitSwitch2

done1                anop
                     clc                          ; for unhandled (floor tiles), just clear carry
                     rts



;-----------------------------------------------------------------------------
willyFloorCollision  entry

                     cmp    #DATA_FLOOR1          ; floors are landed on
                     beq    landed

                     cmp    #DATA_WALL            ; walls can be walked on
                     beq    landed

                     cmp    #DATA_FLOOR2          ; special can be walked on
                     bne    wfc0

landed               anop
                     lda    movementMask          ; see landing from a jump/fall
                     and    #MASK_AIR
                     beq    notFromAir            ; just a foot-fall from walking, no action
                     clc
                     lda    willyFallFromJump     ; see if a jump
                     adc    willyJumpCounter      ; and how far
                     cmp    #18+9                 ; compare to death height
                     bcc    fellNotTooFar         ; not too far
                     jmp    willyDies             ; fell to far, kill willy
fellNotTooFar        anop
                     lda    #0                    ; reset the fall from jump
                     sta    willyFallFromJump
                     sta    willyJumpCounter      ; and reset the willy jump counter
                     lda    #$FB                  ; <~MASK_AIR                             ; clear the air bit
                     and    movementMask
                     sta    movementMask
notFromAir           anop
                     rts

wfc0                 cmp    #DATA_CONVEYOR        ; landed on a conveyor
                     bne    wfc1
                     ldx    currLevel             ; get the level
                     lda    conveyorDirections,x  ; get the direction of the conveyor
                     sta    conveyorMask          ; set it as the conveyor mask (which is reset each frame)
                     bne    landed                ; and do landing code

wfc1                 cmp    #DATA_COLLAPSE        ; check for collapsing tiles
                     bcc    willyWorldCollision   ; less than, not collapsing
                     cmp    #DATA_COLLAPSE+9      ; in the collapse range
                     bcs    willyWorldCollision   ; no, check non-walk/floor tiles
                     jsr    willyCollapse         ; collapse a platform tile, returns with carry clear
                     bcc    landed                ; BRA to land code



;-----------------------------------------------------------------------------
willyHitSwitch1      entry

                     clc
                     adc    #1                    ; DATA_SWITCH1 becomes DATA_SWITCH1_OPEN
                     sta    (srcPtrL),y           ; make this switch draw open

                     lda    #0
                     sta    levelLayout+11*32+17  ; make a hole in the wall
                     sta    levelLayout+12*32+17

                     ldx    #1                    ; sprite 1 barrel needs to go further
                     lda    #19                   ; this is the new max for return-kong
extend               anop
                     sta    spriteMax,x           ; make the new max active
                     clc                          ; must leave with carry clear - not a wall collision
                     rts



;-----------------------------------------------------------------------------
willyHitSwitch2      entry

                     clc
                     adc    #1                    ; DATA_SWITCH2 becomes DATA_SWITCH2_OPEN
                     sta    (srcPtrL),y           ; make this switch draw open

                     lda    #0
                     sta    levelLayout+2*32+15   ; remove kong's platform
                     sta    levelLayout+2*32+16

                     ldx    #3                    ; kong is at index 3
                     lda    #14*8-5               ; put the fallen-down destination for kong in place
                     sta    spriteMax,x

                     lda    #2                    ; turn kong upside down
                     sta    spriteFrame,x

                     lda    #0                    ; set kong's direction to down
                     sta    spriteDir,x

                     rts



;-----------------------------------------------------------------------------
willyCollapse        entry

                     clc
                     adc    #1                    ; move the tile-top one down
                     cmp    #DATA_COLLAPSE+7      ; is it all the way down
                     bcc    wc00                  ; not yet
                     lda    #0                    ; yes, so erase the tile
                     clc
wc00                 sta    (srcPtrL),y           ; make the change in the level
                     rts



;-----------------------------------------------------------------------------
willyHitKey          entry

tempX                equ    tmpBot+5

                     stx    tempX                 ; save x - it may be an index in left/right col
                     lda    #0                    ; erase the key tile in the level
                     sta    (srcPtrL),y
                     ldx    #3                    ; add 100 (digit 3 of 6, zero based 000100)
                     lda    #1
                     jsr    textAddScore
                     dec    keysToCollect         ; 1 less key to collect
                     bne    done2                 ; all keys collected?

                     ldx    currLevel             ; get the level
                     lda    doorL,x               ; get the door location in the level (lo)
                     sta    putDoor+1
                     lda    doorH,x               ; and hi
                     sta    putDoor+2
                     lda    #DATA_DOOR            ; get the door tile
putDoor              anop
                     sta    PLACEHOLDER           ; and add the door tile to the level

done2                anop
                     ldx    tempX                 ; restore the saved x
                     clc                          ; make sure carry is clear
                     rts



;-----------------------------------------------------------------------------
willySetWorldPtr     entry

                     lda    willyYPos             ; get the height
                     lsr    a                     ; divide by 8
                     lsr    a
                     lsr    a
                     sta    willyYRow             ; save the row willy's in
                     tax                          ; put the row in Y
                     clc
                     lda    mult32L,x             ; row * 32
                     adc    willyXPos             ; and add the X position (levelLayout is aligned so no need to add lo)
                     sta    srcPtrL               ; the low byte of the pos in the level
                     lda    mult32H,x             ; get the high byte
                     adc    #>levelLayout         ; and offset into the level
                     sta    srcPtrH               ; and now srcPtr points at willy in the level

                     rts

                     end

