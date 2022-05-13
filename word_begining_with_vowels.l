%{
#include<stdio.h>
#include<string.h>
int flag = 0;
%}
%%
[aeiouAEIOU].[a-zA-Z0-9.]+ flag=1;
[a-zA-Z0-9]+
%%
int yywrap(void){
return 1;
}
main()
{
yylex();

if (flag == 1)
printf("Begins with vowel");
else
printf("Does not begin with vowel");
}