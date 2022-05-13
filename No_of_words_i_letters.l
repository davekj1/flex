%{
#include<stdio.h>
#include<string.h>
int pos[20]={0};
void printer();
%}
%%
[a-zA-Z0-9]* {pos[yyleng]+=1;};
\n;
%%

main(){
yyin= fopen("input.txt","r");
yylex();
printer();

}
void printer(){
int i,j;
printf("\n\n\n");
for(i=1;i<20;i++){
printf("%d",i);
for(j=1;j<=pos[i];j++){
printf(" * ");
}
printf("\n");
}
}

int yywrap(){
return(1);
}