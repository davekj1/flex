%{
#include<stdio.h>
#include<stdlib.h>
int upper(char *);
int lower(char *);
int count_char(char *);
int q=0;
int word=0;
int sc=0;
int d=0;
int sa=0;
int la=0;
%}
%%
([a-zA-Z])*(" ")("College") {printf("College name is %s\n",yytext);
word+=2;sa+=lower(yytext);la+=upper(yytext);};
([0-9]\/)+[0-9]* {printf("Date is %s\n",yytext);};
("Question")[0-9](.)+
{q+=1;d+=1;word+=count_char(yytext);sa+=lower(yytext);la+=upper(yytext);};
("Sem:")(.+)[("I")("II")("III")("IV")("V")("VI")("VIII")("VII")] {printf("Semester is
%s\n",yytext);word+=1;la+=1;sa+=2;};
"#"|"@"|"$"|"^"|"%"|"^"|"&" sc+=1;
[0-9]+ d+=1;
\n ;

%%

int count_char(char *str ){
int i=0,wrd=1;
/* loop till end of string */
while(str[i]!='\0')
{
/* check whether the current character is white space or new line or tab character*/
if(str[i]==' ' || str[i]=='\n' || str[i]=='\t')
{
wrd++;
}

i++;
}
return wrd-1;
}
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
yyin= fopen("input6.txt","r");
yylex();
printf("No . of special characters are %d\n",sc);
printf("No . of questions are %d\n",q);
printf("No . of digits are %d\n",d);
printf("No . of words are %d\n",word);
printf("No . of small alphabets %d \n",sa);
printf("No . of large alphabets %d \n",la);

}
int yywrap(){
return(1);
}