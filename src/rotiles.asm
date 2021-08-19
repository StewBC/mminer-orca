;-----------------------------------------------------------------------------
; rotiles.inc
; Part of manic miner, the zx spectrum game, made for Apple II
;
; Stefan Wessels, 2020
; This is free and unencumbered software released into the public domain.

;-----------------------------------------------------------------------------
            align  $10

;-----------------------------------------------------------------------------
ROTILES     data

;tiledata anop
tile00      anop
            dc     h'8080'     ; -------------- = --------------
            dc     h'8080'     ; -------------- = --------------
            dc     h'8080'     ; -------------- = --------------
            dc     h'8080'     ; -------------- = --------------
            dc     h'8080'     ; -------------- = --------------
            dc     h'8080'     ; -------------- = --------------
            dc     h'8080'     ; -------------- = --------------
            dc     h'8080'     ; -------------- = --------------

tile01      anop
            dc     h'C081'     ; X------------X = ------XX------
            dc     h'C081'     ; X------------X = ------XX------
            dc     h'FC9F'     ; XXXXX----XXXXX = --XXXXXXXXXX--
            dc     h'F3FF'     ; XXX--XXXXXXXXX = XX--XXXXXXXXXX
            dc     h'F3FF'     ; XXX--XXXXXXXXX = XX--XXXXXXXXXX
            dc     h'83FE'     ; -----XXXXXXXX- = XX------XXXXXX
            dc     h'8FE0'     ; ---XXXXXX----- = XXXX--------XX
            dc     h'FC9F'     ; XXXXX----XXXXX = --XXXXXXXXXX--

tile02      anop
            dc     h'C0FF'     ; X------XXXXXXX = ------XXXXXXXX
            dc     h'C0E1'     ; X------XX----X = ------XX----XX
            dc     h'FCE7'     ; XXXXX--XX--XXX = --XXXXXXXX--XX
            dc     h'8CFE'     ; ---XX--XXXXXX- = --XX----XXXXXX
            dc     h'BF86'     ; -XXXXXX----XX- = XXXXXX--XX----
            dc     h'F387'     ; XXX--XX----XXX = XX--XXXXXX----
            dc     h'C381'     ; X----XX------X = XX----XX------
            dc     h'FF81'     ; XXXXXXX------X = XXXXXXXX------

tile03      anop
            dc     h'C081'     ; X------------X = ------XX------
            dc     h'C081'     ; X------------X = ------XX------
            dc     h'C081'     ; X------------X = ------XX------
            dc     h'C081'     ; X------------X = ------XX------
            dc     h'C081'     ; X------------X = ------XX------
            dc     h'C081'     ; X------------X = ------XX------
            dc     h'C081'     ; X------------X = ------XX------
            dc     h'C081'     ; X------------X = ------XX------

tile04      anop
            dc     h'C081'     ; X------------X = ------XX------
            dc     h'C081'     ; X------------X = ------XX------
            dc     h'CFF9'     ; X--XXXXXXXX--X = XXXX--XX--XXXX
            dc     h'F087'     ; XXX--------XXX = ----XXXXXX----
            dc     h'CFF9'     ; X--XXXXXXXX--X = XXXX--XX--XXXX
            dc     h'F087'     ; XXX--------XXX = ----XXXXXX----
            dc     h'CC99'     ; X--XX----XX--X = --XX--XX--XX--
            dc     h'C3E1'     ; X----XXXX----X = XX----XX----XX

tile05      anop
            dc     h'C081'     ; X------------X = ------XX------
            dc     h'CFF9'     ; X--XXXXXXXX--X = XXXX--XX--XXXX
            dc     h'F087'     ; XXX--------XXX = ----XXXXXX----
            dc     h'CFF9'     ; X--XXXXXXXX--X = XXXX--XX--XXXX
            dc     h'F087'     ; XXX--------XXX = ----XXXXXX----
            dc     h'8C98'     ; ---XX----XX--- = --XX------XX--
            dc     h'8FF8'     ; ---XXXXXXXX--- = XXXX------XXXX
            dc     h'B086'     ; -XX--------XX- = ----XX--XX----

tile06      anop
            dc     h'C081'     ; X------------X = ------XX------
            dc     h'BC9E'     ; -XXXX----XXXX- = --XXXX--XXXX--
            dc     h'8C98'     ; ---XX----XX--- = --XX------XX--
            dc     h'CFF9'     ; X--XXXXXXXX--X = XXXX--XX--XXXX
            dc     h'8FE6'     ; ---XXXXXX--XX- = XXXX----XX--XX
            dc     h'BC98'     ; -XXXX----XX--- = --XXXX----XX--
            dc     h'FC9F'     ; XXXXX----XXXXX = --XXXXXXXXXX--
            dc     h'C081'     ; X------------X = ------XX------

