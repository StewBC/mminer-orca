;-----------------------------------------------------------------------------
; rosprites.inc
; Part of manic miner, the zx spectrum game, made for Apple II
;
; Stefan Wessels, 2020
; This is free and unencumbered software released into the public domain.

;-----------------------------------------------------------------------------
ROSPRITES   data

;-----------------------------------------------------------------------------
; The Willy sprites and the cheat-boot are stored in white, 2bpp since they are
; not re-instanced.  They are drawn from where they reside when loaded.
; To save memory, the other sprites are stored as 1 bpp.  The single bits
; get doubled in the instance, and the high bit is set in the bytes, before color
; is applied.  The method for bit doubling is not quite a double, but a lookup
; table is used.  The "bit" format the sprites are stored in works like this: Each
; byte is composed of 2 nibbles that will each become a 7 bit byte, and the msb
; will automatically be turned on. Assume the nibbles are: abcd efgh then the
; "decompression" will make 2 bytes that will have the format 1abbccdd 1eeffggh.
; a and h together form the "split" pixel, 1 is the msb that's turned on and
; bcdefg are doubled through the 16 byte lookup table named binDouble.
sprites     anop
sprite00    anop
            dc    h'001E0000'  ; ---------XXXX--------------- = --------XXXX----------------
            dc    h'701F0000'  ; XXX------XXXXX-------------- = ----XXXXXXXX----------------
            dc    h'7C070000'  ; XXXXX------XXX-------------- = --XXXXXXXX------------------
            dc    h'30060000'  ; -XX--------XX--------------- = ----XX--XX------------------
            dc    h'701F0000'  ; XXX------XXXXX-------------- = ----XXXXXXXX----------------
            dc    h'70070000'  ; XXX--------XXX-------------- = ----XXXXXX------------------
            dc    h'40010000'  ; X------------X-------------- = ------XX--------------------
            dc    h'70070000'  ; XXX--------XXX-------------- = ----XXXXXX------------------
            dc    h'7C1F0000'  ; XXXXX----XXXXX-------------- = --XXXXXXXXXX----------------
            dc    h'7C1F0000'  ; XXXXX----XXXXX-------------- = --XXXXXXXXXX----------------
            dc    h'3F7E0000'  ; -XXXXXXXXXXXX--------------- = XXXXXX--XXXXXX--------------
            dc    h'7F790000'  ; XXXXXXXXXXX--X-------------- = XXXXXXXX--XXXX--------------
            dc    h'70070000'  ; XXX--------XXX-------------- = ----XXXXXX------------------
            dc    h'3C1E0000'  ; -XXXX----XXXX--------------- = --XXXX--XXXX----------------
            dc    h'7C1F0000'  ; XXXXX----XXXXX-------------- = --XXXXXXXXXX----------------
            dc    h'3C7E0000'  ; -XXXX--XXXXXX--------------- = --XXXX--XXXXXX--------------

sprite01    anop
            dc    h'00600300'  ; -------XX----------XX------- = ------------XXXX------------
            dc    h'007E0300'  ; -------XXXXXX------XX------- = --------XXXXXXXX------------
            dc    h'407F0000'  ; X------XXXXXXX-------------- = ------XXXXXXXX--------------
            dc    h'00660000'  ; -------XX--XX--------------- = --------XX--XX--------------
            dc    h'007E0300'  ; -------XXXXXX------XX------- = --------XXXXXXXX------------
            dc    h'007E0000'  ; -------XXXXXX--------------- = --------XXXXXX--------------
            dc    h'00180000'  ; ---------XX----------------- = ----------XX----------------
            dc    h'007E0000'  ; -------XXXXXX--------------- = --------XXXXXX--------------
            dc    h'40670300'  ; X------XX--XXX-----XX------- = ------XXXX--XXXX------------
            dc    h'40670300'  ; X------XX--XXX-----XX------- = ------XXXX--XXXX------------
            dc    h'40670300'  ; X------XX--XXX-----XX------- = ------XXXX--XXXX------------
            dc    h'407F0300'  ; X------XXXXXXX-----XX------- = ------XXXXXXXXXX------------
            dc    h'007E0000'  ; -------XXXXXX--------------- = --------XXXXXX--------------
            dc    h'00180000'  ; ---------XX----------------- = ----------XX----------------
            dc    h'00180000'  ; ---------XX----------------- = ----------XX----------------
            dc    h'00780000'  ; -------XXXX----------------- = ----------XXXX--------------


sprite02    anop
            dc    h'00003C00'  ; ---------------XXXX--------- = ----------------XXXX--------
            dc    h'00603F00'  ; -------XX------XXXXXX------- = ------------XXXXXXXX--------
            dc    h'00780F00'  ; -------XXXX------XXXX------- = ----------XXXXXXXX----------
            dc    h'00600C00'  ; -------XX--------XX--------- = ------------XX--XX----------
            dc    h'00603F00'  ; -------XX------XXXXXX------- = ------------XXXXXXXX--------
            dc    h'00600F00'  ; -------XX--------XXXX------- = ------------XXXXXX----------
            dc    h'00000300'  ; -------------------XX------- = --------------XX------------
            dc    h'00600F00'  ; -------XX--------XXXX------- = ------------XXXXXX----------
            dc    h'00783F00'  ; -------XXXX----XXXXXX------- = ----------XXXXXXXXXX--------
            dc    h'00783F00'  ; -------XXXX----XXXXXX------- = ----------XXXXXXXXXX--------
            dc    h'007E7C01'  ; -------XXXXXX-XXXXX--------X = --------XXXXXX--XXXXXX------
            dc    h'007E7301'  ; -------XXXXXX-XXX--XX------X = --------XXXXXXXX--XXXX------
            dc    h'00600F00'  ; -------XX--------XXXX------- = ------------XXXXXX----------
            dc    h'00783C00'  ; -------XXXX----XXXX--------- = ----------XXXX--XXXX--------
            dc    h'00183F00'  ; ---------XX----XXXXXX------- = ----------XX--XXXXXX--------
            dc    h'00787C01'  ; -------XXXX---XXXXX--------X = ----------XXXX--XXXXXX------

sprite03    anop
            dc    h'00004007'  ; --------------X----------XXX = --------------------XXXX----
            dc    h'00007C07'  ; --------------XXXXX------XXX = ----------------XXXXXXXX----
            dc    h'00007F01'  ; --------------XXXXXXX------X = --------------XXXXXXXX------
            dc    h'00004C01'  ; --------------X--XX--------X = ----------------XX--XX------
            dc    h'00007C07'  ; --------------XXXXX------XXX = ----------------XXXXXXXX----
            dc    h'00007C01'  ; --------------XXXXX--------X = ----------------XXXXXX------
            dc    h'00003000'  ; ---------------XX----------- = ------------------XX--------
            dc    h'00007C01'  ; --------------XXXXX--------X = ----------------XXXXXX------
            dc    h'00007F07'  ; --------------XXXXXXX----XXX = --------------XXXXXXXXXX----
            dc    h'00607F1F'  ; -------XX-----XXXXXXX--XXXXX = ------------XXXXXXXXXXXXXX--
            dc    h'00787F7F'  ; -------XXXX---XXXXXXXXXXXXXX = ----------XXXXXXXXXXXXXXXXXX
            dc    h'00787C79'  ; -------XXXX---XXXXX--XXXX--X = ----------XXXX--XXXXXX--XXXX
            dc    h'00007C07'  ; --------------XXXXX------XXX = ----------------XXXXXXXX----
            dc    h'00004F67'  ; --------------X--XXXXXX--XXX = --------------XXXX--XXXX--XX
            dc    h'0060037E'  ; -------XX----------XXXXXXXX- = ------------XXXX------XXXXXX
            dc    h'00600F18'  ; -------XX--------XXXX--XX--- = ------------XXXXXX------XX--

sprite04    anop
            dc    h'70010000'  ; XXX----------X-------------- = ----XXXX--------------------
            dc    h'701F0000'  ; XXX------XXXXX-------------- = ----XXXXXXXX----------------
            dc    h'407F0000'  ; X------XXXXXXX-------------- = ------XXXXXXXX--------------
            dc    h'40190000'  ; X--------XX--X-------------- = ------XX--XX----------------
            dc    h'701F0000'  ; XXX------XXXXX-------------- = ----XXXXXXXX----------------
            dc    h'401F0000'  ; X--------XXXXX-------------- = ------XXXXXX----------------
            dc    h'00060000'  ; -----------XX--------------- = --------XX------------------
            dc    h'401F0000'  ; X--------XXXXX-------------- = ------XXXXXX----------------
            dc    h'707F0000'  ; XXX----XXXXXXX-------------- = ----XXXXXXXXXX--------------
            dc    h'7C7F0300'  ; XXXXX--XXXXXXX-----XX------- = --XXXXXXXXXXXXXX------------
            dc    h'7F7F0F00'  ; XXXXXXXXXXXXXX---XXXX------- = XXXXXXXXXXXXXXXXXX----------
            dc    h'4F1F0F00'  ; X--XXXX--XXXXX---XXXX------- = XXXX--XXXXXX--XXXX----------
            dc    h'701F0000'  ; XXX------XXXXX-------------- = ----XXXXXXXX----------------
            dc    h'73790000'  ; XXX--XXXXXX--X-------------- = XX--XXXX--XXXX--------------
            dc    h'3F600300'  ; -XXXXXXXX----------XX------- = XXXXXX------XXXX------------
            dc    h'0C780300'  ; ---XX--XXXX--------XX------- = --XX------XXXXXX------------

sprite05    anop
            dc    h'001E0000'  ; ---------XXXX--------------- = --------XXXX----------------
            dc    h'007E0300'  ; -------XXXXXX------XX------- = --------XXXXXXXX------------
            dc    h'00780F00'  ; -------XXXX------XXXX------- = ----------XXXXXXXX----------
            dc    h'00180300'  ; ---------XX--------XX------- = ----------XX--XX------------
            dc    h'007E0300'  ; -------XXXXXX------XX------- = --------XXXXXXXX------------
            dc    h'00780300'  ; -------XXXX--------XX------- = ----------XXXXXX------------
            dc    h'00600000'  ; -------XX------------------- = ------------XX--------------
            dc    h'00780300'  ; -------XXXX--------XX------- = ----------XXXXXX------------
            dc    h'007E0F00'  ; -------XXXXXX----XXXX------- = --------XXXXXXXXXX----------
            dc    h'007E0F00'  ; -------XXXXXX----XXXX------- = --------XXXXXXXXXX----------
            dc    h'401F3F00'  ; X--------XXXXX-XXXXXX------- = ------XXXXXX--XXXXXX--------
            dc    h'40673F00'  ; X------XX--XXX-XXXXXX------- = ------XXXX--XXXXXXXX--------
            dc    h'00780300'  ; -------XXXX--------XX------- = ----------XXXXXX------------
            dc    h'001E0F00'  ; ---------XXXX----XXXX------- = --------XXXX--XXXX----------
            dc    h'007E0C00'  ; -------XXXXXX----XX--------- = --------XXXXXX--XX----------
            dc    h'401F0F00'  ; X--------XXXXX---XXXX------- = ------XXXXXX--XXXX----------

sprite06    anop
            dc    h'00600300'  ; -------XX----------XX------- = ------------XXXX------------
            dc    h'00603F00'  ; -------XX------XXXXXX------- = ------------XXXXXXXX--------
            dc    h'00007F01'  ; --------------XXXXXXX------X = --------------XXXXXXXX------
            dc    h'00003300'  ; ---------------XX--XX------- = --------------XX--XX--------
            dc    h'00603F00'  ; -------XX------XXXXXX------- = ------------XXXXXXXX--------
            dc    h'00003F00'  ; ---------------XXXXXX------- = --------------XXXXXX--------
            dc    h'00000C00'  ; -----------------XX--------- = ----------------XX----------
            dc    h'00003F00'  ; ---------------XXXXXX------- = --------------XXXXXX--------
            dc    h'00607F01'  ; -------XX-----XXXXXXX------X = ------------XXXXXXXXXX------
            dc    h'00607301'  ; -------XX-----XXX--XX------X = ------------XXXX--XXXX------
            dc    h'00607301'  ; -------XX-----XXX--XX------X = ------------XXXX--XXXX------
            dc    h'00607301'  ; -------XX-----XXX--XX------X = ------------XXXX--XXXX------
            dc    h'00003F00'  ; ---------------XXXXXX------- = --------------XXXXXX--------
            dc    h'00000C00'  ; -----------------XX--------- = ----------------XX----------
            dc    h'00000C00'  ; -----------------XX--------- = ----------------XX----------
            dc    h'00000F00'  ; -----------------XXXX------- = --------------XXXX----------

sprite07    anop
            dc    h'00003C00'  ; ---------------XXXX--------- = ----------------XXXX--------
            dc    h'00007C07'  ; --------------XXXXX------XXX = ----------------XXXXXXXX----
            dc    h'0000701F'  ; --------------XXX------XXXXX = ------------------XXXXXXXX--
            dc    h'00003006'  ; ---------------XX--------XX- = ------------------XX--XX----
            dc    h'00007C07'  ; --------------XXXXX------XXX = ----------------XXXXXXXX----
            dc    h'00007007'  ; --------------XXX--------XXX = ------------------XXXXXX----
            dc    h'00004001'  ; --------------X------------X = --------------------XX------
            dc    h'00007007'  ; --------------XXX--------XXX = ------------------XXXXXX----
            dc    h'00007C1F'  ; --------------XXXXX----XXXXX = ----------------XXXXXXXXXX--
            dc    h'00007C1F'  ; --------------XXXXX----XXXXX = ----------------XXXXXXXXXX--
            dc    h'00003F7E'  ; ---------------XXXXXXXXXXXX- = --------------XXXXXX--XXXXXX
            dc    h'00004F7F'  ; --------------X--XXXXXXXXXXX = --------------XXXX--XXXXXXXX
            dc    h'00007007'  ; --------------XXX--------XXX = ------------------XXXXXX----
            dc    h'00003C1E'  ; ---------------XXXX----XXXX- = ----------------XXXX--XXXX--
            dc    h'00007C19'  ; --------------XXXXX----XX--X = ----------------XXXXXX--XX--
            dc    h'00003F1E'  ; ---------------XXXXXX--XXXX- = --------------XXXXXX--XXXX--

sprite08    anop
            dc    h'8F91'     ; X---XXXXX--X---X = ------XXXXXXXXXX----XX------
            dc    h'C3F1'     ; XX----XXXXXX---X = ----XXXXXX----XXXXXXXX------
            dc    h'83F1'     ; X-----XXXXXX---X = ------XXXX----XXXXXXXX------
            dc    h'0E91'     ; ----XXX-X--X---X = --------XXXXXXXX----XX------
            dc    h'9F10'     ; X--XXXXX---X---- = XX----XXXXXXXXXX------------
            dc    h'AF30'     ; X-X-XXXX--XX---- = --XX--XXXXXXXXXXXX----------
            dc    h'FF70'     ; XXXXXXXX-XXX---- = XXXXXXXXXXXXXXXXXXXX--------
            dc    h'AF00'     ; X-X-XXXX-------- = --XX--XXXXXXXX--------------
            dc    h'9F70'     ; X--XXXXX-XXX---- = XX----XXXXXXXXXXXXXX--------
            dc    h'8F30'     ; X---XXXX--XX---- = ------XXXXXXXXXXXX----------
            dc    h'0E00'     ; ----XXX--------- = --------XXXXXX--------------
            dc    h'8F10'     ; X---XXXX---X---- = ------XXXXXXXXXX------------
            dc    h'DBB1'     ; XX-XX-XXX-XX---X = XX--XXXXXX--XXXXXX--XX------
            dc    h'E170'     ; XXX----X-XXX---- = --XXXXXX------XXXXXX--------
            dc    h'4020'     ; -X--------X----- = ----XX----------XX----------
            dc    h'8110'     ; X------X---X---- = ------XX------XX------------

sprite09    anop
            dc    h'0E34'     ; ----XXX---XX-X-- = --------XXXXXXXXXX------XX--
            dc    h'87E7'     ; X----XXXXXX--XXX = ------XXXXXX----XXXXXXXXXX--
            dc    h'06E7'     ; -----XX-XXX--XXX = --------XXXX----XXXXXXXXXX--
            dc    h'2C34'     ; --X-XX----XX-X-- = --XX------XXXXXXXX------XX--
            dc    h'4E30'     ; -X--XXX---XX---- = ----XX--XXXXXXXXXX----------
            dc    h'4E70'     ; -X--XXX--XXX---- = ----XX--XXXXXXXXXXXX--------
            dc    h'EFF1'     ; XXX-XXXXXXXX---X = --XXXXXXXXXXXXXXXXXXXX------
            dc    h'4EF1'     ; -X--XXX-XXXX---X = ----XX--XXXXXXXXXXXXXX------
            dc    h'4EF1'     ; -X--XXX-XXXX---X = ----XX--XXXXXXXXXXXXXX------
            dc    h'2E70'     ; --X-XXX--XXX---- = --XX----XXXXXXXXXXXX--------
            dc    h'0C10'     ; ----XX-----X---- = ----------XXXXXX------------
            dc    h'0C10'     ; ----XX-----X---- = ----------XXXXXX------------
            dc    h'0630'     ; -----XX---XX---- = --------XXXX--XXXX----------
            dc    h'0630'     ; -----XX---XX---- = --------XXXX--XXXX----------
            dc    h'C3E1'     ; XX----XXXXX----X = ----XXXXXX------XXXXXX------
            dc    h'0630'     ; -----XX---XX---- = --------XXXX--XXXX----------

sprite0A    anop
            dc    h'08F9'     ; ----X---XXXXX--X = ------------XXXXXXXXXX----XX
            dc    h'0C9F'     ; ----XX--X--XXXXX = ----------XXXXXX----XXXXXXXX
            dc    h'089F'     ; ----X---X--XXXXX = ------------XXXX----XXXXXXXX
            dc    h'00F9'     ; --------XXXXX--X = --------------XXXXXXXX----XX
            dc    h'89F1'     ; X---X--XXXXX---X = ------XX----XXXXXXXXXX------
            dc    h'0AF3'     ; ----X-X-XXXX--XX = --------XX--XXXXXXXXXXXX----
            dc    h'8FF7'     ; X---XXXXXXXX-XXX = ------XXXXXXXXXXXXXXXXXXXX--
            dc    h'0A70'     ; ----X-X--XXX---- = --------XX--XXXXXXXX--------
            dc    h'89F7'     ; X---X--XXXXX-XXX = ------XX----XXXXXXXXXXXXXX--
            dc    h'08F3'     ; ----X---XXXX--XX = ------------XXXXXXXXXXXX----
            dc    h'0070'     ; ---------XXX---- = --------------XXXXXX--------
            dc    h'0070'     ; ---------XXX---- = --------------XXXXXX--------
            dc    h'0070'     ; ---------XXX---- = --------------XXXXXX--------
            dc    h'0070'     ; ---------XXX---- = --------------XXXXXX--------
            dc    h'0070'     ; ---------XXX---- = --------------XXXXXX--------
            dc    h'08F1'     ; ----X---XXXX---X = ------------XXXXXXXXXX------

sprite0B    anop
            dc    h'00FB'     ; --------XXXXX-XX = --------------XXXXXXXXXX--XX
            dc    h'083E'     ; ----X-----XXXXX- = ------------XXXXXX----XXXXXX
            dc    h'003E'     ; ----------XXXXX- = --------------XXXX----XXXXXX
            dc    h'00EB'     ; --------XXX-X-XX = ----------------XXXXXXXX--XX
            dc    h'00F3'     ; --------XXXX--XX = --------------XXXXXXXXXX----
            dc    h'00FF'     ; --------XXXXXXXX = --------------XXXXXXXXXXXXXX
            dc    h'0EF3'     ; ----XXX-XXXX--XX = --------XXXXXXXXXXXXXXXX----
            dc    h'00F1'     ; --------XXXX---X = --------------XXXXXXXX------
            dc    h'00F3'     ; --------XXXX--XX = --------------XXXXXXXXXX----
            dc    h'00FF'     ; --------XXXXXXXX = --------------XXXXXXXXXXXXXX
            dc    h'00E1'     ; --------XXX----X = ----------------XXXXXX------
            dc    h'00E1'     ; --------XXX----X = ----------------XXXXXX------
            dc    h'00B3'     ; --------X-XX--XX = --------------XXXX--XXXX----
            dc    h'00B3'     ; --------X-XX--XX = --------------XXXX--XXXX----
            dc    h'0C1E'     ; ----XX-----XXXX- = ----------XXXXXX------XXXXXX
            dc    h'00B3'     ; --------X-XX--XX = --------------XXXX--XXXX----

sprite0C    anop
            dc    h'DF00'     ; XX-XXXXX-------- = XX--XXXXXXXXXX--------------
            dc    h'7C10'     ; -XXXXX-----X---- = XXXXXX----XXXXXX------------
            dc    h'7C00'     ; -XXXXX---------- = XXXXXX----XXXX--------------
            dc    h'D700'     ; XX-X-XXX-------- = XX--XXXXXXXX----------------
            dc    h'CF00'     ; XX--XXXX-------- = ----XXXXXXXXXX--------------
            dc    h'FF00'     ; XXXXXXXX-------- = XXXXXXXXXXXXXX--------------
            dc    h'CF70'     ; XX--XXXX-XXX---- = ----XXXXXXXXXXXXXXXX--------
            dc    h'8F00'     ; X---XXXX-------- = ------XXXXXXXX--------------
            dc    h'CF00'     ; XX--XXXX-------- = ----XXXXXXXXXX--------------
            dc    h'FF00'     ; XXXXXXXX-------- = XXXXXXXXXXXXXX--------------
            dc    h'8700'     ; X----XXX-------- = ------XXXXXX----------------
            dc    h'8700'     ; X----XXX-------- = ------XXXXXX----------------
            dc    h'CD00'     ; XX--XX-X-------- = ----XXXX--XXXX--------------
            dc    h'CD00'     ; XX--XX-X-------- = ----XXXX--XXXX--------------
            dc    h'7830'     ; -XXXX-----XX---- = XXXXXX------XXXXXX----------
            dc    h'CD00'     ; XX--XX-X-------- = ----XXXX--XXXX--------------

sprite0D    anop
            dc    h'9F10'     ; X--XXXXX---X---- = XX----XXXXXXXXXX------------
            dc    h'F930'     ; XXXXX--X--XX---- = XXXXXXXX----XXXXXX----------
            dc    h'F910'     ; XXXXX--X---X---- = XXXXXXXX----XXXX------------
            dc    h'9F00'     ; X--XXXXX-------- = XX----XXXXXXXX--------------
            dc    h'8F91'     ; X---XXXXX--X---X = ------XXXXXXXXXX----XX------
            dc    h'CF50'     ; XX--XXXX-X-X---- = ----XXXXXXXXXXXX--XX--------
            dc    h'EFF1'     ; XXX-XXXXXXXX---X = --XXXXXXXXXXXXXXXXXXXX------
            dc    h'0E50'     ; ----XXX--X-X---- = --------XXXXXXXX--XX--------
            dc    h'EF91'     ; XXX-XXXXX--X---X = --XXXXXXXXXXXXXX----XX------
            dc    h'CF10'     ; XX--XXXX---X---- = ----XXXXXXXXXXXX------------
            dc    h'0E00'     ; ----XXX--------- = --------XXXXXX--------------
            dc    h'0E00'     ; ----XXX--------- = --------XXXXXX--------------
            dc    h'0E00'     ; ----XXX--------- = --------XXXXXX--------------
            dc    h'0E00'     ; ----XXX--------- = --------XXXXXX--------------
            dc    h'0E00'     ; ----XXX--------- = --------XXXXXX--------------
            dc    h'8F10'     ; X---XXXX---X---- = ------XXXXXXXXXX------------

sprite0E    anop
            dc    h'2C70'     ; --X-XX---XXX---- = --XX------XXXXXXXXXX--------
            dc    h'E7E1'     ; XXX--XXXXXX----X = --XXXXXXXXXX----XXXXXX------
            dc    h'E760'     ; XXX--XXX-XX----- = --XXXXXXXXXX----XXXX--------
            dc    h'2C34'     ; --X-XX----XX-X-- = --XX------XXXXXXXX------XX--
            dc    h'0C72'     ; ----XX---XXX--X- = ----------XXXXXXXXXX--XX----
            dc    h'0E72'     ; ----XXX--XXX--X- = --------XXXXXXXXXXXX--XX----
            dc    h'8FF7'     ; X---XXXXXXXX-XXX = ------XXXXXXXXXXXXXXXXXXXX--
            dc    h'8F72'     ; X---XXXX-XXX--X- = ------XXXXXXXXXXXXXX--XX----
            dc    h'8F72'     ; X---XXXX-XXX--X- = ------XXXXXXXXXXXXXX--XX----
            dc    h'0E74'     ; ----XXX--XXX-X-- = --------XXXXXXXXXXXX----XX--
            dc    h'0830'     ; ----X-----XX---- = ------------XXXXXX----------
            dc    h'0830'     ; ----X-----XX---- = ------------XXXXXX----------
            dc    h'0C60'     ; ----XX---XX----- = ----------XXXX--XXXX--------
            dc    h'0C60'     ; ----XX---XX----- = ----------XXXX--XXXX--------
            dc    h'87C3'     ; X----XXXXX----XX = ------XXXXXX------XXXXXX----
            dc    h'0C60'     ; ----XX---XX----- = ----------XXXX--XXXX--------

sprite0F    anop
            dc    h'89F1'     ; X---X--XXXXX---X = ------XX----XXXXXXXXXX------
            dc    h'8FC3'     ; X---XXXXXX----XX = ------XXXXXXXX----XXXXXX----
            dc    h'8FC1'     ; X---XXXXXX-----X = ------XXXXXXXX----XXXX------
            dc    h'8970'     ; X---X--X-XXX---- = ------XX----XXXXXXXX--------
            dc    h'08F9'     ; ----X---XXXXX--X = ------------XXXXXXXXXX----XX
            dc    h'0CF5'     ; ----XX--XXXX-X-X = ----------XXXXXXXXXXXX--XX--
            dc    h'0EFF'     ; ----XXX-XXXXXXXX = --------XXXXXXXXXXXXXXXXXXXX
            dc    h'00F5'     ; --------XXXX-X-X = --------------XXXXXXXX--XX--
            dc    h'0EF9'     ; ----XXX-XXXXX--X = --------XXXXXXXXXXXXXX----XX
            dc    h'0CF1'     ; ----XX--XXXX---X = ----------XXXXXXXXXXXX------
            dc    h'0070'     ; ---------XXX---- = --------------XXXXXX--------
            dc    h'08F1'     ; ----X---XXXX---X = ------------XXXXXXXXXX------
            dc    h'8DDB'     ; X---XX-XXX-XX-XX = ------XX--XXXXXX--XXXXXX--XX
            dc    h'0E87'     ; ----XXX-X----XXX = --------XXXXXX------XXXXXX--
            dc    h'0402'     ; -----X--------X- = ----------XX----------XX----
            dc    h'0881'     ; ----X---X------X = ------------XX------XX------

sprite10    anop
            dc    h'FFFF'     ; XXXXXXXXXXXXXX = XXXXXXXXXXXXXXXXXXXXXXXXXXXX
            dc    h'E997'     ; XX-X--X--X-XXX = --XXXXXX----XXXX----XXXXXX--
            dc    h'1A58'     ; --XX-X-X-XX--- = XX------XX--XXXX--XX------XX
            dc    h'5A5A'     ; X-XX-X-X-XX-X- = XX--XX--XX--XXXX--XX--XX--XX
            dc    h'2A54'     ; -X-X-X-X-X-X-- = --XX----XX--XXXX--XX----XX--
            dc    h'8991'     ; ---X--X--X---X = ------XX----XXXX----XX------
            dc    h'4812'     ; X--X-----X--X- = ----XX------XXXX------XX----
            dc    h'4A52'     ; X--X-X-X-X--X- = ----XX--XX--XXXX--XX--XX----
            dc    h'4A52'     ; X--X-X-X-X--X- = ----XX--XX--XXXX--XX--XX----
            dc    h'4A52'     ; X--X-X-X-X--X- = ----XX--XX--XXXX--XX--XX----
            dc    h'4A52'     ; X--X-X-X-X--X- = ----XX--XX--XXXX--XX--XX----
            dc    h'4A52'     ; X--X-X-X-X--X- = ----XX--XX--XXXX--XX--XX----
            dc    h'4A52'     ; X--X-X-X-X--X- = ----XX--XX--XXXX--XX--XX----
            dc    h'4A52'     ; X--X-X-X-X--X- = ----XX--XX--XXXX--XX--XX----
            dc    h'4A52'     ; X--X-X-X-X--X- = ----XX--XX--XXXX--XX--XX----
            dc    h'4A52'     ; X--X-X-X-X--X- = ----XX--XX--XXXX--XX--XX----

sprite11    anop
            dc    h'0600'     ; -----XX--------- = --------XXXX----------------
            dc    h'8F00'     ; X---XXXX-------- = ------XXXXXXXX--------------
            dc    h'8B10'     ; X---X-XX---X---- = ------XXXX--XXXX------------
            dc    h'8F60'     ; X---XXXX-XX----- = ------XXXXXXXX--XXXX--------
            dc    h'C310'     ; XX----XX---X---- = ----XXXXXX----XX------------
            dc    h'C900'     ; XX--X--X-------- = ----XXXX----XX--------------
            dc    h'CB00'     ; XX--X-XX-------- = ----XXXXXX--XX--------------
            dc    h'C710'     ; XX---XXX---X---- = ----XXXXXXXX--XX------------
            dc    h'6610'     ; -XX--XX----X---- = --XXXX--XXXX--XX------------
            dc    h'6210'     ; -XX---X----X---- = --XXXX--XX----XX------------
            dc    h'6210'     ; -XX---X----X---- = --XXXX--XX----XX------------
            dc    h'6010'     ; -XX--------X---- = --XXXX--------XX------------
            dc    h'E110'     ; XXX----X---X---- = --XXXXXX------XX------------
            dc    h'DF00'     ; XX-XXXXX-------- = XX--XXXXXXXXXX--------------
            dc    h'0200'     ; ------X--------- = --------XX------------------
            dc    h'8F00'     ; X---XXXX-------- = ------XXXXXXXX--------------

sprite12    anop
            dc    h'0810'     ; ----X------X---- = ------------XXXX------------
            dc    h'0C30'     ; ----XX----XX---- = ----------XXXXXXXX----------
            dc    h'0C60'     ; ----XX---XX----- = ----------XXXX--XXXX--------
            dc    h'0CB3'     ; ----XX--X-XX--XX = ----------XXXXXXXX--XXXX----
            dc    h'0E40'     ; ----XXX--X------ = --------XXXXXX----XX--------
            dc    h'0620'     ; -----XX---X----- = --------XXXX----XX----------
            dc    h'0E30'     ; ----XXX---XX---- = --------XXXXXXXXXX----------
            dc    h'0670'     ; -----XX--XXX---- = --------XXXX--XXXXXX--------
            dc    h'8B50'     ; X---X-XX-X-X---- = ------XXXX--XXXX--XX--------
            dc    h'8B50'     ; X---X-XX-X-X---- = ------XXXX--XXXX--XX--------
            dc    h'8D40'     ; X---XX-X-X------ = ------XX--XXXX----XX--------
            dc    h'8340'     ; X-----XX-X------ = ------XXXX--------XX--------
            dc    h'8740'     ; X----XXX-X------ = ------XXXXXX------XX--------
            dc    h'4E30'     ; -X--XXX---XX---- = ----XX--XXXXXXXXXX----------
            dc    h'0450'     ; -----X---X-X---- = ----------XX--XX--XX--------
            dc    h'0E30'     ; ----XXX---XX---- = --------XXXXXXXXXX----------

sprite13    anop
            dc    h'0030'     ; ----------XX---- = --------------XXXX----------
            dc    h'0870'     ; ----X----XXX---- = ------------XXXXXXXX--------
            dc    h'08D1'     ; ----X---XX-X---X = ------------XXXX--XXXX------
            dc    h'0876'     ; ----X----XXX-XX- = ------------XXXXXXXX--XXXX--
            dc    h'0C91'     ; ----XX--X--X---X = ----------XXXXXX----XX------
            dc    h'0C40'     ; ----XX---X------ = ----------XXXX----XX--------
            dc    h'0C50'     ; ----XX---X-X---- = ----------XXXXXX--XX--------
            dc    h'0CB1'     ; ----XX--X-XX---X = ----------XXXXXXXX--XX------
            dc    h'06B1'     ; -----XX-X-XX---X = --------XXXX--XXXX--XX------
            dc    h'0691'     ; -----XX-X--X---X = --------XXXX--XX----XX------
            dc    h'0691'     ; -----XX-X--X---X = --------XXXX--XX----XX------
            dc    h'0681'     ; -----XX-X------X = --------XXXX--------XX------
            dc    h'0E81'     ; ----XXX-X------X = --------XXXXXX------XX------
            dc    h'8D72'     ; X---XX-X-XXX--X- = ------XX--XXXXXXXXXX--XX----
            dc    h'04A1'     ; -----X--X-X----X = ----------XX----XX--XX------
            dc    h'0E70'     ; ----XXX--XXX---- = --------XXXXXXXXXXXX--------

sprite14    anop
            dc    h'0060'     ; ---------XX----- = ----------------XXXX--------
            dc    h'00F1'     ; --------XXXX---X = --------------XXXXXXXX------
            dc    h'00B3'     ; --------X-XX--XX = --------------XXXX--XXXX----
            dc    h'00FD'     ; --------XXXXXX-X = --------------XXXXXXXX--XXXX
            dc    h'0832'     ; ----X-----XX--X- = ------------XXXXXX----XX----
            dc    h'0891'     ; ----X---X--X---X = ------------XXXX----XX------
            dc    h'08B1'     ; ----X---X-XX---X = ------------XXXXXX--XX------
            dc    h'0872'     ; ----X----XXX--X- = ------------XXXXXXXX--XX----
            dc    h'0C62'     ; ----XX---XX---X- = ----------XXXX--XXXX--XX----
            dc    h'0C42'     ; ----XX---X----X- = ----------XXXX----XX--XX----
            dc    h'0C42'     ; ----XX---X----X- = ----------XXXX----XX--XX----
            dc    h'0C02'     ; ----XX--------X- = ----------XXXX--------XX----
            dc    h'0C12'     ; ----XX-----X--X- = ----------XXXXXX------XX----
            dc    h'0AF1'     ; ----X-X-XXXX---X = --------XX--XXXXXXXXXX------
            dc    h'0052'     ; ---------X-X--X- = --------------XX--XX--XX----
            dc    h'08F1'     ; ----X---XXXX---X = ------------XXXXXXXXXX------

