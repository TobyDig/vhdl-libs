-- ************************************************************************
--
--      This package contains custom types and type related constructs 
--      for use in the tad64 keyboard controller. 
--
--      Contents may include:
--          1)  custom types to describe parts of the controller
--          2)  constants of useful type instances 
--          3)  operator overloarding functions for custom types
--          4)  type conversion functions
--
--*************************************************************************


library ieee;
use ieee.std_logic_1164.all;

package types is

    -- TYPES

    type t_modkey is record
        shift   : std_logic;
        ctrl    : std_logic;
        meta    : std_logic;
        alt     : std_logic;
    end record;

    type t_alphakey is record
        a   : std_logic;
        b   : std_logic;
        c   : std_logic;
        d   : std_logic;
        e   : std_logic;
        f   : std_logic;
        g   : std_logic;
        h   : std_logic;
        i   : std_logic;
        j   : std_logic;
        k   : std_logic;
        l   : std_logic;
        m   : std_logic;
        n   : std_logic;
        o   : std_logic;
        p   : std_logic;
        q   : std_logic;
        r   : std_logic;
        s   : std_logic;
        t   : std_logic;
        u   : std_logic;
        v   : std_logic;
        w   : std_logic;
        x   : std_logic;
        y   : std_logic;
        z   : std_logic;
    end record;

    type t_functionkey is record
        f1      : std_logic;
        f2      : std_logic;
        f3      : std_logic;
        f4      : std_logic;
        f5      : std_logic;
        f6      : std_logic;
        f7      : std_logic;
        f8      : std_logic;
        f9      : std_logic;
        f10     : std_logic;
        f11     : std_logic;
        f12     : std_logic;
        f13     : std_logic;
        f14     : std_logic;
        f15     : std_logic;
    end record;

    type t_punctuationkey is record
        grave       : std_logic;
        hyphen      : std_logic;
        equals      : std_logic;
        lbracket    : std_logic;
        rbracket    : std_logic;
        backslash   : std_logic;
        semicolon   : std_logic;
        apostrophe  : std_logic;
        comma       : std_logic;
        period      : std_logic;
        fwdslash    : std_logic;
        space       : std_logic;
    end record;

    type t_navigationkey is record
        pghome  : std_logic;
        pgup    : std_logic;
        pgdn    : std_logic;
        pgend   : std_logic;
        up      : std_logic;
        down    : std_logic;
        left    : std_logic;
        right   : std_logic;
    end record;

    type t_numerickey is record
        n1   : std_logic;
        n2   : std_logic;
        n3   : std_logic;
        n4   : std_logic;
        n5   : std_logic;
        n6   : std_logic;
        n7   : std_logic;
        n8   : std_logic;
        n9   : std_logic;
        n0   : std_logic;
    end record;

	type t_nonalphakey is record
        fnkey   : t_functionkey;
        pnkey   : t_punctuationkey;
        navkey  : t_navigationkey;
        numkey  : t_numerickey;
        bs      : std_logic;
        del     : std_logic;
        tab     : std_logic;
        rtn     : std_logic;
        esc     : std_logic;
        ins     : std_logic;
    end record;
	
    type t_stdkey is record 
        alpha       : t_alphakey;
        nonalpha    : t_nonalphakey;
    end record;
	
    type t_key is record
        leftmod     : t_modkey;
        rightmod    : t_modkey;
        std      	: t_stdkey;
        caps        : std_logic;
    end record;

    type keytable is array(0 to 76) of t_stdkey;

    -- CONSTANTS

    constant c_modkey_zeros         : t_modkey          := (others => '0');
    constant c_alphakey_zeros       : t_alphakey        := (others => '0');
    constant c_fnkey_zeros          : t_functionkey     := (others => '0');
    constant c_pnkey_zeros          : t_punctuationkey  := (others => '0');
    constant c_navkey_zeros         : t_navigationkey   := (others => '0');
    constant c_numkey_zeros         : t_numerickey      := (others => '0');
    constant c_nonalphakey_zeros    : t_nonalphakey     := (
        fnkey   => c_fnkey_zeros,
        pnkey   => c_pnkey_zeros,
        navkey  => c_navkey_zeros,
        numkey  => c_numkey_zeros, 
        others  => '0'
    );
    constant c_stdkey_zeros         : t_stdkey          := (
        alpha       => c_alphakey_zeros,
        nonalpha    => c_nonalphakey_zeros
    );
    constant c_key_zeros            : t_key             := (
        leftmod     => c_modkey_zeros,
        rightmod    => c_modkey_zeros,
        std         => c_stdkey_zeros,
        others      => '0'
    );

    -- constant c_bs_key           : t_stdkey := (c_alphakey_zeros,(c_fnkey_zeros,c_pnkey_zeros,c_navkey_zeros,c_numkey_zeros,'1','0','0','0','0','0'));
	-- constant c_del_key          : t_stdkey := (c_alphakey_zeros,(c_fnkey_zeros,c_pnkey_zeros,c_navkey_zeros,c_numkey_zeros,'0','1','0','0','0','0'));
	-- constant c_tab_key          : t_stdkey := (c_alphakey_zeros,(c_fnkey_zeros,c_pnkey_zeros,c_navkey_zeros,c_numkey_zeros,'0','0','1','0','0','0'));
	-- constant c_rtn_key          : t_stdkey := (c_alphakey_zeros,(c_fnkey_zeros,c_pnkey_zeros,c_navkey_zeros,c_numkey_zeros,'0','0','0','1','0','0'));
	-- constant c_esc_key          : t_stdkey := (c_alphakey_zeros,(c_fnkey_zeros,c_pnkey_zeros,c_navkey_zeros,c_numkey_zeros,'0','0','0','0','1','0'));
	-- constant c_space_key        : t_stdkey := (c_alphakey_zeros,(c_fnkey_zeros,(space=>'1',others=>'0'),c_navkey_zeros,c_numkey_zeros,'0','0','0','0','0','0'));
	-- constant c_a_key            : t_stdkey := ((a=>'1',others=>'0'),c_nonalphakey_zeros);
	-- constant c_b_key            : t_stdkey := ((b=>'1',others=>'0'),c_nonalphakey_zeros);
	-- constant c_c_key            : t_stdkey := ((c=>'1',others=>'0'),c_nonalphakey_zeros);
	-- constant c_d_key            : t_stdkey := ((d=>'1',others=>'0'),c_nonalphakey_zeros);
	-- constant c_e_key            : t_stdkey := ((e=>'1',others=>'0'),c_nonalphakey_zeros);
	-- constant c_f_key            : t_stdkey := ((f=>'1',others=>'0'),c_nonalphakey_zeros);
	-- constant c_g_key            : t_stdkey := ((g=>'1',others=>'0'),c_nonalphakey_zeros);
	-- constant c_h_key            : t_stdkey := ((h=>'1',others=>'0'),c_nonalphakey_zeros);
	-- constant c_i_key            : t_stdkey := ((i=>'1',others=>'0'),c_nonalphakey_zeros);
	-- constant c_j_key            : t_stdkey := ((j=>'1',others=>'0'),c_nonalphakey_zeros);
	-- constant c_k_key            : t_stdkey := ((k=>'1',others=>'0'),c_nonalphakey_zeros);
	-- constant c_l_key            : t_stdkey := ((l=>'1',others=>'0'),c_nonalphakey_zeros);
	-- constant c_m_key            : t_stdkey := ((m=>'1',others=>'0'),c_nonalphakey_zeros);
	-- constant c_n_key            : t_stdkey := ((n=>'1',others=>'0'),c_nonalphakey_zeros);
	-- constant c_o_key            : t_stdkey := ((o=>'1',others=>'0'),c_nonalphakey_zeros);
	-- constant c_p_key            : t_stdkey := ((p=>'1',others=>'0'),c_nonalphakey_zeros);
	-- constant c_q_key            : t_stdkey := ((q=>'1',others=>'0'),c_nonalphakey_zeros);
	-- constant c_r_key            : t_stdkey := ((r=>'1',others=>'0'),c_nonalphakey_zeros);
	-- constant c_s_key            : t_stdkey := ((s=>'1',others=>'0'),c_nonalphakey_zeros);
	-- constant c_t_key            : t_stdkey := ((t=>'1',others=>'0'),c_nonalphakey_zeros);
	-- constant c_u_key            : t_stdkey := ((u=>'1',others=>'0'),c_nonalphakey_zeros);
	-- constant c_v_key            : t_stdkey := ((v=>'1',others=>'0'),c_nonalphakey_zeros);
	-- constant c_w_key            : t_stdkey := ((w=>'1',others=>'0'),c_nonalphakey_zeros);
	-- constant c_x_key            : t_stdkey := ((x=>'1',others=>'0'),c_nonalphakey_zeros);
	-- constant c_y_key            : t_stdkey := ((y=>'1',others=>'0'),c_nonalphakey_zeros);
	-- constant c_z_key            : t_stdkey := ((z=>'1',others=>'0'),c_nonalphakey_zeros);
	-- constant c_grave_key        : t_stdkey := (c_alphakey_zeros,(c_fnkey_zeros,(grave=>'1',others=>'0'),c_navkey_zeros,c_numkey_zeros,'0','0','0','0','0','0'));
	-- constant c_hyphen_key       : t_stdkey := (c_alphakey_zeros,(c_fnkey_zeros,(hyphen=>'1',others=>'0'),c_navkey_zeros,c_numkey_zeros,'0','0','0','0','0','0'));
	-- constant c_equals_key       : t_stdkey := (c_alphakey_zeros,(c_fnkey_zeros,(equals=>'1',others=>'0'),c_navkey_zeros,c_numkey_zeros,'0','0','0','0','0','0'));
	-- constant c_lbracket_key     : t_stdkey := (c_alphakey_zeros,(c_fnkey_zeros,(lbracket=>'1',others=>'0'),c_navkey_zeros,c_numkey_zeros,'0','0','0','0','0','0'));
	-- constant c_rbracket_key     : t_stdkey := (c_alphakey_zeros,(c_fnkey_zeros,(rbracket=>'1',others=>'0'),c_navkey_zeros,c_numkey_zeros,'0','0','0','0','0','0'));
	-- constant c_n0_key           : t_stdkey := (c_alphakey_zeros,(c_fnkey_zeros,c_pnkey_zeros,c_navkey_zeros,(n0=>'1',others=>'0'),'0','0','0','0','0','0'));
	-- constant c_n1_key           : t_stdkey := (c_alphakey_zeros,(c_fnkey_zeros,c_pnkey_zeros,c_navkey_zeros,(n1=>'1',others=>'0'),'0','0','0','0','0','0'));
	-- constant c_n2_key           : t_stdkey := (c_alphakey_zeros,(c_fnkey_zeros,c_pnkey_zeros,c_navkey_zeros,(n2=>'1',others=>'0'),'0','0','0','0','0','0'));
	-- constant c_n3_key           : t_stdkey := (c_alphakey_zeros,(c_fnkey_zeros,c_pnkey_zeros,c_navkey_zeros,(n3=>'1',others=>'0'),'0','0','0','0','0','0'));
	-- constant c_n4_key           : t_stdkey := (c_alphakey_zeros,(c_fnkey_zeros,c_pnkey_zeros,c_navkey_zeros,(n4=>'1',others=>'0'),'0','0','0','0','0','0'));
	-- constant c_n5_key           : t_stdkey := (c_alphakey_zeros,(c_fnkey_zeros,c_pnkey_zeros,c_navkey_zeros,(n5=>'1',others=>'0'),'0','0','0','0','0','0'));
	-- constant c_n6_key           : t_stdkey := (c_alphakey_zeros,(c_fnkey_zeros,c_pnkey_zeros,c_navkey_zeros,(n6=>'1',others=>'0'),'0','0','0','0','0','0'));
	-- constant c_n7_key           : t_stdkey := (c_alphakey_zeros,(c_fnkey_zeros,c_pnkey_zeros,c_navkey_zeros,(n7=>'1',others=>'0'),'0','0','0','0','0','0'));
	-- constant c_n8_key           : t_stdkey := (c_alphakey_zeros,(c_fnkey_zeros,c_pnkey_zeros,c_navkey_zeros,(n8=>'1',others=>'0'),'0','0','0','0','0','0'));
	-- constant c_n9_key           : t_stdkey := (c_alphakey_zeros,(c_fnkey_zeros,c_pnkey_zeros,c_navkey_zeros,(n9=>'1',others=>'0'),'0','0','0','0','0','0'));
	-- constant c_backslash_key    : t_stdkey := (c_alphakey_zeros,(c_fnkey_zeros,(backslash=>'1',others=>'0'),c_navkey_zeros,c_numkey_zeros,'0','0','0','0','0','0'));
	-- constant c_semicolon_key    : t_stdkey := (c_alphakey_zeros,(c_fnkey_zeros,(semicolon=>'1',others=>'0'),c_navkey_zeros,c_numkey_zeros,'0','0','0','0','0','0'));
	-- constant c_apostrophe_key   : t_stdkey := (c_alphakey_zeros,(c_fnkey_zeros,(apostrophe=>'1',others=>'0'),c_navkey_zeros,c_numkey_zeros,'0','0','0','0','0','0'));
	-- constant c_comma_key        : t_stdkey := (c_alphakey_zeros,(c_fnkey_zeros,(comma=>'1',others=>'0'),c_navkey_zeros,c_numkey_zeros,'0','0','0','0','0','0'));
	-- constant c_period_key       : t_stdkey := (c_alphakey_zeros,(c_fnkey_zeros,(period=>'1',others=>'0'),c_navkey_zeros,c_numkey_zeros,'0','0','0','0','0','0'));
	-- constant c_fwdslash_key     : t_stdkey := (c_alphakey_zeros,(c_fnkey_zeros,(fwdslash=>'1',others=>'0'),c_navkey_zeros,c_numkey_zeros,'0','0','0','0','0','0'));
	-- constant c_f1_key           : t_stdkey := (c_alphakey_zeros,((f1=>'1',others=>'0'),c_pnkey_zeros,c_navkey_zeros,c_numkey_zeros,'0','0','0','0','0','0'));
	-- constant c_f2_key           : t_stdkey := (c_alphakey_zeros,((f2=>'1',others=>'0'),c_pnkey_zeros,c_navkey_zeros,c_numkey_zeros,'0','0','0','0','0','0'));
	-- constant c_f3_key           : t_stdkey := (c_alphakey_zeros,((f3=>'1',others=>'0'),c_pnkey_zeros,c_navkey_zeros,c_numkey_zeros,'0','0','0','0','0','0'));
	-- constant c_f4_key           : t_stdkey := (c_alphakey_zeros,((f4=>'1',others=>'0'),c_pnkey_zeros,c_navkey_zeros,c_numkey_zeros,'0','0','0','0','0','0'));
	-- constant c_f5_key           : t_stdkey := (c_alphakey_zeros,((f5=>'1',others=>'0'),c_pnkey_zeros,c_navkey_zeros,c_numkey_zeros,'0','0','0','0','0','0'));
	-- constant c_f6_key           : t_stdkey := (c_alphakey_zeros,((f6=>'1',others=>'0'),c_pnkey_zeros,c_navkey_zeros,c_numkey_zeros,'0','0','0','0','0','0'));
	-- constant c_f7_key           : t_stdkey := (c_alphakey_zeros,((f7=>'1',others=>'0'),c_pnkey_zeros,c_navkey_zeros,c_numkey_zeros,'0','0','0','0','0','0'));
	-- constant c_f8_key           : t_stdkey := (c_alphakey_zeros,((f8=>'1',others=>'0'),c_pnkey_zeros,c_navkey_zeros,c_numkey_zeros,'0','0','0','0','0','0'));
	-- constant c_f9_key           : t_stdkey := (c_alphakey_zeros,((f9=>'1',others=>'0'),c_pnkey_zeros,c_navkey_zeros,c_numkey_zeros,'0','0','0','0','0','0'));
	-- constant c_f10_key          : t_stdkey := (c_alphakey_zeros,((f10=>'1',others=>'0'),c_pnkey_zeros,c_navkey_zeros,c_numkey_zeros,'0','0','0','0','0','0'));
	-- constant c_f11_key          : t_stdkey := (c_alphakey_zeros,((f11=>'1',others=>'0'),c_pnkey_zeros,c_navkey_zeros,c_numkey_zeros,'0','0','0','0','0','0'));
	-- constant c_f12_key          : t_stdkey := (c_alphakey_zeros,((f12=>'1',others=>'0'),c_pnkey_zeros,c_navkey_zeros,c_numkey_zeros,'0','0','0','0','0','0'));
	-- constant c_f13_key          : t_stdkey := (c_alphakey_zeros,((f13=>'1',others=>'0'),c_pnkey_zeros,c_navkey_zeros,c_numkey_zeros,'0','0','0','0','0','0'));
	-- constant c_f14_key          : t_stdkey := (c_alphakey_zeros,((f14=>'1',others=>'0'),c_pnkey_zeros,c_navkey_zeros,c_numkey_zeros,'0','0','0','0','0','0'));
	-- constant c_f15_key          : t_stdkey := (c_alphakey_zeros,((f15=>'1',others=>'0'),c_pnkey_zeros,c_navkey_zeros,c_numkey_zeros,'0','0','0','0','0','0'));
	-- constant c_ins_key          : t_stdkey := (c_alphakey_zeros,(c_fnkey_zeros,c_pnkey_zeros,c_navkey_zeros,c_numkey_zeros,'0','0','0','0','0','1'));
	-- constant c_pghome_key       : t_stdkey := (c_alphakey_zeros,(c_fnkey_zeros,c_pnkey_zeros,(pghome=>'1',others=>'0'),c_numkey_zeros,'0','0','0','0','0','0'));
	-- constant c_pgup_key         : t_stdkey := (c_alphakey_zeros,(c_fnkey_zeros,c_pnkey_zeros,(pgup=>'1',others=>'0'),c_numkey_zeros,'0','0','0','0','0','0'));
	-- constant c_pgdn_key         : t_stdkey := (c_alphakey_zeros,(c_fnkey_zeros,c_pnkey_zeros,(pgdn=>'1',others=>'0'),c_numkey_zeros,'0','0','0','0','0','0'));
	-- constant c_pgend_key        : t_stdkey := (c_alphakey_zeros,(c_fnkey_zeros,c_pnkey_zeros,(pgend=>'1',others=>'0'),c_numkey_zeros,'0','0','0','0','0','0'));
	-- constant c_up_key           : t_stdkey := (c_alphakey_zeros,(c_fnkey_zeros,c_pnkey_zeros,(up=>'1',others=>'0'),c_numkey_zeros,'0','0','0','0','0','0'));
	-- constant c_down_key         : t_stdkey := (c_alphakey_zeros,(c_fnkey_zeros,c_pnkey_zeros,(down=>'1',others=>'0'),c_numkey_zeros,'0','0','0','0','0','0'));
	-- constant c_left_key         : t_stdkey := (c_alphakey_zeros,(c_fnkey_zeros,c_pnkey_zeros,(left=>'1',others=>'0'),c_numkey_zeros,'0','0','0','0','0','0'));
	-- constant c_right_key        : t_stdkey := (c_alphakey_zeros,(c_fnkey_zeros,c_pnkey_zeros,(right=>'1',others=>'0'),c_numkey_zeros,'0','0','0','0','0','0'));
	
	-- constant stdkeytable : keytable := (
    --     c_bs_key,           
    --     c_del_key,          
    --     c_tab_key,          
    --     c_rtn_key,          
    --     c_esc_key,          
    --     c_space_key,        
    --     c_a_key,            
    --     c_b_key,            
    --     c_c_key,            
    --     c_d_key,            
    --     c_e_key,            
    --     c_f_key,            
    --     c_g_key,            
    --     c_h_key,            
    --     c_i_key,            
    --     c_j_key,            
    --     c_k_key,            
    --     c_l_key,            
    --     c_m_key,            
    --     c_n_key,            
    --     c_o_key,            
    --     c_p_key,            
    --     c_q_key,            
    --     c_r_key,            
    --     c_s_key,            
    --     c_t_key,            
    --     c_u_key,            
    --     c_v_key,            
    --     c_w_key,            
    --     c_x_key,            
    --     c_y_key,            
    --     c_z_key,            
    --     c_grave_key,        
    --     c_hyphen_key,       
    --     c_equals_key,       
    --     c_lbracket_key,     
    --     c_rbracket_key,     
    --     c_n0_key,           
    --     c_n1_key,           
    --     c_n2_key,           
    --     c_n3_key,           
    --     c_n4_key,           
    --     c_n5_key,           
    --     c_n6_key,           
    --     c_n7_key,           
    --     c_n8_key,           
    --     c_n9_key,           
    --     c_backslash_key,    
    --     c_semicolon_key,    
    --     c_apostrophe_key,   
    --     c_comma_key,        
    --     c_period_key,       
    --     c_fwdslash_key,     
    --     c_f1_key,           
    --     c_f2_key,           
    --     c_f3_key,           
    --     c_f4_key,           
    --     c_f5_key,           
    --     c_f6_key,           
    --     c_f7_key,           
    --     c_f8_key,           
    --     c_f9_key,           
    --     c_f10_key,          
    --     c_f11_key,          
    --     c_f12_key,          
    --     c_f13_key,          
    --     c_f14_key,          
    --     c_f15_key,          
    --     c_ins_key,          
    --     c_pghome_key,       
    --     c_pgup_key,         
    --     c_pgdn_key,         
    --     c_pgend_key,        
    --     c_up_key,           
    --     c_down_key,         
    --     c_left_key,         
    --     c_right_key        
    -- );

    -- FUNCTION PROTOTYPES
	
	function "or" (l, r : t_modkey) return t_modkey;
    
    function "and" (l, r : t_alphakey) return t_alphakey;
    function "and" (l, r : t_functionkey) return t_functionkey;
    function "and" (l, r : t_punctuationkey) return t_punctuationkey;
    function "and" (l, r : t_navigationkey) return t_navigationkey;
    function "and" (l, r : t_numerickey) return t_numerickey;
    function "and" (l, r : t_nonalphakey) return t_nonalphakey;
    function "and" (l, r : t_stdkey) return t_stdkey;

    function "not" (r : t_alphakey) return t_alphakey;
    function "not" (r : t_functionkey) return t_functionkey;
    function "not" (r : t_punctuationkey) return t_punctuationkey;
    function "not" (r : t_navigationkey) return t_navigationkey;
    function "not" (r : t_numerickey) return t_numerickey;
    function "not" (r : t_nonalphakey) return t_nonalphakey;
    function "not" (r : t_stdkey) return t_stdkey;

    function stdkey_to_slv(stdkey : t_stdkey) return std_logic_vector;
    function slv_to_stdkey(slv : std_logic_vector) return t_stdkey;