tile07      anop
            dc     h'C0FF'     ; X------XXXXXXX = ------XXXXXXXX
            dc     h'8F9E'     ; ---XXXX--XXXX- = XXXX----XXXX--
            dc     h'C0FF'     ; X------XXXXXXX = ------XXXXXXXX
            dc     h'8F9E'     ; ---XXXX--XXXX- = XXXX----XXXX--
            dc     h'8080'     ; -------------- = --------------
            dc     h'8080'     ; -------------- = --------------
            dc     h'8080'     ; -------------- = --------------
            dc     h'8080'     ; -------------- = --------------

tile08      anop
            dc     h'C0FF'     ; X------XXXXXXX = ------XXXXXXXX
            dc     h'B0F8'     ; -XX----XXXX--- = ----XX----XXXX
            dc     h'8CFE'     ; ---XX--XXXXXX- = --XX----XXXXXX
            dc     h'FFFF'     ; XXXXXXXXXXXXXX = XXXXXXXXXXXXXX
            dc     h'C3FF'     ; X----XXXXXXXXX = XX----XXXXXXXX
            dc     h'C39F'     ; X----XX--XXXXX = XX----XXXXXX--
            dc     h'C387'     ; X----XX----XXX = XX----XXXX----
            dc     h'FF81'     ; XXXXXXX------X = XXXXXXXX------

tile09      anop
            dc     h'F081'     ; XXX----------X = ----XXXX------
            dc     h'8C86'     ; ---XX------XX- = --XX----XX----
            dc     h'8386'     ; -----XX----XX- = XX------XX----
            dc     h'C381'     ; X----XX------X = XX----XX------
            dc     h'BC86'     ; -XXXX------XX- = --XXXX--XX----
            dc     h'8098'     ; ---------XX--- = ----------XX--
            dc     h'80E6'     ; -------XX--XX- = --------XX--XX
            dc     h'8098'     ; ---------XX--- = ----------XX--

tile0A      anop
            dc     h'F087'     ; XXX--------XXX = ----XXXXXX----
            dc     h'FC99'     ; XXXXX----XX--X = --XXXXXX--XX--
            dc     h'B3E6'     ; -XX--XXXX--XX- = XX--XX--XX--XX
            dc     h'BFE6'     ; -XXXXXXXX--XX- = XXXXXX--XX--XX
            dc     h'BFE6'     ; -XXXXXXXX--XX- = XXXXXX--XX--XX
            dc     h'BFE6'     ; -XXXXXXXX--XX- = XXXXXX--XX--XX
            dc     h'FC99'     ; XXXXX----XX--X = --XXXXXX--XX--
            dc     h'F087'     ; XXX--------XXX = ----XXXXXX----

tile0B      anop
            dc     h'F087'     ; XXX--------XXX = ----XXXXXX----
            dc     h'C081'     ; X------------X = ------XX------
            dc     h'F3E7'     ; XXX--XXXX--XXX = XX--XXXXXX--XX
            dc     h'BFFE'     ; -XXXXXXXXXXXX- = XXXXXX--XXXXXX
            dc     h'BFFE'     ; -XXXXXXXXXXXX- = XXXXXX--XXXXXX
            dc     h'F3E7'     ; XXX--XXXX--XXX = XX--XXXXXX--XX
            dc     h'C081'     ; X------------X = ------XX------
            dc     h'F087'     ; XXX--------XXX = ----XXXXXX----

tile0C      anop
            dc     h'8C98'     ; ---XX----XX--- = --XX------XX--
            dc     h'8FFE'     ; ---XXXXXXXXXX- = XXXX----XXXXXX
            dc     h'FF9F'     ; XXXXXXX--XXXXX = XXXXXXXXXXXX--
            dc     h'BCE6'     ; -XXXX--XX--XX- = --XXXX--XX--XX
            dc     h'B39E'     ; -XX--XX--XXXX- = XX--XX--XXXX--
            dc     h'FCE7'     ; XXXXX--XX--XXX = --XXXXXXXX--XX
            dc     h'FF9F'     ; XXXXXXX--XXXXX = XXXXXXXXXXXX--
            dc     h'8FFE'     ; ---XXXXXXXXXX- = XXXX----XXXXXX

tile0D      anop
            dc     h'8C86'     ; ---XX------XX- = --XX----XX----
            dc     h'C081'     ; X------------X = ------XX------
            dc     h'B380'     ; -XX--XX------- = XX--XX--------
            dc     h'BCE0'     ; -XXXX--XX----- = --XXXX------XX
            dc     h'B0E6'     ; -XX----XX--XX- = ----XX--XX--XX
            dc     h'BF9E'     ; -XXXXXX--XXXX- = XXXXXX--XXXX--
            dc     h'FC81'     ; XXXXX--------X = --XXXXXX------
            dc     h'B080'     ; -XX----------- = ----XX--------

