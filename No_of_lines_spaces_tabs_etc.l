%{
#include<stdio.h>
int l=1;

int s=0;
int t=0;
int c=0;
int w=0;
int sa=0;
int la=0;
%}
%%
[a-zA-Z]+ {w+=1;sa+=lower(yytext);la+=upper(yytext);}
\n l++;
([ ])+ s++;
\t t++;
. c++;
%%
int upper(char *ch)
{

int upper=0,i;
for(i=0; ch[i]!='\0'; i++){
if(ch[i]>='A' && ch[i]<='Z'){
upper=upper+1;
}
}

return upper;
}
int lower(char *ch)
{
int lower=0,i;
for(i=0; ch[i]!='\0'; i++){
if(ch[i]>='a' && ch[i]<='z'){
lower=lower+1;

}

}
return lower;
}
main(){
yyin= fopen("myfile.txt","r");
yylex();
printf("No. of lines are %d\n",l);
printf("No. of spaces are %d\n",s);
printf("No. of tabs are %d\n",t);
printf("No. of characters are %d\n",c);
printf("No. of words are %d\n",w);
printf("No. of capital alphabets are %d\n",la);
printf("No. of small alphabets are %d\n",sa);
}
int yywrap(){
return(1);
}