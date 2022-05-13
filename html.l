%{
%}

%%
^[("<"[^>]*>)] ; /* if anything enclosed in
these < > occur print text*/
. printf("%s",yytext) ; // else do nothing

%%

int yywrap(){}

int main(int argc, char*argv[])
{
// Open tags.txt in read mode
yyin = fopen("input5.html","r");

// The function that starts the analysis
yylex();

return 0;
}