tile0E      anop
            dc     h'8C98'     ; ---XX----XX--- = --XX------XX--
            dc     h'8C98'     ; ---XX----XX--- = --XX------XX--
            dc     h'8C98'     ; ---XX----XX--- = --XX------XX--
            dc     h'8C98'     ; ---XX----XX--- = --XX------XX--
            dc     h'BCF8'     ; -XXXX--XXXX--- = --XXXX----XXXX
            dc     h'BFFE'     ; -XXXXXXXXXXXX- = XXXXXX--XXXXXX
            dc     h'BFFE'     ; -XXXXXXXXXXXX- = XXXXXX--XXXXXX
            dc     h'FFFF'     ; XXXXXXXXXXXXXX = XXXXXXXXXXXXXX

tile0F      anop
            dc     h'8C86'     ; ---XX------XX- = --XX----XX----
            dc     h'F399'     ; XXX--XX--XX--X = XX--XXXX--XX--
            dc     h'CCE7'     ; X--XX--XX--XXX = --XX--XXXX--XX
            dc     h'C099'     ; X--------XX--X = ------XX--XX--
            dc     h'FC81'     ; XXXXX--------X = --XXXXXX------
            dc     h'B39E'     ; -XX--XX--XXXX- = XX--XX--XXXX--
            dc     h'B3E6'     ; -XX--XXXX--XX- = XX--XX--XX--XX
            dc     h'8CF8'     ; ---XX--XXXX--- = --XX------XXXX

tile10      anop
            dc     h'BC80'     ; -XXXX--------- = --XXXX--------
            dc     h'C381'     ; X----XX------X = XX----XX------
            dc     h'BC86'     ; -XXXX------XX- = --XXXX--XX----
            dc     h'C381'     ; X----XX------X = XX----XX------
            dc     h'BC86'     ; -XXXX------XX- = --XXXX--XX----
            dc     h'C087'     ; X----------XXX = ------XXXX----
            dc     h'8098'     ; ---------XX--- = ----------XX--
            dc     h'80E0'     ; -------XX----- = ------------XX

tile11      anop
            dc     h'FC9F'     ; XXXXX----XXXXX = --XXXXXXXXXX--
            dc     h'F087'     ; XXX--------XXX = ----XXXXXX----
            dc     h'BC98'     ; -XXXX----XX--- = --XXXX----XX--
            dc     h'CFFF'     ; X--XXXXXXXXXXX = XXXX--XXXXXXXX
            dc     h'83FE'     ; -----XXXXXXXX- = XX------XXXXXX
            dc     h'CFFF'     ; X--XXXXXXXXXXX = XXXX--XXXXXXXX
            dc     h'83E0'     ; -----XXXX----- = XX----------XX
            dc     h'FC9F'     ; XXXXX----XXXXX = --XXXXXXXXXX--

tile12      anop
            dc     h'FC87'     ; XXXXX------XXX = --XXXXXXXX----
            dc     h'FFFF'     ; XXXXXXXXXXXXXX = XXXXXXXXXXXXXX
            dc     h'CFFF'     ; X--XXXXXXXXXXX = XXXX--XXXXXXXX
            dc     h'F09F'     ; XXX------XXXXX = ----XXXXXXXX--
            dc     h'C087'     ; X----------XXX = ------XXXX----
            dc     h'C081'     ; X------------X = ------XX------
            dc     h'C081'     ; X------------X = ------XX------
            dc     h'C081'     ; X------------X = ------XX------

tile13      anop
            dc     h'FCFF'     ; XXXXX--XXXXXXX = --XXXXXXXXXXXX
            dc     h'F09F'     ; XXX------XXXXX = ----XXXXXXXX--
            dc     h'C09F'     ; X--------XXXXX = ------XXXXXX--
            dc     h'C087'     ; X----------XXX = ------XXXX----
            dc     h'C087'     ; X----------XXX = ------XXXX----
            dc     h'8086'     ; -----------XX- = --------XX----
            dc     h'8086'     ; -----------XX- = --------XX----
            dc     h'8086'     ; -----------XX- = --------XX----

tile14      anop
            dc     h'8380'     ; -----XX------- = XX------------
            dc     h'8F80'     ; ---XXXX------- = XXXX----------
            dc     h'BF9E'     ; -XXXXXX--XXXX- = XXXXXX--XXXX--
            dc     h'FCE1'     ; XXXXX--XX----X = --XXXXXX----XX
            dc     h'B086'     ; -XX--------XX- = ----XX--XX----
            dc     h'CC99'     ; X--XX----XX--X = --XX--XX--XX--
            dc     h'83E6'     ; -----XXXX--XX- = XX------XX--XX
            dc     h'83F8'     ; -----XXXXXX--- = XX--------XXXX

