library ieee;
use ieee.std_logic_1164.all;

package ascii is

    constant c_ascii_NUL                : std_logic_vector := "0000000"; --0x00
    constant c_ascii_SOH                : std_logic_vector := "0000001"; --0x01
    constant c_ascii_STX                : std_logic_vector := "0000010"; --0x02
    constant c_ascii_ETX                : std_logic_vector := "0000011"; --0x03
    constant c_ascii_EOT                : std_logic_vector := "0000100"; --0x04
    constant c_ascii_ENQ                : std_logic_vector := "0000101"; --0x05
    constant c_ascii_ACK                : std_logic_vector := "0000110"; --0x06
    constant c_ascii_BEL                : std_logic_vector := "0000111"; --0x07
    constant c_ascii_BS                 : std_logic_vector := "0001000"; --0x08
    constant c_ascii_HT                 : std_logic_vector := "0001001"; --0x09
    constant c_ascii_LF                 : std_logic_vector := "0001010"; --0x0A
    constant c_ascii_VT                 : std_logic_vector := "0001011"; --0x0B
    constant c_ascii_FF                 : std_logic_vector := "0001100"; --0x0C
    constant c_ascii_CR                 : std_logic_vector := "0001101"; --0x0D
    constant c_ascii_SO                 : std_logic_vector := "0001110"; --0x0E
    constant c_ascii_SI                 : std_logic_vector := "0001111"; --0x0F
    constant c_ascii_DLE                : std_logic_vector := "0010000"; --0x10
    constant c_ascii_DC1                : std_logic_vector := "0010001"; --0x11
    constant c_ascii_DC2                : std_logic_vector := "0010010"; --0x12
    constant c_ascii_DC3                : std_logic_vector := "0010011"; --0x13
    constant c_ascii_DC4                : std_logic_vector := "0010100"; --0x14
    constant c_ascii_NAK                : std_logic_vector := "0010101"; --0x15
    constant c_ascii_SYN                : std_logic_vector := "0010110"; --0x16
    constant c_ascii_ETB                : std_logic_vector := "0010111"; --0x17
    constant c_ascii_CAN                : std_logic_vector := "0011000"; --0x18
    constant c_ascii_EM                 : std_logic_vector := "0011001"; --0x19
    constant c_ascii_SUB                : std_logic_vector := "0011010"; --0x1A
    constant c_ascii_ESC                : std_logic_vector := "0011011"; --0x1B
    constant c_ascii_FS                 : std_logic_vector := "0011100"; --0x1C
    constant c_ascii_GS                 : std_logic_vector := "0011101"; --0x1D
    constant c_ascii_RS                 : std_logic_vector := "0011110"; --0x1E
    constant c_ascii_US                 : std_logic_vector := "0011111"; --0x1F
    constant c_ascii_space              : std_logic_vector := "0100000"; --0x20
    constant c_ascii_exclamation_mark   : std_logic_vector := "0100001"; --0x21
    constant c_ascii_quotation_mark     : std_logic_vector := "0100010"; --0x22
    constant c_ascii_hash               : std_logic_vector := "0100011"; --0x23
    constant c_ascii_dollar             : std_logic_vector := "0100100"; --0x24
    constant c_ascii_percent            : std_logic_vector := "0100101"; --0x25
    constant c_ascii_ampersand          : std_logic_vector := "0100110"; --0x26
    constant c_ascii_apostrophe         : std_logic_vector := "0100111"; --0x27
    constant c_ascii_left_parenthesis   : std_logic_vector := "0101000"; --0x28
    constant c_ascii_right_parenthesis  : std_logic_vector := "0101001"; --0x29
    constant c_ascii_asterisk           : std_logic_vector := "0101010"; --0x2A
    constant c_ascii_plus               : std_logic_vector := "0101011"; --0x2B
    constant c_ascii_comma              : std_logic_vector := "0101100"; --0x2C
    constant c_ascii_hyphen             : std_logic_vector := "0101101"; --0x2D
    constant c_ascii_period             : std_logic_vector := "0101110"; --0x2E
    constant c_ascii_solidus            : std_logic_vector := "0101111"; --0x2F
    constant c_ascii_0                  : std_logic_vector := "0110000"; --0x30
    constant c_ascii_1                  : std_logic_vector := "0110001"; --0x31
    constant c_ascii_2                  : std_logic_vector := "0110010"; --0x32
    constant c_ascii_3                  : std_logic_vector := "0110011"; --0x33
    constant c_ascii_4                  : std_logic_vector := "0110100"; --0x34
    constant c_ascii_5                  : std_logic_vector := "0110101"; --0x35
    constant c_ascii_6                  : std_logic_vector := "0110110"; --0x36
    constant c_ascii_7                  : std_logic_vector := "0110111"; --0x37
    constant c_ascii_8                  : std_logic_vector := "0111000"; --0x38
    constant c_ascii_9                  : std_logic_vector := "0111001"; --0x39
    constant c_ascii_colon              : std_logic_vector := "0111010"; --0x3A
    constant c_ascii_semicolon          : std_logic_vector := "0111011"; --0x3B
    constant c_ascii_less_than          : std_logic_vector := "0111100"; --0x3C
    constant c_ascii_equality           : std_logic_vector := "0111101"; --0x3D
    constant c_ascii_greater_than       : std_logic_vector := "0111110"; --0x3E
    constant c_ascii_question_mark      : std_logic_vector := "0111111"; --0x3F
    constant c_ascii_address            : std_logic_vector := "1000000"; --0x40
    constant c_ascii_uppercase_a        : std_logic_vector := "1000001"; --0x41
    constant c_ascii_uppercase_b        : std_logic_vector := "1000010"; --0x42
    constant c_ascii_uppercase_c        : std_logic_vector := "1000011"; --0x43
    constant c_ascii_uppercase_d        : std_logic_vector := "1000100"; --0x44
    constant c_ascii_uppercase_e        : std_logic_vector := "1000101"; --0x45
    constant c_ascii_uppercase_f        : std_logic_vector := "1000110"; --0x46
    constant c_ascii_uppercase_g        : std_logic_vector := "1000111"; --0x47
    constant c_ascii_uppercase_h        : std_logic_vector := "1001000"; --0x48
    constant c_ascii_uppercase_i        : std_logic_vector := "1001001"; --0x49
    constant c_ascii_uppercase_j        : std_logic_vector := "1001010"; --0x4A
    constant c_ascii_uppercase_k        : std_logic_vector := "1001011"; --0x4B
    constant c_ascii_uppercase_l        : std_logic_vector := "1001100"; --0x4C
    constant c_ascii_uppercase_m        : std_logic_vector := "1001101"; --0x4D
    constant c_ascii_uppercase_n        : std_logic_vector := "1001110"; --0x4E
    constant c_ascii_uppercase_o        : std_logic_vector := "1001111"; --0x4F
    constant c_ascii_uppercase_p        : std_logic_vector := "1010000"; --0x50
    constant c_ascii_uppercase_q        : std_logic_vector := "1010001"; --0x51
    constant c_ascii_uppercase_r        : std_logic_vector := "1010010"; --0x52
    constant c_ascii_uppercase_s        : std_logic_vector := "1010011"; --0x53
    constant c_ascii_uppercase_t        : std_logic_vector := "1010100"; --0x54
    constant c_ascii_uppercase_u        : std_logic_vector := "1010101"; --0x55
    constant c_ascii_uppercase_v        : std_logic_vector := "1010110"; --0x56
    constant c_ascii_uppercase_w        : std_logic_vector := "1010111"; --0x57
    constant c_ascii_uppercase_x        : std_logic_vector := "1011000"; --0x58
    constant c_ascii_uppercase_y        : std_logic_vector := "1011001"; --0x59
    constant c_ascii_uppercase_z        : std_logic_vector := "1011010"; --0x5A
    constant c_ascii_left_bracket       : std_logic_vector := "1011011"; --0x5B
    constant c_ascii_reverse_solidus    : std_logic_vector := "1011100"; --0x5C
    constant c_ascii_right_bracket      : std_logic_vector := "1011101"; --0x5D
    constant c_ascii_circumflex         : std_logic_vector := "1011110"; --0x5E
    constant c_ascii_underscore         : std_logic_vector := "1011111"; --0x5F
    constant c_ascii_grave              : std_logic_vector := "1100000"; --0x60
    constant c_ascii_lowercase_a        : std_logic_vector := "1100001"; --0x61
    constant c_ascii_lowercase_b        : std_logic_vector := "1100010"; --0x62
    constant c_ascii_lowercase_c        : std_logic_vector := "1100011"; --0x63
    constant c_ascii_lowercase_d        : std_logic_vector := "1100100"; --0x64
    constant c_ascii_lowercase_e        : std_logic_vector := "1100101"; --0x65
    constant c_ascii_lowercase_f        : std_logic_vector := "1100110"; --0x66
    constant c_ascii_lowercase_g        : std_logic_vector := "1100111"; --0x67
    constant c_ascii_lowercase_h        : std_logic_vector := "1101000"; --0x68
    constant c_ascii_lowercase_i        : std_logic_vector := "1101001"; --0x69
    constant c_ascii_lowercase_j        : std_logic_vector := "1101010"; --0x6A
    constant c_ascii_lowercase_k        : std_logic_vector := "1101011"; --0x6B
    constant c_ascii_lowercase_l        : std_logic_vector := "1101100"; --0x6C
    constant c_ascii_lowercase_m        : std_logic_vector := "1101101"; --0x6D
    constant c_ascii_lowercase_n        : std_logic_vector := "1101110"; --0x6E
    constant c_ascii_lowercase_o        : std_logic_vector := "1101111"; --0x6F
    constant c_ascii_lowercase_p        : std_logic_vector := "1110000"; --0x70
    constant c_ascii_lowercase_q        : std_logic_vector := "1110001"; --0x71
    constant c_ascii_lowercase_r        : std_logic_vector := "1110010"; --0x72
    constant c_ascii_lowercase_s        : std_logic_vector := "1110011"; --0x73
    constant c_ascii_lowercase_t        : std_logic_vector := "1110100"; --0x74
    constant c_ascii_lowercase_u        : std_logic_vector := "1110101"; --0x75
    constant c_ascii_lowercase_v        : std_logic_vector := "1110110"; --0x76
    constant c_ascii_lowercase_w        : std_logic_vector := "1110111"; --0x77
    constant c_ascii_lowercase_x        : std_logic_vector := "1111000"; --0x78
    constant c_ascii_lowercase_y        : std_logic_vector := "1111001"; --0x79
    constant c_ascii_lowercase_z        : std_logic_vector := "1111010"; --0x7A
    constant c_ascii_left_brace         : std_logic_vector := "1111011"; --0x7B
    constant c_ascii_vertical_bar       : std_logic_vector := "1111100"; --0x7C
    constant c_ascii_right_brace        : std_logic_vector := "1111101"; --0x7D
    constant c_ascii_tilde              : std_logic_vector := "1111110"; --0x7E
    constant c_ascii_DEL                : std_logic_vector := "1111111"; --0x7F