sprite15    anop
            dc    h'0600'     ; -----XX--------- = --------XXXX----------------
            dc    h'8F00'     ; X---XXXX-------- = ------XXXXXXXX--------------
            dc    h'CD00'     ; XX--XX-X-------- = ----XXXX--XXXX--------------
            dc    h'BF00'     ; X-XXXXXX-------- = XXXX--XXXXXXXX--------------
            dc    h'4C10'     ; -X--XX-----X---- = ----XX----XXXXXX------------
            dc    h'8910'     ; X---X--X---X---- = ------XX----XXXX------------
            dc    h'8D10'     ; X---XX-X---X---- = ------XX--XXXXXX------------
            dc    h'4E10'     ; -X--XXX----X---- = ----XX--XXXXXXXX------------
            dc    h'4630'     ; -X---XX---XX---- = ----XX--XXXX--XXXX----------
            dc    h'4230'     ; -X----X---XX---- = ----XX--XX----XXXX----------
            dc    h'4230'     ; -X----X---XX---- = ----XX--XX----XXXX----------
            dc    h'4030'     ; -X--------XX---- = ----XX--------XXXX----------
            dc    h'4830'     ; -X--X-----XX---- = ----XX------XXXXXX----------
            dc    h'8F50'     ; X---XXXX-X-X---- = ------XXXXXXXXXX--XX--------
            dc    h'4A00'     ; -X--X-X--------- = ----XX--XX--XX--------------
            dc    h'8F10'     ; X---XXXX---X---- = ------XXXXXXXXXX------------

sprite16    anop
            dc    h'0C00'     ; ----XX---------- = ----------XXXX--------------
            dc    h'0E10'     ; ----XXX----X---- = --------XXXXXXXX------------
            dc    h'8B10'     ; X---X-XX---X---- = ------XXXX--XXXX------------
            dc    h'6E10'     ; -XX-XXX----X---- = --XXXX--XXXXXXXX------------
            dc    h'8930'     ; X---X--X--XX---- = ------XX----XXXXXX----------
            dc    h'0230'     ; ------X---XX---- = --------XX----XXXX----------
            dc    h'0A30'     ; ----X-X---XX---- = --------XX--XXXXXX----------
            dc    h'8D30'     ; X---XX-X--XX---- = ------XX--XXXXXXXX----------
            dc    h'8D60'     ; X---XX-X-XX----- = ------XX--XXXX--XXXX--------
            dc    h'8960'     ; X---X--X-XX----- = ------XX----XX--XXXX--------
            dc    h'8960'     ; X---X--X-XX----- = ------XX----XX--XXXX--------
            dc    h'8160'     ; X------X-XX----- = ------XX--------XXXX--------
            dc    h'8170'     ; X------X-XXX---- = ------XX------XXXXXX--------
            dc    h'4EB1'     ; -X--XXX-X-XX---X = ----XX--XXXXXXXXXX--XX------
            dc    h'8520'     ; X----X-X--X----- = ------XX--XX----XX----------
            dc    h'0E70'     ; ----XXX--XXX---- = --------XXXXXXXXXXXX--------

sprite17    anop
            dc    h'0810'     ; ----X------X---- = ------------XXXX------------
            dc    h'0C30'     ; ----XX----XX---- = ----------XXXXXXXX----------
            dc    h'0630'     ; -----XX---XX---- = --------XXXX--XXXX----------
            dc    h'CD30'     ; XX--XX-X--XX---- = ----XXXX--XXXXXXXX----------
            dc    h'0270'     ; ------X--XXX---- = --------XX----XXXXXX--------
            dc    h'0460'     ; -----X---XX----- = ----------XX----XXXX--------
            dc    h'0C70'     ; ----XX---XXX---- = ----------XXXXXXXXXX--------
            dc    h'0E60'     ; ----XXX--XX----- = --------XXXXXX--XXXX--------
            dc    h'0AD1'     ; ----X-X-XX-X---X = --------XX--XXXX--XXXX------
            dc    h'0AD1'     ; ----X-X-XX-X---X = --------XX--XXXX--XXXX------
            dc    h'02B1'     ; ------X-X-XX---X = --------XX----XXXX--XX------
            dc    h'02C1'     ; ------X-XX-----X = --------XX--------XXXX------
            dc    h'02E1'     ; ------X-XXX----X = --------XX------XXXXXX------
            dc    h'0C72'     ; ----XX---XXX--X- = ----------XXXXXXXXXX--XX----
            dc    h'0A20'     ; ----X-X---X----- = --------XX--XX--XX----------
            dc    h'0C70'     ; ----XX---XXX---- = ----------XXXXXXXXXX--------

sprite18    anop
            dc    h'0060'     ; ---------XX----- = ----------------XXXX--------
            dc    h'00F1'     ; --------XXXX---X = --------------XXXXXXXX------
            dc    h'08D1'     ; ----X---XX-X---X = ------------XXXX--XXXX------
            dc    h'06F1'     ; -----XX-XXXX---X = --------XXXX--XXXXXXXX------
            dc    h'08C3'     ; ----X---XX----XX = ------------XX----XXXXXX----
            dc    h'0093'     ; --------X--X--XX = --------------XX----XXXX----
            dc    h'00D3'     ; --------XX-X--XX = --------------XX--XXXXXX----
            dc    h'08E3'     ; ----X---XXX---XX = ------------XX--XXXXXXXX----
            dc    h'0866'     ; ----X----XX--XX- = ------------XX--XXXX--XXXX--
            dc    h'0846'     ; ----X----X---XX- = ------------XX----XX--XXXX--
            dc    h'0846'     ; ----X----X---XX- = ------------XX----XX--XXXX--
            dc    h'0806'     ; ----X--------XX- = ------------XX--------XXXX--
            dc    h'0887'     ; ----X---X----XXX = ------------XX------XXXXXX--
            dc    h'00FB'     ; --------XXXXX-XX = --------------XXXXXXXXXX--XX
            dc    h'0040'     ; ---------X------ = ------------------XX--------
            dc    h'00F1'     ; --------XXXX---X = --------------XXXXXXXX------

sprite19    anop
            dc    h'4A60'     ; -X--X-X--XX----- = ----XX--XX--XX--XXXX--------
            dc    h'C550'     ; XX---X-X-X-X---- = ----XXXX--XX--XX--XX--------
            dc    h'CF70'     ; XX--XXXX-XXX---- = ----XXXXXXXXXXXXXXXX--------
            dc    h'0600'     ; -----XX--------- = --------XXXX----------------
            dc    h'0600'     ; -----XX--------- = --------XXXX----------------
            dc    h'8F00'     ; X---XXXX-------- = ------XXXXXXXX--------------
            dc    h'8900'     ; X---X--X-------- = ------XX----XX--------------
            dc    h'8900'     ; X---X--X-------- = ------XX----XX--------------
            dc    h'8900'     ; X---X--X-------- = ------XX----XX--------------
            dc    h'4410'     ; -X---X-----X---- = ----XX----XX--XX------------
            dc    h'48E1'     ; -X--X---XXX----X = ----XX------XX--XXXXXX------
            dc    h'A322'     ; X-X---XX--X---X- = --XX--XXXX------XX----XX----
            dc    h'2414'     ; --X--X-----X-X-- = --XX------XX--XX--------XX--
            dc    h'2404'     ; --X--X-------X-- = --XX------XX------------XX--
            dc    h'2404'     ; --X--X-------X-- = --XX------XX------------XX--
            dc    h'FFFF'     ; XXXXXXXXXXXXXXXX = XXXXXXXXXXXXXXXXXXXXXXXXXXXX

sprite1A    anop
            dc    h'0810'     ; ----X------X---- = ------------XXXX------------
            dc    h'0C20'     ; ----XX----X----- = ----------XXXX--XX----------
            dc    h'0C70'     ; ----XX---XXX---- = ----------XXXXXXXXXX--------
            dc    h'0810'     ; ----X------X---- = ------------XXXX------------
            dc    h'0030'     ; ----------XX---- = --------------XXXX----------
            dc    h'0060'     ; ---------XX----- = ----------------XXXX--------
            dc    h'DF60'     ; XX-XXXXX-XX----- = XX--XXXXXXXXXX--XXXX--------
            dc    h'7830'     ; -XXXX-----XX---- = XXXXXX------XXXXXX----------
            dc    h'2010'     ; --X--------X---- = --XX----------XX------------
            dc    h'5A10'     ; -X-XX-X----X---- = XX--XX--XX--XXXX------------
            dc    h'EF10'     ; XXX-XXXX---X---- = --XXXXXXXXXXXXXX------------
            dc    h'CF00'     ; XX--XXXX-------- = ----XXXXXXXXXX--------------
            dc    h'0200'     ; ------X--------- = --------XX------------------
            dc    h'0200'     ; ------X--------- = --------XX------------------
            dc    h'0200'     ; ------X--------- = --------XX------------------
            dc    h'8500'     ; X----X-X-------- = ------XX--XX----------------

sprite1B    anop
            dc    h'0060'     ; ---------XX----- = ----------------XXXX--------
            dc    h'00B1'     ; --------X-XX---X = --------------XXXX--XX------
            dc    h'00F3'     ; --------XXXX--XX = --------------XXXXXXXXXX----
            dc    h'0060'     ; ---------XX----- = ----------------XXXX--------
            dc    h'00C1'     ; --------XX-----X = ------------------XXXX------
            dc    h'0083'     ; --------X-----XX = --------------------XXXX----
            dc    h'4EB3'     ; -X--XXX-X-XX--XX = ----XX--XXXXXXXXXX--XXXX----
            dc    h'C3E1'     ; XX----XXXXX----X = ----XXXXXX------XXXXXX------
            dc    h'8360'     ; X-----XX-XX----- = ------XXXX------XXXX--------
            dc    h'C160'     ; XX-----X-XX----- = ----XXXX--------XXXX--------
            dc    h'8570'     ; X----X-X-XXX---- = ------XX--XX--XXXXXX--------
            dc    h'0A20'     ; ----X-X---X----- = --------XX--XX--XX----------
            dc    h'8510'     ; X----X-X---X---- = ------XX--XX--XX------------
            dc    h'0800'     ; ----X----------- = ------------XX--------------
            dc    h'0410'     ; -----X-----X---- = ----------XX--XX------------
            dc    h'0000'     ; ---------------- = ----------------------------

sprite1C    anop
            dc    h'00C1'     ; --------XX-----X = ------------------XXXX------
            dc    h'0062'     ; ---------XX---X- = ----------------XXXX--XX----
            dc    h'00E7'     ; --------XXX--XXX = ----------------XXXXXXXXXX--
            dc    h'00C1'     ; --------XX-----X = ------------------XXXX------
            dc    h'0083'     ; --------X-----XX = --------------------XXXX----
            dc    h'0006'     ; -------------XX- = ----------------------XXXX--
            dc    h'8D76'     ; X---XX-X-XXX-XX- = ------XX--XXXXXXXXXX--XXXX--
            dc    h'87C3'     ; X----XXXXX----XX = ------XXXXXX------XXXXXX----
            dc    h'0281'     ; ------X-X------X = --------XX----------XX------
            dc    h'85D1'     ; X----X-XXX-X---X = ------XX--XX--XX--XXXX------
            dc    h'0EF1'     ; ----XXX-XXXX---X = --------XXXXXXXXXXXXXX------
            dc    h'0C70'     ; ----XX---XXX---- = ----------XXXXXXXXXX--------
            dc    h'0010'     ; -----------X---- = --------------XX------------
            dc    h'0820'     ; ----X-----X----- = ------------XX--XX----------
            dc    h'0000'     ; ---------------- = ----------------------------
            dc    h'0000'     ; ---------------- = ----------------------------

sprite1D    anop
            dc    h'0083'     ; --------X-----XX = --------------------XXXX----
            dc    h'00C5'     ; --------XX---X-X = ------------------XXXX--XX--
            dc    h'00CF'     ; --------XX--XXXX = ------------------XXXXXXXXXX
            dc    h'08A3'     ; ----X---X-X---XX = ------------XX--XX--XXXX----
            dc    h'0456'     ; -----X---X-X-XX- = ----------XX--XX--XX--XXXX--
            dc    h'08AD'     ; ----X---X-X-XX-X = ------------XX--XX--XX--XXXX
            dc    h'06DD'     ; -----XX-XX-XXX-X = --------XXXX--XX--XXXX--XXXX
            dc    h'0E06'     ; ----XXX------XX- = --------XXXXXX--------XXXX--
            dc    h'0483'     ; -----X--X-----XX = ----------XX--------XXXX----
            dc    h'0EF3'     ; ----XXX-XXXX--XX = --------XXXXXXXXXXXXXXXX----
            dc    h'0CF3'     ; ----XX--XXXX--XX = ----------XXXXXXXXXXXXXX----
            dc    h'08F1'     ; ----X---XXXX---X = ------------XXXXXXXXXX------
            dc    h'0020'     ; ----------X----- = ----------------XX----------
            dc    h'0020'     ; ----------X----- = ----------------XX----------
            dc    h'0050'     ; ---------X-X---- = --------------XX--XX--------
            dc    h'0000'     ; ---------------- = ----------------------------

sprite1E    anop
            dc    h'C100'     ; XX-----X-------- = ----XXXX--------------------
            dc    h'A300'     ; X-X---XX-------- = --XX--XXXX------------------
            dc    h'F300'     ; XXXX--XX-------- = XXXXXXXXXX------------------
            dc    h'C510'     ; XX---X-X---X---- = ----XXXX--XX--XX------------
            dc    h'6A20'     ; -XX-X-X---X----- = --XXXX--XX--XX--XX----------
            dc    h'B510'     ; X-XX-X-X---X---- = XXXX--XX--XX--XX------------
            dc    h'BB60'     ; X-XXX-XX-XX----- = XXXX--XXXX--XX--XXXX--------
            dc    h'6070'     ; -XX------XXX---- = --XXXX--------XXXXXX--------
            dc    h'C120'     ; XX-----X--X----- = ----XXXX--------XX----------
            dc    h'CF70'     ; XX--XXXX-XXX---- = ----XXXXXXXXXXXXXXXX--------
            dc    h'CF30'     ; XX--XXXX--XX---- = ----XXXXXXXXXXXXXX----------
            dc    h'8F10'     ; X---XXXX---X---- = ------XXXXXXXXXX------------
            dc    h'0400'     ; -----X---------- = ----------XX----------------
            dc    h'0400'     ; -----X---------- = ----------XX----------------
            dc    h'0A00'     ; ----X-X--------- = --------XX--XX--------------
            dc    h'0000'     ; ---------------- = ----------------------------

sprite1F    anop
            dc    h'8300'     ; X-----XX-------- = ------XXXX------------------
            dc    h'4600'     ; -X---XX--------- = ----XX--XXXX----------------
            dc    h'E700'     ; XXX--XXX-------- = --XXXXXXXXXX----------------
            dc    h'8300'     ; X-----XX-------- = ------XXXX------------------
            dc    h'C100'     ; XX-----X-------- = ----XXXX--------------------
            dc    h'6000'     ; -XX------------- = --XXXX----------------------
            dc    h'6EB1'     ; -XX-XXX-X-XX---X = --XXXX--XXXXXXXXXX--XX------
            dc    h'C3E1'     ; XX----XXXXX----X = ----XXXXXX------XXXXXX------
            dc    h'8140'     ; X------X-X------ = ------XX----------XX--------
            dc    h'8BA1'     ; X---X-XXX-X----X = ------XXXX--XX--XX--XX------
            dc    h'8F70'     ; X---XXXX-XXX---- = ------XXXXXXXXXXXXXX--------
            dc    h'0E30'     ; ----XXX---XX---- = --------XXXXXXXXXX----------
            dc    h'0800'     ; ----X----------- = ------------XX--------------
            dc    h'0410'     ; -----X-----X---- = ----------XX--XX------------
            dc    h'0000'     ; ---------------- = ----------------------------
            dc    h'0000'     ; ---------------- = ----------------------------

sprite20    anop
            dc    h'0600'     ; -----XX--------- = --------XXXX----------------
            dc    h'8D00'     ; X---XX-X-------- = ------XX--XXXX--------------
            dc    h'CF00'     ; XX--XXXX-------- = ----XXXXXXXXXX--------------
            dc    h'0600'     ; -----XX--------- = --------XXXX----------------
            dc    h'8300'     ; X-----XX-------- = ------XXXX------------------
            dc    h'C100'     ; XX-----X-------- = ----XXXX--------------------
            dc    h'CD72'     ; XX--XX-X-XXX--X- = ----XXXX--XXXXXXXXXX--XX----
            dc    h'87C3'     ; X----XXXXX----XX = ------XXXXXX------XXXXXX----
            dc    h'06C1'     ; -----XX-XX-----X = --------XXXX------XXXX------
            dc    h'0683'     ; -----XX-X-----XX = --------XXXX--------XXXX----
            dc    h'0EA1'     ; ----XXX-X-X----X = --------XXXXXX--XX--XX------
            dc    h'0450'     ; -----X---X-X---- = ----------XX--XX--XX--------
            dc    h'08A1'     ; ----X---X-X----X = ------------XX--XX--XX------
            dc    h'0010'     ; -----------X---- = --------------XX------------
            dc    h'0820'     ; ----X-----X----- = ------------XX--XX----------
            dc    h'0000'     ; ---------------- = ----------------------------

sprite21    anop
            dc    h'0810'     ; ----X------X---- = ------------XXXX------------
            dc    h'0430'     ; -----X----XX---- = ----------XX--XXXX----------
            dc    h'0E30'     ; ----XXX---XX---- = --------XXXXXXXXXX----------
            dc    h'0810'     ; ----X------X---- = ------------XXXX------------
            dc    h'0C00'     ; ----XX---------- = ----------XXXX--------------
            dc    h'0600'     ; -----XX--------- = --------XXXX----------------
            dc    h'06FB'     ; -----XX-XXXXX-XX = --------XXXX--XXXXXXXXXX--XX
            dc    h'0C1E'     ; ----XX-----XXXX- = ----------XXXXXX------XXXXXX
            dc    h'0804'     ; ----X--------X-- = ------------XX----------XX--
            dc    h'085A'     ; ----X----X-XX-X- = ------------XXXX--XX--XX--XX
            dc    h'08F7'     ; ----X---XXXX-XXX = ------------XXXXXXXXXXXXXX--
            dc    h'00F3'     ; --------XXXX--XX = --------------XXXXXXXXXX----
            dc    h'0040'     ; ---------X------ = ------------------XX--------
            dc    h'0040'     ; ---------X------ = ------------------XX--------
            dc    h'0040'     ; ---------X------ = ------------------XX--------
            dc    h'00A1'     ; --------X-X----X = ----------------XX--XX------

sprite22    anop
            dc    h'0C10'     ; ----XX-----X---- = ----------XXXXXX------------
            dc    h'0A30'     ; ----X-X---XX---- = --------XX--XXXXXX----------
            dc    h'8970'     ; X---X--X-XXX---- = ------XX----XXXXXXXX--------
            dc    h'8970'     ; X---X--X-XXX---- = ------XX----XXXXXXXX--------
            dc    h'8970'     ; X---X--X-XXX---- = ------XX----XXXXXXXX--------
            dc    h'0A30'     ; ----X-X---XX---- = --------XX--XXXXXX----------
            dc    h'0C10'     ; ----XX-----X---- = ----------XXXXXX------------
            dc    h'0010'     ; -----------X---- = --------------XX------------
            dc    h'0C10'     ; ----XX-----X---- = ----------XXXXXX------------
            dc    h'0410'     ; -----X-----X---- = ----------XX--XX------------
            dc    h'0C10'     ; ----XX-----X---- = ----------XXXXXX------------
            dc    h'0C30'     ; ----XX----XX---- = ----------XXXXXXXX----------
            dc    h'2E30'     ; --X-XXX---XX---- = --XX----XXXXXXXXXX----------
            dc    h'AF70'     ; X-X-XXXX-XXX---- = --XX--XXXXXXXXXXXXXX--------
            dc    h'FF60'     ; XXXXXXXX-XX----- = XXXXXXXXXXXXXX--XXXX--------
            dc    h'C740'     ; XX---XXX-X------ = ----XXXXXXXX------XX--------

sprite23    anop
            dc    h'0070'     ; ---------XXX---- = --------------XXXXXX--------
            dc    h'08E1'     ; ----X---XXX----X = ------------XX--XXXXXX------
            dc    h'0472'     ; -----X---XXX--X- = ----------XX--XXXXXX--XX----
            dc    h'0472'     ; -----X---XXX--X- = ----------XX--XXXXXX--XX----
            dc    h'0472'     ; -----X---XXX--X- = ----------XX--XXXXXX--XX----
            dc    h'08E1'     ; ----X---XXX----X = ------------XX--XXXXXX------
            dc    h'0070'     ; ---------XXX---- = --------------XXXXXX--------
            dc    h'0040'     ; ---------X------ = ------------------XX--------
            dc    h'0070'     ; ---------XXX---- = --------------XXXXXX--------
            dc    h'0050'     ; ---------X-X---- = --------------XX--XX--------
            dc    h'0070'     ; ---------XXX---- = --------------XXXXXX--------
            dc    h'00F1'     ; --------XXXX---X = --------------XXXXXXXX------
            dc    h'48F1'     ; -X--X---XXXX---X = ----XX------XXXXXXXXXX------
            dc    h'4EF3'     ; -X--XXX-XXXX--XX = ----XX--XXXXXXXXXXXXXXXX----
            dc    h'EFB3'     ; XXX-XXXXX-XX--XX = --XXXXXXXXXXXXXXXX--XXXX----
            dc    h'8F12'     ; X---XXXX---X--X- = ------XXXXXXXXXX------XX----

sprite24    anop
            dc    h'00E1'     ; --------XXX----X = ----------------XXXXXX------
            dc    h'0072'     ; ---------XXX--X- = --------------XXXXXX--XX----
            dc    h'0874'     ; ----X----XXX-X-- = ------------XXXXXXXX----XX--
            dc    h'0874'     ; ----X----XXX-X-- = ------------XXXXXXXX----XX--
            dc    h'0874'     ; ----X----XXX-X-- = ------------XXXXXXXX----XX--
            dc    h'0072'     ; ---------XXX--X- = --------------XXXXXX--XX----
            dc    h'00E1'     ; --------XXX----X = ----------------XXXXXX------
            dc    h'0081'     ; --------X------X = --------------------XX------
            dc    h'00E1'     ; --------XXX----X = ----------------XXXXXX------
            dc    h'00A1'     ; --------X-X----X = ----------------XX--XX------
            dc    h'00E1'     ; --------XXX----X = ----------------XXXXXX------
            dc    h'00F3'     ; --------XXXX--XX = --------------XXXXXXXXXX----
            dc    h'28F3'     ; --X-X---XXXX--XX = --XX--------XXXXXXXXXXXX----
            dc    h'2EF7'     ; --X-XXX-XXXX-XXX = --XX----XXXXXXXXXXXXXXXXXX--
            dc    h'FF76'     ; XXXXXXXX-XXX-XX- = XXXXXXXXXXXXXXXXXXXX--XXXX--
            dc    h'8F34'     ; X---XXXX--XX-X-- = ------XXXXXXXXXXXX------XX--

sprite25    anop
            dc    h'00C3'     ; --------XX----XX = ------------------XXXXXX----
            dc    h'0066'     ; ---------XX--XX- = ----------------XXXX--XXXX--
            dc    h'003C'     ; ----------XXXX-- = --------------XXXX------XXXX
            dc    h'003C'     ; ----------XXXX-- = --------------XXXX------XXXX
            dc    h'003C'     ; ----------XXXX-- = --------------XXXX------XXXX
            dc    h'0066'     ; ---------XX--XX- = ----------------XXXX--XXXX--
            dc    h'00C3'     ; --------XX----XX = ------------------XXXXXX----
            dc    h'0002'     ; --------------X- = ----------------------XX----
            dc    h'00C3'     ; --------XX----XX = ------------------XXXXXX----
            dc    h'0042'     ; ---------X----X- = ------------------XX--XX----
            dc    h'00C3'     ; --------XX----XX = ------------------XXXXXX----
            dc    h'00C7'     ; --------XX---XXX = ------------------XXXXXXXX--
            dc    h'81E7'     ; X------XXXX--XXX = ------XX--------XXXXXXXXXX--
            dc    h'89FF'     ; X---X--XXXXXXXXX = ------XX----XXXXXXXXXXXXXXXX
            dc    h'CFFD'     ; XX--XXXXXXXXXX-X = ----XXXXXXXXXXXXXXXXXX--XXXX
            dc    h'0E78'     ; ----XXX--XXXX--- = --------XXXXXXXXXXXX------XX

sprite26    anop
            dc    h'C300'     ; XX----XX-------- = ----XXXXXX------------------
            dc    h'6600'     ; -XX--XX--------- = --XXXX--XXXX----------------
            dc    h'3C00'     ; --XXXX---------- = XXXX------XXXX--------------
            dc    h'3C00'     ; --XXXX---------- = XXXX------XXXX--------------
            dc    h'3C00'     ; --XXXX---------- = XXXX------XXXX--------------
            dc    h'6600'     ; -XX--XX--------- = --XXXX--XXXX----------------
            dc    h'C300'     ; XX----XX-------- = ----XXXXXX------------------
            dc    h'4000'     ; -X-------------- = ----XX----------------------
            dc    h'C300'     ; XX----XX-------- = ----XXXXXX------------------
            dc    h'4200'     ; -X----X--------- = ----XX--XX------------------
            dc    h'C300'     ; XX----XX-------- = ----XXXXXX------------------
            dc    h'E300'     ; XXX---XX-------- = --XXXXXXXX------------------
            dc    h'E781'     ; XXX--XXXX------X = --XXXXXXXXXX--------XX------
            dc    h'FF91'     ; XXXXXXXXX--X---X = XXXXXXXXXXXXXXXX----XX------
            dc    h'BFF3'     ; X-XXXXXXXXXX--XX = XXXX--XXXXXXXXXXXXXXXXXX----
            dc    h'1E70'     ; ---XXXX--XXX---- = XX------XXXXXXXXXXXX--------

sprite27    anop
            dc    h'8700'     ; X----XXX-------- = ------XXXXXX----------------
            dc    h'4E00'     ; -X--XXX--------- = ----XX--XXXXXX--------------
            dc    h'2E10'     ; --X-XXX----X---- = --XX----XXXXXXXX------------
            dc    h'2E10'     ; --X-XXX----X---- = --XX----XXXXXXXX------------
            dc    h'2E10'     ; --X-XXX----X---- = --XX----XXXXXXXX------------
            dc    h'4E00'     ; -X--XXX--------- = ----XX--XXXXXX--------------
            dc    h'8700'     ; X----XXX-------- = ------XXXXXX----------------
            dc    h'8100'     ; X------X-------- = ------XX--------------------
            dc    h'8700'     ; X----XXX-------- = ------XXXXXX----------------
            dc    h'8500'     ; X----X-X-------- = ------XX--XX----------------
            dc    h'8700'     ; X----XXX-------- = ------XXXXXX----------------
            dc    h'CF00'     ; XX--XXXX-------- = ----XXXXXXXXXX--------------
            dc    h'CF14'     ; XX--XXXX---X-X-- = ----XXXXXXXXXXXX--------XX--
            dc    h'EF74'     ; XXX-XXXX-XXX-X-- = --XXXXXXXXXXXXXXXXXX----XX--
            dc    h'6EFF'     ; -XX-XXX-XXXXXXXX = --XXXX--XXXXXXXXXXXXXXXXXXXX
            dc    h'2CF1'     ; --X-XX--XXXX---X = --XX------XXXXXXXXXXXX------

sprite28    anop
            dc    h'0E00'     ; ----XXX--------- = --------XXXXXX--------------
            dc    h'8710'     ; X----XXX---X---- = ------XXXXXX--XX------------
            dc    h'4E20'     ; -X--XXX---X----- = ----XX--XXXXXX--XX----------
            dc    h'4E20'     ; -X--XXX---X----- = ----XX--XXXXXX--XX----------
            dc    h'4E20'     ; -X--XXX---X----- = ----XX--XXXXXX--XX----------
            dc    h'8710'     ; X----XXX---X---- = ------XXXXXX--XX------------
            dc    h'0E00'     ; ----XXX--------- = --------XXXXXX--------------
            dc    h'0200'     ; ------X--------- = --------XX------------------
            dc    h'0E00'     ; ----XXX--------- = --------XXXXXX--------------
            dc    h'0A00'     ; ----X-X--------- = --------XX--XX--------------
            dc    h'0E00'     ; ----XXX--------- = --------XXXXXX--------------
            dc    h'8F00'     ; X---XXXX-------- = ------XXXXXXXX--------------
            dc    h'8F12'     ; X---XXXX---X--X- = ------XXXXXXXXXX------XX----
            dc    h'CF72'     ; XX--XXXX-XXX--X- = ----XXXXXXXXXXXXXXXX--XX----
            dc    h'CDF7'     ; XX--XX-XXXXX-XXX = ----XXXX--XXXXXXXXXXXXXXXX--
            dc    h'48F1'     ; -X--X---XXXX---X = ----XX------XXXXXXXXXX------

sprite29    anop
            dc    h'0830'     ; ----X-----XX---- = ------------XXXXXX----------
            dc    h'0C50'     ; ----XX---X-X---- = ----------XXXXXX--XX--------
            dc    h'0E91'     ; ----XXX-X--X---X = --------XXXXXXXX----XX------
            dc    h'0E91'     ; ----XXX-X--X---X = --------XXXXXXXX----XX------
            dc    h'0E91'     ; ----XXX-X--X---X = --------XXXXXXXX----XX------
            dc    h'0C50'     ; ----XX---X-X---- = ----------XXXXXX--XX--------
            dc    h'0830'     ; ----X-----XX---- = ------------XXXXXX----------
            dc    h'0800'     ; ----X----------- = ------------XX--------------
            dc    h'0830'     ; ----X-----XX---- = ------------XXXXXX----------
            dc    h'0820'     ; ----X-----X----- = ------------XX--XX----------
            dc    h'0830'     ; ----X-----XX---- = ------------XXXXXX----------
            dc    h'0C30'     ; ----XX----XX---- = ----------XXXXXXXX----------
            dc    h'0C74'     ; ----XX---XXX-X-- = ----------XXXXXXXXXX----XX--
            dc    h'0EF5'     ; ----XXX-XXXX-X-X = --------XXXXXXXXXXXXXX--XX--
            dc    h'06FF'     ; -----XX-XXXXXXXX = --------XXXX--XXXXXXXXXXXXXX
            dc    h'02E3'     ; ------X-XXX---XX = --------XX------XXXXXXXX----

sprite2A    anop
            dc    h'0C30'     ; ---XX---XX---- = ----------XXXXXXXX----------
            dc    h'0E70'     ; ---XXX-XXX---- = --------XXXXXXXXXXXX--------
            dc    h'8FF1'     ; ---XXXXXXX---X = ------XXXXXXXXXXXXXXXX------
            dc    h'8FF1'     ; ---XXXXXXX---X = ------XXXXXXXXXXXXXXXX------
            dc    h'C993'     ; X--X--X--X--XX = ----XXXX----XXXX----XXXX----
            dc    h'0660'     ; ----XX-XX----- = --------XXXX----XXXX--------
            dc    h'6E76'     ; XX-XXX-XXX-XX- = --XXXX--XXXXXXXXXXXX--XXXX--
            dc    h'566A'     ; X-X-XX-XX-X-X- = XX--XX--XXXX----XXXX--XX--XX
            dc    h'D99B'     ; X-XX--X--XX-XX = XX--XXXX----XXXX----XXXX--XX
            dc    h'9FF9'     ; --XXXXXXXXX--X = XX----XXXXXXXXXXXXXXXX----XX
            dc    h'9DB9'     ; --XXX-X-XXX--X = XX----XX--XXXXXXXX--XX----XX
            dc    h'1248'     ; --X--X-X--X--- = XX------XX--------XX------XX
            dc    h'2E74'     ; -X-XXX-XXX-X-- = --XX----XXXXXXXXXXXX----XX--
            dc    h'0420'     ; ----X---X----- = ----------XX----XX----------
            dc    h'0420'     ; ----X---X----- = ----------XX----XX----------
            dc    h'0660'     ; ----XX-XX----- = --------XXXX----XXXX--------

sprite2B    anop
            dc    h'3000'     ; --XX------------ = XXXX------------------------
            dc    h'3000'     ; --XX------------ = XXXX------------------------
            dc    h'3000'     ; --XX------------ = XXXX------------------------
            dc    h'3000'     ; --XX------------ = XXXX------------------------
            dc    h'3000'     ; --XX------------ = XXXX------------------------
            dc    h'3000'     ; --XX------------ = XXXX------------------------
            dc    h'3000'     ; --XX------------ = XXXX------------------------
            dc    h'BF70'     ; X-XXXXXX-XXX---- = XXXX--XXXXXXXXXXXXXX--------
            dc    h'BF70'     ; X-XXXXXX-XXX---- = XXXX--XXXXXXXXXXXXXX--------
            dc    h'FF70'     ; XXXXXXXX-XXX---- = XXXXXXXXXXXXXXXXXXXX--------
            dc    h'8F70'     ; X---XXXX-XXX---- = ------XXXXXXXXXXXXXX--------
            dc    h'0E30'     ; ----XXX---XX---- = --------XXXXXXXXXX----------
            dc    h'ED30'     ; XXX-XX-X--XX---- = --XXXXXX--XXXXXXXX----------
            dc    h'FF10'     ; XXXXXXXX---X---- = XXXXXXXXXXXXXXXX------------
            dc    h'BF10'     ; X-XXXXXX---X---- = XXXX--XXXXXXXXXX------------
            dc    h'BF10'     ; X-XXXXXX---X---- = XXXX--XXXXXXXXXX------------