tile15      anop
            dc     h'83E0'     ; -----XXXX----- = XX----------XX
            dc     h'8FF8'     ; ---XXXXXXXX--- = XXXX------XXXX
            dc     h'B3E6'     ; -XX--XXXX--XX- = XX--XX--XX--XX
            dc     h'C3E1'     ; X----XXXX----X = XX----XX----XX
            dc     h'C3E1'     ; X----XXXX----X = XX----XX----XX
            dc     h'B3E6'     ; -XX--XXXX--XX- = XX--XX--XX--XX
            dc     h'8FF8'     ; ---XXXXXXXX--- = XXXX------XXXX
            dc     h'83E0'     ; -----XXXX----- = XX----------XX

tile16      anop
            dc     h'C3FF'     ; X----XXXXXXXXX = XX----XXXXXXXX
            dc     h'8F9E'     ; ---XXXX--XXXX- = XXXX----XXXX--
            dc     h'C3FF'     ; X----XXXXXXXXX = XX----XXXXXXXX
            dc     h'8080'     ; -------------- = --------------
            dc     h'8080'     ; -------------- = --------------
            dc     h'8080'     ; -------------- = --------------
            dc     h'8080'     ; -------------- = --------------
            dc     h'8080'     ; -------------- = --------------

tile17      anop
            dc     h'B3E6'     ; -XX--XXXX--XX- = XX--XX--XX--XX
            dc     h'8C98'     ; ---XX----XX--- = --XX------XX--
            dc     h'F087'     ; XXX--------XXX = ----XXXXXX----
            dc     h'CFF9'     ; X--XXXXXXXX--X = XXXX--XX--XXXX
            dc     h'F087'     ; XXX--------XXX = ----XXXXXX----
            dc     h'FC9F'     ; XXXXX----XXXXX = --XXXXXXXXXX--
            dc     h'B3E6'     ; -XX--XXXX--XX- = XX--XX--XX--XX
            dc     h'B086'     ; -XX--------XX- = ----XX--XX----

tile18      anop
            dc     h'B3E6'     ; -XX--XXXX--XX- = XX--XX--XX--XX
            dc     h'B3E6'     ; -XX--XXXX--XX- = XX--XX--XX--XX
            dc     h'B3E6'     ; -XX--XXXX--XX- = XX--XX--XX--XX
            dc     h'B3E6'     ; -XX--XXXX--XX- = XX--XX--XX--XX
            dc     h'B3E6'     ; -XX--XXXX--XX- = XX--XX--XX--XX
            dc     h'B3E6'     ; -XX--XXXX--XX- = XX--XX--XX--XX
            dc     h'B3E6'     ; -XX--XXXX--XX- = XX--XX--XX--XX
            dc     h'B3E6'     ; -XX--XXXX--XX- = XX--XX--XX--XX

tile19      anop
            dc     h'B3E6'     ; -XX--XXXX--XX- = XX--XX--XX--XX
            dc     h'B3E6'     ; -XX--XXXX--XX- = XX--XX--XX--XX
            dc     h'FFFF'     ; XXXXXXXXXXXXXX = XXXXXXXXXXXXXX
            dc     h'FFFF'     ; XXXXXXXXXXXXXX = XXXXXXXXXXXXXX
            dc     h'FFFF'     ; XXXXXXXXXXXXXX = XXXXXXXXXXXXXX
            dc     h'FFFF'     ; XXXXXXXXXXXXXX = XXXXXXXXXXXXXX
            dc     h'B3E6'     ; -XX--XXXX--XX- = XX--XX--XX--XX
            dc     h'B3E6'     ; -XX--XXXX--XX- = XX--XX--XX--XX

tile1A      anop
            dc     h'B3E6'     ; -XX--XXXX--XX- = XX--XX--XX--XX
            dc     h'CC99'     ; X--XX----XX--X = --XX--XX--XX--
            dc     h'B3E6'     ; -XX--XXXX--XX- = XX--XX--XX--XX
            dc     h'CC99'     ; X--XX----XX--X = --XX--XX--XX--
            dc     h'B3E6'     ; -XX--XXXX--XX- = XX--XX--XX--XX
            dc     h'CC99'     ; X--XX----XX--X = --XX--XX--XX--
            dc     h'B3E6'     ; -XX--XXXX--XX- = XX--XX--XX--XX
            dc     h'CC99'     ; X--XX----XX--X = --XX--XX--XX--

