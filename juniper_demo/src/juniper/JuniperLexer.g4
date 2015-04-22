lexer grammar JuniperLexer;

options {
 //  superClass = 'org.batfish.grammar.BatfishLexer';
}

@header {
package juniper;
}

@members {
boolean enableIPV6_ADDRESS = true;
boolean enableIP_ADDRESS = true;
boolean enableDEC = true;


}

CLOSE_BRACE
:
   '}'
;

CLOSE_BRACKET
:
   ']'
;

CLOSE_PAREN
:
   ')'
;

INACTIVE
:
   'inactive:'
;

LINE_COMMENT
:
   '#' F_NonNewlineChar* F_NewlineChar+ -> channel(HIDDEN)
;

MULTILINE_COMMENT
:
   '/*' .*? '*/' -> channel(HIDDEN)
;

OPEN_BRACE
:
   '{'
;

OPEN_BRACKET
:
   '['
;

OPEN_PAREN
:
   '('
;

SEMICOLON
:
   ';'
;

WORD
:
   F_QuotedString
   | F_ParenString
   | F_WordChar+
;

WS
:
   F_WhitespaceChar+ -> channel(HIDDEN)
;

fragment
F_NewlineChar
:
   [\r\n]
;

fragment
F_NonNewlineChar
:
   ~[\r\n]
;

fragment
F_ParenString
:
   '(' ~')'* ')'
;

fragment
F_QuotedString
:
   '"' ~'"'* '"'
;

fragment
F_WhitespaceChar
:
   [ \t\u000C\r\n]
;

fragment
F_WordChar
:
   ~[ \t\u000C\r\n;{}[\]"#()]
;
