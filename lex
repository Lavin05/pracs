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

lex vowel.l
xx lex.yy.c -lfl
./a.out

input-abdABC

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

input a,8,8ab


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

input -
Geeks for       Geeks 
gfg  gfg


4
%{

 void display( int x, char *y);
%}

%%

(int|float|string|double|char|new) {  display(1,yytext); }
[a-zA-Z][a-zA-Z0-9]* { display(2,yytext); }
[,;{}()\[\]] { display(3,yytext); }
[+*/=><-] { display(4,yytext); }
.[-]*[0-9]+ { display(5,yytext); }


%%

void main() {
    printf("Enter the code:");
    yylex();

}
void display( int x, char *y) {
    if (x==1) {
        printf("Keyword: %s \n",y);
    }
    if (x==2) {
        printf("Identifier: %s \n",y);
    }
    if (x==3) {
        printf("Special Symbol: %s \n",y);
    }
    if (x==4) {
        printf("Operator: %s \n",y);
    }
    if (x==5) {
        printf("Number: %s \n",y);
    }
    if (x==6) {
        printf("constants: %s \n",y);
    }

}

int yywrap() {
    return 1;
}

5.
%{
    char name[30];
    
    int choice = 1;
%}

%%
\n { printf("Hello %s, Good something\n", name);  return 1;}
%%

void main(){
    printf("Enter your name: ");
    scanf("%s", name);
    yylex();
    printf("choice = %d", choice);
    while(choice == 1){
        printf("Enter 1 to enter the name again and 2 to exit: ");
        scanf("%d", &choice);
        printf("choice = %d", choice);

        if(choice == 1){
            printf("Enter your name: ");
            scanf("%s", name);
            yylex();
        }
        else if(choice == s2){
            printf("Goodbye %s", name);
            break;
        }
        else{
            printf("Invalid choice");
            choice = 1;
        }
    }
}
int yywrap(){return(1);}


input- any random names
