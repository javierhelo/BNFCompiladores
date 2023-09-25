import java_cup.runtime.*;

%%
%class Scanner
%cup

%{
// Importar las clases generadas por CUP
import java_cup.runtime.Symbol;
import java.io.*;
import java.util.HashMap;
%}

%{
// Tabla de símbolos para almacenar información de los tokens
HashMap<String, String> symbolTable = new HashMap<>();

// Método para agregar un token a la tabla de símbolos
void addToken(String token, String lexeme) {
    symbolTable.put(token, lexeme);
}
%}

// Declaración de macros
%{
static final String INTEGER_TYPE = "int";
static final String FLOAT_TYPE = "float";
static final String BOOLEAN_TYPE = "bool";
static final String CHAR_TYPE = "char";
static final String STRING_TYPE = "string";
static final String GLOBAL_TYPE = "global";
static final String ID = "[a-zA-Z_][a-zA-Z0-9_]*";
static final String INT_LITERAL = "0|-?[1-9][0-9]*";
static final String FLOAT_LITERAL = "[0-9]+\\.[0-9]*";
static final String CHAR_LITERAL = "'[^']'";
static final String STRING_LITERAL = "\"[^\"]*\"";
static final String TRUE_LITERAL = "true";
static final String FALSE_LITERAL = "false";
static final String PLUS = "\\+";
static final String MINUS = "-";
static final String MULTIPLY = "\\*";
static final String DIVIDE = "/";
static final String MODULUS = "%";
static final String POWER = "\\^";
static final String INCREMENT = "\\+\\+";
static final String DECREMENT = "--";
static final String AND_OPERATOR = "\\&";
static final String OR_OPERATOR = "\\|";
static final String NOT_OPERATOR = "!";
static final String BOOL_EQUAL = "==";
static final String EQUAL = "=";
static final String NOT_EQUAL = "!=";
static final String LESS_THAN = "<";
static final String LESS_THAN_OR_EQUAL = "<=";
static final String GREATER_THAN = ">";
static final String GREATER_THAN_OR_EQUAL = ">=";
static final String COMMA = ",";
static final String SEMICOLON = ";";
static final String LEFT_PARENTHESIS = "\\(";
static final String RIGHT_PARENTHESIS = "\\)";
static final String LEFT_BRACE = "\\{";
static final String RIGHT_BRACE = "\\}";
static final String COLON = ":";
static final String IF_KEYWORD = "if";
static final String ELSE_KEYWORD = "else";
static final String WHILE_KEYWORD = "while";
static final String FOR_KEYWORD = "for";
static final String SWITCH_KEYWORD = "switch";
static final String CASE_KEYWORD = "case";
static final String DEFAULT_KEYWORD = "default";
static final String BREAK_KEYWORD = "break";
static final String RETURN_KEYWORD = "return";
static final String READ_INTEGER_FUNCTION = "read_integer";
static final String READ_FLOAT_FUNCTION = "read_float";
static final String WRITE_FUNCTION = "write";
static final String SPACE = "#";
static final String COMMENT_LINE = "//.*";
static final String COMMENT_BLOCK_START = "/\\*";
static final String COMMENT_BLOCK_END = "\\*/";
static final String COMMENT_BLOCK_CONTENT = "[^\\*]*";
%}

