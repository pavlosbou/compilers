%{
#include <stdio.h>
#include <stdlib.h>

int yylex();
void yyerror(const char *msg);

%}

%token T_id
%token T_num
%token T_begin "begin"
%token T_end "end"
%token T_print "print"
%token T_let "let"
%token T_if "if"
%token T_then "then"
%token T_else "else"
%token T_for "for"

%expect 1
%left '+' '-'
%left '*' 

%%

stmtlst :
        | stmtlst stmt

stmt : "let" T_id '=' expr
     | "begin" stmtlst "end"
     | "print" expr
     | "if" expr "then" stmt
     | "if" expr "then" stmt "else" stmt
     | "for" expr "do" stmt

expr : expr '+' expr
     | expr '*' expr
     | expr '/' expr
     | '(' expr ')'
     | T_num
     | T_id

%%


void yyerror(const char *msg) {
  fprintf(stderr, "%s\n", msg);
  exit(1);
}

int main() {
        int result = yyparse();
        if (result == 0) printf("Success.\n");
        return result;
}