sprite2C    anop
            dc    h'C100'     ; XX-----X-------- = ----XXXX--------------------
            dc    h'C100'     ; XX-----X-------- = ----XXXX--------------------
            dc    h'C100'     ; XX-----X-------- = ----XXXX--------------------
            dc    h'C100'     ; XX-----X-------- = ----XXXX--------------------
            dc    h'C181'     ; XX-----XX------X = ----XXXX------------XX------
            dc    h'C160'     ; XX-----X-XX----- = ----XXXX--------XXXX--------
            dc    h'C910'     ; XX--X--X---X---- = ----XXXX----XXXX------------
            dc    h'C500'     ; XX---X-X-------- = ----XXXX--XX----------------
            dc    h'CDF3'     ; XX--XX-XXXXX--XX = ----XXXX--XXXXXXXXXXXXXX----
            dc    h'CFF3'     ; XX--XXXXXXXX--XX = ----XXXXXXXXXXXXXXXXXXXX----
            dc    h'0CF3'     ; ----XX--XXXX--XX = ----------XXXXXXXXXXXXXX----
            dc    h'08F1'     ; ----X---XXXX---X = ------------XXXXXXXXXX------
            dc    h'87F1'     ; X----XXXXXXX---X = ------XXXXXX--XXXXXXXX------
            dc    h'CF70'     ; XX--XXXX-XXX---- = ----XXXXXXXXXXXXXXXX--------
            dc    h'CD70'     ; XX--XX-X-XXX---- = ----XXXX--XXXXXXXXXX--------
            dc    h'CD70'     ; XX--XX-X-XXX---- = ----XXXX--XXXXXXXXXX--------

sprite2D    anop
            dc    h'8300'     ; X-----XX-------- = ------XXXX------------------
            dc    h'8300'     ; X-----XX-------- = ------XXXX------------------
            dc    h'8340'     ; X-----XX-X------ = ------XXXX--------XX--------
            dc    h'8320'     ; X-----XX--X----- = ------XXXX------XX----------
            dc    h'8320'     ; X-----XX--X----- = ------XXXX------XX----------
            dc    h'8310'     ; X-----XX---X---- = ------XXXX----XX------------
            dc    h'8310'     ; X-----XX---X---- = ------XXXX----XX------------
            dc    h'8B00'     ; X---X-XX-------- = ------XXXX--XX--------------
            dc    h'8BF7'     ; X---X-XXXXXX-XXX = ------XXXX--XXXXXXXXXXXXXX--
            dc    h'8FF7'     ; X---XXXXXXXX-XXX = ------XXXXXXXXXXXXXXXXXXXX--
            dc    h'08F7'     ; ----X---XXXX-XXX = ------------XXXXXXXXXXXXXX--
            dc    h'00F3'     ; --------XXXX--XX = --------------XXXXXXXXXX----
            dc    h'0EE3'     ; ----XXX-XXX---XX = --------XXXXXX--XXXXXXXX----
            dc    h'8FF1'     ; X---XXXXXXXX---X = ------XXXXXXXXXXXXXXXX------
            dc    h'8BF1'     ; X---X-XXXXXX---X = ------XXXX--XXXXXXXXXX------
            dc    h'8BF1'     ; X---X-XXXXXX---X = ------XXXX--XXXXXXXXXX------

sprite2E    anop
            dc    h'0600'     ; -----XX--------- = --------XXXX----------------
            dc    h'0600'     ; -----XX--------- = --------XXXX----------------
            dc    h'0600'     ; -----XX--------- = --------XXXX----------------
            dc    h'0600'     ; -----XX--------- = --------XXXX----------------
            dc    h'0604'     ; -----XX------X-- = --------XXXX------------XX--
            dc    h'0683'     ; -----XX-X-----XX = --------XXXX--------XXXX----
            dc    h'0660'     ; -----XX--XX----- = --------XXXX----XXXX--------
            dc    h'0610'     ; -----XX----X---- = --------XXXX--XX------------
            dc    h'06FF'     ; -----XX-XXXXXXXX = --------XXXX--XXXXXXXXXXXXXX
            dc    h'0EFF'     ; ----XXX-XXXXXXXX = --------XXXXXXXXXXXXXXXXXXXX
            dc    h'00FF'     ; --------XXXXXXXX = --------------XXXXXXXXXXXXXX
            dc    h'00E7'     ; --------XXX--XXX = ----------------XXXXXXXXXX--
            dc    h'0CD7'     ; ----XX--XX-X-XXX = ----------XXXXXX--XXXXXXXX--
            dc    h'0EF3'     ; ----XXX-XXXX--XX = --------XXXXXXXXXXXXXXXX----
            dc    h'06F3'     ; -----XX-XXXX--XX = --------XXXX--XXXXXXXXXX----
            dc    h'06F3'     ; -----XX-XXXX--XX = --------XXXX--XXXXXXXXXX----

sprite2F    anop
            dc    h'0060'     ; ---------XX----- = ----------------XXXX--------
            dc    h'0060'     ; ---------XX----- = ----------------XXXX--------
            dc    h'0060'     ; ---------XX----- = ----------------XXXX--------
            dc    h'0060'     ; ---------XX----- = ----------------XXXX--------
            dc    h'2060'     ; --X------XX----- = --XX------------XXXX--------
            dc    h'C160'     ; XX-----X-XX----- = ----XXXX--------XXXX--------
            dc    h'0660'     ; -----XX--XX----- = --------XXXX----XXXX--------
            dc    h'0860'     ; ----X----XX----- = ------------XX--XXXX--------
            dc    h'FF60'     ; XXXXXXXX-XX----- = XXXXXXXXXXXXXX--XXXX--------
            dc    h'FF70'     ; XXXXXXXX-XXX---- = XXXXXXXXXXXXXXXXXXXX--------
            dc    h'FF00'     ; XXXXXXXX-------- = XXXXXXXXXXXXXX--------------
            dc    h'E700'     ; XXX--XXX-------- = --XXXXXXXXXX----------------
            dc    h'EB30'     ; XXX-X-XX--XX---- = --XXXXXXXX--XXXXXX----------
            dc    h'CF70'     ; XX--XXXX-XXX---- = ----XXXXXXXXXXXXXXXX--------
            dc    h'CF60'     ; XX--XXXX-XX----- = ----XXXXXXXXXX--XXXX--------
            dc    h'CF60'     ; XX--XXXX-XX----- = ----XXXXXXXXXX--XXXX--------

sprite30    anop
            dc    h'0083'     ; --------X-----XX = --------------------XXXX----
            dc    h'0083'     ; --------X-----XX = --------------------XXXX----
            dc    h'0483'     ; -----X--X-----XX = ----------XX--------XXXX----
            dc    h'0883'     ; ----X---X-----XX = ------------XX------XXXX----
            dc    h'0883'     ; ----X---X-----XX = ------------XX------XXXX----
            dc    h'0093'     ; --------X--X--XX = --------------XX----XXXX----
            dc    h'0093'     ; --------X--X--XX = --------------XX----XXXX----
            dc    h'00A3'     ; --------X-X---XX = ----------------XX--XXXX----
            dc    h'CFB3'     ; XX--XXXXX-XX--XX = ----XXXXXXXXXXXXXX--XXXX----
            dc    h'CFF3'     ; XX--XXXXXXXX--XX = ----XXXXXXXXXXXXXXXXXXXX----
            dc    h'CF30'     ; XX--XXXX--XX---- = ----XXXXXXXXXXXXXX----------
            dc    h'8F10'     ; X---XXXX---X---- = ------XXXXXXXXXX------------
            dc    h'8FE1'     ; X---XXXXXXX----X = ------XXXXXXXX--XXXXXX------
            dc    h'0EF3'     ; ----XXX-XXXX--XX = --------XXXXXXXXXXXXXXXX----
            dc    h'0EB3'     ; ----XXX-X-XX--XX = --------XXXXXXXXXX--XXXX----
            dc    h'0EB3'     ; ----XXX-X-XX--XX = --------XXXXXXXXXX--XXXX----

sprite31    anop
            dc    h'0006'     ; -------------XX- = ----------------------XXXX--
            dc    h'0006'     ; -------------XX- = ----------------------XXXX--
            dc    h'0006'     ; -------------XX- = ----------------------XXXX--
            dc    h'0006'     ; -------------XX- = ----------------------XXXX--
            dc    h'0206'     ; ------X------XX- = --------XX------------XXXX--
            dc    h'0C06'     ; ----XX-------XX- = ----------XXXX--------XXXX--
            dc    h'0036'     ; ----------XX-XX- = --------------XXXX----XXXX--
            dc    h'0046'     ; ---------X---XX- = ------------------XX--XXXX--
            dc    h'8F76'     ; X---XXXX-XXX-XX- = ------XXXXXXXXXXXXXX--XXXX--
            dc    h'8FF7'     ; X---XXXXXXXX-XXX = ------XXXXXXXXXXXXXXXXXXXX--
            dc    h'8F70'     ; X---XXXX-XXX---- = ------XXXXXXXXXXXXXX--------
            dc    h'0E30'     ; ----XXX---XX---- = --------XXXXXXXXXX----------
            dc    h'0ED3'     ; ----XXX-XX-X--XX = --------XXXXXXXX--XXXXXX----
            dc    h'0CF7'     ; ----XX--XXXX-XXX = ----------XXXXXXXXXXXXXXXX--
            dc    h'0C76'     ; ----XX---XXX-XX- = ----------XXXXXXXXXX--XXXX--
            dc    h'0C76'     ; ----XX---XXX-XX- = ----------XXXXXXXXXX--XXXX--

sprite32    anop
            dc    h'000C'     ; ------------XX-- = ------------------------XXXX
            dc    h'000C'     ; ------------XX-- = ------------------------XXXX
            dc    h'000C'     ; ------------XX-- = ------------------------XXXX
            dc    h'000C'     ; ------------XX-- = ------------------------XXXX
            dc    h'000C'     ; ------------XX-- = ------------------------XXXX
            dc    h'000C'     ; ------------XX-- = ------------------------XXXX
            dc    h'000C'     ; ------------XX-- = ------------------------XXXX
            dc    h'0EFD'     ; ----XXX-XXXXXX-X = --------XXXXXXXXXXXXXX--XXXX
            dc    h'0EFD'     ; ----XXX-XXXXXX-X = --------XXXXXXXXXXXXXX--XXXX
            dc    h'0EFF'     ; ----XXX-XXXXXXXX = --------XXXXXXXXXXXXXXXXXXXX
            dc    h'0EF1'     ; ----XXX-XXXX---X = --------XXXXXXXXXXXXXX------
            dc    h'0C70'     ; ----XX---XXX---- = ----------XXXXXXXXXX--------
            dc    h'0CB7'     ; ----XX--X-XX-XXX = ----------XXXXXXXX--XXXXXX--
            dc    h'08FF'     ; ----X---XXXXXXXX = ------------XXXXXXXXXXXXXXXX
            dc    h'08FD'     ; ----X---XXXXXX-X = ------------XXXXXXXXXX--XXXX
            dc    h'08FD'     ; ----X---XXXXXX-X = ------------XXXXXXXXXX--XXXX

sprite33    anop
            dc    h'8F10'     ; X---XXXX---X---- = ------XXXXXXXXXX------------
            dc    h'EF70'     ; XXX-XXXX-XXX---- = --XXXXXXXXXXXXXXXXXX--------
            dc    h'E9F1'     ; XXX-X--XXXXX---X = --XXXXXX----XXXXXXXXXX------
            dc    h'F930'     ; XXXXX--X--XX---- = XXXXXXXX----XXXXXX----------
            dc    h'FF00'     ; XXXXXXXX-------- = XXXXXXXXXXXXXX--------------
            dc    h'F300'     ; XXXX--XX-------- = XXXXXXXXXX------------------
            dc    h'FF00'     ; XXXXXXXX-------- = XXXXXXXXXXXXXX--------------
            dc    h'FF30'     ; XXXXXXXX--XX---- = XXXXXXXXXXXXXXXXXX----------
            dc    h'EFF1'     ; XXX-XXXXXXXX---X = --XXXXXXXXXXXXXXXXXXXX------
            dc    h'EF70'     ; XXX-XXXX-XXX---- = --XXXXXXXXXXXXXXXXXX--------
            dc    h'8F10'     ; X---XXXX---X---- = ------XXXXXXXXXX------------
            dc    h'0A00'     ; ----X-X--------- = --------XX--XX--------------
            dc    h'0A00'     ; ----X-X--------- = --------XX--XX--------------
            dc    h'0A00'     ; ----X-X--------- = --------XX--XX--------------
            dc    h'0A00'     ; ----X-X--------- = --------XX--XX--------------
            dc    h'8F10'     ; X---XXXX---X---- = ------XXXXXXXXXX------------

sprite34    anop
            dc    h'0C70'     ; ----XX---XXX---- = ----------XXXXXXXXXX--------
            dc    h'8FF3'     ; X---XXXXXXXX--XX = ------XXXXXXXXXXXXXXXXXX----
            dc    h'8FC3'     ; X---XXXXXX----XX = ------XXXXXXXX----XXXXXX----
            dc    h'CFC7'     ; XX--XXXXXX---XXX = ----XXXXXXXXXX----XXXXXXXX--
            dc    h'CFF7'     ; XX--XXXXXXXX-XXX = ----XXXXXXXXXXXXXXXXXXXXXX--
            dc    h'CF00'     ; XX--XXXX-------- = ----XXXXXXXXXX--------------
            dc    h'CFF7'     ; XX--XXXXXXXX-XXX = ----XXXXXXXXXXXXXXXXXXXXXX--
            dc    h'CFF7'     ; XX--XXXXXXXX-XXX = ----XXXXXXXXXXXXXXXXXXXXXX--
            dc    h'8FF3'     ; X---XXXXXXXX--XX = ------XXXXXXXXXXXXXXXXXX----
            dc    h'8FF3'     ; X---XXXXXXXX--XX = ------XXXXXXXXXXXXXXXXXX----
            dc    h'0C70'     ; ----XX---XXX---- = ----------XXXXXXXXXX--------
            dc    h'0820'     ; ----X-----X----- = ------------XX--XX----------
            dc    h'0820'     ; ----X-----X----- = ------------XX--XX----------
            dc    h'0C70'     ; ----XX---XXX---- = ----------XXXXXXXXXX--------
            dc    h'0000'     ; ---------------- = ----------------------------
            dc    h'0000'     ; ---------------- = ----------------------------

sprite35    anop
            dc    h'08F1'     ; ----X---XXXX---X = ------------XXXXXXXXXX------
            dc    h'0EF7'     ; ----XXX-XXXX-XXX = --------XXXXXXXXXXXXXXXXXX--
            dc    h'0ECF'     ; ----XXX-XX--XXXX = --------XXXXXX----XXXXXXXXXX
            dc    h'8FC3'     ; X---XXXXXX----XX = ------XXXXXXXX----XXXXXX----
            dc    h'8F70'     ; X---XXXX-XXX---- = ------XXXXXXXXXXXXXX--------
            dc    h'8F10'     ; X---XXXX---X---- = ------XXXXXXXXXX------------
            dc    h'8F70'     ; X---XXXX-XXX---- = ------XXXXXXXXXXXXXX--------
            dc    h'8FF3'     ; X---XXXXXXXX--XX = ------XXXXXXXXXXXXXXXXXX----
            dc    h'0EFF'     ; ----XXX-XXXXXXXX = --------XXXXXXXXXXXXXXXXXXXX
            dc    h'0EF7'     ; ----XXX-XXXX-XXX = --------XXXXXXXXXXXXXXXXXX--
            dc    h'08F1'     ; ----X---XXXX---X = ------------XXXXXXXXXX------
            dc    h'08F1'     ; ----X---XXXX---X = ------------XXXXXXXXXX------
            dc    h'0000'     ; ---------------- = ----------------------------
            dc    h'0000'     ; ---------------- = ----------------------------
            dc    h'0000'     ; ---------------- = ----------------------------
            dc    h'0000'     ; ---------------- = ----------------------------

sprite36    anop
            dc    h'00F3'     ; --------XXXX--XX = --------------XXXXXXXXXX----
            dc    h'0C9F'     ; ----XX--X--XXXXX = ----------XXXXXX----XXXXXXXX
            dc    h'0C97'     ; ----XX--X--X-XXX = ----------XXXXXX----XXXXXX--
            dc    h'0EF3'     ; ----XXX-XXXX--XX = --------XXXXXXXXXXXXXXXX----
            dc    h'0E70'     ; ----XXX--XXX---- = --------XXXXXXXXXXXX--------
            dc    h'0E30'     ; ----XXX---XX---- = --------XXXXXXXXXX----------
            dc    h'0E70'     ; ----XXX--XXX---- = --------XXXXXXXXXXXX--------
            dc    h'0EF3'     ; ----XXX-XXXX--XX = --------XXXXXXXXXXXXXXXX----
            dc    h'0CF7'     ; ----XX--XXXX-XXX = ----------XXXXXXXXXXXXXXXX--
            dc    h'0CFF'     ; ----XX--XXXXXXXX = ----------XXXXXXXXXXXXXXXXXX
            dc    h'00F3'     ; --------XXXX--XX = --------------XXXXXXXXXX----
            dc    h'00A1'     ; --------X-X----X = ----------------XX--XX------
            dc    h'00A1'     ; --------X-X----X = ----------------XX--XX------
            dc    h'00F3'     ; --------XXXX--XX = --------------XXXXXXXXXX----
            dc    h'0000'     ; ---------------- = ----------------------------
            dc    h'0000'     ; ---------------- = ----------------------------

sprite37    anop
            dc    h'CF00'     ; XX--XXXX-------- = ----XXXXXXXXXX--------------
            dc    h'F930'     ; XXXXX--X--XX---- = XXXXXXXX----XXXXXX----------
            dc    h'E930'     ; XXX-X--X--XX---- = --XXXXXX----XXXXXX----------
            dc    h'CF70'     ; XX--XXXX-XXX---- = ----XXXXXXXXXXXXXXXX--------
            dc    h'0E70'     ; ----XXX--XXX---- = --------XXXXXXXXXXXX--------
            dc    h'0C70'     ; ----XX---XXX---- = ----------XXXXXXXXXX--------
            dc    h'0E70'     ; ----XXX--XXX---- = --------XXXXXXXXXXXX--------
            dc    h'CF70'     ; XX--XXXX-XXX---- = ----XXXXXXXXXXXXXXXX--------
            dc    h'EF30'     ; XXX-XXXX--XX---- = --XXXXXXXXXXXXXXXX----------
            dc    h'FF30'     ; XXXXXXXX--XX---- = XXXXXXXXXXXXXXXXXX----------
            dc    h'CF00'     ; XX--XXXX-------- = ----XXXXXXXXXX--------------
            dc    h'8500'     ; X----X-X-------- = ------XX--XX----------------
            dc    h'8500'     ; X----X-X-------- = ------XX--XX----------------
            dc    h'CF00'     ; XX--XXXX-------- = ----XXXXXXXXXX--------------
            dc    h'0000'     ; ---------------- = ----------------------------
            dc    h'0000'     ; ---------------- = ----------------------------

sprite38    anop
            dc    h'0E30'     ; ----XXX---XX---- = --------XXXXXXXXXX----------
            dc    h'CFF1'     ; XX--XXXXXXXX---X = ----XXXXXXXXXXXXXXXXXX------
            dc    h'E7E1'     ; XXX--XXXXXX----X = --XXXXXXXXXX----XXXXXX------
            dc    h'87E3'     ; X----XXXXXX---XX = ------XXXXXX----XXXXXXXX----
            dc    h'0CF3'     ; ----XX--XXXX--XX = ----------XXXXXXXXXXXXXX----
            dc    h'00F3'     ; --------XXXX--XX = --------------XXXXXXXXXX----
            dc    h'0CF3'     ; ----XX--XXXX--XX = ----------XXXXXXXXXXXXXX----
            dc    h'8FF3'     ; X---XXXXXXXX--XX = ------XXXXXXXXXXXXXXXXXX----
            dc    h'EFF1'     ; XXX-XXXXXXXX---X = --XXXXXXXXXXXXXXXXXXXX------
            dc    h'CFF1'     ; XX--XXXXXXXX---X = ----XXXXXXXXXXXXXXXXXX------
            dc    h'0E30'     ; ----XXX---XX---- = --------XXXXXXXXXX----------
            dc    h'0E30'     ; ----XXX---XX---- = --------XXXXXXXXXX----------
            dc    h'0000'     ; ---------------- = ----------------------------
            dc    h'0000'     ; ---------------- = ----------------------------
            dc    h'0000'     ; ---------------- = ----------------------------
            dc    h'0000'     ; ---------------- = ----------------------------

sprite39    anop
            dc    h'0C70'     ; ----XX---XXX---- = ----------XXXXXXXXXX--------
            dc    h'8FF3'     ; X---XXXXXXXX--XX = ------XXXXXXXXXXXXXXXXXX----
            dc    h'87E3'     ; X----XXXXXX---XX = ------XXXXXX----XXXXXXXX----
            dc    h'C7E7'     ; XX---XXXXXX--XXX = ----XXXXXXXX----XXXXXXXXXX--
            dc    h'CFF7'     ; XX--XXXXXXXX-XXX = ----XXXXXXXXXXXXXXXXXXXXXX--
            dc    h'00E7'     ; --------XXX--XXX = ----------------XXXXXXXXXX--
            dc    h'CFF7'     ; XX--XXXXXXXX-XXX = ----XXXXXXXXXXXXXXXXXXXXXX--
            dc    h'CFF7'     ; XX--XXXXXXXX-XXX = ----XXXXXXXXXXXXXXXXXXXXXX--
            dc    h'8FF3'     ; X---XXXXXXXX--XX = ------XXXXXXXXXXXXXXXXXX----
            dc    h'8FF3'     ; X---XXXXXXXX--XX = ------XXXXXXXXXXXXXXXXXX----
            dc    h'0C70'     ; ----XX---XXX---- = ----------XXXXXXXXXX--------
            dc    h'0820'     ; ----X-----X----- = ------------XX--XX----------
            dc    h'0820'     ; ----X-----X----- = ------------XX--XX----------
            dc    h'0C70'     ; ----XX---XXX---- = ----------XXXXXXXXXX--------
            dc    h'0000'     ; ---------------- = ----------------------------
            dc    h'0000'     ; ---------------- = ----------------------------

sprite3A    anop
            dc    h'08F1'     ; ----X---XXXX---X = ------------XXXXXXXXXX------
            dc    h'0EF7'     ; ----XXX-XXXX-XXX = --------XXXXXXXXXXXXXXXXXX--
            dc    h'8F97'     ; X---XXXXX--X-XXX = ------XXXXXXXXXX----XXXXXX--
            dc    h'0C9F'     ; ----XX--X--XXXXX = ----------XXXXXX----XXXXXXXX
            dc    h'00FF'     ; --------XXXXXXXX = --------------XXXXXXXXXXXXXX
            dc    h'00CF'     ; --------XX--XXXX = ------------------XXXXXXXXXX
            dc    h'00FF'     ; --------XXXXXXXX = --------------XXXXXXXXXXXXXX
            dc    h'0CFF'     ; ----XX--XXXXXXXX = ----------XXXXXXXXXXXXXXXXXX
            dc    h'8FF7'     ; X---XXXXXXXX-XXX = ------XXXXXXXXXXXXXXXXXXXX--
            dc    h'0EF7'     ; ----XXX-XXXX-XXX = --------XXXXXXXXXXXXXXXXXX--
            dc    h'08F1'     ; ----X---XXXX---X = ------------XXXXXXXXXX------
            dc    h'0050'     ; ---------X-X---- = --------------XX--XX--------
            dc    h'0050'     ; ---------X-X---- = --------------XX--XX--------
            dc    h'0050'     ; ---------X-X---- = --------------XX--XX--------
            dc    h'0050'     ; ---------X-X---- = --------------XX--XX--------
            dc    h'08F1'     ; ----X---XXXX---X = ------------XXXXXXXXXX------

sprite3B    anop
            dc    h'8300'     ; X-----XX-------- = ------XXXX------------------
            dc    h'8700'     ; X----XXX-------- = ------XXXXXX----------------
            dc    h'0A20'     ; ----X-X---X----- = --------XX--XX--XX----------
            dc    h'0E30'     ; ----XXX---XX---- = --------XXXXXXXXXX----------
            dc    h'0600'     ; -----XX--------- = --------XXXX----------------
            dc    h'8700'     ; X----XXX-------- = ------XXXXXX----------------
            dc    h'8F00'     ; X---XXXX-------- = ------XXXXXXXX--------------
            dc    h'8710'     ; X----XXX---X---- = ------XXXXXX--XX------------
            dc    h'C700'     ; XX---XXX-------- = ----XXXXXXXX----------------
            dc    h'CF00'     ; XX--XXXX-------- = ----XXXXXXXXXX--------------
            dc    h'CF00'     ; XX--XXXX-------- = ----XXXXXXXXXX--------------
            dc    h'6E00'     ; -XX-XXX--------- = --XXXX--XXXXXX--------------
            dc    h'2400'     ; --X--X---------- = --XX------XX----------------
            dc    h'2800'     ; --X-X----------- = --XX--------XX--------------
            dc    h'1010'     ; ---X-------X---- = XX------------XX------------
            dc    h'0000'     ; ---------------- = ----------------------------

sprite3C    anop
            dc    h'0000'     ; ---------------- = ----------------------------
            dc    h'0000'     ; ---------------- = ----------------------------
            dc    h'0C00'     ; ----XX---------- = ----------XXXX--------------
            dc    h'0C10'     ; ----XX-----X---- = ----------XXXXXX------------
            dc    h'08A1'     ; ----X---X-X----X = ------------XX--XX--XX------
            dc    h'08F1'     ; ----X---XXXX---X = ------------XXXXXXXXXX------
            dc    h'0830'     ; ----X-----XX---- = ------------XXXXXX----------
            dc    h'0C10'     ; ----XX-----X---- = ----------XXXXXX------------
            dc    h'0C30'     ; ----XX----XX---- = ----------XXXXXXXX----------
            dc    h'0C50'     ; ----XX---X-X---- = ----------XXXXXX--XX--------
            dc    h'0E10'     ; ----XXX----X---- = --------XXXXXXXX------------
            dc    h'0E30'     ; ----XXX---XX---- = --------XXXXXXXXXX----------
            dc    h'0E30'     ; ----XXX---XX---- = --------XXXXXXXXXX----------
            dc    h'8B30'     ; X---X-XX--XX---- = ------XXXX--XXXXXX----------
            dc    h'C910'     ; XX--X--X---X---- = ----XXXX----XXXX------------
            dc    h'2060'     ; --X------XX----- = --XX------------XXXX--------

sprite3D    anop
            dc    h'0000'     ; ---------------- = ----------------------------
            dc    h'0000'     ; ---------------- = ----------------------------
            dc    h'0000'     ; ---------------- = ----------------------------
            dc    h'0000'     ; ---------------- = ----------------------------
            dc    h'0810'     ; ----X------X---- = ------------XXXX------------
            dc    h'0830'     ; ----X-----XX---- = ------------XXXXXX----------
            dc    h'0052'     ; ---------X-X--X- = --------------XX--XX--XX----
            dc    h'00F3'     ; --------XXXX--XX = --------------XXXXXXXXXX----
            dc    h'0070'     ; ---------XXX---- = --------------XXXXXX--------
            dc    h'0830'     ; ----X-----XX---- = ------------XXXXXX----------
            dc    h'0870'     ; ----X----XXX---- = ------------XXXXXXXX--------
            dc    h'08B1'     ; ----X---X-XX---X = ------------XXXXXX--XX------
            dc    h'0C30'     ; ----XX----XX---- = ----------XXXXXXXX----------
            dc    h'0C70'     ; ----XX---XXX---- = ----------XXXXXXXXXX--------
            dc    h'0E70'     ; ----XXX--XXX---- = --------XXXXXXXXXXXX--------
            dc    h'E7F3'     ; XXX--XXXXXXX--XX = --XXXXXXXXXX--XXXXXXXXXX----

sprite3E    anop
            dc    h'0000'     ; ---------------- = ----------------------------
            dc    h'0000'     ; ---------------- = ----------------------------
            dc    h'0030'     ; ----------XX---- = --------------XXXX----------
            dc    h'0070'     ; ---------XXX---- = --------------XXXXXX--------
            dc    h'00A5'     ; --------X-X--X-X = ----------------XX--XX--XX--
            dc    h'00E7'     ; --------XXX--XXX = ----------------XXXXXXXXXX--
            dc    h'00E1'     ; --------XXX----X = ----------------XXXXXX------
            dc    h'0070'     ; ---------XXX---- = --------------XXXXXX--------
            dc    h'00F1'     ; --------XXXX---X = --------------XXXXXXXX------
            dc    h'0072'     ; ---------XXX--X- = --------------XXXXXX--XX----
            dc    h'0870'     ; ----X----XXX---- = ------------XXXXXXXX--------
            dc    h'08F1'     ; ----X---XXXX---X = ------------XXXXXXXXXX------
            dc    h'0CF1'     ; ----XX--XXXX---X = ----------XXXXXXXXXXXX------
            dc    h'0C60'     ; ----XX---XX----- = ----------XXXX--XXXX--------
            dc    h'0683'     ; -----XX-X-----XX = --------XXXX--------XXXX----
            dc    h'8100'     ; X------X-------- = ------XX--------------------

sprite3F    anop
            dc    h'0000'     ; ---------------- = ----------------------------
            dc    h'0000'     ; ---------------- = ----------------------------
            dc    h'0C00'     ; ----XX---------- = ----------XXXX--------------
            dc    h'0E00'     ; ----XXX--------- = --------XXXXXX--------------
            dc    h'A500'     ; X-X--X-X-------- = --XX--XX--XX----------------
            dc    h'E700'     ; XXX--XXX-------- = --XXXXXXXXXX----------------
            dc    h'8700'     ; X----XXX-------- = ------XXXXXX----------------
            dc    h'0E00'     ; ----XXX--------- = --------XXXXXX--------------
            dc    h'8F00'     ; X---XXXX-------- = ------XXXXXXXX--------------
            dc    h'4E00'     ; -X--XXX--------- = ----XX--XXXXXX--------------
            dc    h'0E10'     ; ----XXX----X---- = --------XXXXXXXX------------
            dc    h'8F10'     ; X---XXXX---X---- = ------XXXXXXXXXX------------
            dc    h'8F30'     ; X---XXXX--XX---- = ------XXXXXXXXXXXX----------
            dc    h'0630'     ; -----XX---XX---- = --------XXXX--XXXX----------
            dc    h'C160'     ; XX-----X-XX----- = ----XXXX--------XXXX--------
            dc    h'0081'     ; --------X------X = --------------------XX------

sprite40    anop
            dc    h'0000'     ; ---------------- = ----------------------------
            dc    h'0000'     ; ---------------- = ----------------------------
            dc    h'0000'     ; ---------------- = ----------------------------
            dc    h'0000'     ; ---------------- = ----------------------------
            dc    h'0030'     ; ----------XX---- = --------------XXXX----------
            dc    h'0830'     ; ----X-----XX---- = ------------XXXXXX----------
            dc    h'8510'     ; X----X-X---X---- = ------XX--XX--XX------------
            dc    h'8F10'     ; X---XXXX---X---- = ------XXXXXXXXXX------------
            dc    h'0C10'     ; ----XX-----X---- = ----------XXXXXX------------
            dc    h'0830'     ; ----X-----XX---- = ------------XXXXXX----------
            dc    h'0C30'     ; ----XX----XX---- = ----------XXXXXXXX----------
            dc    h'0A30'     ; ----X-X---XX---- = --------XX--XXXXXX----------
            dc    h'0870'     ; ----X----XXX---- = ------------XXXXXXXX--------
            dc    h'0C70'     ; ----XX---XXX---- = ----------XXXXXXXXXX--------
            dc    h'0CF1'     ; ----XX--XXXX---X = ----------XXXXXXXXXXXX------
            dc    h'8FDF'     ; X---XXXXXX-XXXXX = ------XXXXXXXXXX--XXXXXXXXXX

sprite41    anop
            dc    h'0000'     ; ---------------- = ----------------------------
            dc    h'0000'     ; ---------------- = ----------------------------
            dc    h'0060'     ; ---------XX----- = ----------------XXXX--------
            dc    h'0070'     ; ---------XXX---- = --------------XXXXXX--------
            dc    h'0A20'     ; ----X-X---X----- = --------XX--XX--XX----------
            dc    h'0E30'     ; ----XXX---XX---- = --------XXXXXXXXXX----------
            dc    h'0830'     ; ----X-----XX---- = ------------XXXXXX----------
            dc    h'0070'     ; ---------XXX---- = --------------XXXXXX--------
            dc    h'0870'     ; ----X----XXX---- = ------------XXXXXXXX--------
            dc    h'0470'     ; -----X---XXX---- = ----------XX--XXXXXX--------
            dc    h'00F1'     ; --------XXXX---X = --------------XXXXXXXX------
            dc    h'08F1'     ; ----X---XXXX---X = ------------XXXXXXXXXX------
            dc    h'08F1'     ; ----X---XXXX---X = ------------XXXXXXXXXX------
            dc    h'08B3'     ; ----X---X-XX--XX = ------------XXXXXX--XXXX----
            dc    h'0036'     ; ----------XX-XX- = --------------XXXX----XXXX--
            dc    h'0C08'     ; ----XX------X--- = ----------XXXX------------XX

sprite42    anop
            dc    h'00C1'     ; --------XX-----X = ------------------XXXX------
            dc    h'00E1'     ; --------XXX----X = ----------------XXXXXX------
            dc    h'0450'     ; -----X---X-X---- = ----------XX--XX--XX--------
            dc    h'0C70'     ; ----XX---XXX---- = ----------XXXXXXXXXX--------
            dc    h'0060'     ; ---------XX----- = ----------------XXXX--------
            dc    h'00E1'     ; --------XXX----X = ----------------XXXXXX------
            dc    h'00F1'     ; --------XXXX---X = --------------XXXXXXXX------
            dc    h'08E1'     ; ----X---XXX----X = ------------XX--XXXXXX------
            dc    h'00E3'     ; --------XXX---XX = ----------------XXXXXXXX----
            dc    h'00F3'     ; --------XXXX--XX = --------------XXXXXXXXXX----
            dc    h'00F3'     ; --------XXXX--XX = --------------XXXXXXXXXX----
            dc    h'0076'     ; ---------XXX-XX- = --------------XXXXXX--XXXX--
            dc    h'0024'     ; ----------X--X-- = ----------------XX------XX--
            dc    h'0014'     ; -----------X-X-- = --------------XX--------XX--
            dc    h'0808'     ; ----X-------X--- = ------------XX------------XX
            dc    h'0000'     ; ---------------- = ----------------------------

