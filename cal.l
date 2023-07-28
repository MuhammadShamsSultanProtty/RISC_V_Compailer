%option noyywrap

%{
    //#include "cal.tab.h"
%}

delim [ \t]
ws {delim}+
digit [0-9]
number ({digit}+)


alpha     [a-zA-Z]
alnum     {alpha}|{digit}
ID        {alpha}{alnum}*
print     [ -~]
ICONST    "0"|[0-9]{digit}*



%%
{ws} {}
{number} {printf("%s NUMBER\n", yytext);}
"&" {printf("%s AND\n", yytext);}
"|" {printf("%s OR\n", yytext);}
"+" {printf("%s ADD\n", yytext);}
"-" {printf("%s SUB\n", yytext);}
"<" {printf("%s SHL\n", yytext);}
">" {printf("%s SHR\n", yytext);}
"*" {printf("%s MUL\n", yytext);}
"^" {printf("%s XOR\n", yytext);}
"=" {printf("%s EQUAL\n", yytext);}
{ID} {printf("%s --> ID\n", yytext);}

"("       {printf("%s LPAREN\n", yytext);}
")"       {printf("%s RPAREN\n", yytext);}
"{"       {printf("%s LBRACE\n", yytext);}
"}"       {printf("%s RBRACE\n", yytext);}
";"       {printf("%s SEMI\n", yytext);}
"="       {printf("%s ASSIGN\n", yytext);}

"//".*     {printf("%s -->NEWLINE\n", yytext);}
"int"     {printf("%s -->INT\n", yytext);}

"if"        {printf("%s IF\n", yytext);}
"else"      {printf("%s ELSE\n", yytext);}

"while"     {printf("%s WHILE\n", yytext);}
"continue"  {printf("%s CONTINUE\n", yytext);}
"break"     {printf("%s BREAK\n", yytext);}

"print"   {printf("%s PRINT\n", yytext);}
"scan"   {printf("%s SCAN\n", yytext);}



%%

int main()
{
    yylex();
    return 0;
}

