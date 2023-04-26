
#ifndef _LEXER_H
#define _LEXER_H

#define T_if        1001 
#define T_then      1002 
#define T_else      1003 
#define T_and       1004 
#define T_while     1005 
#define T_not       1006 
#define T_do        1007 
#define T_fun       1008 
#define T_return    1009 
#define T_char      1010 
#define T_int       1011 
#define T_div       1012
#define T_mod       1013
#define T_nothing   1014
#define T_or        1015
#define T_ref       1016
#define T_var       1017
#define T_white     1018


int yylex();

extern char* yytext;

#endif