sprite43    anop
            dc    h'4C32'     ; -X--XX----XX--X- = ----XX----XXXXXXXX----XX----
            dc    h'CBD3'     ; XX--X-XXXX-X--XX = ----XXXXXX--XXXX--XXXXXX----
            dc    h'8FF1'     ; X---XXXXXXXX---X = ------XXXXXXXXXXXXXXXX------
            dc    h'0660'     ; -----XX--XX----- = --------XXXX----XXXX--------
            dc    h'0A50'     ; ----X-X--X-X---- = --------XX--XXXX--XX--------
            dc    h'0420'     ; -----X----X----- = ----------XX----XX----------
            dc    h'0C30'     ; ----XX----XX---- = ----------XXXXXXXX----------
            dc    h'0E70'     ; ----XXX--XXX---- = --------XXXXXXXXXXXX--------
            dc    h'8FF1'     ; X---XXXXXXXX---X = ------XXXXXXXXXXXXXXXX------
            dc    h'CDB3'     ; XX--XX-XX-XX--XX = ----XXXX--XXXXXXXX--XXXX----
            dc    h'6C36'     ; -XX-XX----XX-XX- = --XXXX----XXXXXXXX----XXXX--
            dc    h'2424'     ; --X--X----X--X-- = --XX------XX----XX------XX--
            dc    h'4242'     ; -X----X--X----X- = ----XX--XX--------XX--XX----
            dc    h'0420'     ; -----X----X----- = ----------XX----XX----------
            dc    h'0420'     ; -----X----X----- = ----------XX----XX----------
            dc    h'87E1'     ; X----XXXXXX----X = ------XXXXXX----XXXXXX------

sprite44    anop
            dc    h'8DB1'     ; X---XX-XX-XX---X = ------XX--XXXXXXXX--XX------
            dc    h'8BD1'     ; X---X-XXXX-X---X = ------XXXX--XXXX--XXXX------
            dc    h'8FF1'     ; X---XXXXXXXX---X = ------XXXXXXXXXXXXXXXX------
            dc    h'0660'     ; -----XX--XX----- = --------XXXX----XXXX--------
            dc    h'0A50'     ; ----X-X--X-X---- = --------XX--XXXX--XX--------
            dc    h'0420'     ; -----X----X----- = ----------XX----XX----------
            dc    h'0C30'     ; ----XX----XX---- = ----------XXXXXXXX----------
            dc    h'8FF1'     ; X---XXXXXXXX---X = ------XXXXXXXXXXXXXXXX------
            dc    h'EFF7'     ; XXX-XXXXXXXX-XXX = --XXXXXXXXXXXXXXXXXXXXXXXX--
            dc    h'7C3E'     ; -XXXXX----XXXXX- = XXXXXX----XXXXXXXX----XXXXXX
            dc    h'1C38'     ; ---XXX----XXX--- = XX--------XXXXXXXX--------XX
            dc    h'3C3C'     ; --XXXX----XXXX-- = XXXX------XXXXXXXX------XXXX
            dc    h'0420'     ; -----X----X----- = ----------XX----XX----------
            dc    h'0240'     ; ------X--X------ = --------XX--------XX--------
            dc    h'0240'     ; ------X--X------ = --------XX--------XX--------
            dc    h'C3C3'     ; XX----XXXX----XX = ----XXXXXX--------XXXXXX----

sprite45    anop
            dc    h'87E1'     ; X----XXXXXX----X = ------XXXXXX----XXXXXX------
            dc    h'0420'     ; -----X----X----- = ----------XX----XX----------
            dc    h'0660'     ; -----XX--XX----- = --------XXXX----XXXX--------
            dc    h'6426'     ; -XX--X----X--XX- = --XXXX----XX----XX----XXXX--
            dc    h'4812'     ; -X--X------X--X- = ----XX------XXXX------XX----
            dc    h'6C36'     ; -XX-XX----XX-XX- = --XXXX----XXXXXXXX----XXXX--
            dc    h'CDB3'     ; XX--XX-XX-XX--XX = ----XXXX--XXXXXXXX--XXXX----
            dc    h'8FF1'     ; X---XXXXXXXX---X = ------XXXXXXXXXXXXXXXX------
            dc    h'0E70'     ; ----XXX--XXX---- = --------XXXXXXXXXXXX--------
            dc    h'0E70'     ; ----XXX--XXX---- = --------XXXXXXXXXXXX--------
            dc    h'0420'     ; -----X----X----- = ----------XX----XX----------
            dc    h'0A50'     ; ----X-X--X-X---- = --------XX--XXXX--XX--------
            dc    h'0660'     ; -----XX--XX----- = --------XXXX----XXXX--------
            dc    h'8FF1'     ; X---XXXXXXXX---X = ------XXXXXXXXXXXXXXXX------
            dc    h'8BD1'     ; X---X-XXXX-X---X = ------XXXX--XXXX--XXXX------
            dc    h'8DB1'     ; X---XX-XX-XX---X = ------XX--XXXXXXXX--XX------

sprite46    anop
            dc    h'E187'     ; XXX----XX----XXX = --XXXXXX------------XXXXXX--
            dc    h'83C1'     ; X-----XXXX-----X = ------XXXX--------XXXX------
            dc    h'0660'     ; -----XX--XX----- = --------XXXX----XXXX--------
            dc    h'0C30'     ; ----XX----XX---- = ----------XXXXXXXX----------
            dc    h'6816'     ; -XX-X------X-XX- = --XXXX------XXXX------XXXX--
            dc    h'4C32'     ; -X--XX----XX--X- = ----XX----XXXXXXXX----XX----
            dc    h'6C36'     ; -XX-XX----XX-XX- = --XXXX----XXXXXXXX----XXXX--
            dc    h'CDB3'     ; XX--XX-XX-XX--XX = ----XXXX--XXXXXXXX--XXXX----
            dc    h'8FF1'     ; X---XXXXXXXX---X = ------XXXXXXXXXXXXXXXX------
            dc    h'8FF1'     ; X---XXXXXXXX---X = ------XXXXXXXXXXXXXXXX------
            dc    h'0420'     ; -----X----X----- = ----------XX----XX----------
            dc    h'0A50'     ; ----X-X--X-X---- = --------XX--XXXX--XX--------
            dc    h'4662'     ; -X---XX--XX---X- = ----XX--XXXX----XXXX--XX----
            dc    h'8FF1'     ; X---XXXXXXXX---X = ------XXXXXXXXXXXXXXXX------
            dc    h'8BD1'     ; X---X-XXXX-X---X = ------XXXX--XXXX--XXXX------
            dc    h'0C30'     ; ----XX----XX---- = ----------XXXXXXXX----------

sprite47    anop
            dc    h'0200'     ; ------X--------- = --------XX------------------
            dc    h'0410'     ; -----X-----X---- = ----------XX--XX------------
            dc    h'0220'     ; ------X---X----- = --------XX------XX----------
            dc    h'4410'     ; -X---X-----X---- = ----XX----XX--XX------------
            dc    h'2220'     ; --X---X---X----- = --XX----XX------XX----------
            dc    h'4010'     ; -X---------X---- = ----XX--------XX------------
            dc    h'2600'     ; --X--XX--------- = --XX----XXXX----------------
            dc    h'C910'     ; XX--X--X---X---- = ----XXXX----XXXX------------
            dc    h'2420'     ; --X--X----X----- = --XX------XX----XX----------
            dc    h'2420'     ; --X--X----X----- = --XX------XX----XX----------
            dc    h'1240'     ; ---X--X--X------ = XX------XX--------XX--------
            dc    h'1440'     ; ---X-X---X------ = XX--------XX------XX--------
            dc    h'2220'     ; --X---X---X----- = --XX----XX------XX----------
            dc    h'2220'     ; --X---X---X----- = --XX----XX------XX----------
            dc    h'C910'     ; XX--X--X---X---- = ----XXXX----XXXX------------
            dc    h'0600'     ; -----XX--------- = --------XXXX----------------

sprite48    anop
            dc    h'0800'     ; ----X----------- = ------------XX--------------
            dc    h'8191'     ; X------XX--X---X = ------XX------XX----XX------
            dc    h'0A40'     ; ----X-X--X------ = --------XX--XX----XX--------
            dc    h'8191'     ; X------XX--X---X = ------XX------XX----XX------
            dc    h'0A40'     ; ----X-X--X------ = --------XX--XX----XX--------
            dc    h'8181'     ; X------XX------X = ------XX------------XX------
            dc    h'0810'     ; ----X------X---- = ------------XXXX------------
            dc    h'0660'     ; -----XX--XX----- = --------XXXX----XXXX--------
            dc    h'8181'     ; X------XX------X = ------XX------------XX------
            dc    h'81C1'     ; X------XXX-----X = ------XX----------XXXX------
            dc    h'4822'     ; -X--X-----X---X- = ----XX------XX--XX----XX----
            dc    h'4412'     ; -X---X-----X--X- = ----XX----XX--XX------XX----
            dc    h'8381'     ; X-----XXX------X = ------XXXX----------XX------
            dc    h'8181'     ; X------XX------X = ------XX------------XX------
            dc    h'0660'     ; -----XX--XX----- = --------XXXX----XXXX--------
            dc    h'0810'     ; ----X------X---- = ------------XXXX------------

sprite49    anop
            dc    h'0020'     ; ----------X----- = ----------------XX----------
            dc    h'0440'     ; -----X---X------ = ----------XX------XX--------
            dc    h'0222'     ; ------X---X---X- = --------XX------XX----XX----
            dc    h'0444'     ; -----X---X---X-- = ----------XX------XX----XX--
            dc    h'0222'     ; ------X---X---X- = --------XX------XX----XX----
            dc    h'0404'     ; -----X-------X-- = ----------XX------------XX--
            dc    h'0032'     ; ----------XX--X- = --------------XXXX----XX----
            dc    h'0CC1'     ; ----XX--XX-----X = ----------XXXX----XXXX------
            dc    h'0202'     ; ------X-------X- = --------XX------------XX----
            dc    h'0202'     ; ------X-------X- = --------XX------------XX----
            dc    h'8D24'     ; X---XX-X--X--X-- = ------XX--XXXX--XX------XX--
            dc    h'81D5'     ; X------XXX-X-X-X = ------XX------XX--XXXX--XX--
            dc    h'0202'     ; ------X-------X- = --------XX------------XX----
            dc    h'0202'     ; ------X-------X- = --------XX------------XX----
            dc    h'0CC1'     ; ----XX--XX-----X = ----------XXXX----XXXX------
            dc    h'0030'     ; ----------XX---- = --------------XXXX----------

sprite4A    anop
            dc    h'0012'     ; -----------X--X- = --------------XX------XX----
            dc    h'0424'     ; -----X----X--X-- = ----------XX----XX------XX--
            dc    h'0212'     ; ------X----X--X- = --------XX----XX------XX----
            dc    h'0424'     ; -----X----X--X-- = ----------XX----XX------XX--
            dc    h'0212'     ; ------X----X--X- = --------XX----XX------XX----
            dc    h'0404'     ; -----X-------X-- = ----------XX------------XX--
            dc    h'0260'     ; ------X--XX----- = --------XX------XXXX--------
            dc    h'0893'     ; ----X---X--X--XX = ------------XXXX----XXXX----
            dc    h'0414'     ; -----X-----X-X-- = ----------XX--XX--------XX--
            dc    h'0424'     ; -----X----X--X-- = ----------XX----XX------XX--
            dc    h'0248'     ; ------X--X--X--- = --------XX--------XX------XX
            dc    h'0228'     ; ------X---X-X--- = --------XX------XX--------XX
            dc    h'0444'     ; -----X---X---X-- = ----------XX------XX----XX--
            dc    h'0485'     ; -----X--X----X-X = ----------XX--------XX--XX--
            dc    h'0893'     ; ----X---X--X--XX = ------------XXXX----XXXX----
            dc    h'0060'     ; ---------XX----- = ----------------XXXX--------

sprite4B    anop
            dc    h'8540'     ; X----X-X-X------ = ------XX--XX------XX--------
            dc    h'4662'     ; -X---XX--XX---X- = ----XX--XXXX----XXXX--XX----
            dc    h'08A1'     ; ----X---X-X----X = ------------XX--XX--XX------
            dc    h'E968'     ; XXX-X--X-XX-X--- = --XXXXXX----XX--XXXX------XX
            dc    h'3A3E'     ; --XXX-X---XXXXX- = XXXX----XX--XXXXXX----XXXXXX
            dc    h'0CB1'     ; ----XX--X-XX---X = ----------XXXXXXXX--XX------
            dc    h'FF7E'     ; XXXXXXXX-XXXXXX- = XXXXXXXXXXXXXXXXXXXX--XXXXXX
            dc    h'0EF1'     ; ----XXX-XXXX---X = --------XXXXXXXXXXXXXX------
            dc    h'7E74'     ; -XXXXXX--XXX-X-- = XXXXXX--XXXXXXXXXXXX----XX--
            dc    h'1EFF'     ; ---XXXX-XXXXXXXX = XX------XXXXXXXXXXXXXXXXXXXX
            dc    h'8DF1'     ; X---XX-XXXXX---X = ------XX--XXXXXXXXXXXX------
            dc    h'6456'     ; -XX--X---X-X-XX- = --XXXX----XX--XX--XX--XXXX--
            dc    h'325C'     ; --XX--X--X-XXX-- = XXXX----XX----XX--XX----XXXX
            dc    h'9958'     ; X--XX--X-X-XX--- = XX----XX----XXXX--XX------XX
            dc    h'4491'     ; -X---X--X--X---X = ----XX----XX--XX----XX------
            dc    h'6693'     ; -XX--XX-X--X--XX = --XXXX--XXXX--XX----XXXX----

sprite4C    anop
            dc    h'0000'     ; ---------------- = ----------------------------
            dc    h'0A40'     ; ----X-X--X------ = --------XX--XX----XX--------
            dc    h'0C20'     ; ----XX----X----- = ----------XXXX--XX----------
            dc    h'68E5'     ; -XX-X---XXX--X-X = --XXXX------XX--XXXXXX--XX--
            dc    h'CB36'     ; XX--X-XX--XX-XX- = ----XXXXXX--XXXXXX----XXXX--
            dc    h'0CB1'     ; ----XX--X-XX---X = ----------XXXXXXXX--XX------
            dc    h'EF76'     ; XXX-XXXX-XXX-XX- = --XXXXXXXXXXXXXXXXXX--XXXX--
            dc    h'0EF5'     ; ----XXX-XXXX-X-X = --------XXXXXXXXXXXXXX--XX--
            dc    h'EF70'     ; XXX-XXXX-XXX---- = --XXXXXXXXXXXXXXXXXX--------
            dc    h'3EF7'     ; --XXXXX-XXXX-XXX = XXXX----XXXXXXXXXXXXXXXXXX--
            dc    h'8DF1'     ; X---XX-XXXXX---X = ------XX--XXXXXXXXXXXX------
            dc    h'6456'     ; -XX--X---X-X-XX- = --XXXX----XX--XX--XX--XXXX--
            dc    h'2254'     ; --X---X--X-X-X-- = --XX----XX----XX--XX----XX--
            dc    h'8D91'     ; X---XX-XX--X---X = ------XX--XXXXXX----XX------
            dc    h'C5B3'     ; XX---X-XX-XX--XX = ----XXXX--XX--XXXX--XXXX----
            dc    h'0030'     ; ----------XX---- = --------------XXXX----------

sprite4D    anop
            dc    h'0000'     ; ---------------- = ----------------------------
            dc    h'0000'     ; ---------------- = ----------------------------
            dc    h'0440'     ; -----X---X------ = ----------XX------XX--------
            dc    h'8960'     ; X---X--X-XX----- = ------XX----XX--XXXX--------
            dc    h'0A32'     ; ----X-X---XX--X- = --------XX--XXXXXX----XX----
            dc    h'0CB1'     ; ----XX--X-XX---X = ----------XXXXXXXX--XX------
            dc    h'CF70'     ; XX--XXXX-XXX---- = ----XXXXXXXXXXXXXXXX--------
            dc    h'0EF3'     ; ----XXX-XXXX--XX = --------XXXXXXXXXXXXXXXX----
            dc    h'CF70'     ; XX--XXXX-XXX---- = ----XXXXXXXXXXXXXXXX--------
            dc    h'4EF3'     ; -X--XXX-XXXX--XX = ----XX--XXXXXXXXXXXXXXXX----
            dc    h'8FF1'     ; X---XXXXXXXX---X = ------XXXXXXXXXXXXXXXX------
            dc    h'4452'     ; -X---X---X-X--X- = ----XX----XX--XX--XX--XX----
            dc    h'0A50'     ; ----X-X--X-X---- = --------XX--XXXX--XX--------
            dc    h'85D1'     ; X----X-XXX-X---X = ------XX--XX--XX--XXXX------
            dc    h'0030'     ; ----------XX---- = --------------XXXX----------
            dc    h'0000'     ; ---------------- = ----------------------------

sprite4E    anop
            dc    h'0000'     ; ---------------- = ----------------------------
            dc    h'0A40'     ; ----X-X--X------ = --------XX--XX----XX--------
            dc    h'0C20'     ; ----XX----X----- = ----------XXXX--XX----------
            dc    h'68E5'     ; -XX-X---XXX--X-X = --XXXX------XX--XXXXXX--XX--
            dc    h'CB36'     ; XX--X-XX--XX-XX- = ----XXXXXX--XXXXXX----XXXX--
            dc    h'0CB1'     ; ----XX--X-XX---X = ----------XXXXXXXX--XX------
            dc    h'EF76'     ; XXX-XXXX-XXX-XX- = --XXXXXXXXXXXXXXXXXX--XXXX--
            dc    h'0EF5'     ; ----XXX-XXXX-X-X = --------XXXXXXXXXXXXXX--XX--
            dc    h'EF70'     ; XXX-XXXX-XXX---- = --XXXXXXXXXXXXXXXXXX--------
            dc    h'3EF7'     ; --XXXXX-XXXX-XXX = XXXX----XXXXXXXXXXXXXXXXXX--
            dc    h'8DF1'     ; X---XX-XXXXX---X = ------XX--XXXXXXXXXXXX------
            dc    h'6456'     ; -XX--X---X-X-XX- = --XXXX----XX--XX--XX--XXXX--
            dc    h'2254'     ; --X---X--X-X-X-- = --XX----XX----XX--XX----XX--
            dc    h'8D91'     ; X---XX-XX--X---X = ------XX--XXXXXX----XX------
            dc    h'C5B3'     ; XX---X-XX-XX--XX = ----XXXX--XX--XXXX--XXXX----
            dc    h'0030'     ; ----------XX---- = --------------XXXX----------

sprite4F    anop
            dc    h'0600'     ; -----XX--------- = --------XXXX----------------
            dc    h'0600'     ; -----XX--------- = --------XXXX----------------
            dc    h'0600'     ; -----XX--------- = --------XXXX----------------
            dc    h'0600'     ; -----XX--------- = --------XXXX----------------
            dc    h'0600'     ; -----XX--------- = --------XXXX----------------
            dc    h'0600'     ; -----XX--------- = --------XXXX----------------
            dc    h'0600'     ; -----XX--------- = --------XXXX----------------
            dc    h'0600'     ; -----XX--------- = --------XXXX----------------
            dc    h'0600'     ; -----XX--------- = --------XXXX----------------
            dc    h'0600'     ; -----XX--------- = --------XXXX----------------
            dc    h'FF70'     ; XXXXXXXX-XXX---- = XXXXXXXXXXXXXXXXXXXX--------
            dc    h'0600'     ; -----XX--------- = --------XXXX----------------
            dc    h'6030'     ; -XX-------XX---- = --XXXX--------XXXX----------
            dc    h'B960'     ; X-XXX--X-XX----- = XXXX--XX----XX--XXXX--------
            dc    h'D950'     ; XX-XX--X-X-X---- = XX--XXXX----XXXX--XX--------
            dc    h'6030'     ; -XX-------XX---- = --XXXX--------XXXX----------

sprite50    anop
            dc    h'0810'     ; ----X------X---- = ------------XXXX------------
            dc    h'0810'     ; ----X------X---- = ------------XXXX------------
            dc    h'0810'     ; ----X------X---- = ------------XXXX------------
            dc    h'0810'     ; ----X------X---- = ------------XXXX------------
            dc    h'0810'     ; ----X------X---- = ------------XXXX------------
            dc    h'0810'     ; ----X------X---- = ------------XXXX------------
            dc    h'0810'     ; ----X------X---- = ------------XXXX------------
            dc    h'0810'     ; ----X------X---- = ------------XXXX------------
            dc    h'0810'     ; ----X------X---- = ------------XXXX------------
            dc    h'0810'     ; ----X------X---- = ------------XXXX------------
            dc    h'CFF3'     ; XX--XXXXXXXX--XX = ----XXXXXXXXXXXXXXXXXXXX----
            dc    h'0810'     ; ----X------X---- = ------------XXXX------------
            dc    h'83C1'     ; X-----XXXX-----X = ------XXXX--------XXXX------
            dc    h'4462'     ; -X---X---XX---X- = ----XX----XX----XXXX--XX----
            dc    h'C762'     ; XX---XXX-XX---X- = ----XXXXXXXX----XXXX--XX----
            dc    h'83C1'     ; X-----XXXX-----X = ------XXXX--------XXXX------

sprite51    anop
            dc    h'0030'     ; ----------XX---- = --------------XXXX----------
            dc    h'0030'     ; ----------XX---- = --------------XXXX----------
            dc    h'0030'     ; ----------XX---- = --------------XXXX----------
            dc    h'0030'     ; ----------XX---- = --------------XXXX----------
            dc    h'0030'     ; ----------XX---- = --------------XXXX----------
            dc    h'0030'     ; ----------XX---- = --------------XXXX----------
            dc    h'0030'     ; ----------XX---- = --------------XXXX----------
            dc    h'0030'     ; ----------XX---- = --------------XXXX----------
            dc    h'0030'     ; ----------XX---- = --------------XXXX----------
            dc    h'0030'     ; ----------XX---- = --------------XXXX----------
            dc    h'8FF7'     ; X---XXXXXXXX-XXX = ------XXXXXXXXXXXXXXXXXXXX--
            dc    h'0030'     ; ----------XX---- = --------------XXXX----------
            dc    h'0683'     ; -----XX-X-----XX = --------XXXX--------XXXX----
            dc    h'8DC5'     ; X---XX-XXX---X-X = ------XX--XXXX----XXXX--XX--
            dc    h'8B46'     ; X---X-XX-X---XX- = ------XXXX--XX----XX--XXXX--
            dc    h'0683'     ; -----XX-X-----XX = --------XXXX--------XXXX----

sprite52    anop
            dc    h'0060'     ; ---------XX----- = ----------------XXXX--------
            dc    h'0060'     ; ---------XX----- = ----------------XXXX--------
            dc    h'0060'     ; ---------XX----- = ----------------XXXX--------
            dc    h'0060'     ; ---------XX----- = ----------------XXXX--------
            dc    h'0060'     ; ---------XX----- = ----------------XXXX--------
            dc    h'0060'     ; ---------XX----- = ----------------XXXX--------
            dc    h'0060'     ; ---------XX----- = ----------------XXXX--------
            dc    h'0060'     ; ---------XX----- = ----------------XXXX--------
            dc    h'0060'     ; ---------XX----- = ----------------XXXX--------
            dc    h'0060'     ; ---------XX----- = ----------------XXXX--------
            dc    h'0EFF'     ; ----XXX-XXXXXXXX = --------XXXXXXXXXXXXXXXXXXXX
            dc    h'0060'     ; ---------XX----- = ----------------XXXX--------
            dc    h'0C06'     ; ----XX-------XX- = ----------XXXX--------XXXX--
            dc    h'029B'     ; ------X-X--XX-XX = --------XX----XX----XXXX--XX
            dc    h'0E9B'     ; ----XXX-X--XX-XX = --------XXXXXXXX----XXXX--XX
            dc    h'0C06'     ; ----XX-------XX- = ----------XXXX--------XXXX--

sprite53    anop
            dc    h'E100'     ; XXX----X-------- = --XXXXXX--------------------
            dc    h'A100'     ; X-X----X-------- = --XX--XX--------------------
            dc    h'E700'     ; XXX--XXX-------- = --XXXXXXXXXX----------------
            dc    h'C500'     ; XX---X-X-------- = ----XXXX--XX----------------
            dc    h'CF00'     ; XX--XXXX-------- = ----XXXXXXXXXX--------------
            dc    h'CF00'     ; XX--XXXX-------- = ----XXXXXXXXXX--------------
            dc    h'8300'     ; X-----XX-------- = ------XXXX------------------
            dc    h'C700'     ; XX---XXX-------- = ----XXXXXXXX----------------
            dc    h'EF00'     ; XXX-XXXX-------- = --XXXXXXXXXXXX--------------
            dc    h'EF00'     ; XXX-XXXX-------- = --XXXXXXXXXXXX--------------
            dc    h'FD10'     ; XXXXXX-X---X---- = XXXXXXXX--XXXXXX------------
            dc    h'FB10'     ; XXXXX-XX---X---- = XXXXXXXXXX--XXXX------------
            dc    h'C700'     ; XX---XXX-------- = ----XXXXXXXX----------------
            dc    h'ED00'     ; XXX-XX-X-------- = --XXXXXX--XXXX--------------
            dc    h'6E00'     ; -XX-XXX--------- = --XXXX--XXXXXX--------------
            dc    h'ED10'     ; XXX-XX-X---X---- = --XXXXXX--XXXXXX------------

sprite54    anop
            dc    h'8700'     ; X----XXX-------- = ------XXXXXX----------------
            dc    h'8500'     ; X----X-X-------- = ------XX--XX----------------
            dc    h'8F10'     ; X---XXXX---X---- = ------XXXXXXXXXX------------
            dc    h'0610'     ; -----XX----X---- = --------XXXX--XX------------
            dc    h'0E30'     ; ----XXX---XX---- = --------XXXXXXXXXX----------
            dc    h'0E30'     ; ----XXX---XX---- = --------XXXXXXXXXX----------
            dc    h'0C00'     ; ----XX---------- = ----------XXXX--------------
            dc    h'0E10'     ; ----XXX----X---- = --------XXXXXXXX------------
            dc    h'8B30'     ; X---X-XX--XX---- = ------XXXX--XXXXXX----------
            dc    h'8B30'     ; X---X-XX--XX---- = ------XXXX--XXXXXX----------
            dc    h'8B30'     ; X---X-XX--XX---- = ------XXXX--XXXXXX----------
            dc    h'8730'     ; X----XXX--XX---- = ------XXXXXX--XXXX----------
            dc    h'0E10'     ; ----XXX----X---- = --------XXXXXXXX------------
            dc    h'0C00'     ; ----XX---------- = ----------XXXX--------------
            dc    h'0C00'     ; ----XX---------- = ----------XXXX--------------
            dc    h'0C10'     ; ----XX-----X---- = ----------XXXXXX------------

sprite55    anop
            dc    h'0E00'     ; ----XXX--------- = --------XXXXXX--------------
            dc    h'0A00'     ; ----X-X--------- = --------XX--XX--------------
            dc    h'0E30'     ; ----XXX---XX---- = --------XXXXXXXXXX----------
            dc    h'0C20'     ; ----XX----X----- = ----------XXXX--XX----------
            dc    h'0C70'     ; ----XX---XXX---- = ----------XXXXXXXXXX--------
            dc    h'0C70'     ; ----XX---XXX---- = ----------XXXXXXXXXX--------
            dc    h'0810'     ; ----X------X---- = ------------XXXX------------
            dc    h'0C30'     ; ----XX----XX---- = ----------XXXXXXXX----------
            dc    h'0E70'     ; ----XXX--XXX---- = --------XXXXXXXXXXXX--------
            dc    h'0E70'     ; ----XXX--XXX---- = --------XXXXXXXXXXXX--------
            dc    h'8FE1'     ; X---XXXXXXX----X = ------XXXXXXXX--XXXXXX------
            dc    h'8FD1'     ; X---XXXXXX-X---X = ------XXXXXXXXXX--XXXX------
            dc    h'0C30'     ; ----XX----XX---- = ----------XXXXXXXX----------
            dc    h'0E60'     ; ----XXX--XX----- = --------XXXXXX--XXXX--------
            dc    h'0670'     ; -----XX--XXX---- = --------XXXX--XXXXXX--------
            dc    h'0EE1'     ; ----XXX-XXX----X = --------XXXXXX--XXXXXX------

sprite56    anop
            dc    h'0C10'     ; ----XX-----X---- = ----------XXXXXX------------
            dc    h'0410'     ; -----X-----X---- = ----------XX--XX------------
            dc    h'0C70'     ; ----XX---XXX---- = ----------XXXXXXXXXX--------
            dc    h'0850'     ; ----X----X-X---- = ------------XXXX--XX--------
            dc    h'08F1'     ; ----X---XXXX---X = ------------XXXXXXXXXX------
            dc    h'08F1'     ; ----X---XXXX---X = ------------XXXXXXXXXX------
            dc    h'0030'     ; ----------XX---- = --------------XXXX----------
            dc    h'0870'     ; ----X----XXX---- = ------------XXXXXXXX--------
            dc    h'0CF1'     ; ----XX--XXXX---X = ----------XXXXXXXXXXXX------
            dc    h'0EF3'     ; ----XXX-XXXX--XX = --------XXXXXXXXXXXXXXXX----
            dc    h'8FF7'     ; X---XXXXXXXX-XXX = ------XXXXXXXXXXXXXXXXXXXX--
            dc    h'8B76'     ; X---X-XX-XXX-XX- = ------XXXX--XXXXXXXX--XXXX--
            dc    h'08F1'     ; ----X---XXXX---X = ------------XXXXXXXXXX------
            dc    h'0CD5'     ; ----XX--XX-X-X-X = ----------XXXXXX--XXXX--XX--
            dc    h'0687'     ; -----XX-X----XXX = --------XXXX--------XXXXXX--
            dc    h'0E02'     ; ----XXX-------X- = --------XXXXXX--------XX----

sprite57    anop
            dc    h'0830'     ; ----X-----XX---- = ------------XXXXXX----------
            dc    h'0C20'     ; ----XX----X----- = ----------XXXX--XX----------
            dc    h'0E30'     ; ----XXX---XX---- = --------XXXXXXXXXX----------
            dc    h'0A10'     ; ----X-X----X---- = --------XX--XXXX------------
            dc    h'8F10'     ; X---XXXX---X---- = ------XXXXXXXXXX------------
            dc    h'8F10'     ; X---XXXX---X---- = ------XXXXXXXXXX------------
            dc    h'0C00'     ; ----XX---------- = ----------XXXX--------------
            dc    h'0E10'     ; ----XXX----X---- = --------XXXXXXXX------------
            dc    h'8F30'     ; X---XXXX--XX---- = ------XXXXXXXXXXXX----------
            dc    h'CF70'     ; XX--XXXX-XXX---- = ----XXXXXXXXXXXXXXXX--------
            dc    h'EFF1'     ; XXX-XXXXXXXX---X = --XXXXXXXXXXXXXXXXXXXX------
            dc    h'6ED1'     ; -XX-XXX-XX-X---X = --XXXX--XXXXXXXX--XXXX------
            dc    h'8F10'     ; X---XXXX---X---- = ------XXXXXXXXXX------------
            dc    h'AB30'     ; X-X-X-XX--XX---- = --XX--XXXX--XXXXXX----------
            dc    h'E160'     ; XXX----X-XX----- = --XXXXXX--------XXXX--------
            dc    h'4070'     ; -X-------XXX---- = ----XX--------XXXXXX--------

sprite58    anop
            dc    h'00E1'     ; --------XXX----X = ----------------XXXXXX------
            dc    h'00B1'     ; --------X-XX---X = --------------XXXX--XX------
            dc    h'08F1'     ; ----X---XXXX---X = ------------XXXXXXXXXX------
            dc    h'0860'     ; ----X----XX----- = ------------XX--XXXX--------
            dc    h'0C70'     ; ----XX---XXX---- = ----------XXXXXXXXXX--------
            dc    h'0C70'     ; ----XX---XXX---- = ----------XXXXXXXXXX--------
            dc    h'0030'     ; ----------XX---- = --------------XXXX----------
            dc    h'0870'     ; ----X----XXX---- = ------------XXXXXXXX--------
            dc    h'0CF1'     ; ----XX--XXXX---X = ----------XXXXXXXXXXXX------
            dc    h'0CF1'     ; ----XX--XXXX---X = ----------XXXXXXXXXXXX------
            dc    h'0EE3'     ; ----XXX-XXX---XX = --------XXXXXX--XXXXXXXX----
            dc    h'06F3'     ; -----XX-XXXX--XX = --------XXXX--XXXXXXXXXX----
            dc    h'0870'     ; ----X----XXX---- = ------------XXXXXXXX--------
            dc    h'0CE1'     ; ----XX--XXX----X = ----------XXXX--XXXXXX------
            dc    h'0CD1'     ; ----XX--XX-X---X = ----------XXXXXX--XXXX------
            dc    h'0EE1'     ; ----XXX-XXX----X = --------XXXXXX--XXXXXX------

sprite59    anop
            dc    h'00C3'     ; --------XX----XX = ------------------XXXXXX----
            dc    h'0062'     ; ---------XX---X- = ----------------XXXX--XX----
            dc    h'00F3'     ; --------XXXX--XX = --------------XXXXXXXXXX----
            dc    h'00D1'     ; --------XX-X---X = --------------XX--XXXX------
            dc    h'08F1'     ; ----X---XXXX---X = ------------XXXXXXXXXX------
            dc    h'08F1'     ; ----X---XXXX---X = ------------XXXXXXXXXX------
            dc    h'0060'     ; ---------XX----- = ----------------XXXX--------
            dc    h'00F1'     ; --------XXXX---X = --------------XXXXXXXX------
            dc    h'08F3'     ; ----X---XXXX--XX = ------------XXXXXXXXXXXX----
            dc    h'08B3'     ; ----X---X-XX--XX = ------------XXXXXX--XXXX----
            dc    h'08B3'     ; ----X---X-XX--XX = ------------XXXXXX--XXXX----
            dc    h'08D3'     ; ----X---XX-X--XX = ------------XXXX--XXXXXX----
            dc    h'00F1'     ; --------XXXX---X = --------------XXXXXXXX------
            dc    h'0060'     ; ---------XX----- = ----------------XXXX--------
            dc    h'0060'     ; ---------XX----- = ----------------XXXX--------
            dc    h'0070'     ; ---------XXX---- = --------------XXXXXX--------

