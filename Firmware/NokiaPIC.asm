
_NK_Rst:

;NokiaPIC.mbas,6 :: 		sub procedure NK_Rst   'Cadena para resetear el celular
;NokiaPIC.mbas,8 :: 		UART1_Write(0x1E)
	MOVLW      30
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;NokiaPIC.mbas,9 :: 		UART1_Write(0x00)
	CLRF       FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;NokiaPIC.mbas,10 :: 		UART1_Write(0x0C)
	MOVLW      12
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;NokiaPIC.mbas,11 :: 		UART1_Write(0x40)
	MOVLW      64
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;NokiaPIC.mbas,12 :: 		UART1_Write(0x00)
	CLRF       FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;NokiaPIC.mbas,13 :: 		UART1_Write(0x06)
	MOVLW      6
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;NokiaPIC.mbas,14 :: 		UART1_Write(0x00)
	CLRF       FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;NokiaPIC.mbas,15 :: 		UART1_Write(0x01)
	MOVLW      1
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;NokiaPIC.mbas,16 :: 		UART1_Write(0x64)
	MOVLW      100
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;NokiaPIC.mbas,17 :: 		UART1_Write(0x03)
	MOVLW      3
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;NokiaPIC.mbas,18 :: 		UART1_Write(0x01)
	MOVLW      1
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;NokiaPIC.mbas,19 :: 		UART1_Write(0x60)
	MOVLW      96
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;NokiaPIC.mbas,20 :: 		UART1_Write(0x77)
	MOVLW      119
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;NokiaPIC.mbas,21 :: 		UART1_Write(0x24)
	MOVLW      36
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;NokiaPIC.mbas,22 :: 		end sub
	RETURN
; end of _NK_Rst

_NK_Sync:

;NokiaPIC.mbas,25 :: 		dim i as byte
;NokiaPIC.mbas,26 :: 		for i=1 to 128
	MOVLW      1
	MOVWF      NK_Sync_i+0
L__NK_Sync3:
;NokiaPIC.mbas,27 :: 		UART1_Write(0x55)
	MOVLW      85
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;NokiaPIC.mbas,28 :: 		next i
	MOVF       NK_Sync_i+0, 0
	XORLW      128
	BTFSC      STATUS+0, 2
	GOTO       L__NK_Sync6
	INCF       NK_Sync_i+0, 1
	GOTO       L__NK_Sync3
L__NK_Sync6:
;NokiaPIC.mbas,29 :: 		end sub
	RETURN
; end of _NK_Sync

_NK_SMS:

;NokiaPIC.mbas,30 :: 		sub procedure NK_SMS     'Cadena para mandar los SMS
;NokiaPIC.mbas,32 :: 		UART1_Write(0x1E)     '01
	MOVLW      30
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;NokiaPIC.mbas,33 :: 		UART1_Write(0x00)     '02
	CLRF       FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;NokiaPIC.mbas,34 :: 		UART1_Write(0x0C)     '03
	MOVLW      12
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;NokiaPIC.mbas,35 :: 		UART1_Write(0x02)     '04
	MOVLW      2
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;NokiaPIC.mbas,36 :: 		UART1_Write(0x00)     '05
	CLRF       FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;NokiaPIC.mbas,38 :: 		UART1_Write(0x3A)     '06
	MOVLW      58
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;NokiaPIC.mbas,40 :: 		UART1_Write(0x00)     '07
	CLRF       FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;NokiaPIC.mbas,41 :: 		UART1_Write(0x01)     '08
	MOVLW      1
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;NokiaPIC.mbas,42 :: 		UART1_Write(0x00)     '09
	CLRF       FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;NokiaPIC.mbas,43 :: 		UART1_Write(0x01)     '10
	MOVLW      1
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;NokiaPIC.mbas,44 :: 		UART1_Write(0x02)     '11
	MOVLW      2
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;NokiaPIC.mbas,45 :: 		UART1_Write(0x00)     '12
	CLRF       FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;NokiaPIC.mbas,47 :: 		UART1_Write(0x07)     '13
	MOVLW      7
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;NokiaPIC.mbas,49 :: 		UART1_Write(0x81)     '14
	MOVLW      129
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;NokiaPIC.mbas,52 :: 		UART1_Write(0x45)    '15
	MOVLW      69
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;NokiaPIC.mbas,53 :: 		UART1_Write(0x23)    '16
	MOVLW      35
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;NokiaPIC.mbas,54 :: 		UART1_Write(0x00)    '17
	CLRF       FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;NokiaPIC.mbas,55 :: 		UART1_Write(0x00)    '18
	CLRF       FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;NokiaPIC.mbas,56 :: 		UART1_Write(0x00)    '19
	CLRF       FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;NokiaPIC.mbas,57 :: 		UART1_Write(0x10)    '20
	MOVLW      16
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;NokiaPIC.mbas,59 :: 		UART1_Write(0x00)    '21
	CLRF       FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;NokiaPIC.mbas,60 :: 		UART1_Write(0x00)    '22
	CLRF       FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;NokiaPIC.mbas,61 :: 		UART1_Write(0x00)    '23
	CLRF       FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;NokiaPIC.mbas,62 :: 		UART1_Write(0x00)    '24
	CLRF       FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;NokiaPIC.mbas,63 :: 		UART1_Write(0x11)    '25
	MOVLW      17
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;NokiaPIC.mbas,64 :: 		UART1_Write(0x00)    '26
	CLRF       FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;NokiaPIC.mbas,65 :: 		UART1_Write(0x00)    '27
	CLRF       FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;NokiaPIC.mbas,66 :: 		UART1_Write(0x00)    '28
	CLRF       FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;NokiaPIC.mbas,68 :: 		UART1_Write(0x05)    '29
	MOVLW      5
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;NokiaPIC.mbas,70 :: 		UART1_Write(0x0C)    '30
	MOVLW      12
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;NokiaPIC.mbas,72 :: 		UART1_Write(0x81)    '31
	MOVLW      129
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;NokiaPIC.mbas,75 :: 		UART1_Write(0x45)    '32
	MOVLW      69
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;NokiaPIC.mbas,76 :: 		UART1_Write(0x11)    '33
	MOVLW      17
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;NokiaPIC.mbas,77 :: 		UART1_Write(0x73)    '34
	MOVLW      115
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;NokiaPIC.mbas,78 :: 		UART1_Write(0x55)    '35
	MOVLW      85
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;NokiaPIC.mbas,79 :: 		UART1_Write(0x46)    '36
	MOVLW      70
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;NokiaPIC.mbas,80 :: 		UART1_Write(0x07)    '37
	MOVLW      7
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;NokiaPIC.mbas,82 :: 		UART1_Write(0x00)    '38
	CLRF       FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;NokiaPIC.mbas,83 :: 		UART1_Write(0x00)    '39
	CLRF       FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;NokiaPIC.mbas,84 :: 		UART1_Write(0x00)    '40
	CLRF       FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;NokiaPIC.mbas,85 :: 		UART1_Write(0x00)    '41
	CLRF       FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;NokiaPIC.mbas,86 :: 		UART1_Write(0x00)    '42
	CLRF       FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;NokiaPIC.mbas,87 :: 		UART1_Write(0xA7)    '43
	MOVLW      167
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;NokiaPIC.mbas,88 :: 		UART1_Write(0x00)    '44
	CLRF       FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;NokiaPIC.mbas,89 :: 		UART1_Write(0x00)    '45
	CLRF       FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;NokiaPIC.mbas,90 :: 		UART1_Write(0x00)    '46
	CLRF       FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;NokiaPIC.mbas,91 :: 		UART1_Write(0x00)    '47
	CLRF       FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;NokiaPIC.mbas,92 :: 		UART1_Write(0x00)    '48
	CLRF       FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;NokiaPIC.mbas,93 :: 		UART1_Write(0x00)    '49
	CLRF       FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;NokiaPIC.mbas,95 :: 		UART1_Write(0xE8)    '50
	MOVLW      232
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;NokiaPIC.mbas,96 :: 		UART1_Write(0x32)    '51
	MOVLW      50
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;NokiaPIC.mbas,97 :: 		UART1_Write(0x9B)    '52
	MOVLW      155
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;NokiaPIC.mbas,98 :: 		UART1_Write(0xFD)    '53
	MOVLW      253
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;NokiaPIC.mbas,99 :: 		UART1_Write(0x06)    '54
	MOVLW      6
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;NokiaPIC.mbas,101 :: 		UART1_Write(0x01)    '55
	MOVLW      1
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;NokiaPIC.mbas,102 :: 		UART1_Write(0x60)    '56
	MOVLW      96
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;NokiaPIC.mbas,106 :: 		UART1_Write(0x46)    '57
	MOVLW      70
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;NokiaPIC.mbas,108 :: 		UART1_Write(0x07)    '58
	MOVLW      7
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;NokiaPIC.mbas,114 :: 		end sub
	RETURN
