#! /bin/sh
cat "$@" |
sed '#
	s/^\([A-Z0-9_][A-Z0-9_]*:\)  */\1	/
	/;XXX /b
	s/	\(CP	\)\([^A]\)/	\1A,\2/
	s/	\(AND	\)\([^A]\)/	\1A,\2/
	s/	\(OR	\)\([^A]\)/	\1A,\2/
	s/	\(XOR	\)\([^A]\)/	\1A,\2/
	s/	\(SUB	\)\([^A]\)/	\1A,\2/
	s/	\(OR	\)\(A	\)/	\1A,\2/
	s/	\(CP	\)\(A	\)/	\1A,\2/
	s/	\(XOR	\)\(A	\)/	\1A,\2/
	s/	\(RST	\)\([0-9A-F][0-9A-F]*H	\)/	CALL	\2/
	s/	\(EX	(SP)\)/	;XXX \1/
	s/	R\([RL]\)CA/	R\1C	1,A/
	s/	R\([RL]\)A/	R\1	1,A/
	/	CPL	A/b
	s/	CPL/	CPL	A/
'