sprite5A    anop
            dc    h'0087'     ; --------X----XXX = --------------------XXXXXX--
            dc    h'00C5'     ; --------XX---X-X = ------------------XXXX--XX--
            dc    h'00E7'     ; --------XXX--XXX = ----------------XXXXXXXXXX--
            dc    h'00A3'     ; --------X-X---XX = ----------------XX--XXXX----
            dc    h'00F3'     ; --------XXXX--XX = --------------XXXXXXXXXX----
            dc    h'00F3'     ; --------XXXX--XX = --------------XXXXXXXXXX----
            dc    h'00C1'     ; --------XX-----X = ------------------XXXX------
            dc    h'00E3'     ; --------XXX---XX = ----------------XXXXXXXX----
            dc    h'00F7'     ; --------XXXX-XXX = --------------XXXXXXXXXXXX--
            dc    h'00F7'     ; --------XXXX-XXX = --------------XXXXXXXXXXXX--
            dc    h'08BF'     ; ----X---X-XXXXXX = ------------XXXXXX--XXXXXXXX
            dc    h'08DF'     ; ----X---XX-XXXXX = ------------XXXX--XXXXXXXXXX
            dc    h'00E3'     ; --------XXX---XX = ----------------XXXXXXXX----
            dc    h'00B7'     ; --------X-XX-XXX = --------------XXXX--XXXXXX--
            dc    h'0076'     ; ---------XXX-XX- = --------------XXXXXX--XXXX--
            dc    h'08B7'     ; ----X---X-XX-XXX = ------------XXXXXX--XXXXXX--

sprite5B    anop
            dc    h'0000'     ; ---------------- = ----------------------------
            dc    h'0000'     ; ---------------- = ----------------------------
            dc    h'CFF3'     ; XX--XXXXXXXX--XX = ----XXXXXXXXXXXXXXXXXXXX----
            dc    h'6816'     ; -XX-X------X-XX- = --XXXX------XXXX------XXXX--
            dc    h'7A5E'     ; -XXXX-X--X-XXXX- = XXXXXX--XX--XXXX--XX--XXXXXX
            dc    h'724E'     ; -XXX--X--X--XXX- = XXXXXX--XX--------XX--XXXXXX
            dc    h'0E70'     ; ----XXX--XXX---- = --------XXXXXXXXXXXX--------
            dc    h'0C30'     ; ----XX----XX---- = ----------XXXXXXXX----------
            dc    h'0660'     ; -----XX--XX----- = --------XXXX----XXXX--------
            dc    h'0A50'     ; ----X-X--X-X---- = --------XX--XXXX--XX--------
            dc    h'8BD1'     ; X---X-XXXX-X---X = ------XXXX--XXXX--XXXX------
            dc    h'87E1'     ; X----XXXXXX----X = ------XXXXXX----XXXXXX------
            dc    h'CFF3'     ; XX--XXXXXXXX--XX = ----XXXXXXXXXXXXXXXXXXXX----
            dc    h'CFF3'     ; XX--XXXXXXXX--XX = ----XXXXXXXXXXXXXXXXXXXX----
            dc    h'CFF3'     ; XX--XXXXXXXX--XX = ----XXXXXXXXXXXXXXXXXXXX----
            dc    h'CFF3'     ; XX--XXXXXXXX--XX = ----XXXXXXXXXXXXXXXXXXXX----

sprite5C    anop
            dc    h'C700'     ; XX---XXX-------- = ----XXXXXXXX----------------
            dc    h'EF10'     ; XXX-XXXX---X---- = --XXXXXXXXXXXXXX------------
            dc    h'EFF1'     ; XXX-XXXXXXXX---X = --XXXXXXXXXXXXXXXXXXXX------
            dc    h'6816'     ; -XX-X------X-XX- = --XXXX------XXXX------XXXX--
            dc    h'025E'     ; ------X--X-XXXX- = --------XX----XX--XX--XXXXXX
            dc    h'024E'     ; ------X--X--XXX- = --------XX--------XX--XXXXXX
            dc    h'0E7E'     ; ----XXX--XXXXXX- = --------XXXXXXXXXXXX--XXXXXX
            dc    h'0C30'     ; ----XX----XX---- = ----------XXXXXXXX----------
            dc    h'0660'     ; -----XX--XX----- = --------XXXX----XXXX--------
            dc    h'0A50'     ; ----X-X--X-X---- = --------XX--XXXX--XX--------
            dc    h'8BD1'     ; X---X-XXXX-X---X = ------XXXX--XXXX--XXXX------
            dc    h'87E1'     ; X----XXXXXX----X = ------XXXXXX----XXXXXX------
            dc    h'CFF3'     ; XX--XXXXXXXX--XX = ----XXXXXXXXXXXXXXXXXXXX----
            dc    h'CFF3'     ; XX--XXXXXXXX--XX = ----XXXXXXXXXXXXXXXXXXXX----
            dc    h'CFF3'     ; XX--XXXXXXXX--XX = ----XXXXXXXXXXXXXXXXXXXX----
            dc    h'CFF3'     ; XX--XXXXXXXX--XX = ----XXXXXXXXXXXXXXXXXXXX----

sprite5D    anop
            dc    h'0000'     ; ---------------- = ----------------------------
            dc    h'0000'     ; ---------------- = ----------------------------
            dc    h'CFF3'     ; XX--XXXXXXXX--XX = ----XXXXXXXXXXXXXXXXXXXX----
            dc    h'6816'     ; -XX-X------X-XX- = --XXXX------XXXX------XXXX--
            dc    h'7A5E'     ; -XXXX-X--X-XXXX- = XXXXXX--XX--XXXX--XX--XXXXXX
            dc    h'724E'     ; -XXX--X--X--XXX- = XXXXXX--XX--------XX--XXXXXX
            dc    h'0E70'     ; ----XXX--XXX---- = --------XXXXXXXXXXXX--------
            dc    h'0C30'     ; ----XX----XX---- = ----------XXXXXXXX----------
            dc    h'0660'     ; -----XX--XX----- = --------XXXX----XXXX--------
            dc    h'0A50'     ; ----X-X--X-X---- = --------XX--XXXX--XX--------
            dc    h'8BD1'     ; X---X-XXXX-X---X = ------XXXX--XXXX--XXXX------
            dc    h'87E1'     ; X----XXXXXX----X = ------XXXXXX----XXXXXX------
            dc    h'CFF3'     ; XX--XXXXXXXX--XX = ----XXXXXXXXXXXXXXXXXXXX----
            dc    h'CFF3'     ; XX--XXXXXXXX--XX = ----XXXXXXXXXXXXXXXXXXXX----
            dc    h'CFF3'     ; XX--XXXXXXXX--XX = ----XXXXXXXXXXXXXXXXXXXX----
            dc    h'CFF3'     ; XX--XXXXXXXX--XX = ----XXXXXXXXXXXXXXXXXXXX----

sprite5E    anop
            dc    h'00E3'     ; --------XXX---XX = ----------------XXXXXXXX----
            dc    h'08F7'     ; ----X---XXXX-XXX = ------------XXXXXXXXXXXXXX--
            dc    h'8FF7'     ; X---XXXXXXXX-XXX = ------XXXXXXXXXXXXXXXXXXXX--
            dc    h'6816'     ; -XX-X------X-XX- = --XXXX------XXXX------XXXX--
            dc    h'7A40'     ; -XXXX-X--X------ = XXXXXX--XX--XX----XX--------
            dc    h'7240'     ; -XXX--X--X------ = XXXXXX--XX--------XX--------
            dc    h'7E70'     ; -XXXXXX--XXX---- = XXXXXX--XXXXXXXXXXXX--------
            dc    h'0C30'     ; ----XX----XX---- = ----------XXXXXXXX----------
            dc    h'0660'     ; -----XX--XX----- = --------XXXX----XXXX--------
            dc    h'0A50'     ; ----X-X--X-X---- = --------XX--XXXX--XX--------
            dc    h'8BD1'     ; X---X-XXXX-X---X = ------XXXX--XXXX--XXXX------
            dc    h'87E1'     ; X----XXXXXX----X = ------XXXXXX----XXXXXX------
            dc    h'CFF3'     ; XX--XXXXXXXX--XX = ----XXXXXXXXXXXXXXXXXXXX----
            dc    h'CFF3'     ; XX--XXXXXXXX--XX = ----XXXXXXXXXXXXXXXXXXXX----
            dc    h'CFF3'     ; XX--XXXXXXXX--XX = ----XXXXXXXXXXXXXXXXXXXX----
            dc    h'CFF3'     ; XX--XXXXXXXX--XX = ----XXXXXXXXXXXXXXXXXXXX----

sprite5F    anop
            dc    h'0600'     ; -----XX--------- = --------XXXX----------------
            dc    h'8D00'     ; X---XX-X-------- = ------XX--XXXX--------------
            dc    h'4610'     ; -X---XX----X---- = ----XX--XXXX--XX------------
            dc    h'2620'     ; --X--XX---X----- = --XX----XXXX----XX----------
            dc    h'1640'     ; ---X-XX--X------ = XX------XXXX------XX--------
            dc    h'1640'     ; ---X-XX--X------ = XX------XXXX------XX--------
            dc    h'2620'     ; --X--XX---X----- = --XX----XXXX----XX----------
            dc    h'4610'     ; -X---XX----X---- = ----XX--XXXX--XX------------
            dc    h'8D00'     ; X---XX-X-------- = ------XX--XXXX--------------
            dc    h'0600'     ; -----XX--------- = --------XXXX----------------
            dc    h'CD10'     ; XX--XX-X---X---- = ----XXXX--XXXXXX------------
            dc    h'2600'     ; --X--XX--------- = --XX----XXXX----------------
            dc    h'EF70'     ; XXX-XXXX-XXX---- = --XXXXXXXXXXXXXXXXXX--------
            dc    h'FF70'     ; XXXXXXXX-XXX---- = XXXXXXXXXXXXXXXXXXXX--------
            dc    h'2020'     ; --X-------X----- = --XX------------XX----------
            dc    h'4E00'     ; -X--XXX--------- = ----XX--XXXXXX--------------

sprite60    anop
            dc    h'0810'     ; ----X------X---- = ------------XXXX------------
            dc    h'0810'     ; ----X------X---- = ------------XXXX------------
            dc    h'0430'     ; -----X----XX---- = ----------XX--XXXX----------
            dc    h'0C30'     ; ----XX----XX---- = ----------XXXXXXXX----------
            dc    h'0A50'     ; ----X-X--X-X---- = --------XX--XXXX--XX--------
            dc    h'0A50'     ; ----X-X--X-X---- = --------XX--XXXX--XX--------
            dc    h'0C30'     ; ----XX----XX---- = ----------XXXXXXXX----------
            dc    h'0430'     ; -----X----XX---- = ----------XX--XXXX----------
            dc    h'0810'     ; ----X------X---- = ------------XXXX------------
            dc    h'0810'     ; ----X------X---- = ------------XXXX------------
            dc    h'0E60'     ; ----XXX--XX----- = --------XXXXXX--XXXX--------
            dc    h'0891'     ; ----X---X--X---X = ------------XXXX----XX------
            dc    h'CFF1'     ; XX--XXXXXXXX---X = ----XXXXXXXXXXXXXXXXXX------
            dc    h'CFF3'     ; XX--XXXXXXXX--XX = ----XXXXXXXXXXXXXXXXXXXX----
            dc    h'8181'     ; X------XX------X = ------XX------------XX------
            dc    h'0C50'     ; ----XX---X-X---- = ----------XXXXXX--XX--------

sprite61    anop
            dc    h'0030'     ; ----------XX---- = --------------XXXX----------
            dc    h'0030'     ; ----------XX---- = --------------XXXX----------
            dc    h'0030'     ; ----------XX---- = --------------XXXX----------
            dc    h'0030'     ; ----------XX---- = --------------XXXX----------
            dc    h'0010'     ; -----------X---- = --------------XX------------
            dc    h'0010'     ; -----------X---- = --------------XX------------
            dc    h'0030'     ; ----------XX---- = --------------XXXX----------
            dc    h'0030'     ; ----------XX---- = --------------XXXX----------
            dc    h'0030'     ; ----------XX---- = --------------XXXX----------
            dc    h'0030'     ; ----------XX---- = --------------XXXX----------
            dc    h'08B1'     ; ----X---X-XX---X = ------------XXXXXX--XX------
            dc    h'0232'     ; ------X---XX--X- = --------XX----XXXX----XX----
            dc    h'8FF7'     ; X---XXXXXXXX-XXX = ------XXXXXXXXXXXXXXXXXXXX--
            dc    h'8FF3'     ; X---XXXXXXXX--XX = ------XXXXXXXXXXXXXXXXXX----
            dc    h'0002'     ; --------------X- = ----------------------XX----
            dc    h'0CD1'     ; ----XX--XX-X---X = ----------XXXXXX--XXXX------

sprite62    anop
            dc    h'0060'     ; ---------XX----- = ----------------XXXX--------
            dc    h'00B1'     ; --------X-XX---X = --------------XXXX--XX------
            dc    h'0862'     ; ----X----XX---X- = ------------XX--XXXX--XX----
            dc    h'0862'     ; ----X----XX---X- = ------------XX--XXXX--XX----
            dc    h'0464'     ; -----X---XX--X-- = ----------XX----XXXX----XX--
            dc    h'0464'     ; -----X---XX--X-- = ----------XX----XXXX----XX--
            dc    h'0862'     ; ----X----XX---X- = ------------XX--XXXX--XX----
            dc    h'0862'     ; ----X----XX---X- = ------------XX--XXXX--XX----
            dc    h'00B1'     ; --------X-XX---X = --------------XXXX--XX------
            dc    h'0060'     ; ---------XX----- = ----------------XXXX--------
            dc    h'08E1'     ; ----X---XXX----X = ------------XX--XXXXXX------
            dc    h'0464'     ; -----X---XX--X-- = ----------XX----XXXX----XX--
            dc    h'0EFF'     ; ----XXX-XXXXXXXX = --------XXXXXXXXXXXXXXXXXXXX
            dc    h'0CFF'     ; ----XX--XXXXXXXX = ----------XXXXXXXXXXXXXXXXXX
            dc    h'0400'     ; -----X---------- = ----------XX----------------
            dc    h'08D3'     ; ----X---XX-X--XX = ------------XXXX--XXXXXX----

sprite63    anop
            dc    h'0000'     ; ---------------- = ----------------------------
            dc    h'0000'     ; ---------------- = ----------------------------
            dc    h'0000'     ; ---------------- = ----------------------------
            dc    h'0C30'     ; ----XX----XX---- = ----------XXXXXXXX----------
            dc    h'83C1'     ; X-----XXXX-----X = ------XXXX--------XXXX------
            dc    h'4002'     ; -X------------X- = ----XX----------------XX----
            dc    h'2004'     ; --X----------X-- = --XX--------------------XX--
            dc    h'1008'     ; ---X--------X--- = XX------------------------XX
            dc    h'1008'     ; ---X--------X--- = XX------------------------XX
            dc    h'1008'     ; ---X--------X--- = XX------------------------XX
            dc    h'2004'     ; --X----------X-- = --XX--------------------XX--
            dc    h'500A'     ; -X-X--------X-X- = XX--XX----------------XX--XX
            dc    h'A3C5'     ; X-X---XXXX---X-X = --XX--XXXX--------XXXX--XX--
            dc    h'9DB9'     ; X--XXX-XX-XXX--X = XX----XX--XXXXXXXX--XX----XX
            dc    h'4422'     ; -X---X----X---X- = ----XX----XX----XX----XX----
            dc    h'0420'     ; -----X----X----- = ----------XX----XX----------

sprite64    anop
            dc    h'0000'     ; ---------------- = ----------------------------
            dc    h'0000'     ; ---------------- = ----------------------------
            dc    h'0000'     ; ---------------- = ----------------------------
            dc    h'0C30'     ; ----XX----XX---- = ----------XXXXXXXX----------
            dc    h'83C1'     ; X-----XXXX-----X = ------XXXX--------XXXX------
            dc    h'4002'     ; -X------------X- = ----XX----------------XX----
            dc    h'2004'     ; --X----------X-- = --XX--------------------XX--
            dc    h'1008'     ; ---X--------X--- = XX------------------------XX
            dc    h'F18F'     ; XXXX---XX---XXXX = XXXXXXXX------------XXXXXXXX
            dc    h'5E7A'     ; -X-XXXX--XXXX-X- = XX--XX--XXXXXXXXXXXX--XX--XX
            dc    h'ADB5'     ; X-X-XX-XX-XX-X-X = --XX--XX--XXXXXXXX--XX--XX--
            dc    h'4422'     ; -X---X----X---X- = ----XX----XX----XX----XX----
            dc    h'83C1'     ; X-----XXXX-----X = ------XXXX--------XXXX------
            dc    h'0C30'     ; ----XX----XX---- = ----------XXXXXXXX----------
            dc    h'0000'     ; ---------------- = ----------------------------
            dc    h'0000'     ; ---------------- = ----------------------------

sprite65    anop
            dc    h'0240'     ; ------X--X------ = --------XX--------XX--------
            dc    h'0240'     ; ------X--X------ = --------XX--------XX--------
            dc    h'4422'     ; -X---X----X---X- = ----XX----XX----XX----XX----
            dc    h'9DB9'     ; X--XXX-XX-XXX--X = XX----XX--XXXXXXXX--XX----XX
            dc    h'A3C5'     ; X-X---XXXX---X-X = --XX--XXXX--------XXXX--XX--
            dc    h'4C32'     ; -X--XX----XX--X- = ----XX----XXXXXXXX----XX----
            dc    h'2E74'     ; --X-XXX--XXX-X-- = --XX----XXXXXXXXXXXX----XX--
            dc    h'1668'     ; ---X-XX--XX-X--- = XX------XXXX----XXXX------XX
            dc    h'1668'     ; ---X-XX--XX-X--- = XX------XXXX----XXXX------XX
            dc    h'1E78'     ; ---XXXX--XXXX--- = XX------XXXXXXXXXXXX------XX
            dc    h'2C34'     ; --X-XX----XX-X-- = --XX------XXXXXXXX------XX--
            dc    h'4002'     ; -X------------X- = ----XX----------------XX----
            dc    h'83C1'     ; X-----XXXX-----X = ------XXXX--------XXXX------
            dc    h'0C30'     ; ----XX----XX---- = ----------XXXXXXXX----------
            dc    h'0000'     ; ---------------- = ----------------------------
            dc    h'0000'     ; ---------------- = ----------------------------

sprite66    anop
            dc    h'0000'     ; ---------------- = ----------------------------
            dc    h'0000'     ; ---------------- = ----------------------------
            dc    h'0000'     ; ---------------- = ----------------------------
            dc    h'0C30'     ; ----XX----XX---- = ----------XXXXXXXX----------
            dc    h'83C1'     ; X-----XXXX-----X = ------XXXX--------XXXX------
            dc    h'4422'     ; -X---X----X---X- = ----XX----XX----XX----XX----
            dc    h'A5A5'     ; X-X--X-XX-X--X-X = --XX--XX--XX----XX--XX--XX--
            dc    h'DFFB'     ; XX-XXXXXXXXXX-XX = XX--XXXXXXXXXXXXXXXXXXXX--XX
            dc    h'76EF'     ; -XXX-XX-XXX-XXXX = XXXXXX--XXXX----XXXXXXXXXXXX
            dc    h'1E78'     ; ---XXXX--XXXX--- = XX------XXXXXXXXXXXX------XX
            dc    h'2C34'     ; --X-XX----XX-X-- = --XX------XXXXXXXX------XX--
            dc    h'4002'     ; -X------------X- = ----XX----------------XX----
            dc    h'83C1'     ; X-----XXXX-----X = ------XXXX--------XXXX------
            dc    h'0C30'     ; ----XX----XX---- = ----------XXXXXXXX----------
            dc    h'0000'     ; ---------------- = ----------------------------
            dc    h'0000'     ; ---------------- = ----------------------------

sprite67    anop
            dc    h'6030'     ; -XX-------XX---- = --XXXX--------XXXX----------
            dc    h'D940'     ; XX-XX--X-X------ = XX--XXXX----XX----XX--------
            dc    h'D970'     ; XX-XX--X-XXX---- = XX--XXXX----XXXXXXXX--------
            dc    h'6030'     ; -XX-------XX---- = --XXXX--------XXXX----------
            dc    h'0600'     ; -----XX--------- = --------XXXX----------------
            dc    h'FF70'     ; XXXXXXXX-XXX---- = XXXXXXXXXXXXXXXXXXXX--------
            dc    h'A920'     ; X-X-X--X--X----- = --XX--XX----XX--XX----------
            dc    h'8900'     ; X---X--X-------- = ------XX----XX--------------
            dc    h'8900'     ; X---X--X-------- = ------XX----XX--------------
            dc    h'8F00'     ; X---XXXX-------- = ------XXXXXXXX--------------
            dc    h'0600'     ; -----XX--------- = --------XXXX----------------
            dc    h'0600'     ; -----XX--------- = --------XXXX----------------
            dc    h'0600'     ; -----XX--------- = --------XXXX----------------
            dc    h'0600'     ; -----XX--------- = --------XXXX----------------
            dc    h'8F00'     ; X---XXXX-------- = ------XXXXXXXX--------------
            dc    h'CF10'     ; XX--XXXX---X---- = ----XXXXXXXXXXXX------------

sprite68    anop
            dc    h'83C1'     ; X-----XXXX-----X = ------XXXX--------XXXX------
            dc    h'4462'     ; -X---X---XX---X- = ----XX----XX----XXXX--XX----
            dc    h'C762'     ; XX---XXX-XX---X- = ----XXXXXXXX----XXXX--XX----
            dc    h'83C1'     ; X-----XXXX-----X = ------XXXX--------XXXX------
            dc    h'0810'     ; ----X------X---- = ------------XXXX------------
            dc    h'CFF3'     ; XX--XXXXXXXX--XX = ----XXXXXXXXXXXXXXXXXXXX----
            dc    h'85A1'     ; X----X-XX-X----X = ------XX--XX----XX--XX------
            dc    h'0420'     ; -----X----X----- = ----------XX----XX----------
            dc    h'0420'     ; -----X----X----- = ----------XX----XX----------
            dc    h'0C30'     ; ----XX----XX---- = ----------XXXXXXXX----------
            dc    h'0810'     ; ----X------X---- = ------------XXXX------------
            dc    h'0810'     ; ----X------X---- = ------------XXXX------------
            dc    h'0C30'     ; ----XX----XX---- = ----------XXXXXXXX----------
            dc    h'0E70'     ; ----XXX--XXX---- = --------XXXXXXXXXXXX--------
            dc    h'0000'     ; ---------------- = ----------------------------
            dc    h'0000'     ; ---------------- = ----------------------------

sprite69    anop
            dc    h'0683'     ; -----XX-X-----XX = --------XXXX--------XXXX----
            dc    h'8BC7'     ; X---X-XXXX---XXX = ------XXXX--XX----XXXXXXXX--
            dc    h'8B44'     ; X---X-XX-X---X-- = ------XXXX--XX----XX----XX--
            dc    h'0683'     ; -----XX-X-----XX = --------XXXX--------XXXX----
            dc    h'0030'     ; ----------XX---- = --------------XXXX----------
            dc    h'8FF7'     ; X---XXXXXXXX-XXX = ------XXXXXXXXXXXXXXXXXXXX--
            dc    h'0A42'     ; ----X-X--X----X- = --------XX--XX----XX--XX----
            dc    h'0840'     ; ----X----X------ = ------------XX----XX--------
            dc    h'0840'     ; ----X----X------ = ------------XX----XX--------
            dc    h'0870'     ; ----X----XXX---- = ------------XXXXXXXX--------
            dc    h'0870'     ; ----X----XXX---- = ------------XXXXXXXX--------
            dc    h'0CF1'     ; ----XX--XXXX---X = ----------XXXXXXXXXXXX------
            dc    h'0000'     ; ---------------- = ----------------------------
            dc    h'0000'     ; ---------------- = ----------------------------
            dc    h'0000'     ; ---------------- = ----------------------------
            dc    h'0000'     ; ---------------- = ----------------------------

sprite6A    anop
            dc    h'0C06'     ; ----XX-------XX- = ----------XXXX--------XXXX--
            dc    h'0E9D'     ; ----XXX-X--XXX-X = --------XXXXXXXX----XX--XXXX
            dc    h'029D'     ; ------X-X--XXX-X = --------XX----XX----XX--XXXX
            dc    h'0C06'     ; ----XX-------XX- = ----------XXXX--------XXXX--
            dc    h'0060'     ; ---------XX----- = ----------------XXXX--------
            dc    h'0EFF'     ; ----XXX-XXXXXXXX = --------XXXXXXXXXXXXXXXXXXXX
            dc    h'0495'     ; -----X--X--X-X-X = ----------XX--XX----XX--XX--
            dc    h'0091'     ; --------X--X---X = --------------XX----XX------
            dc    h'0091'     ; --------X--X---X = --------------XX----XX------
            dc    h'00F1'     ; --------XXXX---X = --------------XXXXXXXX------
            dc    h'0060'     ; ---------XX----- = ----------------XXXX--------
            dc    h'0060'     ; ---------XX----- = ----------------XXXX--------
            dc    h'00F1'     ; --------XXXX---X = --------------XXXXXXXX------
            dc    h'08F3'     ; ----X---XXXX--XX = ------------XXXXXXXXXXXX----
            dc    h'0000'     ; ---------------- = ----------------------------
            dc    h'0000'     ; ---------------- = ----------------------------

sprite6B    anop
            dc    h'0810'     ; ----X------X---- = ------------XXXX------------
            dc    h'FFFF'     ; XXXXXXXXXXXXXXXX = XXXXXXXXXXXXXXXXXXXXXXXXXXXX
            dc    h'5A5A'     ; -X-XX-X--X-XX-X- = XX--XX--XX--XXXX--XX--XX--XX
            dc    h'FFFF'     ; XXXXXXXXXXXXXXXX = XXXXXXXXXXXXXXXXXXXXXXXXXXXX
            dc    h'8991'     ; X---X--XX--X---X = ------XX----XXXX----XX------
            dc    h'4242'     ; -X----X--X----X- = ----XX--XX--------XX--XX----
            dc    h'85A1'     ; X----X-XX-X----X = ------XX--XX----XX--XX------
            dc    h'0A50'     ; ----X-X--X-X---- = --------XX--XXXX--XX--------
            dc    h'0420'     ; -----X----X----- = ----------XX----XX----------
            dc    h'0810'     ; ----X------X---- = ------------XXXX------------
            dc    h'0810'     ; ----X------X---- = ------------XXXX------------
            dc    h'0420'     ; -----X----X----- = ----------XX----XX----------
            dc    h'0A50'     ; ----X-X--X-X---- = --------XX--XXXX--XX--------
            dc    h'85A1'     ; X----X-XX-X----X = ------XX--XX----XX--XX------
            dc    h'4242'     ; -X----X--X----X- = ----XX--XX--------XX--XX----
            dc    h'8181'     ; X------XX------X = ------XX------------XX------

sprite6C    anop
            dc    h'0000'     ; ---------------- = ----------------------------
            dc    h'0000'     ; ---------------- = ----------------------------
            dc    h'0810'     ; ----X------X---- = ------------XXXX------------
            dc    h'FFFF'     ; XXXXXXXXXXXXXXXX = XXXXXXXXXXXXXXXXXXXXXXXXXXXX
            dc    h'5A5A'     ; -X-XX-X--X-XX-X- = XX--XX--XX--XXXX--XX--XX--XX
            dc    h'FFFF'     ; XXXXXXXXXXXXXXXX = XXXXXXXXXXXXXXXXXXXXXXXXXXXX
            dc    h'8991'     ; X---X--XX--X---X = ------XX----XXXX----XX------
            dc    h'4242'     ; -X----X--X----X- = ----XX--XX--------XX--XX----
            dc    h'85A1'     ; X----X-XX-X----X = ------XX--XX----XX--XX------
            dc    h'0A50'     ; ----X-X--X-X---- = --------XX--XXXX--XX--------
            dc    h'0420'     ; -----X----X----- = ----------XX----XX----------
            dc    h'0810'     ; ----X------X---- = ------------XXXX------------
            dc    h'0810'     ; ----X------X---- = ------------XXXX------------
            dc    h'4420'     ; -X---X----X----- = ----XX----XX----XX----------
            dc    h'2A52'     ; --X-X-X--X-X--X- = --XX----XX--XXXX--XX--XX----
            dc    h'85A5'     ; X----X-XX-X--X-X = ------XX--XX----XX--XX--XX--

sprite6D    anop
            dc    h'0000'     ; ---------------- = ----------------------------
            dc    h'0000'     ; ---------------- = ----------------------------
            dc    h'0000'     ; ---------------- = ----------------------------
            dc    h'000E'     ; ------------XXX- = ----------------------XXXXXX
            dc    h'08FB'     ; ----X---XXXXX-XX = ------------XXXXXXXXXXXX--XX
            dc    h'FF5E'     ; XXXXXXXX-X-XXXX- = XXXXXXXXXXXXXXXX--XX--XXXXXX
            dc    h'5AF1'     ; -X-XX-X-XXXX---X = XX--XX--XX--XXXXXXXXXX------
            dc    h'FF10'     ; XXXXXXXX---X---- = XXXXXXXXXXXXXXXX------------
            dc    h'0810'     ; ----X------X---- = ------------XXXX------------
            dc    h'0000'     ; ---------------- = ----------------------------
            dc    h'8522'     ; X----X-X--X---X- = ------XX--XX----XX----XX----
            dc    h'2A54'     ; --X-X-X--X-X-X-- = --XX----XX--XXXX--XX----XX--
            dc    h'0422'     ; -----X----X---X- = ----------XX----XX----XX----
            dc    h'4814'     ; -X--X------X-X-- = ----XX------XXXX--------XX--
            dc    h'0A50'     ; ----X-X--X-X---- = --------XX--XXXX--XX--------
            dc    h'44A1'     ; -X---X--X-X----X = ----XX----XX----XX--XX------

sprite6E    anop
            dc    h'0000'     ; ---------------- = ----------------------------
            dc    h'0000'     ; ---------------- = ----------------------------
            dc    h'0000'     ; ---------------- = ----------------------------
            dc    h'0020'     ; ----------X----- = ----------------XX----------
            dc    h'0804'     ; ----X--------X-- = ------------XX----------XX--
            dc    h'004A'     ; ---------X--X-X- = ------------------XX--XX--XX
            dc    h'0897'     ; ----X---X--X-XXX = ------------XXXX----XXXXXX--
            dc    h'0E52'     ; ----XXX--X-X--X- = --------XXXXXXXX--XX--XX----
            dc    h'3A91'     ; --XXX-X-X--X---X = XXXX----XX--XXXX----XX------
            dc    h'DD14'     ; XX-XXX-X---X-X-- = XX--XXXX--XXXXXX--------XX--
            dc    h'7891'     ; -XXXX---X--X---X = XXXXXX------XXXX----XX------
            dc    h'C108'     ; XX-----X----X--- = ----XXXX------------------XX
            dc    h'0C32'     ; ----XX----XX--X- = ----------XXXXXXXX----XX----
            dc    h'3891'     ; --XXX---X--X---X = XXXX--------XXXX----XX------
            dc    h'8D14'     ; X---XX-X---X-X-- = ------XX--XXXXXX--------XX--
            dc    h'48F3'     ; -X--X---XXXX--XX = ----XX------XXXXXXXXXXXX----

sprite6F    anop
            dc    h'0000'     ; ---------------- = --------------------------
            dc    h'0000'     ; ---------------- = --------------------------
            dc    h'0000'     ; ---------------- = --------------------------
            dc    h'0210'     ; ------X----X---- = --------XX----XX----------
            dc    h'0000'     ; ---------------- = --------------------------
            dc    h'0000'     ; ---------------- = --------------------------
            dc    h'4002'     ; -X------------X- = ----XX----------------XX--
            dc    h'0024'     ; ----------X--X-- = ----------------XX------XX
            dc    h'0842'     ; ----X----X----X- = ------------XX----XX--XX--
            dc    h'0E20'     ; ----XXX---X----- = --------XXXXXX--XX--------
            dc    h'2A00'     ; --X-X-X--------- = --XX----XX--XX------------
            dc    h'CD02'     ; XX--XX-X------X- = ----XXXX--XXXX--------XX--
            dc    h'6800'     ; -XX-X----------- = --XXXX------XX------------
            dc    h'C104'     ; XX-----X-----X-- = ----XXXX----------------XX
            dc    h'0412'     ; -----X-----X--X- = ----------XX--XX------XX--
            dc    h'3881'     ; --XXX---X------X = XXXX--------XX------XX----

sprite70    anop
            dc    h'0000'     ; ---------------- = ----------------------------
            dc    h'0000'     ; ---------------- = ----------------------------
            dc    h'0000'     ; ---------------- = ----------------------------
            dc    h'0000'     ; ---------------- = ----------------------------
            dc    h'0000'     ; ---------------- = ----------------------------
            dc    h'0800'     ; ----X----------- = ------------XX--------------
            dc    h'0000'     ; ---------------- = ----------------------------
            dc    h'0020'     ; ----------X----- = ----------------XX----------
            dc    h'8181'     ; X------XX------X = ------XX------------XX------
            dc    h'0A02'     ; ----X-X-------X- = --------XX--XX--------XX----
            dc    h'0020'     ; ----------X----- = ----------------XX----------
            dc    h'6400'     ; -XX--X---------- = --XXXX----XX----------------
            dc    h'48B1'     ; -X--X---X-XX---X = ----XX------XXXXXX--XX------
            dc    h'0220'     ; ------X---X----- = --------XX------XX----------
            dc    h'0850'     ; ----X----X-X---- = ------------XXXX--XX--------
            dc    h'8D30'     ; X---XX-X--XX---- = ------XX--XXXXXXXX----------