tile1B      anop
            dc     h'B3E6'     ; -XX--XXXX--XX- = XX--XX--XX--XX
            dc     h'B3E6'     ; -XX--XXXX--XX- = XX--XX--XX--XX
            dc     h'B3E6'     ; -XX--XXXX--XX- = XX--XX--XX--XX
            dc     h'F3E7'     ; XXX--XXXX--XXX = XX--XXXXXX--XX
            dc     h'F3F9'     ; XXX--XXXXXX--X = XX--XXXX--XXXX
            dc     h'B3E6'     ; -XX--XXXX--XX- = XX--XX--XX--XX
            dc     h'8FE6'     ; ---XXXXXX--XX- = XXXX----XX--XX
            dc     h'8FE6'     ; ---XXXXXX--XX- = XXXX----XX--XX

tile1C      anop
            dc     h'8FF8'     ; ---XXXXXXXX--- = XXXX------XXXX
            dc     h'BC9E'     ; -XXXX----XXXX- = --XXXX--XXXX--
            dc     h'F087'     ; XXX--------XXX = ----XXXXXX----
            dc     h'BC9E'     ; -XXXX----XXXX- = --XXXX--XXXX--
            dc     h'8080'     ; -------------- = --------------
            dc     h'C3E1'     ; X----XXXX----X = XX----XX----XX
            dc     h'FFFF'     ; XXXXXXXXXXXXXX = XXXXXXXXXXXXXX
            dc     h'8080'     ; -------------- = --------------

tile1D      anop
            dc     h'8FF8'     ; ---XXXXXXXX--- = XXXX------XXXX
            dc     h'BC9E'     ; -XXXX----XXXX- = --XXXX--XXXX--
            dc     h'F087'     ; XXX--------XXX = ----XXXXXX----
            dc     h'B3E6'     ; -XX--XXXX--XX- = XX--XX--XX--XX
            dc     h'8080'     ; -------------- = --------------
            dc     h'8080'     ; -------------- = --------------
            dc     h'8080'     ; -------------- = --------------
            dc     h'8080'     ; -------------- = --------------

tile1E      anop
            dc     h'8FF8'     ; ---XXXXXXXX--- = XXXX------XXXX
            dc     h'B3E6'     ; -XX--XXXX--XX- = XX--XX--XX--XX
            dc     h'F087'     ; XXX--------XXX = ----XXXXXX----
            dc     h'BC9E'     ; -XXXX----XXXX- = --XXXX--XXXX--
            dc     h'BC9E'     ; -XXXX----XXXX- = --XXXX--XXXX--
            dc     h'8080'     ; -------------- = --------------
            dc     h'8080'     ; -------------- = --------------
            dc     h'8080'     ; -------------- = --------------

tile1F      anop
            dc     h'CFE7'     ; X--XXXXXX--XXX = XXXX--XXXX--XX
            dc     h'8080'     ; -------------- = --------------
            dc     h'BCFE'     ; -XXXX--XXXXXX- = --XXXX--XXXXXX
            dc     h'8080'     ; -------------- = --------------
            dc     h'CFE7'     ; X--XXXXXX--XXX = XXXX--XXXX--XX
            dc     h'8080'     ; -------------- = --------------
            dc     h'BCFE'     ; -XXXX--XXXXXX- = --XXXX--XXXXXX
            dc     h'8080'     ; -------------- = --------------

tile20      anop
            dc     h'FF87'     ; XXXXXXX----XXX = XXXXXXXXXX----
            dc     h'FFFF'     ; XXXXXXXXXXXXXX = XXXXXXXXXXXXXX
            dc     h'83FE'     ; -----XXXXXXXX- = XX------XXXXXX
            dc     h'C087'     ; X----------XXX = ------XXXX----
            dc     h'C081'     ; X------------X = ------XX------
            dc     h'C081'     ; X------------X = ------XX------
            dc     h'C081'     ; X------------X = ------XX------
            dc     h'C081'     ; X------------X = ------XX------

tile21      anop
            dc     h'FFE7'     ; XXXXXXXXX--XXX = XXXXXXXXXX--XX
            dc     h'BCF8'     ; -XXXX--XXXX--- = --XXXX----XXXX
            dc     h'F3FF'     ; XXX--XXXXXXXXX = XX--XXXXXXXXXX
            dc     h'8080'     ; -------------- = --------------
            dc     h'8080'     ; -------------- = --------------
            dc     h'8080'     ; -------------- = --------------
            dc     h'8080'     ; -------------- = --------------
            dc     h'8080'     ; -------------- = --------------

tile22      anop
            dc     h'FFFF'     ; XXXXXXXXXXXXXX = XXXXXXXXXXXXXX
            dc     h'FC9F'     ; XXXXX----XXXXX = --XXXXXXXXXX--
            dc     h'F0E7'     ; XXX----XX--XXX = ----XXXXXX--XX
            dc     h'C0F9'     ; X------XXXX--X = ------XX--XXXX
            dc     h'C0FF'     ; X------XXXXXXX = ------XXXXXXXX
            dc     h'B0FE'     ; -XX----XXXXXX- = ----XX--XXXXXX
            dc     h'8CF8'     ; ---XX--XXXX--- = --XX------XXXX
            dc     h'83E0'     ; -----XXXX----- = XX----------XX

