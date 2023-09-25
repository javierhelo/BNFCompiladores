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
#define INTEGER_TYPE "int"
#define FLOAT_TYPE "float"
#define BOOLEAN_TYPE "bool"
#define CHAR_TYPE "char"
#define STRING_TYPE "string"
#define GLOBAL_TYPE "global"
#define ID "[a-zA-Z_][a-zA-Z0-9_]*"
#define INT_LITERAL "0|-?[1-9][0-9]*"
#define FLOAT_LITERAL "[0-9]+\\.[0-9]*"
#define CHAR_LITERAL "'[^']'"
#define STRING_LITERAL "\"[^\"]*\""
#define TRUE_LITERAL "true"
#define FALSE_LITERAL "false"
#define PLUS "\\+"
#define MINUS "-"
#define MULTIPLY "\\*"
#define DIVIDE "/"
#define MODULUS "%"
#define POWER "\\^"
#define INCREMENT "\\+\\+"
#define DECREMENT "--"
#define AND_OPERATOR "\\&"
#define OR_OPERATOR "\\|"
#define NOT_OPERATOR "!"
#define BOOL_EQUAL "=="
#define EQUAL "="
#define NOT_EQUAL "!="
#define LESS_THAN "<"
#define LESS_THAN_OR_EQUAL "<="
#define GREATER_THAN ">"
#define GREATER_THAN_OR_EQUAL ">="
#define COMMA ","
#define SEMICOLON ";"
#define LEFT_PARENTHESIS "\\("
#define RIGHT_PARENTHESIS "\\)"
#define LEFT_BRACE "\\{"
#define RIGHT_BRACE "\\}"
#define COLON ":"
#define IF_KEYWORD "if"
#define ELSE_KEYWORD "else"
#define WHILE_KEYWORD "while"
#define FOR_KEYWORD "for"
#define SWITCH_KEYWORD "switch"
#define CASE_KEYWORD "case"
#define DEFAULT_KEYWORD "default"
#define BREAK_KEYWORD "break"
#define RETURN_KEYWORD "return"
#define READ_INTEGER_FUNCTION "read_integer"
#define READ_FLOAT_FUNCTION "read_float"
#define WRITE_FUNCTION "write"
#define SPACE "#"
#define COMMENT_LINE "//.*"
#define COMMENT_BLOCK_START "/\\*"
#define COMMENT_BLOCK_END "\\*/"
#define COMMENT_BLOCK_CONTENT "[^\\*]*"
%}

