package org.rust.lang.core.lexer;
import com.intellij.lexer.*;
import com.intellij.psi.tree.IElementType;

%%

%{
  public _RustLexer() {
    this((java.io.Reader)null);
  }
%}

%public
%class _RustLexer
%implements FlexLexer
%function advance
%type IElementType

%x BLOCK_COMMENT
%x EOL_COMMENT

%x LIFETIME_OR_CHAR

%x SUFFIX

%unicode

///////////////////////////////////////////////////////////////////////////////////////////////////
// Whitespaces
///////////////////////////////////////////////////////////////////////////////////////////////////

EOL_WS  = \r|\n|\r\n
LINE_WS = [\ \t]

WHITE_SPACE = ({LINE_WS}|{EOL_WS})+

///////////////////////////////////////////////////////////////////////////////////////////////////
// Identifier
///////////////////////////////////////////////////////////////////////////////////////////////////

IDENTIFIER=[a-zA-Z\x80-\xff_][a-zA-Z0-9\x80-\xff_]*

///////////////////////////////////////////////////////////////////////////////////////////////////
// Literals
///////////////////////////////////////////////////////////////////////////////////////////////////

FLT_LITERAL = {DEC_LITERAL} (\. {DEC_LITERAL}? {FLT_EXP}? {FLT_SUFFIX} | {FLT_EXP} {FLT_SUFFIX}?)

FLT_EXP = [eE][+-]{DEC_LITERAL}
FLT_SUFFIX = f32|f64

INT_LITERAL = ({DEC_LITERAL} | {HEX_LITERAL} | {OCT_LITERAL} | {BIN_LITERAL}){INT_SUFFIX}?

DEC_LITERAL = {DEC_DIGIT}({DEC_DIGIT}|_)*
HEX_LITERAL = 0x({HEX_DIGIT}|_)*
OCT_LITERAL = 0o({OCT_DIGIT}|_)*
BIN_LITERAL = 0b({BIN_DIGIT}|_)*

INT_SUFFIX = u8|u16|u32|u64|usize|i8|i16|i32|i64|isize

DEC_DIGIT = [0-9]
HEX_DIGIT = [A-F0-9]
OCT_DIGIT = [0-7]
BIN_DIGIT = [0-1]

//CHAR_LITERAL = \x27 ([^'] | {ESCAPE_SEQUENCE})* \x27?