tile23      anop
            dc     h'FFFF'     ; XXXXXXXXXXXXXX = XXXXXXXXXXXXXX
            dc     h'83E0'     ; -----XXXX----- = XX----------XX
            dc     h'83E0'     ; -----XXXX----- = XX----------XX
            dc     h'83E0'     ; -----XXXX----- = XX----------XX
            dc     h'83E0'     ; -----XXXX----- = XX----------XX
            dc     h'83E0'     ; -----XXXX----- = XX----------XX
            dc     h'83E0'     ; -----XXXX----- = XX----------XX
            dc     h'83E0'     ; -----XXXX----- = XX----------XX

tile24      anop
            dc     h'FFFF'     ; XXXXXXXXXXXXXX = XXXXXXXXXXXXXX
            dc     h'83E0'     ; -----XXXX----- = XX----------XX
            dc     h'83E0'     ; -----XXXX----- = XX----------XX
            dc     h'FFFF'     ; XXXXXXXXXXXXXX = XXXXXXXXXXXXXX
            dc     h'FFFF'     ; XXXXXXXXXXXXXX = XXXXXXXXXXXXXX
            dc     h'83E0'     ; -----XXXX----- = XX----------XX
            dc     h'83E0'     ; -----XXXX----- = XX----------XX
            dc     h'FFFF'     ; XXXXXXXXXXXXXX = XXXXXXXXXXXXXX

tile25      anop
            dc     h'FFFF'     ; XXXXXXXXXXXXXX = XXXXXXXXXXXXXX
            dc     h'C3E1'     ; X----XXXX----X = XX----XX----XX
            dc     h'F3F9'     ; XXX--XXXXXX--X = XX--XXXX--XXXX
            dc     h'FFFF'     ; XXXXXXXXXXXXXX = XXXXXXXXXXXXXX
            dc     h'FFFF'     ; XXXXXXXXXXXXXX = XXXXXXXXXXXXXX
            dc     h'C3E1'     ; X----XXXX----X = XX----XX----XX
            dc     h'F3F9'     ; XXX--XXXXXX--X = XX--XXXX--XXXX
            dc     h'FFFF'     ; XXXXXXXXXXXXXX = XXXXXXXXXXXXXX

tile26      anop
            dc     h'FFFF'     ; XXXXXXXXXXXXXX = XXXXXXXXXXXXXX
            dc     h'B3E6'     ; -XX--XXXX--XX- = XX--XX--XX--XX
            dc     h'CC99'     ; X--XX----XX--X = --XX--XX--XX--
            dc     h'B3E6'     ; -XX--XXXX--XX- = XX--XX--XX--XX
            dc     h'CC99'     ; X--XX----XX--X = --XX--XX--XX--
            dc     h'B3E6'     ; -XX--XXXX--XX- = XX--XX--XX--XX
            dc     h'CC99'     ; X--XX----XX--X = --XX--XX--XX--
            dc     h'B3E6'     ; -XX--XXXX--XX- = XX--XX--XX--XX

tile27      anop
            dc     h'FFFF'     ; XXXXXXXXXXXXXX = XXXXXXXXXXXXXX
            dc     h'CFE7'     ; X--XXXXXX--XXX = XXXX--XXXX--XX
            dc     h'B3F8'     ; -XX--XXXXXX--- = XX--XX----XXXX
            dc     h'B098'     ; -XX------XX--- = ----XX----XX--
            dc     h'CCE1'     ; X--XX--XX----X = --XX--XX----XX
            dc     h'B080'     ; -XX----------- = ----XX--------
            dc     h'8086'     ; -----------XX- = --------XX----
            dc     h'8080'     ; -------------- = --------------

tile28      anop
            dc     h'FFFF'     ; XXXXXXXXXXXXXX = XXXXXXXXXXXXXX
            dc     h'FF9F'     ; XXXXXXX--XXXXX = XXXXXXXXXXXX--
            dc     h'FC9F'     ; XXXXX----XXXXX = --XXXXXXXXXX--
            dc     h'FC87'     ; XXXXX------XXX = --XXXXXXXX----
            dc     h'CC87'     ; X--XX------XXX = --XX--XXXX----
            dc     h'CC87'     ; X--XX------XXX = --XX--XXXX----
            dc     h'C081'     ; X------------X = ------XX------
            dc     h'C081'     ; X------------X = ------XX------

