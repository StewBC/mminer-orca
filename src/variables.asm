;-----------------------------------------------------------------------------
; variables.inc
; Part of manic miner, the zx spectrum game, made for Apple II
;
; Stefan Wessels, 2020
; This is free and unencumbered software released into the public domain.

;-----------------------------------------------------------------------------
;.segment "LOWMEM"

                      copy  src/defs.s

; These are instance buffers for sprites / tiles.  They are copied into this
; area and then masked for color from where they are rendered
LOWMEM                data

levelLayout           gequ  $0800
levelLayoutEnd        gequ  levelLayout+PLAY_COLS*PLAY_ROWS                  ; Unpacked level (tile) info - keep 1st for alignment

; Instances for display
spriteInstances       gequ  levelLayoutEnd                                   ; Instances of sprite data in a level
spriteInstancesEnd    gequ  spriteInstances+MAX_SPRITE_IFRAMES*SPRITE_BYTES

tilesInstances        gequ  spriteInstancesEnd                               ; instances of tiles in use bitmaps
tilesInstancesEnd     gequ  tilesInstances+TILES_PER_LEVEL*TILE_BYTES

keyAnimTiles          gequ  tilesInstancesEnd                                ; color instances of key tile
keyAnimTilesEnd       gequ  keyAnimTiles+KEYS_FRAMES*TILE_BYTES

conveyorAnimTiles     gequ  keyAnimTilesEnd                                  ; instances of conveyor animated tiles
conveyorAnimTilesEnd  gequ  conveyorAnimTiles+CONVEYOR_FRAMES*TILE_BYTES

; cache of 8 pixel-rows for 32 double-byte characters. The level name is centered in here, and drawn from here
levelNameGfx0         gequ  conveyorAnimTilesEnd
levelNameGfx0End      gequ  levelNameGfx0+PLAY_COLS*2*8

                      end

;-----------------------------------------------------------------------------
;.segment "DATA"

DATA                  data
; The scores are updated in these text strings directly
highScore             dc    c'000000'
score                 dc    c'000000'

                      end

