tration Program *
* *
* This program illustrates how to use the assembler. *
* It adds together two 8 bit numbers and leaves the result *
* in the ‘SUM’ location. *
* Author: Peter Hiscocks *
********************************************************************

; export symbols
          XDEF Entry, _Startup    ; export ‘Entry’ symbol
          ABSENTRY Entry          ; for absolute assembly: mark
                                  ; this as applicat. entry point
                                 
; Include derivative-specific definitions
          INCLUDE 'derivative.inc'
         
********************************************************************
* Code section *
********************************************************************

              ORG    $3000
         
MULTICAND     FCB    05                 ; First Number, Form Constant Byte directive reserves 1 byte and initializes some value
MULTIPLIER    FCB    02                 ; Second Number
PRODUCT       RMB    2                  ; Result of mult   , Reserve Mem Byte reserves 1+ bytes, no initializing

********************************************************************
* The actual program starts here *
********************************************************************

          ORG   $4000
 Entry:
_Startup:
          LDAA  MULTICAND              ; Get the first number into ACCA
          LDAB  MULTIPLIER             ; GEt the second number into ACCB
          mul                          ; auto stores in D, which is concat of A and B
          SWI                          ; break to the monitor
                                
********************************************************************
* Interrupt Vectors *
********************************************************************

          ORG  $FFFE
          FDB  Entry               ; Reset Vector    
         
********************************************************************
* Other Directives for Reference
********************************************************************
* HELLO   FCC 'HELLO WORLD V96'    ; FCC Form Constant Char turns char into ASCII, one per byte
*         FCB $00
* VECTOR  FDB HELLO                ; Form Double Byte reserves and initalizes double byte ie 16 bits
