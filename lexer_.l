%{
#include <stdio.h>
#include "lexer.h"
%}
%option noyywrap

delim       [ \t\n]
ws          {delim}+
l           [a-zA-Z][a-zA-Z0-9_]*
d           [0-9]
%%

"if"            { return T_if; }
"then"          { return T_then; }
"else"          { return T_else; }
"and"           { return T_and; }
"while"         { return T_while; }
"not"           { return T_not; }
"do"            { return T_do; }
"fun"           { return T_fun; }
"return"        { return T_return; }
"div"           { return T_div ; }
"mod"           { return T_mod; }
"nothing"       { return T_nothing ; }
"or"            { return T_or; }
"ref"           { return T_ref; }
"var"           { return T_var; }

[-+*/=()#<><=>=]       { return yytext[0]; }
{l}             { return T_char; }
{d}+            { return T_int; }

{ws}            { return T_white; }
\'.*\n          {}


.               { printf("Illegal token\n"); exit(1); }

%%

int main() {
    int token;
    do {
        token = yylex();
        printf("token=%d, lexeme=\"%s\"\n", token, yytext);
    } while(token != 0);
}
