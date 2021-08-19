;-----------------------------------------------------------------------------
; defs.inc
; Part of manic miner, the zx spectrum game, made for Apple II
;
; Stefan Wessels, 2020
; This is free and unencumbered software released into the public domain.

;-----------------------------------------------------------------------------
; These from apple2.inc for use with ca65

;-----------------------------------------------------------------------------
; Zero page

WNDLFT  gequ      $20     ; Text window left
WNDWDTH gequ      $21     ; Text window width
WNDTOP  gequ      $22     ; Text window top
WNDBTM  gequ      $23     ; Text window bottom+1
CH      gequ      $24     ; Cursor horizontal position
CV      gequ      $25     ; Cursor vertical position
BASL    gequ      $28     ; Text base address low
BASH    gequ      $29     ; Text base address high
INVFLG  gequ      $32     ; Normal/inverse(/flash)
PROMPT  gequ      $33     ; Used by GETLN
RNDL    gequ      $4E     ; Random counter low
RNDH    gequ      $4F     ; Random counter high
HIMEM   gequ      $73     ; Highest available memory address+1

;-----------------------------------------------------------------------------
; Vectors

DOSWARM gequ      $03D0   ; DOS warmstart vector
BRKVec  gequ      $03F0   ; Break vector
SOFTEV  gequ      $03F2   ; Vector for warm start
PWREDUP gequ      $03F4   ; This must be = EOR #$A5 of SOFTEV+1

;-----------------------------------------------------------------------------
; Hardware

; Keyboard input
KBD     gequ      $C000   ; Read keyboard
KBDSTRB gequ      $C010   ; Clear keyboard strobe

; 80 column video
CLR80COL    gequ      $C000   ; Disable 80 column store
SET80COL    gequ      $C001   ; Enable 80 column store
RD80COL     gequ      $C018   ; >127 if 80 column store enabled
RD80VID     gequ      $C01F   ; >127 if 80 column video enabled

; Character set
CLRALTCHAR gequ   $C00E   ; Normal Apple II char set
SETALTCHAR gequ   $C00F   ; Norm/inv LC, no flash
ALTCHARSET gequ   $C01E   ; >127 if alt charset switched in

; Language card
RDLCBNK2    gequ      $C011   ; >127 if LC bank 2 in use
RDLCRAM     gequ      $C012   ; >127 if LC is read enabled
ROMIN       gequ      $C081   ; Swap in D000-FFFF ROM
LCBANK2     gequ      $C083   ; Swap in LC bank 2
LCBANK1     gequ      $C08B   ; Swap in LC bank 1

; Vertical blanking
RDVBLBAR    gequ  $C019   ; >127 if not vertical blanking
RDVBLMSK    gequ  $C041   ; >127 if VBL interrupts enabled
DISVBL      gequ  $C05A   ; Disable VBL interrupts
ENVBL       gequ  $C05B   ; Enable VBL interrupts

; Video mode
TXTCLR      gequ  $C050   ; Display graphics
TXTSET      gequ  $C051   ; Display text
MIXCLR      gequ  $C052   ; Disable 4 lines of text
MIXSET      gequ  $C053   ; Enable 4 lines of text
LOWSCR      gequ  $C054   ; Page 1
HISCR       gequ  $C055   ; Page 2
LORES       gequ  $C056   ; Lores graphics
HIRES       gequ  $C057   ; Hires graphics
DHIRESON    gequ  $C05E   ; Enable double-width graphics
DHIRESOFF   gequ  $C05F   ; Disable double-width graphics

; Game controller
TAPEIN  gequ      $C060   ; Read casette input / Switch input 3
BUTN0   gequ      $C061   ; Switch input 0 / Open-Apple key
BUTN1   gequ      $C062   ; Switch input 1 / Closed-Apple key
BUTN2   gequ      $C063   ; Switch input 2 / Shift key
PADDL0  gequ      $C064   ; Analog input 0
PADDL1  gequ      $C065   ; Analog input 1
PADDL2  gequ      $C066   ; Analog input 2
PADDL3  gequ      $C067   ; Analog input 3
PTRIG   gequ      $C070   ; Analog input reset

; Input/Output Unit
IOUDISON    gequ  $C07E   ; Disable IOU
IOUDISOFF   gequ  $C07F   ; Enable IOU

; Control Your Apple
CYAREG  gequ      $C036   ; Bits 0-3=disk detect 4=shadow all banks 7=fast

;-----------------------------------------------------------------------------
; These are for mminer-apple2

;-----------------------------------------------------------------------------
HGRPage1                              gequ $2000
HGRPage2                              gequ $4000
MLI                                   gequ $BF00
SPEAKER                               gequ $C030
PLACEHOLDER                           gequ $FFFF

