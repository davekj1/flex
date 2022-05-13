%{
#include<stdio.h>
int total =0 ;
%}

%%

#.* {total++; printf("This is Pre-processor directive: %s\n\n",yytext);}

[''|,|;(|)|{|}|.|_] {total++; printf("This is Delimiter: %s\n\n",yytext);}

[[]] {total++; printf("This is Delimiter: %s\n\n",yytext);}

"#"|"@"|"$"|"^"|"%"|"^"|"&" {total++; printf("This is Special Characters: %s\n\n",yytext);}

"["|"]" {total++; printf("This is Delimiter: %s\n\n",yytext);}

"=" {total++; printf("This is Assignment Operator: %s\n\n",yytext);}

"+"|"-"|"*"|"/" {total++; printf("This is Arithmatic Operator: %s\n\n",yytext);}

"and"|"or"|"not"|"nand"|"xor"|"nor"|"xnor" {total++; printf("This is Logical Operators: %s\n\n",yytext);}

"<="|">="|"++"|"!="|"=="|"<"|">" {total++; printf("This is Relational Operator: %s\n\n",yytext);}

("int")|("if")|("else")|("while")|("do")|("break")|("continue")|("double")|("float")|("return")|("EOF") {total++; printf("This is Keyword: %s\n\n",yytext);}

("return")|("char")|("case")|("sizeof")|("long")|("short")|("typedef")|("switch")|("unsigned")|("void")|("static")|("struct")|("goto") {total++;printf("This is Keyword:%s\n",yytext);}

[a-zA-Z_][a-zA-Z0-9_]*\( {total++; printf("This is Function: %s\n\n",yytext);}

[a-zA-Z_][a-zA-Z0-9_]* {total++; printf("This is Identifier: %s\n\n",yytext);}

[0-9]*"."[0-9]+ {total++;printf("This is Fraction : %s\n\n", yytext);}

[-][0-9]*"."[0-9]+ {total++;printf("This is Negative Fraction : %s\n\n", yytext);}

[0-9]+ {total++; printf("This is Integer: %s\n\n",yytext);}

"-"[0-9]+ {total++; printf("This is Negative Integer: %s\n\n",yytext);}

["]([^"\\\n]|\\.|\\\n)*["] {total++; printf("this is String:%s\n\n",yytext);}

"//".*" "* {total++;printf("this is single line Commments: %s\n\n",yytext);}

\/\*(.*\n)*.*\*\/ {total++;printf("this is multi line Comments: %s\n\n",yytext);}

. {printf("",yytext);}

[\t\n]+

%%

main()
{
extern FILE *yyin;
yyin = fopen("input.txt", "r");

yylex();
printf("\n\n\n\n\n Total Tokens = %d",total);
return 0;
}

int yywrap(){
return(1);
}