; end of _NK_SMS

_NK_Call:

;NokiaPIC.mbas,115 :: 		sub procedure NK_Call    'Cadena para llamar a Nro de memoria 2
;NokiaPIC.mbas,117 :: 		UART1_Write(0x1E)
	MOVLW      30
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;NokiaPIC.mbas,118 :: 		UART1_Write(0x00)
	CLRF       FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;NokiaPIC.mbas,119 :: 		UART1_Write(0x10)
	MOVLW      16
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;NokiaPIC.mbas,120 :: 		UART1_Write(0x01)
	MOVLW      1
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;NokiaPIC.mbas,121 :: 		UART1_Write(0x00)
	CLRF       FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;NokiaPIC.mbas,122 :: 		UART1_Write(0x11)
	MOVLW      17
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;NokiaPIC.mbas,123 :: 		UART1_Write(0x00)
	CLRF       FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;NokiaPIC.mbas,124 :: 		UART1_Write(0x01)
	MOVLW      1
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;NokiaPIC.mbas,125 :: 		UART1_Write(0x00)
	CLRF       FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;NokiaPIC.mbas,126 :: 		UART1_Write(0x01)
	MOVLW      1
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;NokiaPIC.mbas,127 :: 		UART1_Write(0x01)
	MOVLW      1
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;NokiaPIC.mbas,128 :: 		UART1_Write(0x00)
	CLRF       FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;NokiaPIC.mbas,129 :: 		UART1_Write(0x32)
	MOVLW      50
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;NokiaPIC.mbas,130 :: 		UART1_Write(0x05)
	MOVLW      5
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;NokiaPIC.mbas,131 :: 		UART1_Write(0x01)
	MOVLW      1
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;NokiaPIC.mbas,132 :: 		UART1_Write(0x05)
	MOVLW      5
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;NokiaPIC.mbas,133 :: 		UART1_Write(0x00)
	CLRF       FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;NokiaPIC.mbas,134 :: 		UART1_Write(0x02)
	MOVLW      2
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;NokiaPIC.mbas,135 :: 		UART1_Write(0x00)
	CLRF       FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;NokiaPIC.mbas,136 :: 		UART1_Write(0x00)
	CLRF       FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;NokiaPIC.mbas,137 :: 		UART1_Write(0x01)
	MOVLW      1
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;NokiaPIC.mbas,138 :: 		UART1_Write(0x01)
	MOVLW      1
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;NokiaPIC.mbas,139 :: 		UART1_Write(0x45)
	MOVLW      69
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;NokiaPIC.mbas,140 :: 		UART1_Write(0x00)
	CLRF       FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;NokiaPIC.mbas,141 :: 		UART1_Write(0x78)
	MOVLW      120
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;NokiaPIC.mbas,142 :: 		UART1_Write(0x13)
	MOVLW      19
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;NokiaPIC.mbas,143 :: 		end sub
	RETURN
; end of _NK_Call

_Alarm_Disp:

;NokiaPIC.mbas,144 :: 		sub procedure Alarm_Disp 'Accion de Disparo de alarma por RB0
;NokiaPIC.mbas,145 :: 		NK_Sync
	CALL       _NK_Sync+0
;NokiaPIC.mbas,146 :: 		delay_ms(100)
	MOVLW      3
	MOVWF      R11+0
	MOVLW      138
	MOVWF      R12+0
	MOVLW      85
	MOVWF      R13+0
L__Alarm_Disp10:
	DECFSZ     R13+0, 1
	GOTO       L__Alarm_Disp10
	DECFSZ     R12+0, 1
	GOTO       L__Alarm_Disp10
	DECFSZ     R11+0, 1
	GOTO       L__Alarm_Disp10
	NOP
	NOP
;NokiaPIC.mbas,147 :: 		NK_Rst
	CALL       _NK_Rst+0
;NokiaPIC.mbas,148 :: 		delay_ms(100)
	MOVLW      3
	MOVWF      R11+0
	MOVLW      138
	MOVWF      R12+0
	MOVLW      85
	MOVWF      R13+0
