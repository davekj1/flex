%{
#include<stdio.h>
char * func(char *);
%}

%%
"#"|"@"|"$"|"^"|"%"|"^"|"&" { printf("This is Special Characters: %s\n",yytext);}
"//".*" "* printf("This is comment : %s",func(yytext));
\/\*(.*\n)*.*\*\/ printf("This is comment :%s",func(yytext));
[A-Z] printf("%c",yytext[0]+32);
[\t\n]+;

%%
int yywrap(){
return 1;
}
char * func(char *temp) {

// Convert to lower case
char *s = temp;
while (*s) {
*s = tolower((unsigned char) *s);
s++;
}
return temp;

}
main( )
{
yyin=fopen("input.txt","r");
yylex();
}