STRING_LITERAL = \x22 ([^\"] | {ESCAPE_SEQUENCE})* (\x22|\\)?

ESCAPE_SEQUENCE = \\[^\r\n\t\\] | {BYTE_ESCAPE} | {UNICODE_ESCAPE}
BYTE_ESCAPE = \\n|\\r|\\t|\\\\|\\x{HEX_DIGIT}{2}
UNICODE_ESCAPE = \\u\{{HEX_DIGIT}{1,6}\}

// TODO(kudinkin):
//  Raw string literals
//  Byte literals
//  Raw byte literals

///////////////////////////////////////////////////////////////////////////////////////////////////
// Other
///////////////////////////////////////////////////////////////////////////////////////////////////

SHEBANG_LINE=\#\!.*

%%
<YYINITIAL> \x27                  { yybegin(LIFETIME_OR_CHAR); }

<YYINITIAL>                       {

  "{"                             { return RustTokenElementTypes.LBRACE; }
  "}"                             { return RustTokenElementTypes.RBRACE; }
  "["                             { return RustTokenElementTypes.LBRACK; }
  "]"                             { return RustTokenElementTypes.RBRACK; }
  "("                             { return RustTokenElementTypes.LPAREN; }
  ")"                             { return RustTokenElementTypes.RPAREN; }
  "::"                            { return RustTokenElementTypes.COLONCOLON; }
  ":"                             { return RustTokenElementTypes.COLON; }
  ";"                             { return RustTokenElementTypes.SEMICOLON; }
  ","                             { return RustTokenElementTypes.COMMA; }
  "."                             { return RustTokenElementTypes.DOT; }
  ".."                            { return RustTokenElementTypes.DOTDOT; }
  "..."                           { return RustTokenElementTypes.DOTDOTDOT; }
  "="                             { return RustTokenElementTypes.EQ; }
  "!="                            { return RustTokenElementTypes.EXCLEQ; }
  "=="                            { return RustTokenElementTypes.EQEQ; }
  "!"                             { return RustTokenElementTypes.EXCL; }
  "++"                            { return RustTokenElementTypes.PLUSPLUS; }
  "+="                            { return RustTokenElementTypes.PLUSEQ; }
  "+"                             { return RustTokenElementTypes.PLUS; }
  "--"                            { return RustTokenElementTypes.MINUSMINUS; }
  "-="                            { return RustTokenElementTypes.MINUSEQ; }
  "-"                             { return RustTokenElementTypes.MINUS; }
  "#"                             { return RustTokenElementTypes.SHA; }
  "#!"                            { return RustTokenElementTypes.SHEBANG; }
  "||"                            { return RustTokenElementTypes.OROR; }
  "|="                            { return RustTokenElementTypes.OREQ; }
  "&&"                            { return RustTokenElementTypes.ANDAND; }
  "&="                            { return RustTokenElementTypes.ANDEQ; }
  "&"                             { return RustTokenElementTypes.AND; }
  "|"                             { return RustTokenElementTypes.OR; }
  "<<="                           { return RustTokenElementTypes.LTLTEQ; }
  "<<"                            { return RustTokenElementTypes.LTLT; }
  "<="                            { return RustTokenElementTypes.LTEQ; }
  "<"                             { return RustTokenElementTypes.LT; }
  "^="                            { return RustTokenElementTypes.XOREQ; }
  "^"                             { return RustTokenElementTypes.XOR; }
  "*="                            { return RustTokenElementTypes.MULEQ; }
  "*"                             { return RustTokenElementTypes.MUL; }
  "/="                            { return RustTokenElementTypes.DIVEQ; }
  "/"                             { return RustTokenElementTypes.DIV; }
  "%="                            { return RustTokenElementTypes.REMEQ; }
  "%"                             { return RustTokenElementTypes.REM; }
  ">>="                           { return RustTokenElementTypes.GTGTEQ; }
  ">>"                            { return RustTokenElementTypes.GTGT; }
  ">="                            { return RustTokenElementTypes.GTEQ; }
  ">"                             { return RustTokenElementTypes.GT; }
  "->"                            { return RustTokenElementTypes.ARROW; }
  "?"                             { return RustTokenElementTypes.Q; }
  "@"                             { return RustTokenElementTypes.AT; }
  "_"                             { return RustTokenElementTypes.UNDERSCORE; }

  "abstract"                      { return RustTokenElementTypes.ABSTRACT; }
  "alignof"                       { return RustTokenElementTypes.ALIGNOF; }
  "as"                            { return RustTokenElementTypes.AS; }
  "become"                        { return RustTokenElementTypes.BECOME; }
  "box"                           { return RustTokenElementTypes.BOX; }
  "break"                         { return RustTokenElementTypes.BREAK; }
  "const"                         { return RustTokenElementTypes.CONST; }
  "continue"                      { return RustTokenElementTypes.CONTINUE; }
  "crate"                         { return RustTokenElementTypes.CRATE; }
  "do"                            { return RustTokenElementTypes.DO; }
  "else"                          { return RustTokenElementTypes.ELSE; }
  "enum"                          { return RustTokenElementTypes.ENUM; }
  "extern"                        { return RustTokenElementTypes.EXTERN; }
  "false"                         { return RustTokenElementTypes.FALSE; }
  "final"                         { return RustTokenElementTypes.FINAL; }
  "fn"                            { return RustTokenElementTypes.FN; }
  "for"                           { return RustTokenElementTypes.FOR; }
  "if"                            { return RustTokenElementTypes.IF; }
  "impl"                          { return RustTokenElementTypes.IMPL; }
  "in"                            { return RustTokenElementTypes.IN; }
  "let"                           { return RustTokenElementTypes.LET; }
  "loop"                          { return RustTokenElementTypes.LOOP; }
  "macro"                         { return RustTokenElementTypes.MACRO; }
  "match"                         { return RustTokenElementTypes.MATCH; }
  "mod"                           { return RustTokenElementTypes.MOD; }
  "move"                          { return RustTokenElementTypes.MOVE; }
  "mut"                           { return RustTokenElementTypes.MUT; }
  "offsetof"                      { return RustTokenElementTypes.OFFSETOF; }
  "override"                      { return RustTokenElementTypes.OVERRIDE; }
  "priv"                          { return RustTokenElementTypes.PRIV; }
  "proc"                          { return RustTokenElementTypes.PROC; }
  "pub"                           { return RustTokenElementTypes.PUB; }
  "pure"                          { return RustTokenElementTypes.PURE; }
  "ref"                           { return RustTokenElementTypes.REF; }
  "return"                        { return RustTokenElementTypes.RETURN; }
  "Self"                          { return RustTokenElementTypes.CSELF; }
  "self"                          { return RustTokenElementTypes.SELF; }
  "sizeof"                        { return RustTokenElementTypes.SIZEOF; }
  "static"                        { return RustTokenElementTypes.STATIC; }
  "struct"                        { return RustTokenElementTypes.STRUCT; }
  "super"                         { return RustTokenElementTypes.SUPER; }
  "trait"                         { return RustTokenElementTypes.TRAIT; }
  "true"                          { return RustTokenElementTypes.TRUE; }
  "type"                          { return RustTokenElementTypes.TYPE; }
  "typeof"                        { return RustTokenElementTypes.TYPEOF; }
  "unsafe"                        { return RustTokenElementTypes.UNSAFE; }
  "unsized"                       { return RustTokenElementTypes.UNSIZED; }
  "use"                           { return RustTokenElementTypes.USE; }
  "virtual"                       { return RustTokenElementTypes.VIRTUAL; }
  "where"                         { return RustTokenElementTypes.WHERE; }
  "while"                         { return RustTokenElementTypes.WHILE; }
  "yield"                         { return RustTokenElementTypes.YIELD; }

  "/*"                            { yybegin(BLOCK_COMMENT); yypushback(2); }
  "//"                            { yybegin(EOL_COMMENT);   yypushback(2); }

  {IDENTIFIER}                    { return RustTokenElementTypes.IDENTIFIER; }

  {INT_LITERAL}                   { return RustTokenElementTypes.INTEGER_LITERAL; }
  {FLT_LITERAL}                   { return RustTokenElementTypes.FLOAT_LITERAL; }

  {STRING_LITERAL}                { return RustTokenElementTypes.STRING_LITERAL; }

  {SHEBANG_LINE}                  { return RustTokenElementTypes.SHEBANG_LINE; }

  {WHITE_SPACE}                   { return com.intellij.psi.TokenType.WHITE_SPACE; }
  [^]                             { return com.intellij.psi.TokenType.BAD_CHARACTER; }
}


///////////////////////////////////////////////////////////////////////////////////////////////////
// Suffix
///////////////////////////////////////////////////////////////////////////////////////////////////

<SUFFIX>{IDENTIFIER}    { yybegin(YYINITIAL); }
<SUFFIX>(.|\n)          { yypushback(1); yybegin(YYINITIAL); }


///////////////////////////////////////////////////////////////////////////////////////////////////
// Comments
///////////////////////////////////////////////////////////////////////////////////////////////////

<BLOCK_COMMENT>([^*]*(\*+[^*/])?)+(\*+\/)?
{
    yybegin(YYINITIAL);

    if (yycharat(2) == '!')
        return RustTokenElementTypes.INNER_DOC_COMMENT;
    else if (yycharat(2) == '*')
        return RustTokenElementTypes.OUTER_DOC_COMMENT;
    else
        return RustTokenElementTypes.BLOCK_COMMENT;
}

<EOL_COMMENT>.*
{
    yybegin(YYINITIAL);

    if (yycharat(2) == '!')
        return RustTokenElementTypes.INNER_DOC_COMMENT;
    else if (yycharat(2) == '/')
        return RustTokenElementTypes.OUTER_DOC_COMMENT;
    else
        return RustTokenElementTypes.EOL_COMMENT;
}


///////////////////////////////////////////////////////////////////////////////////////////////////
// Lifetimes & Literals
///////////////////////////////////////////////////////////////////////////////////////////////////

<LIFETIME_OR_CHAR>static                        { yybegin(YYINITIAL); return RustTokenElementTypes.STATIC_LIFETIME; }
<LIFETIME_OR_CHAR>{IDENTIFIER}                  { yybegin(YYINITIAL); return RustTokenElementTypes.LIFETIME; }
<LIFETIME_OR_CHAR>\\[nrt\\\x27\x220]\x27        { yybegin(SUFFIX);  return RustTokenElementTypes.CHAR_LITERAL; }
<LIFETIME_OR_CHAR>\\x[0-9a-fA-F]{2}\x27         { yybegin(SUFFIX);  return RustTokenElementTypes.CHAR_LITERAL; }
<LIFETIME_OR_CHAR>\\u\{[0-9a-fA-F]?{6}\}\x27    { yybegin(SUFFIX);  return RustTokenElementTypes.CHAR_LITERAL; }
<LIFETIME_OR_CHAR>.\x27                         { yybegin(SUFFIX);  return RustTokenElementTypes.CHAR_LITERAL; }
<LIFETIME_OR_CHAR>[\x80-\xff]{2,4}\x27          { yybegin(SUFFIX);  return RustTokenElementTypes.CHAR_LITERAL; }
<LIFETIME_OR_CHAR><<EOF>>                       { yybegin(YYINITIAL); return com.intellij.psi.TokenType.BAD_CHARACTER; }