;-----------------------------------------------------------------------------
; Cheat Key (binary 0-19 reverse)                 12345
LEVEL_Central_Cavern                  gequ 0      ; 00000
LEVEL_The_Cold_Room                   gequ 1      ; 10000
LEVEL_The_Menagerie                   gequ 2      ; 01000
LEVEL_Abandoned_Uranium_Workings      gequ 3      ; 11000
LEVEL_Eugenes_Lair                    gequ 4      ; 00100
LEVEL_Processing_Plant                gequ 5      ; 10100
LEVEL_The_Vat                         gequ 6      ; 01100
LEVEL_Miner_Willy_meets_the_Kong      gequ 7      ; 11100
LEVEL_Wacky_Amoebatrons               gequ 8      ; 00010
LEVEL_The_Endorian_Forest             gequ 9      ; 10010
LEVEL_Attack_of_the_Mutant_Telephones gequ 10     ; 01010
LEVEL_Return_of_the_Alien_Kong_Beast  gequ 11     ; 11010
LEVEL_Ore_Refinery                    gequ 12     ; 00110
LEVEL_Skylab_Landing_Bay              gequ 13     ; 10110
LEVEL_The_Bank                        gequ 14     ; 01110
LEVEL_The_Sixteenth_Cavern            gequ 15     ; 11110
LEVEL_The_Warehouse                   gequ 16     ; 00001
LEVEL_Amoebatrons_Revenge             gequ 17     ; 10001
LEVEL_Solar_Power_Generator           gequ 18     ; 01001
LEVEL_The_Final_Barrier               gequ 19     ; 11001
LEVEL_Game_Over                       gequ 20

;-----------------------------------------------------------------------------
DATA_BLANK                            gequ $00
DATA_FLOOR1                           gequ $10
DATA_FLOOR2                           gequ $20
DATA_CONVEYOR                         gequ $30
DATA_WALL                             gequ $40
DATA_BUSH                             gequ $50
DATA_ROCK                             gequ $60
DATA_COLLAPSE                         gequ $70
DATA_KEY                              gequ $80
DATA_SWITCH1                          gequ $90
DATA_SWITCH1_OPEN                     gequ $A0
DATA_SWITCH2                          gequ $B0
DATA_SWITCH2_OPEN                     gequ $C0
DATA_DOOR                             gequ $D0

;-----------------------------------------------------------------------------
START_LIVES                           gequ 2
MAX_LIVES                             gequ 5

PLAY_ROWS                             gequ 16
PLAY_COLS                             gequ 32
VISIBLE_COLS                          gequ 20

TILES_PER_LEVEL                       gequ 8
TILE_BYTES                            gequ 16
CONVEYOR_FRAMES                       gequ 7
KEYS_FRAMES                           gequ 4

MAX_SPRITES                           gequ 10
SPRITE_BYTES                          gequ 64
MAX_SPRITE_IFRAMES                    gequ 36

AIR_STR_LEN                           gequ 5
AIR_SPEED                             gequ 14

DEMO_TIMER_DURATION                   gequ 2
DEMO_TIMER_INITAL                     gequ 18

