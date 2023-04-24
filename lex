1.Vowels and constants-
%{
    int vow_count=0;
    int const_count =0;
%}
 
%%
[aeiouAEIOU] {vow_count++;}
[a-zA-Z] {const_count++;}
%%
int yywrap(){}
int main()
{
    printf("Enter the string of vowels and consonants:");
    yylex();
    printf("Number of vowels are:  %d\n", vow_count);
    printf("Number of consonants are:  %d\n", const_count);
    return 0;
}


2.is digit or not

%{
#include<stdio.h>
#include<stdlib.h>
%}
/* Rule Section */
%%
^[0-9]*  printf("digit");
^[^0-9]|[0-9]*[a-zA-Z]  printf("not a digit");
. ;
%%
int main()
{
        // The function that starts the analysis
    yylex();
        return 0;
}














3.LEX Program to count the number of lines, words and characters in a text.


%{
#include<stdio.h>
int lc=0,sc=0,tc=0,ch=0,wc=0;        // GLOBAL VARIABLES
%}
 
// RULE SECTION
%%
[\n] { lc++; ch+=yyleng;}
[  \t] { sc++; ch+=yyleng;}
[^\t] { tc++; ch+=yyleng;}
[^\t\n ]+ { wc++;  ch+=yyleng;} 
%%
 
int yywrap(){ return 1;    }
/*        After inputting press ctrl+d         */
 
// MAIN FUNCTION
int main(){
    printf("Enter the Sentence : ");
    yylex();
    printf("Number of lines : %d\n",lc);
    printf("Number of spaces : %d\n",sc);
    printf("Number of tabs, words, charc : %d , %d , %d\n",tc,wc,ch);
     
    return 0;
}



