%{
	int yywrap (void)
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
    printf( "Number of lines = %d, number of chars = %d\n",
            num_lines, num_chars );
    }