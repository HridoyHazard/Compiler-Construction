/* Shahadat Hossain */
/* 191-115-098 */
/* 47(C) */

%{
	int yywrap (void )
	{
		return 1;
	}
%}
    int num_lines = 0, num_chars = 0;

%%
\n    ++num_lines; ++num_chars;
.     ++num_chars;

%%
main()
    {
    yylex();
    printf( "Number of lines = %d, Number of chars = %d\n",
            num_lines, num_chars );
    }