L__Alarm_Disp11:
	DECFSZ     R13+0, 1
	GOTO       L__Alarm_Disp11
	DECFSZ     R12+0, 1
	GOTO       L__Alarm_Disp11
	DECFSZ     R11+0, 1
	GOTO       L__Alarm_Disp11
	NOP
	NOP
;NokiaPIC.mbas,149 :: 		NK_Call
	CALL       _NK_Call+0
;NokiaPIC.mbas,151 :: 		end sub
	RETURN
; end of _Alarm_Disp

_interrupt:
	MOVWF      R15+0
	SWAPF      STATUS+0, 0
	CLRF       STATUS+0
	MOVWF      ___saveSTATUS+0
	MOVF       PCLATH+0, 0
	MOVWF      ___savePCLATH+0
	CLRF       PCLATH+0

;NokiaPIC.mbas,153 :: 		sub procedure interrupt
;NokiaPIC.mbas,154 :: 		if TestBit(INTCON, INTF) = 1 then  'se dispara la alarma
	CLRF       R1+0
	BTFSS      INTCON+0, 1
	GOTO       L__interrupt16
	MOVLW      1
	MOVWF      R1+0
L__interrupt16:
	MOVF       R1+0, 0
	XORLW      1
	BTFSS      STATUS+0, 2
	GOTO       L__interrupt14
;NokiaPIC.mbas,155 :: 		clearbit(PORTA,1)
	BCF        PORTA+0, 1
;NokiaPIC.mbas,156 :: 		delay_ms(3000)
	MOVLW      77
	MOVWF      R11+0
	MOVLW      25
	MOVWF      R12+0
	MOVLW      79
	MOVWF      R13+0
L__interrupt17:
	DECFSZ     R13+0, 1
	GOTO       L__interrupt17
	DECFSZ     R12+0, 1
	GOTO       L__interrupt17
	DECFSZ     R11+0, 1
	GOTO       L__interrupt17
	NOP
	NOP
;NokiaPIC.mbas,157 :: 		if testbit(PORTB,0) = 1 then
	CLRF       R1+0
	BTFSS      PORTB+0, 0
	GOTO       L__interrupt21
	MOVLW      1
	MOVWF      R1+0
L__interrupt21:
	MOVF       R1+0, 0
	XORLW      1
	BTFSS      STATUS+0, 2
	GOTO       L__interrupt19
;NokiaPIC.mbas,158 :: 		delay_ms(3000)
	MOVLW      77
	MOVWF      R11+0
	MOVLW      25
	MOVWF      R12+0
	MOVLW      79
	MOVWF      R13+0
L__interrupt22:
	DECFSZ     R13+0, 1
	GOTO       L__interrupt22
	DECFSZ     R12+0, 1
	GOTO       L__interrupt22
	DECFSZ     R11+0, 1
	GOTO       L__interrupt22
	NOP
	NOP
;NokiaPIC.mbas,159 :: 		if testbit(PORTB,0) = 1 then
	CLRF       R1+0
	BTFSS      PORTB+0, 0
	GOTO       L__interrupt26
	MOVLW      1
	MOVWF      R1+0
L__interrupt26:
	MOVF       R1+0, 0
	XORLW      1
	BTFSS      STATUS+0, 2
	GOTO       L__interrupt24
;NokiaPIC.mbas,160 :: 		setbit(PORTA , 0)
	BSF        PORTA+0, 0
;NokiaPIC.mbas,161 :: 		delay_ms(6000)
	MOVLW      153
	MOVWF      R11+0
	MOVLW      49
	MOVWF      R12+0
	MOVLW      162
	MOVWF      R13+0
L__interrupt27:
	DECFSZ     R13+0, 1
	GOTO       L__interrupt27
	DECFSZ     R12+0, 1
	GOTO       L__interrupt27
	DECFSZ     R11+0, 1
	GOTO       L__interrupt27
	NOP
;NokiaPIC.mbas,162 :: 		clearbit(PORTA, 0)
	BCF        PORTA+0, 0
;NokiaPIC.mbas,164 :: 		Alarm_Disp
	CALL       _Alarm_Disp+0