tile29      anop
            dc     h'FFFF'     ; XXXXXXXXXXXXXX = XXXXXXXXXXXXXX
            dc     h'FFFF'     ; XXXXXXXXXXXXXX = XXXXXXXXXXXXXX
            dc     h'C0E1'     ; X------XX----X = ------XX----XX
            dc     h'B098'     ; -XX------XX--- = ----XX----XX--
            dc     h'8C86'     ; ---XX------XX- = --XX----XX----
            dc     h'C381'     ; X----XX------X = XX----XX------
            dc     h'FFFF'     ; XXXXXXXXXXXXXX = XXXXXXXXXXXXXX
            dc     h'FFFF'     ; XXXXXXXXXXXXXX = XXXXXXXXXXXXXX

tile2A      anop
            dc     h'FFFF'     ; XXXXXXXXXXXXXX = XXXXXXXXXXXXXX
            dc     h'FFFF'     ; XXXXXXXXXXXXXX = XXXXXXXXXXXXXX
            dc     h'C081'     ; X------------X = ------XX------
            dc     h'C081'     ; X------------X = ------XX------
            dc     h'C081'     ; X------------X = ------XX------
            dc     h'C081'     ; X------------X = ------XX------
            dc     h'C081'     ; X------------X = ------XX------
            dc     h'C081'     ; X------------X = ------XX------

tile2B      anop
            dc     h'FFFF'     ; XXXXXXXXXXXXXX = XXXXXXXXXXXXXX
            dc     h'FFFF'     ; XXXXXXXXXXXXXX = XXXXXXXXXXXXXX
            dc     h'8C9E'     ; ---XX----XXXX- = --XX----XXXX--
            dc     h'B09E'     ; -XX------XXXX- = ----XX--XXXX--
            dc     h'C09F'     ; X--------XXXXX = ------XXXXXX--
            dc     h'809E'     ; ---------XXXX- = --------XXXX--
            dc     h'809E'     ; ---------XXXX- = --------XXXX--
            dc     h'809E'     ; ---------XXXX- = --------XXXX--

tile2C      anop
            dc     h'FFFF'     ; XXXXXXXXXXXXXX = XXXXXXXXXXXXXX
            dc     h'FFFF'     ; XXXXXXXXXXXXXX = XXXXXXXXXXXXXX
            dc     h'BC98'     ; -XXXX----XX--- = --XXXX----XX--
            dc     h'BC86'     ; -XXXX------XX- = --XXXX--XX----
            dc     h'FC81'     ; XXXXX--------X = --XXXXXX------
            dc     h'BC80'     ; -XXXX--------- = --XXXX--------
            dc     h'BC80'     ; -XXXX--------- = --XXXX--------
            dc     h'BC80'     ; -XXXX--------- = --XXXX--------

tile2D      anop
            dc     h'FFFF'     ; XXXXXXXXXXXXXX = XXXXXXXXXXXXXX
            dc     h'FFFF'     ; XXXXXXXXXXXXXX = XXXXXXXXXXXXXX
            dc     h'BC9E'     ; -XXXX----XXXX- = --XXXX--XXXX--
            dc     h'C3E1'     ; X----XXXX----X = XX----XX----XX
            dc     h'8C98'     ; ---XX----XX--- = --XX------XX--
            dc     h'C081'     ; X------------X = ------XX------
            dc     h'FF99'     ; XXXXXXX--XX--X = XXXXXXXX--XX--
            dc     h'8080'     ; -------------- = --------------

tile2E      anop
            dc     h'FFFF'     ; XXXXXXXXXXXXXX = XXXXXXXXXXXXXX
            dc     h'FFFF'     ; XXXXXXXXXXXXXX = XXXXXXXXXXXXXX
            dc     h'BC9E'     ; -XXXX----XXXX- = --XXXX--XXXX--
            dc     h'C3E1'     ; X----XXXX----X = XX----XX----XX
            dc     h'BC9E'     ; -XXXX----XXXX- = --XXXX--XXXX--
            dc     h'C3E1'     ; X----XXXX----X = XX----XX----XX
            dc     h'FFFF'     ; XXXXXXXXXXXXXX = XXXXXXXXXXXXXX
            dc     h'8080'     ; -------------- = --------------

tile2F      anop
            dc     h'FFFF'     ; XXXXXXXXXXXXXX = XXXXXXXXXXXXXX
            dc     h'FFFF'     ; XXXXXXXXXXXXXX = XXXXXXXXXXXXXX
            dc     h'C3E1'     ; X----XXXX----X = XX----XX----XX
            dc     h'C3E1'     ; X----XXXX----X = XX----XX----XX
            dc     h'FFFF'     ; XXXXXXXXXXXXXX = XXXXXXXXXXXXXX
            dc     h'C3E1'     ; X----XXXX----X = XX----XX----XX
            dc     h'BC9E'     ; -XXXX----XXXX- = --XXXX--XXXX--
            dc     h'8080'     ; -------------- = --------------