end ascii;


library ieee;
use ieee.std_logic_1164.all;

package comcodes is

    constant c_NUL              : std_logic_vector := "0000000"; --0x00 --
    constant c_BS               : std_logic_vector := "0000001"; --0x01
    constant c_DEL              : std_logic_vector := "0000010"; --0x02
    constant c_HT               : std_logic_vector := "0000011"; --0x03
    constant c_LF               : std_logic_vector := "0000100"; --0x04
    constant c_SI               : std_logic_vector := "0000101"; --0x05
    constant c_ESC              : std_logic_vector := "0000110"; --0x06
    constant c_ENQ              : std_logic_vector := "0000111"; --0x07
    constant c_SOH              : std_logic_vector := "0001000"; --0x08
    constant c_STX              : std_logic_vector := "0001001"; --0x09
    constant c_ACK              : std_logic_vector := "0001010"; --0x0A
    constant c_XON              : std_logic_vector := "0001011"; --0x0B
    constant c_SYN              : std_logic_vector := "0001100"; --0x0C
    constant c_US               : std_logic_vector := "0001101"; --0x0D
    constant c_GS               : std_logic_vector := "0001110"; --0x0E
    constant c_SUB              : std_logic_vector := "0001111"; --0x0F --
    
    constant c_space            : std_logic_vector := "0010000"; --0x10 --
    constant c_letter_a         : std_logic_vector := "0010001"; --0x11 
    constant c_letter_b         : std_logic_vector := "0010010"; --0x12
    constant c_letter_c         : std_logic_vector := "0010011"; --0x13
    constant c_letter_d         : std_logic_vector := "0010100"; --0x14
    constant c_letter_e         : std_logic_vector := "0010101"; --0x15
    constant c_letter_f         : std_logic_vector := "0010110"; --0x16
    constant c_letter_g         : std_logic_vector := "0010111"; --0x17
    constant c_letter_h         : std_logic_vector := "0011000"; --0x18
    constant c_letter_i         : std_logic_vector := "0011001"; --0x19
    constant c_letter_j         : std_logic_vector := "0011010"; --0x1A
    constant c_letter_k         : std_logic_vector := "0011011"; --0x1B
    constant c_letter_l         : std_logic_vector := "0011100"; --0x1C
    constant c_letter_m         : std_logic_vector := "0011101"; --0x1D
    constant c_letter_n         : std_logic_vector := "0011110"; --0x1E
    constant c_letter_o         : std_logic_vector := "0011111"; --0x1F
    constant c_letter_p         : std_logic_vector := "0100000"; --0x20
    constant c_letter_q         : std_logic_vector := "0100001"; --0x21
    constant c_letter_r         : std_logic_vector := "0100010"; --0x22
    constant c_letter_s         : std_logic_vector := "0100011"; --0x23
    constant c_letter_t         : std_logic_vector := "0100100"; --0x24
    constant c_letter_u         : std_logic_vector := "0100101"; --0x25
    constant c_letter_v         : std_logic_vector := "0100110"; --0x26
    constant c_letter_w         : std_logic_vector := "0100111"; --0x27
    constant c_letter_x         : std_logic_vector := "0101000"; --0x28
    constant c_letter_y         : std_logic_vector := "0101001"; --0x29
    constant c_letter_z         : std_logic_vector := "0101010"; --0x2A --
    
    constant c_grave            : std_logic_vector := "0101011"; --0x2B --
    constant c_hyphen           : std_logic_vector := "0101100"; --0x2C
    constant c_equality         : std_logic_vector := "0101101"; --0x2D
    constant c_left_bracket     : std_logic_vector := "0101110"; --0x2E
    constant c_right_bracket    : std_logic_vector := "0101111"; --0x2F --

    constant c_zero             : std_logic_vector := "0110000"; --0x30 --
    constant c_one              : std_logic_vector := "0110001"; --0x31
    constant c_two              : std_logic_vector := "0110010"; --0x32
    constant c_three            : std_logic_vector := "0110011"; --0x33
    constant c_four             : std_logic_vector := "0110100"; --0x34
    constant c_five             : std_logic_vector := "0110101"; --0x35
    constant c_six              : std_logic_vector := "0110110"; --0x36
    constant c_seven            : std_logic_vector := "0110111"; --0x37
    constant c_eight            : std_logic_vector := "0111000"; --0x38
    constant c_nine             : std_logic_vector := "0111001"; --0x39 --

    constant c_reverse_solidus  : std_logic_vector := "0111010"; --0x3A --
    constant c_semicolon        : std_logic_vector := "0111011"; --0x3B
    constant c_apostrophe       : std_logic_vector := "0111100"; --0x3C
    constant c_comma            : std_logic_vector := "0111101"; --0x3D
    constant c_period           : std_logic_vector := "0111110"; --0x3E
    constant c_solidus          : std_logic_vector := "0111111"; --0x3F --

    constant c_f1               : std_logic_vector := "1000000"; --0x40 --
    constant c_f2               : std_logic_vector := "1000001"; --0x41
    constant c_f3               : std_logic_vector := "1000010"; --0x42
    constant c_f4               : std_logic_vector := "1000011"; --0x43
    constant c_f5               : std_logic_vector := "1000100"; --0x44
    constant c_f6               : std_logic_vector := "1000101"; --0x45
    constant c_f7               : std_logic_vector := "1000110"; --0x46
    constant c_f8               : std_logic_vector := "1000111"; --0x47
    constant c_f9               : std_logic_vector := "1001000"; --0x48
    constant c_f10              : std_logic_vector := "1001001"; --0x49
    constant c_f11              : std_logic_vector := "1001010"; --0x4A
    constant c_f12              : std_logic_vector := "1001011"; --0x4B
    constant c_f13              : std_logic_vector := "1001100"; --0x4C
    constant c_f14              : std_logic_vector := "1001101"; --0x4D
    constant c_f15              : std_logic_vector := "1001110"; --0x4E --

    constant c_insert           : std_logic_vector := "1001111"; --0x4F --
    constant c_home             : std_logic_vector := "1010000"; --0x50
    constant c_page_up          : std_logic_vector := "1010001"; --0x51
    constant c_page_down        : std_logic_vector := "1010010"; --0x52
    constant c_end              : std_logic_vector := "1010011"; --0x53 --

    constant c_arrow_up         : std_logic_vector := "1010100"; --0x54 --
    constant c_arrow_down       : std_logic_vector := "1010101"; --0x55
    constant c_arrow_left       : std_logic_vector := "1010110"; --0x56
    constant c_arrow_right      : std_logic_vector := "1010111"; --0x57 --

    type codetable is array(0 to 76) of std_logic_vector(6 downto 0);
	
	constant stdkey_codetable : codetable := (
		c_BS,                
		c_DEL,               
		c_HT,              
		c_LF,                
		c_ESC,               
		c_space,             
		c_letter_a,          
		c_letter_b,          
		c_letter_c,          
		c_letter_d,          
		c_letter_e,          
		c_letter_f,          
		c_letter_g,          
		c_letter_h,          
		c_letter_i,          
		c_letter_j,          
		c_letter_k,          
		c_letter_l,          
		c_letter_m,          
		c_letter_n,          
		c_letter_o,          
		c_letter_p,          
		c_letter_q,          
		c_letter_r,          
		c_letter_s,          
		c_letter_t,          
		c_letter_u,          
		c_letter_v,         
		c_letter_w,          
		c_letter_x,          
		c_letter_y,          
		c_letter_z,         
		c_grave,             
		c_hyphen,            
		c_equality,          
		c_left_bracket,      
		c_right_bracket,     
		c_zero,              
		c_one,               
		c_two,               
		c_three,             
		c_four,              
		c_five,              
		c_six,              
		c_seven,             
		c_eight,             
		c_nine,              
		c_reverse_solidus,   
		c_semicolon,         
		c_apostrophe,        
		c_comma,             
		c_period,            
		c_solidus,           
		c_f1,                
		c_f2,               
		c_f3,                
		c_f4,                
		c_f5,                
		c_f6,                
		c_f7,                
		c_f8,                
		c_f9,                
		c_f10,               
		c_f11,               
		c_f12,               
		c_f13,               
		c_f14,               
		c_f15,               
		c_insert,            
		c_home,              
		c_page_up,           
		c_page_down,         
		c_end,               
		c_arrow_up,          
		c_arrow_down,        
		c_arrow_left,        
		c_arrow_right       
	);

end comcodes;


-- Null Data
-- NUL : SHF

-- Data Formatting
-- BS : CR
-- DEL : CAN
-- HT : VT
-- LF : FF
-- SI : SO

-- Data Transmission
-- ESC : DLE
-- ENQ : EOT
-- SOH : ETB
-- STX : ETX
-- ACK : NAK
-- XON : XOF
-- SYN : BEL

-- Data Structuring
-- US : RS
-- GS : FS
-- SUB : EM