sprite71    anop
            dc    h'0000'     ; ---------------- = ----------------------------
            dc    h'0000'     ; ---------------- = ----------------------------
            dc    h'0000'     ; ---------------- = ----------------------------
            dc    h'0000'     ; ---------------- = ----------------------------
            dc    h'0000'     ; ---------------- = ----------------------------
            dc    h'0000'     ; ---------------- = ----------------------------
            dc    h'0000'     ; ---------------- = ----------------------------
            dc    h'0000'     ; ---------------- = ----------------------------
            dc    h'0800'     ; ----X----------- = ------------XX--------------
            dc    h'0020'     ; ----------X----- = ----------------XX----------
            dc    h'8100'     ; X------X-------- = ------XX--------------------
            dc    h'0000'     ; ---------------- = ----------------------------
            dc    h'0440'     ; -----X---X------ = ----------XX------XX--------
            dc    h'00B1'     ; --------X-XX---X = --------------XXXX--XX------
            dc    h'4820'     ; -X--X-----X----- = ----XX------XX--XX----------
            dc    h'0650'     ; -----XX--X-X---- = --------XXXX--XX--XX--------

sprite72    anop
            dc    h'0000'     ; ---------------- = ----------------------------
            dc    h'0000'     ; ---------------- = ----------------------------
            dc    h'0000'     ; ---------------- = ----------------------------
            dc    h'0000'     ; ---------------- = ----------------------------
            dc    h'0000'     ; ---------------- = ----------------------------
            dc    h'0000'     ; ---------------- = ----------------------------
            dc    h'0000'     ; ---------------- = ----------------------------
            dc    h'0000'     ; ---------------- = ----------------------------
            dc    h'0000'     ; ---------------- = ----------------------------
            dc    h'0000'     ; ---------------- = ----------------------------
            dc    h'0000'     ; ---------------- = ----------------------------
            dc    h'0000'     ; ---------------- = ----------------------------
            dc    h'0020'     ; ----------X----- = ----------------XX----------
            dc    h'0200'     ; ------X--------- = --------XX------------------
            dc    h'0810'     ; ----X------X---- = ------------XXXX------------
            dc    h'0C30'     ; ----XX----XX---- = ----------XXXXXXXX----------

sprite73    anop
            dc    h'6006'     ; -XX----------XX- = --XXXX----------------XXXX--
            dc    h'9FF9'     ; X--XXXXXXXXXX--X = XX----XXXXXXXXXXXXXXXX----XX
            dc    h'9FF9'     ; X--XXXXXXXXXX--X = XX----XXXXXXXXXXXXXXXX----XX
            dc    h'6006'     ; -XX----------XX- = --XXXX----------------XXXX--
            dc    h'0810'     ; ----X------X---- = ------------XXXX------------
            dc    h'FFFF'     ; XXXXXXXXXXXXXXXX = XXXXXXXXXXXXXXXXXXXXXXXXXXXX
            dc    h'1008'     ; ---X--------X--- = XX------------------------XX
            dc    h'5AA9'     ; -X-XX-X-X-X-X--X = XX--XX--XX--XX--XX--XX----XX
            dc    h'9FFB'     ; X--XXXXXXXXXX-XX = XX----XXXXXXXXXXXXXXXXXX--XX
            dc    h'D5D9'     ; XX-X-X-XXX-XX--X = XX--XXXX--XX--XX--XXXX----XX
            dc    h'918B'     ; X--X---XX---X-XX = XX----XX------------XXXX--XX
            dc    h'D5D9'     ; XX-X-X-XXX-XX--X = XX--XXXX--XX--XX--XXXX----XX
            dc    h'9FFB'     ; X--XXXXXXXXXX-XX = XX----XXXXXXXXXXXXXXXXXX--XX
            dc    h'5AA9'     ; -X-XX-X-X-X-X--X = XX--XX--XX--XX--XX--XX----XX
            dc    h'1008'     ; ---X--------X--- = XX------------------------XX
            dc    h'FFFF'     ; XXXXXXXXXXXXXXXX = XXXXXXXXXXXXXXXXXXXXXXXXXXXX

sprite74    anop
            dc    h'87E1'     ; X----XXXXXX----X = ------XXXXXX----XXXXXX------
            dc    h'4872'     ; -X--X----XXX--X- = ----XX------XXXXXXXX--XX----
            dc    h'4872'     ; -X--X----XXX--X- = ----XX------XXXXXXXX--XX----
            dc    h'87E1'     ; X----XXXXXX----X = ------XXXXXX----XXXXXX------
            dc    h'0810'     ; ----X------X---- = ------------XXXX------------
            dc    h'FFFF'     ; XXXXXXXXXXXXXXXX = XXXXXXXXXXXXXXXXXXXXXXXXXXXX
            dc    h'B55A'     ; X-XX-X-X-X-XX-X- = XXXX--XX--XX--XX--XX--XX--XX
            dc    h'DFFF'     ; XX-XXXXXXXXXXXXX = XX--XXXXXXXXXXXXXXXXXXXXXXXX
            dc    h'7AAB'     ; -XXXX-X-X-X-X-XX = XXXXXX--XX--XX--XX--XXXX--XX
            dc    h'D10E'     ; XX-X---X----XXX- = XX--XXXX--------------XXXXXX
            dc    h'749B'     ; -XXX-X--X--XX-XX = XXXXXX----XX--XX----XXXX--XX
            dc    h'D10E'     ; XX-X---X----XXX- = XX--XXXX--------------XXXXXX
            dc    h'7AAB'     ; -XXXX-X-X-X-X-XX = XXXXXX--XX--XX--XX--XXXX--XX
            dc    h'DFFF'     ; XX-XXXXXXXXXXXXX = XX--XXXXXXXXXXXXXXXXXXXXXXXX
            dc    h'B55A'     ; X-XX-X-X-X-XX-X- = XXXX--XX--XX--XX--XX--XX--XX
            dc    h'FFFF'     ; XXXXXXXXXXXXXXXX = XXXXXXXXXXXXXXXXXXXXXXXXXXXX

sprite75    anop
            dc    h'0C30'     ; ----XX----XX---- = ----------XXXXXXXX----------
            dc    h'0240'     ; ------X--X------ = --------XX--------XX--------
            dc    h'0240'     ; ------X--X------ = --------XX--------XX--------
            dc    h'0C30'     ; ----XX----XX---- = ----------XXXXXXXX----------
            dc    h'0810'     ; ----X------X---- = ------------XXXX------------
            dc    h'FFFF'     ; XXXXXXXXXXXXXXXX = XXXXXXXXXXXXXXXXXXXXXXXXXXXX
            dc    h'FFFF'     ; XXXXXXXXXXXXXXXX = XXXXXXXXXXXXXXXXXXXXXXXXXXXX
            dc    h'B55E'     ; X-XX-X-X-X-XXXX- = XXXX--XX--XX--XX--XX--XXXXXX
            dc    h'700C'     ; -XXX--------XX-- = XXXXXX------------------XXXX
            dc    h'3A2E'     ; --XXX-X---X-XXX- = XXXX----XX--XX--XX----XXXXXX
            dc    h'7C7C'     ; -XXXXX---XXXXX-- = XXXXXX----XXXXXXXXXX----XXXX
            dc    h'3A2E'     ; --XXX-X---X-XXX- = XXXX----XX--XX--XX----XXXXXX
            dc    h'700C'     ; -XXX--------XX-- = XXXXXX------------------XXXX
            dc    h'B55E'     ; X-XX-X-X-X-XXXX- = XXXX--XX--XX--XX--XX--XXXXXX
            dc    h'FFFF'     ; XXXXXXXXXXXXXXXX = XXXXXXXXXXXXXXXXXXXXXXXXXXXX
            dc    h'FFFF'     ; XXXXXXXXXXXXXXXX = XXXXXXXXXXXXXXXXXXXXXXXXXXXX

sprite76    anop
            dc    h'87E1'     ; X----XXXXXX----X = ------XXXXXX----XXXXXX------
            dc    h'4E12'     ; -X--XXX----X--X- = ----XX--XXXXXXXX------XX----
            dc    h'4E12'     ; -X--XXX----X--X- = ----XX--XXXXXXXX------XX----
            dc    h'87E1'     ; X----XXXXXX----X = ------XXXXXX----XXXXXX------
            dc    h'0810'     ; ----X------X---- = ------------XXXX------------
            dc    h'FFFF'     ; XXXXXXXXXXXXXXXX = XXXXXXXXXXXXXXXXXXXXXXXXXXXX
            dc    h'5AAD'     ; -X-XX-X-X-X-XX-X = XX--XX--XX--XX--XX--XX--XXXX
            dc    h'3008'     ; --XX--------X--- = XXXX----------------------XX
            dc    h'955C'     ; X--X-X-X-X-XXX-- = XX----XX--XX--XX--XX----XXXX
            dc    h'3EF9'     ; --XXXXX-XXXXX--X = XXXX----XXXXXXXXXXXXXX----XX
            dc    h'9B6C'     ; X--XX-XX-XX-XX-- = XX----XXXX--XX--XXXX----XXXX
            dc    h'3EF9'     ; --XXXXX-XXXXX--X = XXXX----XXXXXXXXXXXXXX----XX
            dc    h'955C'     ; X--X-X-X-X-XXX-- = XX----XX--XX--XX--XX----XXXX
            dc    h'3008'     ; --XX--------X--- = XXXX----------------------XX
            dc    h'5AAD'     ; -X-XX-X-X-X-XX-X = XX--XX--XX--XX--XX--XX--XXXX
            dc    h'FFFF'     ; XXXXXXXXXXXXXXXX = XXXXXXXXXXXXXXXXXXXXXXXXXXXX

sprite77    anop
            dc    h'0000'     ; ---------------- = ----------------------------
            dc    h'0000'     ; ---------------- = ----------------------------
            dc    h'0000'     ; ---------------- = ----------------------------
            dc    h'0000'     ; ---------------- = ----------------------------
            dc    h'0000'     ; ---------------- = ----------------------------
            dc    h'0000'     ; ---------------- = ----------------------------
            dc    h'0000'     ; ---------------- = ----------------------------
            dc    h'0000'     ; ---------------- = ----------------------------
            dc    h'0000'     ; ---------------- = ----------------------------
            dc    h'0000'     ; ---------------- = ----------------------------
            dc    h'FF70'     ; XXXXXXXX-XXX---- = XXXXXXXXXXXXXXXXXXXX--------
            dc    h'1070'     ; ---X-----XXX---- = XX------------XXXXXX--------
            dc    h'FF70'     ; XXXXXXXX-XXX---- = XXXXXXXXXXXXXXXXXXXX--------
            dc    h'1840'     ; ---XX----X------ = XX----------XX----XX--------
            dc    h'FF40'     ; XXXXXXXX-X------ = XXXXXXXXXXXXXX----XX--------
            dc    h'FF70'     ; XXXXXXXX-XXX---- = XXXXXXXXXXXXXXXXXXXX--------

sprite78    anop
            dc    h'0000'     ; ---------------- = ----------------------------
            dc    h'0000'     ; ---------------- = ----------------------------
            dc    h'0000'     ; ---------------- = ----------------------------
            dc    h'0000'     ; ---------------- = ----------------------------
            dc    h'0000'     ; ---------------- = ----------------------------
            dc    h'0000'     ; ---------------- = ----------------------------
            dc    h'CFF3'     ; XX--XXXXXXXX--XX = ----XXXXXXXXXXXXXXXXXXXX----
            dc    h'40C3'     ; -X------XX----XX = ----XX------------XXXXXX----
            dc    h'CFF3'     ; XX--XXXXXXXX--XX = ----XXXXXXXXXXXXXXXXXXXX----
            dc    h'4022'     ; -X--------X---X- = ----XX----------XX----XX----
            dc    h'CF32'     ; XX--XXXX--XX--X- = ----XXXXXXXXXXXXXX----XX----
            dc    h'CFF3'     ; XX--XXXXXXXX--XX = ----XXXXXXXXXXXXXXXXXXXX----
            dc    h'0000'     ; ---------------- = ----------------------------
            dc    h'0000'     ; ---------------- = ----------------------------
            dc    h'0000'     ; ---------------- = ----------------------------
            dc    h'0000'     ; ---------------- = ----------------------------

sprite79    anop
            dc    h'0000'     ; ---------------- = ----------------------------
            dc    h'0000'     ; ---------------- = ----------------------------
            dc    h'0000'     ; ---------------- = ----------------------------
            dc    h'0000'     ; ---------------- = ----------------------------
            dc    h'8FF7'     ; X---XXXXXXXX-XXX = ------XXXXXXXXXXXXXXXXXXXX--
            dc    h'8187'     ; X------XX----XXX = ------XX------------XXXXXX--
            dc    h'8FF7'     ; X---XXXXXXXX-XXX = ------XXXXXXXXXXXXXXXXXXXX--
            dc    h'8144'     ; X------X-X---X-- = ------XX----------XX----XX--
            dc    h'8F74'     ; X---XXXX-XXX-X-- = ------XXXXXXXXXXXXXX----XX--
            dc    h'8FF7'     ; X---XXXXXXXX-XXX = ------XXXXXXXXXXXXXXXXXXXX--
            dc    h'0000'     ; ---------------- = ----------------------------
            dc    h'0000'     ; ---------------- = ----------------------------
            dc    h'0000'     ; ---------------- = ----------------------------
            dc    h'0000'     ; ---------------- = ----------------------------
            dc    h'0000'     ; ---------------- = ----------------------------
            dc    h'0000'     ; ---------------- = ----------------------------

sprite7A    anop
            dc    h'0000'     ; ---------------- = ----------------------------
            dc    h'0000'     ; ---------------- = ----------------------------
            dc    h'0000'     ; ---------------- = ----------------------------
            dc    h'0000'     ; ---------------- = ----------------------------
            dc    h'0000'     ; ---------------- = ----------------------------
            dc    h'0000'     ; ---------------- = ----------------------------
            dc    h'0EFF'     ; ----XXX-XXXXXXXX = --------XXXXXXXXXXXXXXXXXXXX
            dc    h'020E'     ; ------X-----XXX- = --------XX------------XXXXXX
            dc    h'0EFF'     ; ----XXX-XXXXXXXX = --------XXXXXXXXXXXXXXXXXXXX
            dc    h'0289'     ; ------X-X---X--X = --------XX----------XX----XX
            dc    h'0EF9'     ; ----XXX-XXXXX--X = --------XXXXXXXXXXXXXX----XX
            dc    h'0EFF'     ; ----XXX-XXXXXXXX = --------XXXXXXXXXXXXXXXXXXXX
            dc    h'0000'     ; ---------------- = ----------------------------
            dc    h'0000'     ; ---------------- = ----------------------------
            dc    h'0000'     ; ---------------- = ----------------------------
            dc    h'0000'     ; ---------------- = ----------------------------

sprite7B    anop
            dc    h'0000'     ; ---------------- = ----------------------------
            dc    h'0200'     ; ------X--------- = --------XX------------------
            dc    h'8500'     ; X----X-X-------- = ------XX--XX----------------
            dc    h'4A00'     ; -X--X-X--------- = ----XX--XX--XX--------------
            dc    h'A510'     ; X-X--X-X---X---- = --XX--XX--XX--XX------------
            dc    h'2A00'     ; --X-X-X--------- = --XX----XX--XX--------------
            dc    h'1400'     ; ---X-X---------- = XX--------XX----------------
            dc    h'1060'     ; ---X-----XX----- = XX--------------XXXX--------
            dc    h'1060'     ; ---X-----XX----- = XX--------------XXXX--------
            dc    h'2010'     ; --X--------X---- = --XX----------XX------------
            dc    h'EF30'     ; XXX-XXXX--XX---- = --XXXXXXXXXXXXXXXX----------
            dc    h'CF70'     ; XX--XXXX-XXX---- = ----XXXXXXXXXXXXXXXX--------
            dc    h'8F30'     ; X---XXXX--XX---- = ------XXXXXXXXXXXX----------
            dc    h'0E10'     ; ----XXX----X---- = --------XXXXXXXX------------
            dc    h'0A20'     ; ----X-X---X----- = --------XX--XX--XX----------
            dc    h'8940'     ; X---X--X-X------ = ------XX----XX----XX--------

sprite7C    anop
            dc    h'4A00'     ; -X--X-X--------- = ----XX--XX--XX--------------
            dc    h'8510'     ; X----X-X---X---- = ------XX--XX--XX------------
            dc    h'4A00'     ; -X--X-X--------- = ----XX--XX--XX--------------
            dc    h'8510'     ; X----X-X---X---- = ------XX--XX--XX------------
            dc    h'4000'     ; -X-------------- = ----XX----------------------
            dc    h'4000'     ; -X-------------- = ----XX----------------------
            dc    h'4000'     ; -X-------------- = ----XX----------------------
            dc    h'4083'     ; -X------X-----XX = ----XX--------------XXXX----
            dc    h'4083'     ; -X------X-----XX = ----XX--------------XXXX----
            dc    h'8140'     ; X------X-X------ = ------XX----------XX--------
            dc    h'8FF1'     ; X---XXXXXXXX---X = ------XXXXXXXXXXXXXXXX------
            dc    h'0EF3'     ; ----XXX-XXXX--XX = --------XXXXXXXXXXXXXXXX----
            dc    h'0CF1'     ; ----XX--XXXX---X = ----------XXXXXXXXXXXX------
            dc    h'0870'     ; ----X----XXX---- = ------------XXXXXXXX--------
            dc    h'08A1'     ; ----X---X-X----X = ------------XX--XX--XX------
            dc    h'0422'     ; -----X----X---X- = ----------XX----XX----XX----

sprite7D    anop
            dc    h'0000'     ; ---------------- = ----------------------------
            dc    h'4000'     ; -X-------------- = ----XX----------------------
            dc    h'A100'     ; X-X----X-------- = --XX--XX--------------------
            dc    h'5200'     ; -X-X--X--------- = XX--XX--XX------------------
            dc    h'A500'     ; X-X--X-X-------- = --XX--XX--XX----------------
            dc    h'5800'     ; -X-XX----------- = XX--XX------XX--------------
            dc    h'2800'     ; --X-X----------- = --XX--------XX--------------
            dc    h'0806'     ; ----X--------XX- = ------------XX--------XXXX--
            dc    h'0406'     ; -----X-------XX- = ----------XX----------XXXX--
            dc    h'0481'     ; -----X--X------X = ----------XX--------XX------
            dc    h'0CF3'     ; ----XX--XXXX--XX = ----------XXXXXXXXXXXXXX----
            dc    h'0CF7'     ; ----XX--XXXX-XXX = ----------XXXXXXXXXXXXXXXX--
            dc    h'08F3'     ; ----X---XXXX--XX = ------------XXXXXXXXXXXX----
            dc    h'00F1'     ; --------XXXX---X = --------------XXXXXXXX------
            dc    h'0052'     ; ---------X-X--X- = --------------XX--XX--XX----
            dc    h'0844'     ; ----X----X---X-- = ------------XX----XX----XX--

sprite7E    anop
            dc    h'8510'     ; X----X-X---X---- = ------XX--XX--XX------------
            dc    h'4A00'     ; -X--X-X--------- = ----XX--XX--XX--------------
            dc    h'8510'     ; X----X-X---X---- = ------XX--XX--XX------------
            dc    h'4A00'     ; -X--X-X--------- = ----XX--XX--XX--------------
            dc    h'0010'     ; -----------X---- = --------------XX------------
            dc    h'0010'     ; -----------X---- = --------------XX------------
            dc    h'0010'     ; -----------X---- = --------------XX------------
            dc    h'001C'     ; -----------XXX-- = --------------XX--------XXXX
            dc    h'080C'     ; ----X-------XX-- = ------------XX----------XXXX
            dc    h'0802'     ; ----X---------X- = ------------XX--------XX----
            dc    h'08F7'     ; ----X---XXXX-XXX = ------------XXXXXXXXXXXXXX--
            dc    h'08FF'     ; ----X---XXXXXXXX = ------------XXXXXXXXXXXXXXXX
            dc    h'00F7'     ; --------XXXX-XXX = --------------XXXXXXXXXXXX--
            dc    h'00E3'     ; --------XXX---XX = ----------------XXXXXXXX----
            dc    h'00A5'     ; --------X-X--X-X = ----------------XX--XX--XX--
            dc    h'0099'     ; --------X--XX--X = --------------XX----XX----XX

sprite7F    anop
            dc    h'08A1'     ; ----X---X-X----X = ------------XX--XX--XX------
            dc    h'0052'     ; ---------X-X--X- = --------------XX--XX--XX----
            dc    h'08A1'     ; ----X---X-X----X = ------------XX--XX--XX------
            dc    h'0052'     ; ---------X-X--X- = --------------XX--XX--XX----
            dc    h'0800'     ; ----X----------- = ------------XX--------------
            dc    h'0800'     ; ----X----------- = ------------XX--------------
            dc    h'0800'     ; ----X----------- = ------------XX--------------
            dc    h'3800'     ; --XXX----------- = XXXX--------XX--------------
            dc    h'3010'     ; --XX-------X---- = XXXX----------XX------------
            dc    h'4010'     ; -X---------X---- = ----XX--------XX------------
            dc    h'EF10'     ; XXX-XXXX---X---- = --XXXXXXXXXXXXXX------------
            dc    h'FF10'     ; XXXXXXXX---X---- = XXXXXXXXXXXXXXXX------------
            dc    h'EF00'     ; XXX-XXXX-------- = --XXXXXXXXXXXX--------------
            dc    h'C700'     ; XX---XXX-------- = ----XXXXXXXX----------------
            dc    h'A500'     ; X-X--X-X-------- = --XX--XX--XX----------------
            dc    h'9900'     ; X--XX--X-------- = XX----XX----XX--------------

sprite80    anop
            dc    h'0000'     ; ---------------- = ----------------------------
            dc    h'0002'     ; --------------X- = ----------------------XX----
            dc    h'0085'     ; --------X----X-X = --------------------XX--XX--
            dc    h'004A'     ; ---------X--X-X- = ------------------XX--XX--XX
            dc    h'00A5'     ; --------X-X--X-X = ----------------XX--XX--XX--
            dc    h'001A'     ; -----------XX-X- = --------------XX------XX--XX
            dc    h'0014'     ; -----------X-X-- = --------------XX--------XX--
            dc    h'6010'     ; -XX--------X---- = --XXXX--------XX------------
            dc    h'6020'     ; -XX-------X----- = --XXXX----------XX----------
            dc    h'8120'     ; X------X--X----- = ------XX--------XX----------
            dc    h'CF30'     ; XX--XXXX--XX---- = ----XXXXXXXXXXXXXX----------
            dc    h'EF30'     ; XXX-XXXX--XX---- = --XXXXXXXXXXXXXXXX----------
            dc    h'CF10'     ; XX--XXXX---X---- = ----XXXXXXXXXXXX------------
            dc    h'8F00'     ; X---XXXX-------- = ------XXXXXXXX--------------
            dc    h'4A00'     ; -X--X-X--------- = ----XX--XX--XX--------------
            dc    h'2210'     ; --X---X----X---- = --XX----XX----XX------------

sprite81    anop
            dc    h'0052'     ; ---------X-X--X- = --------------XX--XX--XX----
            dc    h'08A1'     ; ----X---X-X----X = ------------XX--XX--XX------
            dc    h'0052'     ; ---------X-X--X- = --------------XX--XX--XX----
            dc    h'08A1'     ; ----X---X-X----X = ------------XX--XX--XX------
            dc    h'0002'     ; --------------X- = ----------------------XX----
            dc    h'0002'     ; --------------X- = ----------------------XX----
            dc    h'0002'     ; --------------X- = ----------------------XX----
            dc    h'C102'     ; XX-----X------X- = ----XXXX--------------XX----
            dc    h'C102'     ; XX-----X------X- = ----XXXX--------------XX----
            dc    h'0281'     ; ------X-X------X = --------XX----------XX------
            dc    h'8FF1'     ; X---XXXXXXXX---X = ------XXXXXXXXXXXXXXXX------
            dc    h'CF70'     ; XX--XXXX-XXX---- = ----XXXXXXXXXXXXXXXX--------
            dc    h'8F30'     ; X---XXXX--XX---- = ------XXXXXXXXXXXX----------
            dc    h'0E10'     ; ----XXX----X---- = --------XXXXXXXX------------
            dc    h'8510'     ; X----X-X---X---- = ------XX--XX--XX------------
            dc    h'4420'     ; -X---X----X----- = ----XX----XX----XX----------

sprite82    anop
            dc    h'0000'     ; ---------------- = ----------------------------
            dc    h'0040'     ; ---------X------ = ------------------XX--------
            dc    h'00A1'     ; --------X-X----X = ----------------XX--XX------
            dc    h'0052'     ; ---------X-X--X- = --------------XX--XX--XX----
            dc    h'08A5'     ; ----X---X-X--X-X = ------------XX--XX--XX--XX--
            dc    h'0054'     ; ---------X-X-X-- = --------------XX--XX----XX--
            dc    h'0028'     ; ----------X-X--- = ----------------XX--------XX
            dc    h'0608'     ; -----XX-----X--- = --------XXXX--------------XX
            dc    h'0608'     ; -----XX-----X--- = --------XXXX--------------XX
            dc    h'0804'     ; ----X--------X-- = ------------XX----------XX--
            dc    h'0CF7'     ; ----XX--XXXX-XXX = ----------XXXXXXXXXXXXXXXX--
            dc    h'0EF3'     ; ----XXX-XXXX--XX = --------XXXXXXXXXXXXXXXX----
            dc    h'0CF1'     ; ----XX--XXXX---X = ----------XXXXXXXXXXXX------
            dc    h'0870'     ; ----X----XXX---- = ------------XXXXXXXX--------
            dc    h'0450'     ; -----X---X-X---- = ----------XX--XX--XX--------
            dc    h'0291'     ; ------X-X--X---X = --------XX----XX----XX------

sprite83    anop
            dc    h'A55A'     ; X-X--X-X-X-XX-X- = --XX--XX--XX--XX--XX--XX--XX
            dc    h'FFFF'     ; XXXXXXXXXXXXXXXX = XXXXXXXXXXXXXXXXXXXXXXXXXXXX
            dc    h'FFFF'     ; XXXXXXXXXXXXXXXX = XXXXXXXXXXXXXXXXXXXXXXXXXXXX
            dc    h'0240'     ; ------X--X------ = --------XX--------XX--------
            dc    h'0240'     ; ------X--X------ = --------XX--------XX--------
            dc    h'0240'     ; ------X--X------ = --------XX--------XX--------
            dc    h'F3CF'     ; XXXX--XXXX--XXXX = XXXXXXXXXX--------XXXXXXXXXX
            dc    h'A55A'     ; X-X--X-X-X-XX-X- = --XX--XX--XX--XX--XX--XX--XX
            dc    h'FFFF'     ; XXXXXXXXXXXXXXXX = XXXXXXXXXXXXXXXXXXXXXXXXXXXX
            dc    h'FFFF'     ; XXXXXXXXXXXXXXXX = XXXXXXXXXXXXXXXXXXXXXXXXXXXX
            dc    h'0240'     ; ------X--X------ = --------XX--------XX--------
            dc    h'0240'     ; ------X--X------ = --------XX--------XX--------
            dc    h'0240'     ; ------X--X------ = --------XX--------XX--------
            dc    h'A34A'     ; X-X---XX-X--X-X- = --XX--XXXX--------XX--XX--XX
            dc    h'FFFF'     ; XXXXXXXXXXXXXXXX = XXXXXXXXXXXXXXXXXXXXXXXXXXXX
            dc    h'FFFF'     ; XXXXXXXXXXXXXXXX = XXXXXXXXXXXXXXXXXXXXXXXXXXXX

sprite84    anop
            dc    h'0000'     ; ---------------- = ----------------------------
            dc    h'A55A'     ; X-X--X-X-X-XX-X- = --XX--XX--XX--XX--XX--XX--XX
            dc    h'FFFF'     ; XXXXXXXXXXXXXXXX = XXXXXXXXXXXXXXXXXXXXXXXXXXXX
            dc    h'FFFF'     ; XXXXXXXXXXXXXXXX = XXXXXXXXXXXXXXXXXXXXXXXXXXXX
            dc    h'0240'     ; ------X--X------ = --------XX--------XX--------
            dc    h'F3CF'     ; XXXX--XXXX--XXXX = XXXXXXXXXX--------XXXXXXXXXX
            dc    h'0240'     ; ------X--X------ = --------XX--------XX--------
            dc    h'CFF7'     ; XX--XXXXXXXX-XXX = ----XXXXXXXXXXXXXXXXXXXXXX--
            dc    h'C3C7'     ; XX----XXXX---XXX = ----XXXXXX--------XXXXXXXX--
            dc    h'0240'     ; ------X--X------ = --------XX--------XX--------
            dc    h'AF7A'     ; X-X-XXXX-XXXX-X- = --XX--XXXXXXXXXXXXXX--XX--XX
            dc    h'FFFF'     ; XXXXXXXXXXXXXXXX = XXXXXXXXXXXXXXXXXXXXXXXXXXXX
            dc    h'FFFF'     ; XXXXXXXXXXXXXXXX = XXXXXXXXXXXXXXXXXXXXXXXXXXXX
            dc    h'0000'     ; ---------------- = ----------------------------
            dc    h'FFFF'     ; XXXXXXXXXXXXXXXX = XXXXXXXXXXXXXXXXXXXXXXXXXXXX
            dc    h'0000'     ; ---------------- = ----------------------------

sprite85    anop
            dc    h'0000'     ; ---------------- = ----------------------------
            dc    h'0000'     ; ---------------- = ----------------------------
            dc    h'FFFF'     ; XXXXXXXXXXXXXXXX = XXXXXXXXXXXXXXXXXXXXXXXXXXXX
            dc    h'A55A'     ; X-X--X-X-X-XX-X- = --XX--XX--XX--XX--XX--XX--XX
            dc    h'FFFF'     ; XXXXXXXXXXXXXXXX = XXXXXXXXXXXXXXXXXXXXXXXXXXXX
            dc    h'FFFF'     ; XXXXXXXXXXXXXXXX = XXXXXXXXXXXXXXXXXXXXXXXXXXXX
            dc    h'0240'     ; ------X--X------ = --------XX--------XX--------
            dc    h'C3C7'     ; XX----XXXX---XXX = ----XXXXXX--------XXXXXXXX--
            dc    h'CFF7'     ; XX--XXXXXXXX-XXX = ----XXXXXXXXXXXXXXXXXXXXXX--
            dc    h'0240'     ; ------X--X------ = --------XX--------XX--------
            dc    h'F3CF'     ; XXXX--XXXX--XXXX = XXXXXXXXXX--------XXXXXXXXXX
            dc    h'AF7A'     ; X-X-XXXX-XXXX-X- = --XX--XXXXXXXXXXXXXX--XX--XX
            dc    h'FFFF'     ; XXXXXXXXXXXXXXXX = XXXXXXXXXXXXXXXXXXXXXXXXXXXX
            dc    h'FFFF'     ; XXXXXXXXXXXXXXXX = XXXXXXXXXXXXXXXXXXXXXXXXXXXX
            dc    h'0000'     ; ---------------- = ----------------------------
            dc    h'0000'     ; ---------------- = ----------------------------

sprite86    anop
            dc    h'0000'     ; ---------------- = ----------------------------
            dc    h'A55A'     ; X-X--X-X-X-XX-X- = --XX--XX--XX--XX--XX--XX--XX
            dc    h'FFFF'     ; XXXXXXXXXXXXXXXX = XXXXXXXXXXXXXXXXXXXXXXXXXXXX
            dc    h'F3CF'     ; XXXX--XXXX--XXXX = XXXXXXXXXX--------XXXXXXXXXX
            dc    h'0240'     ; ------X--X------ = --------XX--------XX--------
            dc    h'A55A'     ; X-X--X-X-X-XX-X- = --XX--XX--XX--XX--XX--XX--XX
            dc    h'FFFF'     ; XXXXXXXXXXXXXXXX = XXXXXXXXXXXXXXXXXXXXXXXXXXXX
            dc    h'FFFF'     ; XXXXXXXXXXXXXXXX = XXXXXXXXXXXXXXXXXXXXXXXXXXXX
            dc    h'E3CB'     ; XXX---XXXX--X-XX = --XXXXXXXX--------XXXXXX--XX
            dc    h'F3CF'     ; XXXX--XXXX--XXXX = XXXXXXXXXX--------XXXXXXXXXX
            dc    h'F3CF'     ; XXXX--XXXX--XXXX = XXXXXXXXXX--------XXXXXXXXXX
            dc    h'0240'     ; ------X--X------ = --------XX--------XX--------
            dc    h'A55A'     ; X-X--X-X-X-XX-X- = --XX--XX--XX--XX--XX--XX--XX
            dc    h'FFFF'     ; XXXXXXXXXXXXXXXX = XXXXXXXXXXXXXXXXXXXXXXXXXXXX
            dc    h'FFFF'     ; XXXXXXXXXXXXXXXX = XXXXXXXXXXXXXXXXXXXXXXXXXXXX
            dc    h'0000'     ; ---------------- = ----------------------------

sprite87    anop
            dc    h'EF00'     ; XXX-XXXX-------- = --XXXXXXXXXXXX--------------
            dc    h'9310'     ; X--X--XX---X---- = XX----XXXX----XX------------
            dc    h'FF10'     ; XXXXXXXX---X---- = XXXXXXXXXXXXXXXX------------
            dc    h'BB10'     ; X-XXX-XX---X---- = XXXX--XXXX--XXXX------------
            dc    h'7C10'     ; -XXXXX-----X---- = XXXXXX----XXXXXX------------
            dc    h'EF00'     ; XXX-XXXX-------- = --XXXXXXXXXXXX--------------
            dc    h'4400'     ; -X---X---------- = ----XX----XX----------------
            dc    h'4400'     ; -X---X---------- = ----XX----XX----------------
            dc    h'4400'     ; -X---X---------- = ----XX----XX----------------
            dc    h'2800'     ; --X-X----------- = --XX--------XX--------------
            dc    h'2800'     ; --X-X----------- = --XX--------XX--------------
            dc    h'2800'     ; --X-X----------- = --XX--------XX--------------
            dc    h'1010'     ; ---X-------X---- = XX------------XX------------
            dc    h'1010'     ; ---X-------X---- = XX------------XX------------
            dc    h'3810'     ; --XXX------X---- = XXXX--------XXXX------------
            dc    h'3810'     ; --XXX------X---- = XXXX--------XXXX------------