end types;

package body types is

    -- OR

	function "or" (l, r : t_modkey) return t_modkey is
		variable result : t_modkey;
	begin
		result.shift := l.shift or r.shift;
		result.ctrl := l.ctrl or r.ctrl;
		result.meta := l.meta or r.meta;
		result.alt := l.alt or r.alt;
		return result;
	end function;

    -- AND

    function "and" (l, r : t_alphakey) return t_alphakey is
        variable result : t_alphakey;
    begin
        result.a := l.a and r.a;
        result.b := l.b and r.b;
        result.c := l.c and r.c;
        result.d := l.d and r.d;
        result.e := l.e and r.e;
        result.f := l.f and r.f;
        result.g := l.g and r.g;
        result.h := l.h and r.h;
        result.i := l.i and r.i;
        result.j := l.j and r.j;
        result.k := l.k and r.k;
        result.l := l.l and r.l;
        result.m := l.m and r.m;
        result.n := l.n and r.n;
        result.o := l.o and r.o;
        result.p := l.p and r.p;
        result.q := l.q and r.q;
        result.r := l.r and r.r;
        result.s := l.s and r.s;
        result.t := l.t and r.t;
        result.u := l.u and r.u;
        result.v := l.v and r.v;
        result.w := l.w and r.w;
        result.x := l.x and r.x;
        result.y := l.y and r.y;
        result.z := l.z and r.z;
        return result;
    end function;

    function "and" (l, r : t_functionkey) return t_functionkey is
        variable result : t_functionkey;
    begin
        result.f1  := l.f1  and r.f1;
        result.f2  := l.f2  and r.f2;
        result.f3  := l.f3  and r.f3;
        result.f4  := l.f4  and r.f4;
        result.f5  := l.f5  and r.f5;
        result.f6  := l.f6  and r.f6;
        result.f7  := l.f7  and r.f7;
        result.f8  := l.f8  and r.f8;
        result.f9  := l.f9  and r.f9;
        result.f10 := l.f10 and r.f10;
        result.f11 := l.f11 and r.f11;
        result.f12 := l.f12 and r.f12;
        result.f13 := l.f13 and r.f13;
        result.f14 := l.f14 and r.f14;
        result.f15 := l.f15 and r.f15;
        return result;
    end function;

    function "and" (l, r : t_punctuationkey) return t_punctuationkey is
        variable result : t_punctuationkey;
    begin
        result.grave        := l.grave      and r.grave;          
        result.hyphen       := l.hyphen     and r.hyphen;        
        result.equals       := l.equals     and r.equals;        
        result.lbracket     := l.lbracket   and r.lbracket;    
        result.rbracket     := l.rbracket   and r.rbracket;    
        result.backslash    := l.backslash  and r.backslash;  
        result.semicolon    := l.semicolon  and r.semicolon;  
        result.apostrophe   := l.apostrophe and r.apostrophe;
        result.comma        := l.comma      and r.comma;          
        result.period       := l.period     and r.period;        
        result.fwdslash     := l.fwdslash   and r.fwdslash;    
        result.space        := l.space      and r.space;          
        return result;
    end function;

    function "and" (l, r : t_navigationkey) return t_navigationkey is
        variable result : t_navigationkey;
    begin
        result.pghome := l.pghome and r.pghome;
        result.pgup   := l.pgup   and r.pgup;
        result.pgdn   := l.pgdn   and r.pgdn;
        result.pgend  := l.pgend  and r.pgend;
        result.up     := l.up     and r.up;
        result.down   := l.down   and r.down;
        result.left   := l.left   and r.left;
        result.right  := l.right  and r.right;
        return result;
    end function;

    function "and" (l, r : t_numerickey) return t_numerickey is
        variable result : t_numerickey;
    begin
        result.n1 := l.n1 and r.n1;
        result.n2 := l.n2 and r.n2;
        result.n3 := l.n3 and r.n3;
        result.n4 := l.n4 and r.n4;
        result.n5 := l.n5 and r.n5;
        result.n6 := l.n6 and r.n6;
        result.n7 := l.n7 and r.n7;
        result.n8 := l.n8 and r.n8;
        result.n9 := l.n9 and r.n9;
        result.n0 := l.n0 and r.n0;
        return result;
    end function;

    function "and" (l, r : t_nonalphakey) return t_nonalphakey is
        variable result : t_nonalphakey;
    begin
        result.fnkey  := l.fnkey  and r.fnkey;
        result.pnkey  := l.pnkey  and r.pnkey;
        result.navkey := l.navkey and r.navkey;
        result.numkey := l.numkey and r.numkey;
        result.esc    := l.esc    and r.esc;
        result.del    := l.del    and r.del;
        result.bs     := l.bs     and r.bs;
        result.tab    := l.tab    and r.tab;
        result.rtn    := l.rtn    and r.rtn;
        result.ins    := l.ins    and r.ins;
        return result;
    end function;

    function "and" (l, r : t_stdkey) return t_stdkey is
        variable result : t_stdkey;
    begin
        result.alpha    := l.alpha    and r.alpha;
        result.nonalpha := l.nonalpha and r.nonalpha;
        return result;
    end function;

    -- NOT

    function "not" (r : t_alphakey) return t_alphakey is
        variable result : t_alphakey;
    begin
        result.a := not r.a;
        result.b := not r.b;
        result.c := not r.c;
        result.d := not r.d;
        result.e := not r.e;
        result.f := not r.f;
        result.g := not r.g;
        result.h := not r.h;
        result.i := not r.i;
        result.j := not r.j;
        result.k := not r.k;
        result.l := not r.l;
        result.m := not r.m;
        result.n := not r.n;
        result.o := not r.o;
        result.p := not r.p;
        result.q := not r.q;
        result.r := not r.r;
        result.s := not r.s;
        result.t := not r.t;
        result.u := not r.u;
        result.v := not r.v;
        result.w := not r.w;
        result.x := not r.x;
        result.y := not r.y;
        result.z := not r.z;
        return result;
    end function;

    function "not" (r : t_functionkey) return t_functionkey is
        variable result : t_functionkey;
    begin
        result.f1  := not r.f1;
        result.f2  := not r.f2;
        result.f3  := not r.f3;
        result.f4  := not r.f4;
        result.f5  := not r.f5;
        result.f6  := not r.f6;
        result.f7  := not r.f7;
        result.f8  := not r.f8;
        result.f9  := not r.f9;
        result.f10 := not r.f10;
        result.f11 := not r.f11;
        result.f12 := not r.f12;
        result.f13 := not r.f13;
        result.f14 := not r.f14;
        result.f15 := not r.f15;
        return result;
    end function;

    function "not" (r : t_punctuationkey) return t_punctuationkey is
        variable result : t_punctuationkey;
    begin
        result.grave        := not r.grave;          
        result.hyphen       := not r.hyphen;        
        result.equals       := not r.equals;        
        result.lbracket     := not r.lbracket;    
        result.rbracket     := not r.rbracket;    
        result.backslash    := not r.backslash;  
        result.semicolon    := not r.semicolon;  
        result.apostrophe   := not r.apostrophe;
        result.comma        := not r.comma;          
        result.period       := not r.period;        
        result.fwdslash     := not r.fwdslash;    
        result.space        := not r.space;          
        return result;
    end function;

    function "not" (r : t_navigationkey) return t_navigationkey is
        variable result : t_navigationkey;
    begin
        result.pghome := not r.pghome;
        result.pgup   := not r.pgup;
        result.pgdn   := not r.pgdn;
        result.pgend  := not r.pgend;
        result.up     := not r.up;
        result.down   := not r.down;
        result.left   := not r.left;
        result.right  := not r.right;
        return result;
    end function;

    function "not" (r : t_numerickey) return t_numerickey is
        variable result : t_numerickey;
    begin
        result.n1 := not r.n1;
        result.n2 := not r.n2;
        result.n3 := not r.n3;
        result.n4 := not r.n4;
        result.n5 := not r.n5;
        result.n6 := not r.n6;
        result.n7 := not r.n7;
        result.n8 := not r.n8;
        result.n9 := not r.n9;
        result.n0 := not r.n0;
        return result;
    end function;

    function "not" (r : t_nonalphakey) return t_nonalphakey is
        variable result : t_nonalphakey;
    begin
        result.fnkey  := not r.fnkey;
        result.pnkey  := not r.pnkey;
        result.navkey := not r.navkey;
        result.numkey := not r.numkey;
        result.esc    := not r.esc;
        result.del    := not r.del;
        result.bs     := not r.bs;
        result.tab    := not r.tab;
        result.rtn    := not r.rtn;
        result.ins    := not r.ins;
        return result;
    end function;

    function "not" (r : t_stdkey) return t_stdkey is
        variable result : t_stdkey;
    begin
        result.alpha    := not r.alpha;
        result.nonalpha := not r.nonalpha;
        return result;
    end function;

    function stdkey_to_slv(stdkey : t_stdkey) return std_logic_vector is
        variable result : std_logic_vector(76 downto 0);
    begin
        result(00) := stdkey.nonalpha.bs;
        result(01) := stdkey.nonalpha.del;
        result(02) := stdkey.nonalpha.tab;
        result(03) := stdkey.nonalpha.rtn;
        result(04) := stdkey.nonalpha.esc;
        result(05) := stdkey.nonalpha.pnkey.space;
        result(06) := stdkey.alpha.a;
        result(07) := stdkey.alpha.b;
        result(08) := stdkey.alpha.c;
        result(09) := stdkey.alpha.d;
        result(10) := stdkey.alpha.e;
        result(11) := stdkey.alpha.f;
        result(12) := stdkey.alpha.g;
        result(13) := stdkey.alpha.h;
        result(14) := stdkey.alpha.i;
        result(15) := stdkey.alpha.j;
        result(16) := stdkey.alpha.k;
        result(17) := stdkey.alpha.l;
        result(18) := stdkey.alpha.m;
        result(19) := stdkey.alpha.n;
        result(20) := stdkey.alpha.o;
        result(21) := stdkey.alpha.p;
        result(22) := stdkey.alpha.q;
        result(23) := stdkey.alpha.r;
        result(24) := stdkey.alpha.s;
        result(25) := stdkey.alpha.t;
        result(26) := stdkey.alpha.u;
        result(27) := stdkey.alpha.v;
        result(28) := stdkey.alpha.w;
        result(29) := stdkey.alpha.x;
        result(30) := stdkey.alpha.y;
        result(31) := stdkey.alpha.z;
        result(32) := stdkey.nonalpha.pnkey.grave;
        result(33) := stdkey.nonalpha.pnkey.hyphen;
        result(34) := stdkey.nonalpha.pnkey.equals;
        result(35) := stdkey.nonalpha.pnkey.lbracket;
        result(36) := stdkey.nonalpha.pnkey.rbracket;
        result(37) := stdkey.nonalpha.numkey.n0;
        result(38) := stdkey.nonalpha.numkey.n1;
        result(39) := stdkey.nonalpha.numkey.n2;
        result(40) := stdkey.nonalpha.numkey.n3;
        result(41) := stdkey.nonalpha.numkey.n4;
        result(42) := stdkey.nonalpha.numkey.n5;
        result(43) := stdkey.nonalpha.numkey.n6;
        result(44) := stdkey.nonalpha.numkey.n7;
        result(45) := stdkey.nonalpha.numkey.n8;
        result(46) := stdkey.nonalpha.numkey.n9;
        result(47) := stdkey.nonalpha.pnkey.backslash;
        result(48) := stdkey.nonalpha.pnkey.semicolon;
        result(49) := stdkey.nonalpha.pnkey.apostrophe;
        result(50) := stdkey.nonalpha.pnkey.comma;
        result(51) := stdkey.nonalpha.pnkey.period;
        result(52) := stdkey.nonalpha.pnkey.fwdslash;
        result(53) := stdkey.nonalpha.fnkey.f1;
        result(54) := stdkey.nonalpha.fnkey.f2;
        result(55) := stdkey.nonalpha.fnkey.f3;
        result(56) := stdkey.nonalpha.fnkey.f4;
        result(57) := stdkey.nonalpha.fnkey.f5;
        result(58) := stdkey.nonalpha.fnkey.f6;
        result(59) := stdkey.nonalpha.fnkey.f7;
        result(60) := stdkey.nonalpha.fnkey.f8;
        result(61) := stdkey.nonalpha.fnkey.f9;
        result(62) := stdkey.nonalpha.fnkey.f10;
        result(63) := stdkey.nonalpha.fnkey.f11;
        result(64) := stdkey.nonalpha.fnkey.f12;
        result(65) := stdkey.nonalpha.fnkey.f13;
        result(66) := stdkey.nonalpha.fnkey.f14;
        result(67) := stdkey.nonalpha.fnkey.f15;
        result(68) := stdkey.nonalpha.ins;
        result(69) := stdkey.nonalpha.navkey.pghome;
        result(70) := stdkey.nonalpha.navkey.pgup;
        result(71) := stdkey.nonalpha.navkey.pgdn;
        result(72) := stdkey.nonalpha.navkey.pgend;
        result(73) := stdkey.nonalpha.navkey.up;
        result(74) := stdkey.nonalpha.navkey.down;
        result(75) := stdkey.nonalpha.navkey.left;
        result(76) := stdkey.nonalpha.navkey.right;
        return result;
    end function;

    
    function slv_to_stdkey(slv : std_logic_vector) return t_stdkey is
        variable result : t_stdkey;
    begin
        result.nonalpha.bs                  := slv(00);           
        result.nonalpha.del                 := slv(01);          
        result.nonalpha.tab                 := slv(02);          
        result.nonalpha.rtn                 := slv(03);          
        result.nonalpha.esc                 := slv(04);          
        result.nonalpha.pnkey.space         := slv(05);          
        result.alpha.a                      := slv(06);           
        result.alpha.b                      := slv(07);           
        result.alpha.c                      := slv(08);           
        result.alpha.d                      := slv(09);           
        result.alpha.e                      := slv(10);           
        result.alpha.f                      := slv(11);           
        result.alpha.g                      := slv(12);           
        result.alpha.h                      := slv(13);           
        result.alpha.i                      := slv(14);           
        result.alpha.j                      := slv(15);           
        result.alpha.k                      := slv(16);           
        result.alpha.l                      := slv(17);           
        result.alpha.m                      := slv(18);           
        result.alpha.n                      := slv(19);           
        result.alpha.o                      := slv(20);           
        result.alpha.p                      := slv(21);           
        result.alpha.q                      := slv(22);           
        result.alpha.r                      := slv(23);           
        result.alpha.s                      := slv(24);           
        result.alpha.t                      := slv(25);           
        result.alpha.u                      := slv(26);           
        result.alpha.v                      := slv(27);           
        result.alpha.w                      := slv(28);           
        result.alpha.x                      := slv(29);           
        result.alpha.y                      := slv(30);           
        result.alpha.z                      := slv(31);           
        result.nonalpha.pnkey.grave         := slv(32);          
        result.nonalpha.pnkey.hyphen        := slv(33);         
        result.nonalpha.pnkey.equals        := slv(34);         
        result.nonalpha.pnkey.lbracket      := slv(35);           
        result.nonalpha.pnkey.rbracket      := slv(36);           
        result.nonalpha.numkey.n0           := slv(37);            
        result.nonalpha.numkey.n1           := slv(38);            
        result.nonalpha.numkey.n2           := slv(39);            
        result.nonalpha.numkey.n3           := slv(40);            
        result.nonalpha.numkey.n4           := slv(41);            
        result.nonalpha.numkey.n5           := slv(42);            
        result.nonalpha.numkey.n6           := slv(43);            
        result.nonalpha.numkey.n7           := slv(44);            
        result.nonalpha.numkey.n8           := slv(45);            
        result.nonalpha.numkey.n9           := slv(46);            
        result.nonalpha.pnkey.backslash     := slv(47);          
        result.nonalpha.pnkey.semicolon     := slv(48);          
        result.nonalpha.pnkey.apostrophe    := slv(49);         
        result.nonalpha.pnkey.comma         := slv(50);          
        result.nonalpha.pnkey.period        := slv(51);         
        result.nonalpha.pnkey.fwdslash      := slv(52);           
        result.nonalpha.fnkey.f1            := slv(53);
        result.nonalpha.fnkey.f2            := slv(54);
        result.nonalpha.fnkey.f3            := slv(55);
        result.nonalpha.fnkey.f4            := slv(56);
        result.nonalpha.fnkey.f5            := slv(57);
        result.nonalpha.fnkey.f6            := slv(58);
        result.nonalpha.fnkey.f7            := slv(59);
        result.nonalpha.fnkey.f8            := slv(60);
        result.nonalpha.fnkey.f9            := slv(61);
        result.nonalpha.fnkey.f10           := slv(62);
        result.nonalpha.fnkey.f11           := slv(63);
        result.nonalpha.fnkey.f12           := slv(64);
        result.nonalpha.fnkey.f13           := slv(65);
        result.nonalpha.fnkey.f14           := slv(66);
        result.nonalpha.fnkey.f15           := slv(67);
        result.nonalpha.ins                 := slv(68);
        result.nonalpha.navkey.pghome       := slv(69);
        result.nonalpha.navkey.pgup         := slv(70);
        result.nonalpha.navkey.pgdn         := slv(71);
        result.nonalpha.navkey.pgend        := slv(72);
        result.nonalpha.navkey.up           := slv(73);
        result.nonalpha.navkey.down         := slv(74);
        result.nonalpha.navkey.left         := slv(75);
        result.nonalpha.navkey.right        := slv(76);
        return result;
    end function;


end types;