L__interrupt24:
;NokiaPIC.mbas,165 :: 		end if
L__interrupt19:
;NokiaPIC.mbas,166 :: 		end if
L__interrupt14:
;NokiaPIC.mbas,174 :: 		INTCON = 0x98
	MOVLW      152
	MOVWF      INTCON+0
;NokiaPIC.mbas,175 :: 		end sub
L__interrupt41:
	MOVF       ___savePCLATH+0, 0
	MOVWF      PCLATH+0
	SWAPF      ___saveSTATUS+0, 0
	MOVWF      STATUS+0
	SWAPF      R15+0, 1
	SWAPF      R15+0, 0
	RETFIE
; end of _interrupt

_main:

;NokiaPIC.mbas,178 :: 		main:
;NokiaPIC.mbas,199 :: 		TRISA = 0x0F   '0000 1111 PA como salida
	MOVLW      15
	MOVWF      TRISA+0
;NokiaPIC.mbas,200 :: 		TRISB = 0x0F   '0000 1111 PB como entrada
	MOVLW      15
	MOVWF      TRISB+0
;NokiaPIC.mbas,202 :: 		PORTA = 0x00
	CLRF       PORTA+0
;NokiaPIC.mbas,205 :: 		UART1_Init(115200)
	MOVLW      10
	MOVWF      SPBRG+0
	BSF        TXSTA+0, 2
	CALL       _UART1_Init+0
;NokiaPIC.mbas,206 :: 		delay_ms(100)
	MOVLW      3
	MOVWF      R11+0
	MOVLW      138
	MOVWF      R12+0
	MOVLW      85
	MOVWF      R13+0
L__main29:
	DECFSZ     R13+0, 1
	GOTO       L__main29
	DECFSZ     R12+0, 1
	GOTO       L__main29
	DECFSZ     R11+0, 1
	GOTO       L__main29
	NOP
	NOP
;NokiaPIC.mbas,208 :: 		main_loop:
L__main_main_loop:
;NokiaPIC.mbas,210 :: 		if testbit(PORTA, 2) = 1 then
	CLRF       R1+0
	BTFSS      PORTA+0, 2
	GOTO       L__main34
	MOVLW      1
	MOVWF      R1+0
L__main34:
	MOVF       R1+0, 0
	XORLW      1
	BTFSS      STATUS+0, 2
	GOTO       L__main32
;NokiaPIC.mbas,211 :: 		PORTB.6 = 1
	BSF        PORTB+0, 6
;NokiaPIC.mbas,212 :: 		delay_ms(1000)
	MOVLW      26
	MOVWF      R11+0
	MOVLW      94
	MOVWF      R12+0
	MOVLW      110
	MOVWF      R13+0
L__main35:
	DECFSZ     R13+0, 1
	GOTO       L__main35
	DECFSZ     R12+0, 1
	GOTO       L__main35
	DECFSZ     R11+0, 1
	GOTO       L__main35
	NOP
;NokiaPIC.mbas,213 :: 		PORTB.6 = 0
	BCF        PORTB+0, 6
L__main32:
;NokiaPIC.mbas,215 :: 		if testbit(PORTA, 3) = 1 then
	CLRF       R1+0
	BTFSS      PORTA+0, 3
	GOTO       L__main39
	MOVLW      1
	MOVWF      R1+0
L__main39:
	MOVF       R1+0, 0
	XORLW      1
	BTFSS      STATUS+0, 2
	GOTO       L__main37
;NokiaPIC.mbas,216 :: 		setbit(PORTB,7)
	BSF        PORTB+0, 7
;NokiaPIC.mbas,217 :: 		delay_ms(1000)
	MOVLW      26
	MOVWF      R11+0
	MOVLW      94
	MOVWF      R12+0
	MOVLW      110
	MOVWF      R13+0
L__main40:
	DECFSZ     R13+0, 1
	GOTO       L__main40
	DECFSZ     R12+0, 1
	GOTO       L__main40
	DECFSZ     R11+0, 1
	GOTO       L__main40
	NOP
;NokiaPIC.mbas,218 :: 		clearbit(PORTB,7)
	BCF        PORTB+0, 7
L__main37:
;NokiaPIC.mbas,222 :: 		nop
	NOP
;NokiaPIC.mbas,223 :: 		nop
	NOP
;NokiaPIC.mbas,224 :: 		goto main_loop
	GOTO       L__main_main_loop
	GOTO       $+0
; end of _main