sprite88    anop
            dc    h'0000'     ; ---------------- = ----------------------------
            dc    h'8F30'     ; X---XXXX--XX---- = ------XXXXXXXXXXXX----------
            dc    h'4C40'     ; -X--XX---X------ = ----XX----XXXX----XX--------
            dc    h'CF70'     ; XX--XXXX-XXX---- = ----XXXXXXXXXXXXXXXX--------
            dc    h'CD60'     ; XX--XX-X-XX----- = ----XXXX--XXXX--XXXX--------
            dc    h'C370'     ; XX----XX-XXX---- = ----XXXXXX----XXXXXX--------
            dc    h'8F30'     ; X---XXXX--XX---- = ------XXXXXXXXXXXX----------
            dc    h'8120'     ; X------X--X----- = ------XX--------XX----------
            dc    h'4040'     ; -X-------X------ = ----XX------------XX--------
            dc    h'4040'     ; -X-------X------ = ----XX------------XX--------
            dc    h'2081'     ; --X-----X------X = --XX----------------XX------
            dc    h'2081'     ; --X-----X------X = --XX----------------XX------
            dc    h'1002'     ; ---X----------X- = XX--------------------XX----
            dc    h'1083'     ; ---X----X-----XX = XX------------------XXXX----
            dc    h'3083'     ; --XX----X-----XX = XXXX----------------XXXX----
            dc    h'3000'     ; --XX------------ = XXXX------------------------

sprite89    anop
            dc    h'0000'     ; ---------------- = ----------------------------
            dc    h'0000'     ; ---------------- = ----------------------------
            dc    h'0000'     ; ---------------- = ----------------------------
            dc    h'0E70'     ; ----XXX--XXX---- = --------XXXXXXXXXXXX--------
            dc    h'8991'     ; X---X--XX--X---X = ------XX----XXXX----XX------
            dc    h'8FF1'     ; X---XXXXXXXX---X = ------XXXXXXXXXXXXXXXX------
            dc    h'8BD1'     ; X---X-XXXX-X---X = ------XXXX--XXXX--XXXX------
            dc    h'87E1'     ; X----XXXXXX----X = ------XXXXXX----XXXXXX------
            dc    h'0E70'     ; ----XXX--XXX---- = --------XXXXXXXXXXXX--------
            dc    h'8181'     ; X------XX------X = ------XX------------XX------
            dc    h'4002'     ; -X------------X- = ----XX----------------XX----
            dc    h'2004'     ; --X----------X-- = --XX--------------------XX--
            dc    h'1008'     ; ---X--------X--- = XX------------------------XX
            dc    h'1008'     ; ---X--------X--- = XX------------------------XX
            dc    h'300C'     ; --XX--------XX-- = XXXX--------------------XXXX
            dc    h'300C'     ; --XX--------XX-- = XXXX--------------------XXXX

sprite8A    anop
            dc    h'0000'     ; ---------------- = ----------------------------
            dc    h'0CF1'     ; ----XX--XXXX---X = ----------XXXXXXXXXXXX------
            dc    h'0232'     ; ------X---XX--X- = --------XX----XXXX----XX----
            dc    h'0EF3'     ; ----XXX-XXXX--XX = --------XXXXXXXXXXXXXXXX----
            dc    h'06B3'     ; -----XX-X-XX--XX = --------XXXX--XXXX--XXXX----
            dc    h'0EC3'     ; ----XXX-XX----XX = --------XXXXXX----XXXXXX----
            dc    h'0CF1'     ; ----XX--XXXX---X = ----------XXXXXXXXXXXX------
            dc    h'0481'     ; -----X--X------X = ----------XX--------XX------
            dc    h'0202'     ; ------X-------X- = --------XX------------XX----
            dc    h'0202'     ; ------X-------X- = --------XX------------XX----
            dc    h'8104'     ; X------X-----X-- = ------XX----------------XX--
            dc    h'8104'     ; X------X-----X-- = ------XX----------------XX--
            dc    h'4008'     ; -X----------X--- = ----XX--------------------XX
            dc    h'C108'     ; XX-----X----X--- = ----XXXX------------------XX
            dc    h'C10C'     ; XX-----X----XX-- = ----XXXX----------------XXXX
            dc    h'000C'     ; ------------XX-- = ------------------------XXXX

sprite8B    anop
            dc    h'0C30'     ; ----XX----XX---- = ----------XXXXXXXX----------
            dc    h'87E1'     ; X----XXXXXX----X = ------XXXXXX----XXXXXX------
            dc    h'4C32'     ; -X--XX----XX--X- = ----XX----XXXXXXXX----XX----
            dc    h'6816'     ; -XX-X------X-XX- = --XXXX------XXXX------XXXX--
            dc    h'E997'     ; XXX-X--XX--X-XXX = --XXXXXX----XXXX----XXXXXX--
            dc    h'DFFB'     ; XX-XXXXXXXXXX-XX = XX--XXXXXXXXXXXXXXXXXXXX--XX
            dc    h'9BD9'     ; X--XX-XXXX-XX--X = XX----XXXX--XXXX--XXXX----XX
            dc    h'2254'     ; --X---X--X-X-X-- = --XX----XX----XX--XX----XX--
            dc    h'9944'     ; X--XX--X-X---X-- = XX----XX----XX----XX----XX--
            dc    h'A989'     ; X-X-X--XX---X--X = --XX--XX----XX------XX----XX
            dc    h'2295'     ; --X---X-X--X-X-X = --XX----XX----XX----XX--XX
            dc    h'142A'     ; ---X-X----X-X-X- = XX--------XX----XX----XX--XX
            dc    h'24A9'     ; --X--X--X-X-X--X = --XX------XX----XX--XX----XX
            dc    h'0291'     ; ------X-X--X---X = --------XX----XX----XX------
            dc    h'8112'     ; X------X---X--X- = ------XX------XX------XX----
            dc    h'0020'     ; ----------X----- = ----------------XX----------

sprite8C    anop
            dc    h'0C30'     ; ----XX----XX---- = ----------XXXXXXXX----------
            dc    h'87E1'     ; X----XXXXXX----X = ------XXXXXX----XXXXXX------
            dc    h'4C32'     ; -X--XX----XX--X- = ----XX----XXXXXXXX----XX----
            dc    h'6816'     ; -XX-X------X-XX- = --XXXX------XXXX------XXXX--
            dc    h'E997'     ; XXX-X--XX--X-XXX = --XXXXXX----XXXX----XXXXXX--
            dc    h'DFFB'     ; XX-XXXXXXXXXX-XX = XX--XXXXXXXXXXXXXXXXXXXX--XX
            dc    h'9BD9'     ; X--XX-XXXX-XX--X = XX----XXXX--XXXX--XXXX----XX
            dc    h'2A85'     ; --X-X-X-X----X-X = --XX----XX--XX------XX--XX--
            dc    h'1299'     ; ---X--X-X--XX--X = XX------XX----XX----XX----XX
            dc    h'9154'     ; X--X---X-X-X-X-- = XX----XX------XX--XX----XX--
            dc    h'A944'     ; X-X-X--X-X---X-- = --XX--XX----XX----XX----XX--
            dc    h'A989'     ; X-X-X--XX---X--X = --XX--XX----XX------XX----XX
            dc    h'1299'     ; ---X--X-X--XX--X = XX------XX----XX----XX----XX
            dc    h'0422'     ; -----X----X---X- = ----------XX----XX----XX----
            dc    h'04A1'     ; -----X--X-X----X = ----------XX----XX--XX------
            dc    h'0200'     ; ------X--------- = --------XX------------------

sprite8D    anop
            dc    h'0C30'     ; ----XX----XX---- = ----------XXXXXXXX----------
            dc    h'87E1'     ; X----XXXXXX----X = ------XXXXXX----XXXXXX------
            dc    h'4C32'     ; -X--XX----XX--X- = ----XX----XXXXXXXX----XX----
            dc    h'6816'     ; -XX-X------X-XX- = --XXXX------XXXX------XXXX--
            dc    h'E997'     ; XXX-X--XX--X-XXX = --XXXXXX----XXXX----XXXXXX--
            dc    h'DFFB'     ; XX-XXXXXXXXXX-XX = XX--XXXXXXXXXXXXXXXXXXXX--XX
            dc    h'9BD9'     ; X--XX-XXXX-XX--X = XX----XXXX--XXXX--XXXX----XX
            dc    h'2295'     ; --X---X-X--X-X-X = --XX----XX----XX----XX--XX--
            dc    h'2422'     ; --X--X----X---X- = --XX------XX----XX----XX----
            dc    h'2422'     ; --X--X----X---X- = --XX------XX----XX----XX----
            dc    h'1295'     ; ---X--X-X--X-X-X = XX------XX----XX----XX--XX--
            dc    h'2A44'     ; --X-X-X--X---X-- = --XX----XX--XX----XX----XX--
            dc    h'A948'     ; X-X-X--X-X--X--- = --XX--XX----XX----XX------XX
            dc    h'8191'     ; X------XX--X---X = ------XX------XX----XX------
            dc    h'0222'     ; ------X---X---X- = --------XX------XX----XX----
            dc    h'0020'     ; ----------X----- = ----------------XX----------

sprite8E    anop
            dc    h'0C30'     ; ----XX----XX---- = ----------XXXXXXXX----------
            dc    h'87E1'     ; X----XXXXXX----X = ------XXXXXX----XXXXXX------
            dc    h'4C32'     ; -X--XX----XX--X- = ----XX----XXXXXXXX----XX----
            dc    h'6816'     ; -XX-X------X-XX- = --XXXX------XXXX------XXXX--
            dc    h'E997'     ; XXX-X--XX--X-XXX = --XXXXXX----XXXX----XXXXXX--
            dc    h'DFFB'     ; XX-XXXXXXXXXX-XX = XX--XXXXXXXXXXXXXXXXXXXX--XX
            dc    h'9BD9'     ; X--XX-XXXX-XX--X = XX----XXXX--XXXX--XXXX----XX
            dc    h'A989'     ; X-X-X--XX---X--X = --XX--XX----XX------XX----XX
            dc    h'2295'     ; --X---X-X--X-X-X = --XX----XX----XX----XX--XX--
            dc    h'142A'     ; ---X-X----X-X-X- = XX--------XX----XX----XX--XX
            dc    h'242A'     ; --X--X----X-X-X- = --XX------XX----XX----XX--XX
            dc    h'122A'     ; ---X--X---X-X-X- = XX------XX------XX----XX--XX
            dc    h'9195'     ; X--X---XX--X-X-X = XX----XX------XX----XX--XX--
            dc    h'8940'     ; X---X--X-X------ = ------XX----XX----XX--------
            dc    h'8900'     ; X---X--X-------- = ------XX----XX--------------
            dc    h'0010'     ; -----------X---- = --------------XX------------

sprite8F    anop
            dc    h'0C20'     ; ----XX----X----- = ----------XXXX--XX----------
            dc    h'8FE1'     ; X---XXXXXXX----X = ------XXXXXXXX--XXXXXX------
            dc    h'CFC3'     ; XX--XXXXXX----XX = ----XXXXXXXXXX----XXXXXX----
            dc    h'CF22'     ; XX--XXXX--X---X- = ----XXXXXXXXXX--XX----XX----
            dc    h'EF64'     ; XXX-XXXX-XX--X-- = --XXXXXXXXXXXX--XXXX----XX--
            dc    h'EFE5'     ; XXX-XXXXXXX--X-X = --XXXXXXXXXXXX--XXXXXX--XX--
            dc    h'DFEF'     ; XX-XXXXXXXX-XXXX = XX--XXXXXXXXXX--XXXXXXXXXXXX
            dc    h'00EF'     ; --------XXX-XXXX = ----------------XXXXXXXXXXXX
            dc    h'9700'     ; X--X-XXX-------- = XX----XXXXXX----------------
            dc    h'97FF'     ; X--X-XXXXXXXXXXX = XX----XXXXXX--XXXXXXXXXXXXXX
            dc    h'26F7'     ; --X--XX-XXXX-XXX = --XX----XXXX--XXXXXXXXXXXX--
            dc    h'20F5'     ; --X-----XXXX-X-X = --XX----------XXXXXXXX--XX--
            dc    h'0000'     ; ---------------- = ----------------------------
            dc    h'4002'     ; -X------------X- = ----XX----------------XX----
            dc    h'83C1'     ; X-----XXXX-----X = ------XXXX--------XXXX------
            dc    h'0430'     ; -----X----XX---- = ----------XX--XXXX----------

sprite90    anop
            dc    h'0C30'     ; ----XX----XX---- = ----------XXXXXXXX----------
            dc    h'8FF1'     ; X---XXXXXXXX---X = ------XXXXXXXXXXXXXXXX------
            dc    h'CF52'     ; XX--XXXX-X-X--X- = ----XXXXXXXXXXXX--XX--XX----
            dc    h'CF32'     ; XX--XXXX--XX--X- = ----XXXXXXXXXXXXXX----XX----
            dc    h'EF34'     ; XXX-XXXX--XX-X-- = --XXXXXXXXXXXXXXXX------XX--
            dc    h'2ED5'     ; --X-XXX-XX-X-X-X = --XX----XXXXXXXX--XXXX--XX--
            dc    h'D9DF'     ; XX-XX--XXX-XXXXX = XX--XXXX----XXXX--XXXXXXXXXX
            dc    h'D7EF'     ; XX-X-XXXXXX-XXXX = XX--XXXXXXXX----XXXXXXXXXXXX
            dc    h'97EF'     ; X--X-XXXXXX-XXXX = XX----XXXXXX----XXXXXXXXXXXX
            dc    h'9B9F'     ; X--XX-XXX--XXXXX = XX----XXXX--XXXX----XXXXXXXX
            dc    h'2A74'     ; --X-X-X--XXX-X-- = --XX----XX--XXXXXXXX----XX--
            dc    h'28F5'     ; --X-X---XXXX-X-X = --XX--------XXXXXXXXXX--XX--
            dc    h'0000'     ; ---------------- = ----------------------------
            dc    h'4002'     ; -X------------X- = ----XX----------------XX----
            dc    h'83C1'     ; X-----XXXX-----X = ------XXXX--------XXXX------
            dc    h'0C30'     ; ----XX----XX---- = ----------XXXXXXXX----------

sprite91    anop
            dc    h'0C30'     ; ----XX----XX---- = ----------XXXXXXXX----------
            dc    h'8FF1'     ; X---XXXXXXXX---X = ------XXXXXXXXXXXXXXXX------
            dc    h'CFD3'     ; XX--XXXXXX-X--XX = ----XXXXXXXXXXXX--XXXXXX----
            dc    h'4E32'     ; -X--XXX---XX--X- = ----XX--XXXXXXXXXX----XX----
            dc    h'AD74'     ; X-X-XX-X-XXX-X-- = --XX--XX--XXXXXXXXXX----XX--
            dc    h'AB74'     ; X-X-X-XX-XXX-X-- = --XX--XXXX--XXXXXXXX----XX--
            dc    h'97BF'     ; X--X-XXXX-XXXXXX = XX----XXXXXX--XXXX--XXXXXXXX
            dc    h'97CF'     ; X--X-XXXXX--XXXX = XX----XXXXXX------XXXXXXXXXX
            dc    h'93EF'     ; X--X--XXXXX-XXXX = XX----XXXX------XXXXXXXXXXXX
            dc    h'9DEF'     ; X--XXX-XXXX-XXXX = XX----XX--XXXX--XXXXXXXXXXXX
            dc    h'2ED7'     ; --X-XXX-XX-X-XXX = --XX----XXXXXXXX--XXXXXXXX--
            dc    h'2834'     ; --X-X-----XX-X-- = --XX--------XXXXXX------XX--
            dc    h'0002'     ; --------------X- = ----------------------XX----
            dc    h'4000'     ; -X-------------- = ----XX----------------------
            dc    h'83C1'     ; X-----XXXX-----X = ------XXXX--------XXXX------
            dc    h'0C30'     ; ----XX----XX---- = ----------XXXXXXXX----------

sprite92    anop
            dc    h'0C30'     ; ----XX----XX---- = ----------XXXXXXXX----------
            dc    h'8DF1'     ; X---XX-XXXXX---X = ------XX--XXXXXXXXXXXX------
            dc    h'CBD3'     ; XX--X-XXXX-X--XX = ----XXXXXX--XXXX--XXXXXX----
            dc    h'CB32'     ; XX--X-XX--XX--X- = ----XXXXXX--XXXXXX----XX----
            dc    h'EB74'     ; XXX-X-XX-XXX-X-- = --XXXXXXXX--XXXXXXXX----XX--
            dc    h'E7F5'     ; XXX--XXXXXXX-X-X = --XXXXXXXXXX--XXXXXXXX--XX--
            dc    h'D778'     ; XX-X-XXX-XXXX--- = XX--XXXXXXXX--XXXXXX------XX
            dc    h'D78F'     ; XX-X-XXXX---XXXX = XX--XXXXXXXX--------XXXXXXXX
            dc    h'91EF'     ; X--X---XXXX-XXXX = XX----XX--------XXXXXXXXXXXX
            dc    h'1EEF'     ; ---XXXX-XXX-XXXX = XX------XXXXXX--XXXXXXXXXXXX
            dc    h'0EE7'     ; ----XXX-XXX--XXX = --------XXXXXX--XXXXXXXXXX--
            dc    h'28D5'     ; --X-X---XX-X-X-X = --XX--------XXXX--XXXX--XX--
            dc    h'0000'     ; ---------------- = ----------------------------
            dc    h'4002'     ; -X------------X- = ----XX----------------XX----
            dc    h'8381'     ; X-----XXX------X = ------XXXX----------XX------
            dc    h'0C30'     ; ----XX----XX---- = ----------XXXXXXXX----------

sprite93    anop
            dc    h'0C00'     ; ----XX---------- = ----------XXXX--------------
            dc    h'0600'     ; -----XX--------- = --------XXXX----------------
            dc    h'8300'     ; X-----XX-------- = ------XXXX------------------
            dc    h'C300'     ; XX----XX-------- = ----XXXXXX------------------
            dc    h'E500'     ; XXX--X-X-------- = --XXXXXX--XX----------------
            dc    h'3A20'     ; --XXX-X---X----- = XXXX----XX--XX--XX----------
            dc    h'1470'     ; ---X-X---XXX---- = XX--------XX--XXXXXX--------
            dc    h'0870'     ; ----X----XXX---- = ------------XXXXXXXX--------
            dc    h'0C40'     ; ----XX---X------ = ----------XXXX----XX--------
            dc    h'3E60'     ; --XXXXX--XX----- = XXXX----XXXXXX--XXXX--------
            dc    h'B340'     ; X-XX--XX-X------ = XXXX--XXXX--------XX--------
            dc    h'FF70'     ; XXXXXXXX-XXX---- = XXXXXXXXXXXXXXXXXXXX--------
            dc    h'7800'     ; -XXXX----------- = XXXXXX------XX--------------
            dc    h'3220'     ; --XX--X---X----- = XXXX----XX------XX----------
            dc    h'B550'     ; X-XX-X-X-X-X---- = XXXX--XX--XX--XX--XX--------
            dc    h'0220'     ; ------X---X----- = --------XX------XX----------

sprite94    anop
            dc    h'0030'     ; ----------XX---- = --------------XXXX----------
            dc    h'0810'     ; ----X------X---- = ------------XXXX------------
            dc    h'0C00'     ; ----XX---------- = ----------XXXX--------------
            dc    h'0E00'     ; ----XXX--------- = --------XXXXXX--------------
            dc    h'8710'     ; X----XXX---X---- = ------XXXXXX--XX------------
            dc    h'C9A1'     ; XX--X--XX-X----X = ----XXXX----XX--XX--XX------
            dc    h'40D3'     ; -X------XX-X--XX = ----XX--------XX--XXXXXX----
            dc    h'00E3'     ; --------XXX---XX = ----------------XXXXXXXX----
            dc    h'0032'     ; ----------XX--X- = --------------XXXX----XX----
            dc    h'68B3'     ; -XX-X---X-XX--XX = --XXXX------XXXXXX--XXXX----
            dc    h'6C02'     ; -XX-XX--------X- = --XXXX----XXXX--------XX----
            dc    h'EFF3'     ; XXX-XXXXXXXX--XX = --XXXXXXXXXXXXXXXXXXXXXX----
            dc    h'E320'     ; XXX---XX--X----- = --XXXXXXXX------XX----------
            dc    h'6881'     ; -XX-X---X------X = --XXXX------XX------XX------
            dc    h'6452'     ; -XX--X---X-X--X- = --XXXX----XX--XX--XX--XX----
            dc    h'0881'     ; ----X---X------X = ------------XX------XX------

sprite95    anop
            dc    h'0060'     ; ---------XX----- = ----------------XXXX--------
            dc    h'0030'     ; ----------XX---- = --------------XXXX----------
            dc    h'0810'     ; ----X------X---- = ------------XXXX------------
            dc    h'0C10'     ; ----XX-----X---- = ----------XXXXXX------------
            dc    h'0E20'     ; ----XXX---X----- = --------XXXXXX--XX----------
            dc    h'8352'     ; X-----XX-X-X--X- = ------XXXX----XX--XX--XX----
            dc    h'81A7'     ; X------XX-X--XXX = ------XX--------XX--XXXXXX--
            dc    h'00C7'     ; --------XX---XXX = ------------------XXXXXXXX--
            dc    h'0064'     ; ---------XX--X-- = ----------------XXXX----XX--
            dc    h'6076'     ; -XX------XXX-XX- = --XXXX--------XXXXXX--XXXX--
            dc    h'6814'     ; -XX-X------X-X-- = --XXXX------XXXX--------XX--
            dc    h'EFF7'     ; XXX-XXXXXXXX-XXX = --XXXXXXXXXXXXXXXXXXXXXXXX--
            dc    h'E740'     ; XXX--XXX-X------ = --XXXXXXXXXX------XX--------
            dc    h'6012'     ; -XX--------X--X- = --XXXX--------XX------XX----
            dc    h'68A5'     ; -XX-X---X-X--X-X = --XXXX------XX--XX--XX--XX--
            dc    h'0012'     ; -----------X--X- = --------------XX------XX----

sprite96    anop
            dc    h'00C1'     ; --------XX-----X = ------------------XXXX------
            dc    h'0060'     ; ---------XX----- = ----------------XXXX--------
            dc    h'0030'     ; ----------XX---- = --------------XXXX----------
            dc    h'0830'     ; ----X-----XX---- = ------------XXXXXX----------
            dc    h'0C50'     ; ----XX---X-X---- = ----------XXXXXX--XX--------
            dc    h'06A5'     ; -----XX-X-X--X-X = --------XXXX----XX--XX--XX--
            dc    h'024E'     ; ------X--X--XXX- = --------XX--------XX--XXXXXX
            dc    h'008F'     ; --------X---XXXX = --------------------XXXXXXXX
            dc    h'00C9'     ; --------XX--X--X = ------------------XXXX----XX
            dc    h'83ED'     ; X-----XXXXX-XX-X = ------XXXX------XXXXXX--XXXX
            dc    h'8338'     ; X-----XX--XXX--- = ------XXXX----XXXX--------XX
            dc    h'8FFF'     ; X---XXXXXXXXXXXX = ------XXXXXXXXXXXXXXXXXXXXXX
            dc    h'8F81'     ; X---XXXXX------X = ------XXXXXXXX------XX------
            dc    h'8324'     ; X-----XX--X--X-- = ------XXXX------XX------XX--
            dc    h'835A'     ; X-----XX-X-XX-X- = ------XXXX----XX--XX--XX--XX
            dc    h'0024'     ; ----------X--X-- = ----------------XX------XX--

sprite97    anop
            dc    h'8900'     ; X---X--X-------- = ------XX----XX--------------
            dc    h'0600'     ; -----XX--------- = --------XXXX----------------
            dc    h'8F00'     ; X---XXXX-------- = ------XXXXXXXX--------------
            dc    h'DF50'     ; XX-XXXXX-X-X---- = XX--XXXXXXXXXXXX--XX--------
            dc    h'E930'     ; XXX-X--X--XX---- = --XXXXXX----XXXXXX----------
            dc    h'E930'     ; XXX-X--X--XX---- = --XXXXXX----XXXXXX----------
            dc    h'DF50'     ; XX-XXXXX-X-X---- = XX--XXXXXXXXXXXX--XX--------
            dc    h'AF20'     ; X-X-XXXX--X----- = --XX--XXXXXXXX--XX----------
            dc    h'2620'     ; --X--XX---X----- = --XX----XXXX----XX----------
            dc    h'A920'     ; X-X-X--X--X----- = --XX--XX----XX--XX----------
            dc    h'EF30'     ; XXX-XXXX--XX---- = --XXXXXXXXXXXXXXXX----------
            dc    h'0600'     ; -----XX--------- = --------XXXX----------------
            dc    h'6030'     ; -XX-------XX---- = --XXXX--------XXXX----------
            dc    h'9960'     ; X--XX--X-XX----- = XX----XX----XX--XXXX--------
            dc    h'D940'     ; XX-XX--X-X------ = XX--XXXX----XX----XX--------
            dc    h'6030'     ; -XX-------XX---- = --XXXX--------XXXX----------

sprite98    anop
            dc    h'0810'     ; ----X------X---- = ------------XXXX------------
            dc    h'0C30'     ; ----XX----XX---- = ----------XXXXXXXX----------
            dc    h'0C30'     ; ----XX----XX---- = ----------XXXXXXXX----------
            dc    h'87E1'     ; X----XXXXXX----X = ------XXXXXX----XXXXXX------
            dc    h'CBD3'     ; XX--X-XXXX-X--XX = ----XXXXXX--XXXX--XXXXXX----
            dc    h'CBD3'     ; XX--X-XXXX-X--XX = ----XXXXXX--XXXX--XXXXXX----
            dc    h'87E1'     ; X----XXXXXX----X = ------XXXXXX----XXXXXX------
            dc    h'8DB1'     ; X---XX-XX-XX---X = ------XX--XXXXXXXX--XX------
            dc    h'8DB1'     ; X---XX-XX-XX---X = ------XX--XXXXXXXX--XX------
            dc    h'8991'     ; X---X--XX--X---X = ------XX----XXXX----XX------
            dc    h'8FF1'     ; X---XXXXXXXX---X = ------XXXXXXXXXXXXXXXX------
            dc    h'0810'     ; ----X------X---- = ------------XXXX------------
            dc    h'83C1'     ; X-----XXXX-----X = ------XXXX--------XXXX------
            dc    h'4422'     ; -X---X----X---X- = ----XX----XX----XX----XX----
            dc    h'C5A3'     ; XX---X-XX-X---XX = ----XXXX--XX----XX--XXXX----
            dc    h'83C1'     ; X-----XXXX-----X = ------XXXX--------XXXX------

sprite99    anop
            dc    h'0870'     ; ----X----XXX---- = ------------XXXXXXXX--------
            dc    h'0870'     ; ----X----XXX---- = ------------XXXXXXXX--------
            dc    h'0840'     ; ----X----X------ = ------------XX----XX--------
            dc    h'87B7'     ; X----XXXX-XX-XXX = ------XXXXXX--XXXX--XXXXXX--
            dc    h'8B76'     ; X---X-XX-XXX-XX- = ------XXXX--XXXXXXXX--XXXX--
            dc    h'8B76'     ; X---X-XX-XXX-XX- = ------XXXX--XXXXXXXX--XXXX--
            dc    h'87B7'     ; X----XXXX-XX-XXX = ------XXXXXX--XXXX--XXXXXX--
            dc    h'0A42'     ; ----X-X--X----X- = --------XX--XX----XX--XX----
            dc    h'0A72'     ; ----X-X--XXX--X- = --------XX--XXXXXXXX--XX----
            dc    h'0A72'     ; ----X-X--XXX--X- = --------XX--XXXXXXXX--XX----
            dc    h'0EF3'     ; ----XXX-XXXX--XX = --------XXXXXXXXXXXXXXXX----
            dc    h'0030'     ; ----------XX---- = --------------XXXX----------
            dc    h'0683'     ; -----XX-X-----XX = --------XXXX--------XXXX----
            dc    h'8B44'     ; X---X-XX-X---X-- = ------XXXX--XX----XX----XX--
            dc    h'89C5'     ; X---X--XXX---X-X = ------XX----XX----XXXX--XX--
            dc    h'0683'     ; -----XX-X-----XX = --------XXXX--------XXXX----

sprite9A    anop
            dc    h'00F1'     ; --------XXXX---X = --------------XXXXXXXX------
            dc    h'0091'     ; --------X--X---X = --------------XX----XX------
            dc    h'0060'     ; ---------XX----- = ----------------XXXX--------
            dc    h'06FD'     ; -----XX-XXXXXX-X = --------XXXX--XXXXXXXX--XXXX
            dc    h'0AFB'     ; ----X-X-XXXXX-XX = --------XX--XXXXXXXXXXXX--XX
            dc    h'0AFB'     ; ----X-X-XXXXX-XX = --------XX--XXXXXXXXXXXX--XX
            dc    h'06FD'     ; -----XX-XXXXXX-X = --------XXXX--XXXXXXXX--XXXX
            dc    h'0464'     ; -----X---XX--X-- = ----------XX----XXXX----XX--
            dc    h'0495'     ; -----X--X--X-X-X = ----------XX--XX----XX--XX--
            dc    h'04F5'     ; -----X--XXXX-X-X = ----------XX--XXXXXXXX--XX--
            dc    h'0CF7'     ; ----XX--XXXX-XXX = ----------XXXXXXXXXXXXXXXX--
            dc    h'0060'     ; ---------XX----- = ----------------XXXX--------
            dc    h'0C06'     ; ----XX-------XX- = ----------XXXX--------XXXX--
            dc    h'0A9B'     ; ----X-X-X--XX-XX = --------XX--XXXX----XXXX--XX
            dc    h'0299'     ; ------X-X--XX--X = --------XX----XX----XX----XX
            dc    h'0C06'     ; ----XX-------XX- = ----------XXXX--------XXXX--

sprite9B    anop
            dc    h'FFFF'     ; XXXXXXXXXXXXXX = XXXXXXXXXXXXXXXXXXXXXXXXXXXX
            dc    h'542A'     ; X-X-X---X-X-X- = XX--XX----XX----XX----XX--XX
            dc    h'76BF'     ; XXX-XXX-XXXXXX = XXXXXX--XXXX--XXXX--XXXXXXXX
            dc    h'FFFF'     ; XXXXXXXXXXXXXX = XXXXXXXXXXXXXXXXXXXXXXXXXXXX
            dc    h'542A'     ; X-X-X---X-X-X- = XX--XX----XX----XX----XX--XX
            dc    h'76BF'     ; XXX-XXX-XXXXXX = XXXXXX--XXXX--XXXX--XXXXXXXX
            dc    h'FFFF'     ; XXXXXXXXXXXXXX = XXXXXXXXXXXXXXXXXXXXXXXXXXXX
            dc    h'542A'     ; X-X-X---X-X-X- = XX--XX----XX----XX----XX--XX
            dc    h'76BF'     ; XXX-XXX-XXXXXX = XXXXXX--XXXX--XXXX--XXXXXXXX
            dc    h'FFFF'     ; XXXXXXXXXXXXXX = XXXXXXXXXXXXXXXXXXXXXXXXXXXX
            dc    h'542A'     ; X-X-X---X-X-X- = XX--XX----XX----XX----XX--XX
            dc    h'76BF'     ; XXX-XXX-XXXXXX = XXXXXX--XXXX--XXXX--XXXXXXXX
            dc    h'FFFF'     ; XXXXXXXXXXXXXX = XXXXXXXXXXXXXXXXXXXXXXXXXXXX
            dc    h'542A'     ; X-X-X---X-X-X- = XX--XX----XX----XX----XX--XX
            dc    h'76BF'     ; XXX-XXX-XXXXXX = XXXXXX--XXXX--XXXX--XXXXXXXX
            dc    h'FFFF'     ; XXXXXXXXXXXXXX = XXXXXXXXXXXXXXXXXXXXXXXXXXXX

sprite9C    anop
            dc    h'FFFF'     ; XXXXXXXXXXXXXX = XXXXXXXXXXXXXXXXXXXXXXXXXXXX
            dc    h'542A'     ; X-X-X---X-X-X- = XX--XX----XX----XX----XX--XX
            dc    h'542A'     ; X-X-X---X-X-X- = XX--XX----XX----XX----XX--XX
            dc    h'542A'     ; X-X-X---X-X-X- = XX--XX----XX----XX----XX--XX
            dc    h'542A'     ; X-X-X---X-X-X- = XX--XX----XX----XX----XX--XX
            dc    h'542A'     ; X-X-X---X-X-X- = XX--XX----XX----XX----XX--XX
            dc    h'542A'     ; X-X-X---X-X-X- = XX--XX----XX----XX----XX--XX
            dc    h'542A'     ; X-X-X---X-X-X- = XX--XX----XX----XX----XX--XX
            dc    h'542A'     ; X-X-X---X-X-X- = XX--XX----XX----XX----XX--XX
            dc    h'542A'     ; X-X-X---X-X-X- = XX--XX----XX----XX----XX--XX
            dc    h'542A'     ; X-X-X---X-X-X- = XX--XX----XX----XX----XX--XX
            dc    h'542A'     ; X-X-X---X-X-X- = XX--XX----XX----XX----XX--XX
            dc    h'542A'     ; X-X-X---X-X-X- = XX--XX----XX----XX----XX--XX
            dc    h'542A'     ; X-X-X---X-X-X- = XX--XX----XX----XX----XX--XX
            dc    h'542A'     ; X-X-X---X-X-X- = XX--XX----XX----XX----XX--XX
            dc    h'FFFF'     ; XXXXXXXXXXXXXX = XXXXXXXXXXXXXXXXXXXXXXXXXXXX