// Declaracion de tokens
%%
{INTEGER_TYPE}              { addToken(INTEGER_TYPE, yytext()); return new Symbol(sym.INTEGER_TYPE, yyline, yycolumn); }
{FLOAT_TYPE}                { addToken(FLOAT_TYPE, yytext()); return new Symbol(sym.FLOAT_TYPE, yyline, yycolumn); }
{BOOLEAN_TYPE}              { addToken(BOOLEAN_TYPE, yytext()); return new Symbol(sym.BOOLEAN_TYPE, yyline, yycolumn); }
{CHAR_TYPE}                 { addToken(CHAR_TYPE, yytext()); return new Symbol(sym.CHAR_TYPE, yyline, yycolumn); }
{STRING_TYPE}               { addToken(STRING_TYPE, yytext()); return new Symbol(sym.STRING_TYPE, yyline, yycolumn); }
{GLOBAL_TYPE}               { addToken(GLOBAL_TYPE, yytext()); return new Symbol(sym.GLOBAL_TYPE, yyline, yycolumn); }
{ID}                        { addToken(ID, yytext()); return new Symbol(sym.ID, yyline, yycolumn); }
{INT_LITERAL}               { addToken(INT_LITERAL, yytext()); return new Symbol(sym.INT_LITERAL, yyline, yycolumn); }
{FLOAT_LITERAL}             { addToken(FLOAT_LITERAL, yytext()); return new Symbol(sym.FLOAT_LITERAL, yyline, yycolumn); }
{CHAR_LITERAL}              { addToken(CHAR_LITERAL, yytext()); return new Symbol(sym.CHAR_LITERAL, yyline, yycolumn); }
{STRING_LITERAL}            { addToken(STRING_LITERAL, yytext()); return new Symbol(sym.STRING_LITERAL, yyline, yycolumn); }
{TRUE_LITERAL}              { addToken(TRUE_LITERAL, yytext()); return new Symbol(sym.TRUE_LITERAL, yyline, yycolumn); }
{FALSE_LITERAL}             { addToken(FALSE_LITERAL, yytext()); return new Symbol(sym.FALSE_LITERAL, yyline, yycolumn); }
{PLUS}                      { return new Symbol(sym.PLUS, yyline, yycolumn); }
{MINUS}                     { return new Symbol(sym.MINUS, yyline, yycolumn); }
{MULTIPLY}                  { return new Symbol(sym.MULTIPLY, yyline, yycolumn); }
{DIVIDE}                    { return new Symbol(sym.DIVIDE, yyline, yycolumn); }
{MODULUS}                   { return new Symbol(sym.MODULUS, yyline, yycolumn); }
{POWER}                     { return new Symbol(sym.POWER, yyline, yycolumn); }
{INCREMENT}                 { return new Symbol(sym.INCREMENT, yyline, yycolumn); }
{DECREMENT}                 { return new Symbol(sym.DECREMENT, yyline, yycolumn); }
{AND_OPERATOR}              { return new Symbol(sym.AND_OPERATOR, yyline, yycolumn); }
{OR_OPERATOR}               { return new Symbol(sym.OR_OPERATOR, yyline, yycolumn); }
{NOT_OPERATOR}              { return new Symbol(sym.NOT_OPERATOR, yyline, yycolumn); }
{BOOL_EQUAL}                { return new Symbol(sym.BOOL_EQUAL, yyline, yycolumn); }
{EQUAL}                     { return new Symbol(sym.EQUAL, yyline, yycolumn); }
{NOT_EQUAL}                 { return new Symbol(sym.NOT_EQUAL, yyline, yycolumn); }
{LESS_THAN}                 { return new Symbol(sym.LESS_THAN, yyline, yycolumn); }
{LESS_THAN_OR_EQUAL}        { return new Symbol(sym.LESS_THAN_OR_EQUAL, yyline, yycolumn); }
{GREATER_THAN}              { return new Symbol(sym.GREATER_THAN, yyline, yycolumn); }
{GREATER_THAN_OR_EQUAL}     { return new Symbol(sym.GREATER_THAN_OR_EQUAL, yyline, yycolumn); }
{COMMA}                     { return new Symbol(sym.COMMA, yyline, yycolumn); }
{SEMICOLON}                 { return new Symbol(sym.SEMICOLON, yyline, yycolumn); }
{LEFT_PARENTHESIS}          { return new Symbol(sym.LEFT_PARENTHESIS, yyline, yycolumn); }
{RIGHT_PARENTHESIS}         { return new Symbol(sym.RIGHT_PARENTHESIS, yyline, yycolumn); }
{LEFT_BRACE}                { return new Symbol(sym.LEFT_BRACE, yyline, yycolumn); }
{RIGHT_BRACE}               { return new Symbol(sym.RIGHT_BRACE, yyline, yycolumn); }
{COLON}                     { return new Symbol(sym.COLON, yyline, yycolumn); }
{IF_KEYWORD}                { return new Symbol(sym.IF_KEYWORD, yyline, yycolumn); }
{ELSE_KEYWORD}              { return new Symbol(sym.ELSE_KEYWORD, yyline, yycolumn); }
{WHILE_KEYWORD}             { return new Symbol(sym.WHILE_KEYWORD, yyline, yycolumn); }
{FOR_KEYWORD}               { return new Symbol(sym.FOR_KEYWORD, yyline, yycolumn); }
{SWITCH_KEYWORD}            { return new Symbol(sym.SWITCH_KEYWORD, yyline, yycolumn); }
{CASE_KEYWORD}              { return new Symbol(sym.CASE_KEYWORD, yyline, yycolumn); }
{DEFAULT_KEYWORD}           { return new Symbol(sym.DEFAULT_KEYWORD, yyline, yycolumn); }
{BREAK_KEYWORD}             { return new Symbol(sym.BREAK_KEYWORD, yyline, yycolumn); }
{RETURN_KEYWORD}            { return new Symbol(sym.RETURN_KEYWORD, yyline, yycolumn); }
{READ_INTEGER_FUNCTION}     { return new Symbol(sym.READ_INTEGER_FUNCTION, yyline, yycolumn); }
{READ_FLOAT_FUNCTION}       { return new Symbol(sym.READ_FLOAT_FUNCTION, yyline, yycolumn); }
{WRITE_FUNCTION}            { return new Symbol(sym.WRITE_FUNCTION, yyline, yycolumn); }
{SPACE}                     { /* Ignorar espacios en blanco */ }
{COMMENT_LINE}              { /* Ignorar comentarios de una línea */ }
{COMMENT_BLOCK_START}       { /* Iniciar modo de comentario de bloque */ yybegin(1); }
<YYINITIAL> <COMMENT_LINE>  { /* Ignorar comentarios de una línea */ }
<YYINITIAL> <COMMENT_BLOCK_START> { /* Iniciar modo de comentario de bloque */ yybegin(2); }
<YYINITIAL>\n                { /* Contar líneas */ yyline++; }
<YYINITIAL>.                { /* Ignorar otros caracteres no válidos */ }
<1>"*/"                      { /* Finalizar modo de comentario de bloque */ yybegin(YYINITIAL); }
<1>.                         { /* Ignorar contenido del comentario de bloque */ }
<2>"*/"                      { /* Finalizar modo de comentario de bloque */ yybegin(YYINITIAL); }
<2>"\\*[^/]*"                { /* Ignorar contenido del comentario de bloque */ }
<2>.                         { /* Ignorar contenido del comentario de bloque */ }