tile30      anop
            dc     h'FFFF'     ; XXXXXXXXXXXXXX = XXXXXXXXXXXXXX
            dc     h'FFFF'     ; XXXXXXXXXXXXXX = XXXXXXXXXXXXXX
            dc     h'CF99'     ; X--XXXX--XX--X = XXXX--XX--XX--
            dc     h'8CE6'     ; ---XX--XX--XX- = --XX----XX--XX
            dc     h'B398'     ; -XX--XX--XX--- = XX--XX----XX--
            dc     h'CC81'     ; X--XX--------X = --XX--XX------
            dc     h'8398'     ; -----XX--XX--- = XX--------XX--
            dc     h'8080'     ; -------------- = --------------

tile31      anop
            dc     h'FFFF'     ; XXXXXXXXXXXXXX = XXXXXXXXXXXXXX
            dc     h'FFFF'     ; XXXXXXXXXXXXXX = XXXXXXXXXXXXXX
            dc     h'CFF9'     ; X--XXXXXXXX--X = XXXX--XX--XXXX
            dc     h'FC9F'     ; XXXXX----XXXXX = --XXXXXXXXXX--
            dc     h'8FE6'     ; ---XXXXXX--XX- = XXXX----XX--XX
            dc     h'8C80'     ; ---XX--------- = --XX----------
            dc     h'8080'     ; -------------- = --------------
            dc     h'8080'     ; -------------- = --------------

tile32      anop
            dc     h'FFFF'     ; XXXXXXXXXXXXXX = XXXXXXXXXXXXXX
            dc     h'FFFF'     ; XXXXXXXXXXXXXX = XXXXXXXXXXXXXX
            dc     h'CFE7'     ; X--XXXXXX--XXX = XXXX--XXXX--XX
            dc     h'FCFF'     ; XXXXX--XXXXXXX = --XXXXXXXXXXXX
            dc     h'B39B'     ; -XX--XX--XX-XX = XX--XX-XX-XX--
            dc     h'CCE4'     ; X--XX--XX--X-- = --XX--X--X--XX
            dc     h'B098'     ; -XX------XX--- = ----XX----XX--
            dc     h'8080'     ; -------------- = --------------

tile33      anop
            dc     h'FFFF'     ; XXXXXXXXXXXXXX = XXXXXXXXXXXXXX
            dc     h'FFFF'     ; XXXXXXXXXXXXXX = XXXXXXXXXXXXXX
            dc     h'FFFF'     ; XXXXXXXXXXXXXX = XXXXXXXXXXXXXX
            dc     h'FFFF'     ; XXXXXXXXXXXXXX = XXXXXXXXXXXXXX
            dc     h'B3E6'     ; -XX--XXXX--XX- = XX--XX--XX--XX
            dc     h'8080'     ; -------------- = --------------
            dc     h'8080'     ; -------------- = --------------
            dc     h'8080'     ; -------------- = --------------

tile34      anop
            dc     h'C081'     ; X------------X = ------XX------
            dc     h'C081'     ; X------------X = ------XX------
            dc     h'C081'     ; X------------X = ------XX------
            dc     h'CC99'     ; X--XX----XX--X = --XX--XX--XX--
            dc     h'F087'     ; XXX--------XXX = ----XXXXXX----
            dc     h'CFF9'     ; X--XXXXXXXX--X = XXXX--XX--XXXX
            dc     h'F087'     ; XXX--------XXX = ----XXXXXX----
            dc     h'CC99'     ; X--XX----XX--X = --XX--XX--XX--

tile35      anop
            dc     h'FFFF'     ; XXXXXXXXXXXXXX = XXXXXXXXXXXXXX
            dc     h'83E0'     ; -----XXXX----- = XX----------XX
            dc     h'83E0'     ; -----XXXX----- = XX----------XX
            dc     h'8C98'     ; ---XX----XX--- = --XX------XX--
            dc     h'F087'     ; XXX--------XXX = ----XXXXXX----
            dc     h'C081'     ; X------------X = ------XX------
            dc     h'BC80'     ; -XXXX--------- = --XXXX--------
            dc     h'BC80'     ; -XXXX--------- = --XXXX--------

tile36      anop
            dc     h'FFFF'     ; XXXXXXXXXXXXXX = XXXXXXXXXXXXXX
            dc     h'83E0'     ; -----XXXX----- = XX----------XX
            dc     h'83E0'     ; -----XXXX----- = XX----------XX
            dc     h'8C98'     ; ---XX----XX--- = --XX------XX--
            dc     h'F087'     ; XXX--------XXX = ----XXXXXX----
            dc     h'C081'     ; X------------X = ------XX------
            dc     h'809E'     ; ---------XXXX- = --------XXXX--
            dc     h'809E'     ; ---------XXXX- = --------XXXX--

            end