sprite9D    anop
            dc    h'FFFF'     ; XXXXXXXXXXXXXX = XXXXXXXXXXXXXXXXXXXXXXXXXXXX
            dc    h'1224'     ; --X--X--X--X-- = XX------XX------XX------XX--
            dc    h'C993'     ; X--X--X--X--XX = ----XXXX----XXXX----XXXX----
            dc    h'2448'     ; -X--X--X--X--- = --XX------XX------XX------XX
            dc    h'2448'     ; -X--X--X--X--- = --XX------XX------XX------XX
            dc    h'C993'     ; X--X--X--X--XX = ----XXXX----XXXX----XXXX----
            dc    h'1224'     ; --X--X--X--X-- = XX------XX------XX------XX--
            dc    h'1224'     ; --X--X--X--X-- = XX------XX------XX------XX--
            dc    h'C993'     ; X--X--X--X--XX = ----XXXX----XXXX----XXXX----
            dc    h'2448'     ; -X--X--X--X--- = --XX------XX------XX------XX
            dc    h'2448'     ; -X--X--X--X--- = --XX------XX------XX------XX
            dc    h'C993'     ; X--X--X--X--XX = ----XXXX----XXXX----XXXX----
            dc    h'1224'     ; --X--X--X--X-- = XX------XX------XX------XX--
            dc    h'1224'     ; --X--X--X--X-- = XX------XX------XX------XX--
            dc    h'C993'     ; X--X--X--X--XX = ----XXXX----XXXX----XXXX----
            dc    h'FFFF'     ; XXXXXXXXXXXXXX = XXXXXXXXXXXXXXXXXXXXXXXXXXXX

sprite9E    anop
            dc    h'FFFF'     ; XXXXXXXXXXXXXX = XXXXXXXXXXXXXXXXXXXXXXXXXXXX
            dc    h'5889'     ; X-XX--X---X--X = XX--XX------XX------XX----XX
            dc    h'911A'     ; --X---X--XX-X- = XX----XX------XX------XX--XX
            dc    h'122C'     ; --X--X--X-XX-- = XX------XX------XX------XXXX
            dc    h'3448'     ; -XX-X--X--X--- = XXXX------XX------XX------XX
            dc    h'5889'     ; X-XX--X---X--X = XX--XX------XX------XX----XX
            dc    h'911A'     ; --X---X--XX-X- = XX----XX------XX------XX--XX
            dc    h'122C'     ; --X--X--X-XX-- = XX------XX------XX------XXXX
            dc    h'3448'     ; -XX-X--X--X--- = XXXX------XX------XX------XX
            dc    h'5889'     ; X-XX--X---X--X = XX--XX------XX------XX----XX
            dc    h'911A'     ; --X---X--XX-X- = XX----XX------XX------XX--XX
            dc    h'122C'     ; --X--X--X-XX-- = XX------XX------XX------XXXX
            dc    h'3448'     ; -XX-X--X--X--- = XXXX------XX------XX------XX
            dc    h'5889'     ; X-XX--X---X--X = XX--XX------XX------XX----XX
            dc    h'911A'     ; --X---X--XX-X- = XX----XX------XX------XX--XX
            dc    h'FFFF'     ; XXXXXXXXXXXXXX = XXXXXXXXXXXXXXXXXXXXXXXXXXXX

sprite9F    anop
            dc    h'FFFF'     ; XXXXXXXXXXXXXX = XXXXXXXXXXXXXXXXXXXXXXXXXXXX
            dc    h'A55A'     ; -X--X-XX-XX-X- = --XX--XX--XX--XX--XX--XX--XX
            dc    h'A55A'     ; -X--X-XX-XX-X- = --XX--XX--XX--XX--XX--XX--XX
            dc    h'A55A'     ; -X--X-XX-XX-X- = --XX--XX--XX--XX--XX--XX--XX
            dc    h'A55A'     ; -X--X-XX-XX-X- = --XX--XX--XX--XX--XX--XX--XX
            dc    h'A55A'     ; -X--X-XX-XX-X- = --XX--XX--XX--XX--XX--XX--XX
            dc    h'A55A'     ; -X--X-XX-XX-X- = --XX--XX--XX--XX--XX--XX--XX
            dc    h'A55A'     ; -X--X-XX-XX-X- = --XX--XX--XX--XX--XX--XX--XX
            dc    h'A55A'     ; -X--X-XX-XX-X- = --XX--XX--XX--XX--XX--XX--XX
            dc    h'A55A'     ; -X--X-XX-XX-X- = --XX--XX--XX--XX--XX--XX--XX
            dc    h'A55A'     ; -X--X-XX-XX-X- = --XX--XX--XX--XX--XX--XX--XX
            dc    h'A55A'     ; -X--X-XX-XX-X- = --XX--XX--XX--XX--XX--XX--XX
            dc    h'A55A'     ; -X--X-XX-XX-X- = --XX--XX--XX--XX--XX--XX--XX
            dc    h'A55A'     ; -X--X-XX-XX-X- = --XX--XX--XX--XX--XX--XX--XX
            dc    h'A55A'     ; -X--X-XX-XX-X- = --XX--XX--XX--XX--XX--XX--XX
            dc    h'FFFF'     ; XXXXXXXXXXXXXX = XXXXXXXXXXXXXXXXXXXXXXXXXXXX

spriteA0    anop
            dc    h'FFFF'     ; XXXXXXXXXXXXXX = XXXXXXXXXXXXXXXXXXXXXXXXXXXX
            dc    h'1818'     ; --XX-----XX--- = XX----------XXXX----------XX
            dc    h'DFFB'     ; X-XXXXXXXXX-XX = XX--XXXXXXXXXXXXXXXXXXXX--XX
            dc    h'DFFB'     ; X-XXXXXXXXX-XX = XX--XXXXXXXXXXXXXXXXXXXX--XX
            dc    h'D18B'     ; X-X---X---X-XX = XX--XXXX------------XXXX--XX
            dc    h'D18B'     ; X-X---X---X-XX = XX--XXXX------------XXXX--XX
            dc    h'D18B'     ; X-X---X---X-XX = XX--XXXX------------XXXX--XX
            dc    h'F18F'     ; XXX---X---XXXX = XXXXXXXX------------XXXXXXXX
            dc    h'F18F'     ; XXX---X---XXXX = XXXXXXXX------------XXXXXXXX
            dc    h'D18B'     ; X-X---X---X-XX = XX--XXXX------------XXXX--XX
            dc    h'D18B'     ; X-X---X---X-XX = XX--XXXX------------XXXX--XX
            dc    h'D18B'     ; X-X---X---X-XX = XX--XXXX------------XXXX--XX
            dc    h'DFFB'     ; X-XXXXXXXXX-XX = XX--XXXXXXXXXXXXXXXXXXXX--XX
            dc    h'DFFB'     ; X-XXXXXXXXX-XX = XX--XXXXXXXXXXXXXXXXXXXX--XX
            dc    h'1818'     ; --XX-----XX--- = XX----------XXXX----------XX
            dc    h'FFFF'     ; XXXXXXXXXXXXXX = XXXXXXXXXXXXXXXXXXXXXXXXXXXX

spriteA1    anop
            dc    h'FFFF'     ; XXXXXXXXXXXXXX = XXXXXXXXXXXXXXXXXXXXXXXXXXXX
            dc    h'1818'     ; --XX-----XX--- = XX----------XXXX----------XX
            dc    h'1818'     ; --XX-----XX--- = XX----------XXXX----------XX
            dc    h'1818'     ; --XX-----XX--- = XX----------XXXX----------XX
            dc    h'1818'     ; --XX-----XX--- = XX----------XXXX----------XX
            dc    h'1818'     ; --XX-----XX--- = XX----------XXXX----------XX
            dc    h'1818'     ; --XX-----XX--- = XX----------XXXX----------XX
            dc    h'FFFF'     ; XXXXXXXXXXXXXX = XXXXXXXXXXXXXXXXXXXXXXXXXXXX
            dc    h'FFFF'     ; XXXXXXXXXXXXXX = XXXXXXXXXXXXXXXXXXXXXXXXXXXX
            dc    h'1818'     ; --XX-----XX--- = XX----------XXXX----------XX
            dc    h'1818'     ; --XX-----XX--- = XX----------XXXX----------XX
            dc    h'1818'     ; --XX-----XX--- = XX----------XXXX----------XX
            dc    h'1818'     ; --XX-----XX--- = XX----------XXXX----------XX
            dc    h'1818'     ; --XX-----XX--- = XX----------XXXX----------XX
            dc    h'1818'     ; --XX-----XX--- = XX----------XXXX----------XX
            dc    h'FFFF'     ; XXXXXXXXXXXXXX = XXXXXXXXXXXXXXXXXXXXXXXXXXXX

spriteA2    anop
            dc    h'FFFF'     ; XXXXXXXXXXXXXX = XXXXXXXXXXXXXXXXXXXXXXXXXXXX
            dc    h'1008'     ; --X-------X--- = XX------------------------XX
            dc    h'300C'     ; -XX-------XX-- = XXXX--------------------XXXX
            dc    h'500A'     ; X-X-------X-X- = XX--XX----------------XX--XX
            dc    h'9189'     ; --X---X---X--X = XX----XX------------XX----XX
            dc    h'324C'     ; -XX--X-X--XX-- = XXXX----XX--------XX----XXXX
            dc    h'542A'     ; X-X-X---X-X-X- = XX--XX----XX----XX----XX--XX
            dc    h'9999'     ; --XX--X--XX--X = XX----XX----XXXX----XX----XX
            dc    h'324C'     ; -XX--X-X--XX-- = XXXX----XX--------XX----XXXX
            dc    h'542A'     ; X-X-X---X-X-X- = XX--XX----XX----XX----XX--XX
            dc    h'9999'     ; --XX--X--XX--X = XX----XX----XXXX----XX----XX
            dc    h'324C'     ; -XX--X-X--XX-- = XXXX----XX--------XX----XXXX
            dc    h'542A'     ; X-X-X---X-X-X- = XX--XX----XX----XX----XX--XX
            dc    h'324C'     ; -XX--X-X--XX-- = XXXX----XX--------XX----XXXX
            dc    h'9999'     ; --XX--X--XX--X = XX----XX----XXXX----XX----XX
            dc    h'FFFF'     ; XXXXXXXXXXXXXX = XXXXXXXXXXXXXXXXXXXXXXXXXXXX

spriteA3    anop
            dc    h'FFFF'     ; XXXXXXXXXXXXXX = XXXXXXXXXXXXXXXXXXXXXXXXXXXX
            dc    h'1008'     ; --X-------X--- = XX------------------------XX
            dc    h'1818'     ; --XX-----XX--- = XX----------XXXX----------XX
            dc    h'1428'     ; --X-X---X-X--- = XX--------XX----XX--------XX
            dc    h'1248'     ; --X--X-X--X--- = XX------XX--------XX------XX
            dc    h'9189'     ; --X---X---X--X = XX----XX------------XX----XX
            dc    h'500A'     ; X-X-------X-X- = XX--XX----------------XX--XX
            dc    h'381C'     ; -XXX-----XXX-- = XXXX--------XXXX--------XXXX
            dc    h'381C'     ; -XXX-----XXX-- = XXXX--------XXXX--------XXXX
            dc    h'500A'     ; X-X-------X-X- = XX--XX----------------XX--XX
            dc    h'9189'     ; --X---X---X--X = XX----XX------------XX----XX
            dc    h'1248'     ; --X--X-X--X--- = XX------XX--------XX------XX
            dc    h'1428'     ; --X-X---X-X--- = XX--------XX----XX--------XX
            dc    h'1818'     ; --XX-----XX--- = XX----------XXXX----------XX
            dc    h'1008'     ; --X-------X--- = XX------------------------XX
            dc    h'FFFF'     ; XXXXXXXXXXXXXX = XXXXXXXXXXXXXXXXXXXXXXXXXXXX

spriteA4    anop
            dc    h'FFFF'     ; XXXXXXXXXXXXXX = XXXXXXXXXXXXXXXXXXXXXXXXXXXX
            dc    h'F11E'     ; XXX---X--XXXX- = XXXXXXXX------XX------XXXXXX
            dc    h'9199'     ; --X---X--XX--X = XX----XX------XX----XX----XX
            dc    h'B599'     ; -XX-X-X--XX--X = XXXX--XX--XX--XX----XX----XX
            dc    h'B59D'     ; -XX-X-X--XXX-X = XXXX--XX--XX--XX----XX--XXXX
            dc    h'951C'     ; --X-X-X--XXX-- = XX----XX--XX--XX--------XXXX
            dc    h'5099'     ; X-X---X--XX--X = XX--XX--------XX----XX----XX
            dc    h'5ADB'     ; X-XX-XXX-XX-XX = XX--XX--XX--XXXX--XXXXXX--XX
            dc    h'5AAD'     ; X-XX-XX-X-XX-X = XX--XX--XX--XX--XX--XX--XXXX
            dc    h'582C'     ; X-XX----X-XX-- = XX--XX------XX--XX------XXXX
            dc    h'99CB'     ; --XX--XX--X-XX = XX----XX----XX----XXXXXX--XX
            dc    h'9908'     ; --XX--X---X--- = XX----XX----XX------------XX
            dc    h'B15A'     ; -XX---XX-XX-X- = XXXX--XX------XX--XX--XX--XX
            dc    h'B55A'     ; -XX-X-XX-XX-X- = XXXX--XX--XX--XX--XX--XX--XX
            dc    h'951A'     ; --X-X-X--XX-X- = XX----XX--XX--XX------XX--XX
            dc    h'FFFF'     ; XXXXXXXXXXXXXX = XXXXXXXXXXXXXXXXXXXXXXXXXXXX

spriteA5    anop
            dc    h'FFFF'     ; XXXXXXXXXXXXXX = XXXXXXXXXXXXXXXXXXXXXXXXXXXX
            dc    h'BBAD'     ; -XXX-XX-X-XX-X = XXXX--XXXX--XX--XX--XX--XXXX
            dc    h'7ABD'     ; XXXX-XX-XXXX-X = XXXXXX--XX--XXXXXX--XX--XXXX
            dc    h'FFFF'     ; XXXXXXXXXXXXXX = XXXXXXXXXXXXXXXXXXXXXXXXXXXX
            dc    h'9189'     ; --X---X---X--X = XX----XX------------XX----XX
            dc    h'9189'     ; --X---X---X--X = XX----XX------------XX----XX
            dc    h'FFFF'     ; XXXXXXXXXXXXXX = XXXXXXXXXXXXXXXXXXXXXXXXXXXX
            dc    h'9189'     ; --X---X---X--X = XX----XX------------XX----XX
            dc    h'9189'     ; --X---X---X--X = XX----XX------------XX----XX
            dc    h'FFFF'     ; XXXXXXXXXXXXXX = XXXXXXXXXXXXXXXXXXXXXXXXXXXX
            dc    h'9189'     ; --X---X---X--X = XX----XX------------XX----XX
            dc    h'9189'     ; --X---X---X--X = XX----XX------------XX----XX
            dc    h'FFFF'     ; XXXXXXXXXXXXXX = XXXXXXXXXXXXXXXXXXXXXXXXXXXX
            dc    h'9189'     ; --X---X---X--X = XX----XX------------XX----XX
            dc    h'9189'     ; --X---X---X--X = XX----XX------------XX----XX
            dc    h'FFFF'     ; XXXXXXXXXXXXXX = XXXXXXXXXXXXXXXXXXXXXXXXXXXX

spriteA6    anop
            dc    h'FFFF'     ; XXXXXXXXXXXXXX = XXXXXXXXXXXXXXXXXXXXXXXXXXXX
            dc    h'1008'     ; --X-------X--- = XX------------------------XX
            dc    h'1E78'     ; --XXXX-XXXX--- = XX------XXXXXXXXXXXX------XX
            dc    h'1E78'     ; --XXXX-XXXX--- = XX------XXXXXXXXXXXX------XX
            dc    h'1E78'     ; --XXXX-XXXX--- = XX------XXXXXXXXXXXX------XX
            dc    h'1E78'     ; --XXXX-XXXX--- = XX------XXXXXXXXXXXX------XX
            dc    h'1E78'     ; --XXXX-XXXX--- = XX------XXXXXXXXXXXX------XX
            dc    h'1668'     ; --X-XX-XX-X--- = XX------XXXX----XXXX------XX
            dc    h'1668'     ; --X-XX-XX-X--- = XX------XXXX----XXXX------XX
            dc    h'1E78'     ; --XXXX-XXXX--- = XX------XXXXXXXXXXXX------XX
            dc    h'1E78'     ; --XXXX-XXXX--- = XX------XXXXXXXXXXXX------XX
            dc    h'1E78'     ; --XXXX-XXXX--- = XX------XXXXXXXXXXXX------XX
            dc    h'1E78'     ; --XXXX-XXXX--- = XX------XXXXXXXXXXXX------XX
            dc    h'1E78'     ; --XXXX-XXXX--- = XX------XXXXXXXXXXXX------XX
            dc    h'1008'     ; --X-------X--- = XX------------------------XX
            dc    h'FFFF'     ; XXXXXXXXXXXXXX = XXXXXXXXXXXXXXXXXXXXXXXXXXXX

spriteA7    anop
            dc    h'0C30'     ; ---XX---XX---- = ----------XXXXXXXX----------
            dc    h'0E70'     ; ---XXX-XXX---- = --------XXXXXXXXXXXX--------
            dc    h'8FF1'     ; ---XXXXXXX---X = ------XXXXXXXXXXXXXXXX------
            dc    h'8991'     ; ---X--X--X---X = ------XX----XXXX----XX------
            dc    h'8991'     ; ---X--X--X---X = ------XX----XXXX----XX------
            dc    h'0E70'     ; ---XXX-XXX---- = --------XXXXXXXXXXXX--------
            dc    h'0A50'     ; ---X-X-X-X---- = --------XX--XXXX--XX--------
            dc    h'0420'     ; ----X---X----- = ----------XX----XX----------
            dc    h'2814'     ; -X-X-----X-X-- = --XX--------XXXX--------XX--
            dc    h'F18F'     ; XXX---X---XXXX = XXXXXXXX------------XXXXXXXX
            dc    h'F7EF'     ; XXX-XXXXX-XXXX = XXXXXXXXXXXX----XXXXXXXXXXXX
            dc    h'0A70'     ; ---X-X-XXX---- = --------XX--XXXXXXXX--------
            dc    h'0E50'     ; ---XXX-X-X---- = --------XXXXXXXX--XX--------
            dc    h'F7EF'     ; XXX-XXXXX-XXXX = XXXXXXXXXXXX----XXXXXXXXXXXX
            dc    h'F18F'     ; XXX---X---XXXX = XXXXXXXX------------XXXXXXXX
            dc    h'2004'     ; -X---------X-- = --XX--------------------XX--

spriteA8    anop
            dc    h'FFFF'     ; XXXXXXXXXXXXXX = XXXXXXXXXXXXXXXXXXXXXXXXXXXX
            dc    h'FFFF'     ; XXXXXXXXXXXXXX = XXXXXXXXXXXXXXXXXXXXXXXXXXXX
            dc    h'F3CF'     ; XXX--XXX--XXXX = XXXXXXXXXX--------XXXXXXXXXX
            dc    h'F18F'     ; XXX---X---XXXX = XXXXXXXX------------XXXXXXXX
            dc    h'700E'     ; XXX-------XXX- = XXXXXX----------------XXXXXX
            dc    h'300C'     ; -XX-------XX-- = XXXX--------------------XXXX
            dc    h'1818'     ; --XX-----XX--- = XX----------XXXX----------XX
            dc    h'1428'     ; --X-X---X-X--- = XX--------XX----XX--------XX
            dc    h'1428'     ; --X-X---X-X--- = XX--------XX----XX--------XX
            dc    h'1818'     ; --XX-----XX--- = XX----------XXXX----------XX
            dc    h'300C'     ; -XX-------XX-- = XXXX--------------------XXXX
            dc    h'700E'     ; XXX-------XXX- = XXXXXX----------------XXXXXX
            dc    h'F18F'     ; XXX---X---XXXX = XXXXXXXX------------XXXXXXXX
            dc    h'F3CF'     ; XXX--XXX--XXXX = XXXXXXXXXX--------XXXXXXXXXX
            dc    h'FFFF'     ; XXXXXXXXXXXXXX = XXXXXXXXXXXXXXXXXXXXXXXXXXXX
            dc    h'FFFF'     ; XXXXXXXXXXXXXX = XXXXXXXXXXXXXXXXXXXXXXXXXXXX

spriteA9    anop
            dc    h'FFFF'     ; XXXXXXXXXXXXXX = XXXXXXXXXXXXXXXXXXXXXXXXXXXX
            dc    h'1008'     ; --X-------X--- = XX------------------------XX
            dc    h'1008'     ; --X-------X--- = XX------------------------XX
            dc    h'1008'     ; --X-------X--- = XX------------------------XX
            dc    h'1008'     ; --X-------X--- = XX------------------------XX
            dc    h'1208'     ; --X--X----X--- = XX------XX----------------XX
            dc    h'5A08'     ; X-XX-X----X--- = XX--XX--XX--XX------------XX
            dc    h'978B'     ; --X-XXX---X-XX = XX----XXXXXX--------XXXX--XX
            dc    h'FF5E'     ; XXXXXXXX-XXXX- = XXXXXXXXXXXXXXXX--XX--XXXXXX
            dc    h'9708'     ; --X-XXX---X--- = XX----XXXXXX--------------XX
            dc    h'5A08'     ; X-XX-X----X--- = XX--XX--XX--XX------------XX
            dc    h'1208'     ; --X--X----X--- = XX------XX----------------XX
            dc    h'1008'     ; --X-------X--- = XX------------------------XX
            dc    h'1008'     ; --X-------X--- = XX------------------------XX
            dc    h'1008'     ; --X-------X--- = XX------------------------XX
            dc    h'FFFF'     ; XXXXXXXXXXXXXX = XXXXXXXXXXXXXXXXXXXXXXXXXXXX

spriteAA    anop
            dc    h'FFFF'     ; XXXXXXXXXXXXXX = XXXXXXXXXXXXXXXXXXXXXXXXXXXX
            dc    h'1818'     ; --XX-----XX--- = XX----------XXXX----------XX
            dc    h'1818'     ; --XX-----XX--- = XX----------XXXX----------XX
            dc    h'FFFF'     ; XXXXXXXXXXXXXX = XXXXXXXXXXXXXXXXXXXXXXXXXXXX
            dc    h'1818'     ; --XX-----XX--- = XX----------XXXX----------XX
            dc    h'1818'     ; --XX-----XX--- = XX----------XXXX----------XX
            dc    h'FFFF'     ; XXXXXXXXXXXXXX = XXXXXXXXXXXXXXXXXXXXXXXXXXXX
            dc    h'1818'     ; --XX-----XX--- = XX----------XXXX----------XX
            dc    h'1818'     ; --XX-----XX--- = XX----------XXXX----------XX
            dc    h'FFFF'     ; XXXXXXXXXXXXXX = XXXXXXXXXXXXXXXXXXXXXXXXXXXX
            dc    h'1818'     ; --XX-----XX--- = XX----------XXXX----------XX
            dc    h'1818'     ; --XX-----XX--- = XX----------XXXX----------XX
            dc    h'FFFF'     ; XXXXXXXXXXXXXX = XXXXXXXXXXXXXXXXXXXXXXXXXXXX
            dc    h'1818'     ; --XX-----XX--- = XX----------XXXX----------XX
            dc    h'1818'     ; --XX-----XX--- = XX----------XXXX----------XX
            dc    h'FFFF'     ; XXXXXXXXXXXXXX = XXXXXXXXXXXXXXXXXXXXXXXXXXXX

spriteAB    anop
            dc    h'FFFF'     ; XXXXXXXXXXXXXX = XXXXXXXXXXXXXXXXXXXXXXXXXXXX
            dc    h'1008'     ; --X-------X--- = XX------------------------XX
            dc    h'DFFB'     ; X-XXXXXXXXX-XX = XX--XXXXXXXXXXXXXXXXXXXX--XX
            dc    h'500A'     ; X-X-------X-X- = XX--XX----------------XX--XX
            dc    h'5A5A'     ; X-XX-X-X-XX-X- = XX--XX--XX--XXXX--XX--XX--XX
            dc    h'5A5A'     ; X-XX-X-X-XX-X- = XX--XX--XX--XXXX--XX--XX--XX
            dc    h'5A5A'     ; X-XX-X-X-XX-X- = XX--XX--XX--XXXX--XX--XX--XX
            dc    h'5A5A'     ; X-XX-X-X-XX-X- = XX--XX--XX--XXXX--XX--XX--XX
            dc    h'5A5A'     ; X-XX-X-X-XX-X- = XX--XX--XX--XXXX--XX--XX--XX
            dc    h'5A5A'     ; X-XX-X-X-XX-X- = XX--XX--XX--XXXX--XX--XX--XX
            dc    h'DFFB'     ; X-XXXXXXXXX-XX = XX--XXXXXXXXXXXXXXXXXXXX--XX
            dc    h'5A5A'     ; X-XX-X-X-XX-X- = XX--XX--XX--XXXX--XX--XX--XX
            dc    h'5A5A'     ; X-XX-X-X-XX-X- = XX--XX--XX--XXXX--XX--XX--XX
            dc    h'5A5A'     ; X-XX-X-X-XX-X- = XX--XX--XX--XXXX--XX--XX--XX
            dc    h'5A5A'     ; X-XX-X-X-XX-X- = XX--XX--XX--XXXX--XX--XX--XX
            dc    h'FFFF'     ; XXXXXXXXXXXXXX = XXXXXXXXXXXXXXXXXXXXXXXXXXXX

spriteAC    anop
            dc    h'FFFF'     ; XXXXXXXXXXXXXX = XXXXXXXXXXXXXXXXXXXXXXXXXXXX
            dc    h'1008'     ; --X-------X--- = XX------------------------XX
            dc    h'D18B'     ; X-X---X---X-XX = XX--XXXX------------XXXX--XX
            dc    h'500A'     ; X-X-------X-X- = XX--XX----------------XX--XX
            dc    h'5A5A'     ; X-XX-X-X-XX-X- = XX--XX--XX--XXXX--XX--XX--XX
            dc    h'5A5A'     ; X-XX-X-X-XX-X- = XX--XX--XX--XXXX--XX--XX--XX
            dc    h'5A5A'     ; X-XX-X-X-XX-X- = XX--XX--XX--XXXX--XX--XX--XX
            dc    h'5A5A'     ; X-XX-X-X-XX-X- = XX--XX--XX--XXXX--XX--XX--XX
            dc    h'5A5A'     ; X-XX-X-X-XX-X- = XX--XX--XX--XXXX--XX--XX--XX
            dc    h'5A5A'     ; X-XX-X-X-XX-X- = XX--XX--XX--XXXX--XX--XX--XX
            dc    h'5A5A'     ; X-XX-X-X-XX-X- = XX--XX--XX--XXXX--XX--XX--XX
            dc    h'5A5A'     ; X-XX-X-X-XX-X- = XX--XX--XX--XXXX--XX--XX--XX
            dc    h'500A'     ; X-X-------X-X- = XX--XX----------------XX--XX
            dc    h'D18B'     ; X-X---X---X-XX = XX--XXXX------------XXXX--XX
            dc    h'1008'     ; --X-------X--- = XX------------------------XX
            dc    h'FFFF'     ; XXXXXXXXXXXXXX = XXXXXXXXXXXXXXXXXXXXXXXXXXXX

spriteAD    anop
            dc    h'FFFF'     ; XXXXXXXXXXXXXX = XXXXXXXXXXXXXXXXXXXXXXXXXXXX
            dc    h'1008'     ; --X-------X--- = XX------------------------XX
            dc    h'DFFB'     ; X-XXXXXXXXX-XX = XX--XXXXXXXXXXXXXXXXXXXX--XX
            dc    h'500A'     ; X-X-------X-X- = XX--XX----------------XX--XX
            dc    h'5E7A'     ; X-XXXX-XXXX-X- = XX--XX--XXXXXXXXXXXX--XX--XX
            dc    h'524A'     ; X-X--X-X--X-X- = XX--XX--XX--------XX--XX--XX
            dc    h'5A5A'     ; X-XX-X-X-XX-X- = XX--XX--XX--XXXX--XX--XX--XX
            dc    h'5A5A'     ; X-XX-X-X-XX-X- = XX--XX--XX--XXXX--XX--XX--XX
            dc    h'5A5A'     ; X-XX-X-X-XX-X- = XX--XX--XX--XXXX--XX--XX--XX
            dc    h'5A5A'     ; X-XX-X-X-XX-X- = XX--XX--XX--XXXX--XX--XX--XX
            dc    h'524A'     ; X-X--X-X--X-X- = XX--XX--XX--------XX--XX--XX
            dc    h'5E7A'     ; X-XXXX-XXXX-X- = XX--XX--XXXXXXXXXXXX--XX--XX
            dc    h'500A'     ; X-X-------X-X- = XX--XX----------------XX--XX
            dc    h'DFFB'     ; X-XXXXXXXXX-XX = XX--XXXXXXXXXXXXXXXXXXXX--XX
            dc    h'1008'     ; --X-------X--- = XX------------------------XX
            dc    h'FFFF'     ; XXXXXXXXXXXXXX = XXXXXXXXXXXXXXXXXXXXXXXXXXXX

spriteAE    anop
            dc    h'0000'     ; -------------- = ----------------------------
            dc    h'0E70'     ; ---XXX-XXX---- = --------XXXXXXXXXXXX--------
            dc    h'C183'     ; X-----X-----XX = ----XXXX------------XXXX----
            dc    h'2C34'     ; -X-XX---XX-X-- = --XX------XXXXXXXX------XX--
            dc    h'1248'     ; --X--X-X--X--- = XX------XX--------XX------XX
            dc    h'9189'     ; --X---X---X--X = XX----XX------------XX----XX
            dc    h'9189'     ; --X---X---X--X = XX----XX------------XX----XX
            dc    h'9189'     ; --X---X---X--X = XX----XX------------XX----XX
            dc    h'1248'     ; --X--X-X--X--- = XX------XX--------XX------XX
            dc    h'2424'     ; -X--X---X--X-- = --XX------XX----XX------XX--
            dc    h'C5A3'     ; X---X-X-X---XX = ----XXXX--XX----XX--XXXX----
            dc    h'95A9'     ; --X-X-X-X-X--X = XX----XX--XX----XX--XX----XX
            dc    h'F5AF'     ; XXX-X-X-X-XXXX = XXXXXXXX--XX----XX--XXXXXXXX
            dc    h'1428'     ; --X-X---X-X--- = XX--------XX----XX--------XX
            dc    h'F7EF'     ; XXX-XXXXX-XXXX = XXXXXXXXXXXX----XXXXXXXXXXXX
            dc    h'0000'     ; -------------- = ----------------------------

spriteAF    anop
            dc    h'0450'     ; -----X---X-X---- = ----------XX--XX--XX--------
            dc    h'0A2C'     ; ----X-X---X-XX-- = --------XX--XX--XX------XXXX
            dc    h'CF32'     ; XX--XXXX--XX--X- = ----XXXXXXXXXXXXXX----XX----
            dc    h'6CFF'     ; -XX-XX--XXXXXXXX = --XXXX----XXXXXXXXXXXXXXXXXX
            dc    h'74F1'     ; -XXX-X--XXXX---X = XXXXXX----XX--XXXXXXXX------
            dc    h'CFCF'     ; XX--XXXXXX--XXXX = ----XXXXXXXXXX----XXXXXXXXXX
            dc    h'FF72'     ; XXXXXXXX-XXX--X- = XXXXXXXXXXXXXXXXXXXX--XX----
            dc    h'CF3C'     ; XX--XXXX--XXXX-- = ----XXXXXXXXXXXXXX------XXXX
            dc    h'0000'     ; ---------------- = ----------------------------
            dc    h'0800'     ; ----X----------- = ------------XX--------------
            dc    h'E9F3'     ; XXX-X--XXXXX--XX = --XXXXXX----XXXXXXXXXXXX----
            dc    h'9F04'     ; X--XXXXX-----X-- = XX----XXXXXXXX----------XX--
            dc    h'1808'     ; ---XX-------X--- = XX----------XX------------XX
            dc    h'9FF7'     ; X--XXXXXXXXX-XXX = XX----XXXXXXXXXXXXXXXXXXXX--
            dc    h'E9F3'     ; XXX-X--XXXXX--XX = --XXXXXX----XXXXXXXXXXXX----
            dc    h'0800'     ; ----X----------- = ------------XX--------------

sprite19dw  anop              ; Double width for direct drawing when cheat-boot is active
            dc    h'30660300'  ; -XX----XX--XX------XX------- = ----XX--XX--XXXX------------
            dc    h'70190300'  ; XXX------XX--X-----XX------- = ----XXXX--XX--XX------------
            dc    h'707F0300'  ; XXX----XXXXXXX-----XX------- = ----XXXXXXXXXXXX------------
            dc    h'00060000'  ; -----------XX--------------- = --------XX------------------
            dc    h'00060000'  ; -----------XX--------------- = --------XX------------------
            dc    h'407F0000'  ; X------XXXXXXX-------------- = ------XXXXXXXX--------------
            dc    h'40610000'  ; X------XX----X-------------- = ------XX----XX--------------
            dc    h'40610000'  ; X------XX----X-------------- = ------XX----XX--------------
            dc    h'40610000'  ; X------XX----X-------------- = ------XX----XX--------------
            dc    h'30180300'  ; -XX------XX--------XX------- = ----XX----XX--XX------------
            dc    h'30607C01'  ; -XX----XX-----XXXXX--------X = ----XX------XX--XXXXXX------
            dc    h'4C070C06'  ; X--XX------XXX---XX------XX- = --XX--XXXX------XX----XX----
            dc    h'0C180318'  ; ---XX----XX--------XX--XX--- = --XX------XX--XX--------XX--
            dc    h'0C180018'  ; ---XX----XX------------XX--- = --XX------XX------------XX--
            dc    h'0C180018'  ; ---XX----XX------------XX--- = --XX------XX------------XX--
            dc    h'7F7F7F7F'  ; XXXXXXXXXXXXXXXXXXXXXXXXXXXX = XXXXXXXXXXXXXXXXXXXXXXXXXXXX

            end

