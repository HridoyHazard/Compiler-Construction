/* Shahadat Hossain */
/* 191-115-098 */
/* 47(C) */


%{
/* need this for the call to atof() below */
#include <math.h>
int yywrap(void) {
	return 1;
}
%}

DIGIT    [0-9]
ID       [A-Za-z+_][A-Za-z0-9_]*
CHAR 	 "'"[A-Za-z]"'"
STRING   "'"[A-Za-z]+"'"
REAL     [0-9][0-9+E]*"."[0-9+E]*"-"*[0-9]

%%

{DIGIT}+					{
								printf( "An integer: %s (%d)\n", yytext,
								atoi( yytext ) );
							}

real|REAL|char|CHAR|string|STRING|integer|INTEGER {
                                printf( "A DataType: %s\n", yytext );
                            }

PROGRAM|program|function|FUNCTION|var|VAR|writeln|WRITELN|if|IF|then|THEN|begin|BEGIN|end|END|procedure|PROCEDURE {
								printf( "A keyword: %s\n", yytext );
							}

{ID}							printf( "An identifier: %s\n", yytext );


{CHAR}					    {
								printf( "A character: %s \n", yytext
								);
							}

{STRING}					{
								printf( "A string: %s \n", yytext );
							}

{REAL}			            {
								printf( "A real: %s (%g)\n", yytext,
								atof( yytext ) );
							}

"+"|"-"|"*"|"/"|":="|"("|")"|"'"|"'"				printf( "An operator: %s\n", yytext );


";"|":"					        printf( "A delimiter : %s\n", yytext );

"{"[^{}\n]*"}"					/* eat up one-line comments */

[ \t\n]+						/* eat up whitespace */

.								printf( "Unrecognized character: %s\n", yytext );

%%

int main( int argc, char **argv ) {
	++argv, --argc;  /* skip over program name */
	if ( argc > 0 )
		yyin = fopen( argv[0], "r" );
	else
		yyin = stdin;
	
	yylex();
}