// Declaracion de tokens
%%
"int"                   { addToken("int", yytext()); return new Symbol(sym.INTEGER_TYPE, yyline, yycolumn); }
"float"                 { addToken("float", yytext()); return new Symbol(sym.FLOAT_TYPE, yyline, yycolumn); }
"bool"                  { addToken("bool", yytext()); return new Symbol(sym.BOOLEAN_TYPE, yyline, yycolumn); }
"char"                  { addToken("char", yytext()); return new Symbol(sym.CHAR_TYPE, yyline, yycolumn); }
"string"                { addToken("string", yytext()); return new Symbol(sym.STRING_TYPE, yyline, yycolumn); }
"global"                { addToken("global", yytext()); return new Symbol(sym.GLOBAL_TYPE, yyline, yycolumn); }
"true"                  { addToken("true", yytext()); return new Symbol(sym.TRUE_LITERAL, yyline, yycolumn); }
"false"                 { addToken("false", yytext()); return new Symbol(sym.FALSE_LITERAL, yyline, yycolumn); }
"read_integer"          { addToken("read_integer", yytext()); return new Symbol(sym.READ_INTEGER_FUNCTION, yyline, yycolumn); }
"read_float"            { addToken("read_float", yytext()); return new Symbol(sym.READ_FLOAT_FUNCTION, yyline, yycolumn); }
"write"                 { addToken("write", yytext()); return new Symbol(sym.WRITE_FUNCTION, yyline, yycolumn); }
"if"                    { return new Symbol(sym.IF_KEYWORD, yyline, yycolumn); }
"else"                  { return new Symbol(sym.ELSE_KEYWORD, yyline, yycolumn); }
"while"                 { return new Symbol(sym.WHILE_KEYWORD, yyline, yycolumn); }
"for"                   { return new Symbol(sym.FOR_KEYWORD, yyline, yycolumn); }
"switch"                { return new Symbol(sym.SWITCH_KEYWORD, yyline, yycolumn); }
"case"                  { return new Symbol(sym.CASE_KEYWORD, yyline, yycolumn); }
"default"               { return new Symbol(sym.DEFAULT_KEYWORD, yyline, yycolumn); }
"break"                 { return new Symbol(sym.BREAK_KEYWORD, yyline, yycolumn); }
"return"                { return new Symbol(sym.RETURN_KEYWORD, yyline, yycolumn); }
[a-zA-Z_][a-zA-Z0-9_]*  { addToken(yytext(), yytext()); return new Symbol(sym.ID, yyline, yycolumn); }
0|-?[1-9][0-9]*         { addToken(yytext(), yytext()); return new Symbol(sym.INT_LITERAL, yyline, yycolumn); }
[0-9]+\.[0-9]*          { addToken(yytext(), yytext()); return new Symbol(sym.FLOAT_LITERAL, yyline, yycolumn); }
'[^']'                  { addToken(yytext(), yytext()); return new Symbol(sym.CHAR_LITERAL, yyline, yycolumn); }
\"[^\"]*\"              { addToken(yytext(), yytext()); return new Symbol(sym.STRING_LITERAL, yyline, yycolumn); }
"+"                     { return new Symbol(sym.PLUS, yyline, yycolumn); }
"-"                     { return new Symbol(sym.MINUS, yyline, yycolumn); }
"*"                     { return new Symbol(sym.MULTIPLY, yyline, yycolumn); }
"/"                     { return new Symbol(sym.DIVIDE, yyline, yycolumn); }
"%"                     { return new Symbol(sym.MODULUS, yyline, yycolumn); }
"^"                     { return new Symbol(sym.POWER, yyline, yycolumn); }
"\+\+"                 { return new Symbol(sym.INCREMENT, yyline, yycolumn); }
"--"                    { return new Symbol(sym.DECREMENT, yyline, yycolumn); }
"&"                     { return new Symbol(sym.AND_OPERATOR, yyline, yycolumn); }
"|"                     { return new Symbol(sym.OR_OPERATOR, yyline, yycolumn); }
"!"                     { return new Symbol(sym.NOT_OPERATOR, yyline, yycolumn); }
"=="                    { return new Symbol(sym.BOOL_EQUAL, yyline, yycolumn); }
"="                     { return new Symbol(sym.EQUAL, yyline, yycolumn); }
"!="                    { return new Symbol(sym.NOT_EQUAL, yyline, yycolumn); }
"<"                     { return new Symbol(sym.LESS_THAN, yyline, yycolumn); }
"<="                    { return new Symbol(sym.LESS_THAN_OR_EQUAL, yyline, yycolumn); }
">"                     { return new Symbol(sym.GREATER_THAN, yyline, yycolumn); }
">="                    { return new Symbol(sym.GREATER_THAN_OR_EQUAL, yyline, yycolumn); }
","                     { return new Symbol(sym.COMMA, yyline, yycolumn); }
";"                     { return new Symbol(sym.SEMICOLON, yyline, yycolumn); }
"("                     { return new Symbol(sym.LEFT_PARENTHESIS, yyline, yycolumn); }
")"                     { return new Symbol(sym.RIGHT_PARENTHESIS, yyline, yycolumn); }
"{"                     { return new Symbol(sym.LEFT_BRACE, yyline, yycolumn); }
"}"                     { return new Symbol(sym.RIGHT_BRACE, yyline, yycolumn); }
":"                     { return new Symbol(sym.COLON, yyline, yycolumn); }
"#.*"                   { /* Ignorar espacios en blanco */ }
"//.*"                  { /* Ignorar comentarios de una línea */ }
"/\\*"                  { /* Iniciar modo de comentario de bloque */ yybegin(1); }
<YYINITIAL> <COMMENT_LINE>  { /* Ignorar comentarios de una línea */ }
<YYINITIAL> <COMMENT_BLOCK_START> { /* Iniciar modo de comentario de bloque */ yybegin(2); }
<YYINITIAL>\n                { /* Contar líneas */ yyline++; }
<YYINITIAL>.                { /* Ignorar otros caracteres no válidos */ }