;-----------------------------------------------------------------------------
zero_base                             gequ $50
currPageH               gequ $50         ; $02 or $04 - Hi for screen buffer to draw t0
backPage                gequ $51         ; 0 or 1 - just used to toggle HISCR or LOSCR
monochrome              gequ $52         ; 0 for color, 1 for black and white
leftEdge                gequ $53         ; distance the screen has scrolled to the right
cameraMode              gequ $54
tilesRendered           gequ $55         ; count the number of tiles shown in a screen.  Used to time music delay
willyXPos               gequ $56         ; column for willy
willyYPos               gequ $57         ; pixel-row for willy
willyYRow               gequ $58         ; row (YPos / 8) for willy
willyFrame              gequ $59         ; willy animation frame
willyDir                gequ $5A         ; direction willy is facing
willyJumpCounter        gequ $5B         ; what phase of a jump willy is in
willyFallFromJump       gequ $5C         ; 0 or 1. 1 when willy starts jumping.  Affects falling death
numSprites              gequ $5D         ; how many sprites (excl. willy) to draw in a level (door is last)
spriteXPos              gequ $5E         ; MAX_SPRITES col position of the sprite
spriteYPos              gequ $68         ; MAX_SPRITES pixel row
spriteDir               gequ $72         ; MAX_SPRITES facing direction
spriteMin               gequ $7C         ; MAX_SPRITES min (turn/hold) point for path
spriteMax               gequ $86         ; MAX_SPRITES max point for path
spriteSpeed             gequ $90         ; MAX_SPRITES speed (frames/pixels) to move the sprite
spriteTick              gequ $9A         ; MAX_SPRITES counter how often a sprite animates (spritespeed as init)
spriteFramesIdx         gequ $A4         ; MAX_SPRITES Index into
spriteFrame             gequ $AE         ; MAX_SPRITES which frame the sprite is on
spriteClass             gequ $B8         ; MAX_SPRITES see CLASS_* in defs.inc for masks
spriteColor             gequ $C2         ; MAX_SPRITES index into masks<Left|Right> in rosystem.inc
movementMask            gequ $CC         ; movement that happened in willyMove.  See MASK_* in defs.inc
userKeyMask             gequ $CD         ; user desire to move based on keys pressed.  See MASK_* in defs.inc
conveyorMask            gequ $CE         ; 0, willy not on conveyor, 2 for left, 1 for right
currLevel               gequ $CF         ; level that's active
lives                   gequ $D0         ; lives in reserve
airCols                 gequ $D1         ; screen columns that have an air bar in them
airTipGfx               gequ $D2         ; the bit pattern for the tip of the air bar
airFlow                 gequ $D3         ; the "tick" till a unit of air is decreased
livesFrame              gequ $D4         ; anim frame for the walking willy's at the bottom
keysFrameNum            gequ $D5         ; animation frame for keys in the level (color)
conveyorFrameNum        gequ $D6         ; animation frame for conveyor tile to be active
keysToCollect           gequ $D7         ; number of keys that remain to be collected
eventState              gequ $D8         ; see EVENT_* in defs.inc for bitmask values
updateUICount           gequ $D9         ; updateUI is called when non-zero
uiComponent             gequ $DA         ; See UI_COMPONENT_* in defs.inc for mask values.  What UI to update
fullScreenClearCount    gequ $DB         ; 0 - clear only top, non-zero all.  Is counted down by gameAI
musicL                  gequ $DC         ; pointer or index for playing music
musicH                  gequ $DD         ; hi pointer for playing UI music
audioMask               gequ $DE         ; see AUDIO_* in defs.inc
demoMode                gequ $DF         ; 0 - not a demo, 1 when demo mode active
demoTimer               gequ $E0         ; in demo mode, scroll when counter is 0
demoDirection           gequ $E1         ; direction the demo scroll will move the screen
cheatIndex              gequ $E2         ; count cheat code entry or when active, if 6 is down
cheatActive             gequ $E3         ; non-zero when the cheat was successfully entered
srcPtrL                 gequ $E4         ; often a pointer Lo
srcPtrH                 gequ $E5         ; often a pointer Hi
dstPtrL                 gequ $E6         ; often a pointer Lo
dstPtrH                 gequ $E7         ; often a pointer Hi
sizeL                   gequ $E8         ; sometimes a size used in ptr operations
sizeH                   gequ $E9         ; sometimes a size used in ptr operations
tmpBot                  gequ $EA         ; start of block of 7 zp values used randomly
bitMasks                gequ $F1         ; constant - used mostly for bit instruction (see below)
bit0Mask                gequ $F1         ; 1
bit1Mask                gequ $F2         ; 2
bit2Mask                gequ $F3         ; 4
bit3Mask                gequ $F4         ; 8
bit4Mask                gequ $F5         ; 16
bit5Mask                gequ $F6         ; 32
bit6Mask                gequ $F7         ; 64
bit7Mask                gequ $F8         ; 128

CLASS_MOVE_Y         gequ bit0Mask
CLASS_FOUR_FRAME     gequ bit1Mask
CLASS_UNUSED         gequ bit2Mask
CLASS_HOLDATEND      gequ bit3Mask
CLASS_EUGENE         gequ bit4Mask
CLASS_KONG           gequ bit5Mask
CLASS_SKYLAB         gequ bit6Mask
CLASS_DOOR           gequ bit7Mask

;-----------------------------------------------------------------------------
CAMERA_MODE_3_ZONE                    gequ 0
CAMERA_MODE_SCROLL                    gequ 1

;-----------------------------------------------------------------------------
EVENT_OK                              gequ 0
EVENT_DIED                            gequ 1
EVENT_LEVEL_RESTART                   gequ 2
EVENT_NEXT_LEVEL                      gequ 4
EVENT_EXIT_GAME                       gequ 8
EVENT_CHEAT_JUMP                      gequ 16

;-----------------------------------------------------------------------------
UI_COMPONENT_NAME                     gequ 1
UI_COMPONENT_AIR_NAME                 gequ 2
UI_COMPONENT_AIR                      gequ 4
UI_COMPONENT_SCORE_NAME               gequ 8
UI_COMPONENT_SCORE                    gequ 16
UI_COMPONENT_LIVES                    gequ 32
UI_COMPONENT_HIGHSCORE                gequ 64

;-----------------------------------------------------------------------------
MASK_RIGHT                            gequ 1
MASK_LEFT                             gequ 2
MASK_AIR                              gequ 4

;-----------------------------------------------------------------------------
AUDIO_MUSIC                           gequ $80
AUDIO_SOUND                           gequ $40








