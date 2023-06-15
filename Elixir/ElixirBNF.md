Created by Juan Pablo Ruiz de Chavez

A01783127

5 - 19 - 2023

---
# BNF Elixir

BNF notation for defining an Elixir module and function

```bnf
{
  
<Module> ::= defmodule <ModNames> do <functions> end

<ModNames> ::= <UpperCaseChar><validVarName> 
           |<UpperCaseChar><validVarName>.<Modnames>
<functions> ::= <function> | <function> <functions>

<function> ::= def <validFuncName>(<validArgNames>) do <expressions> end
           |def <validFuncName>(<validArgNames>) do:<expressions>
           |def <validFuncName>(<validArgNames>) when <validArgNames> <logicalOp> <comparableVarOrValue> do: <expressions>
           |defp <validFuncName>(<validArgNames>) do:<expressions>
           |defp <validFuncName>(<validArgNames>) do <expressions> end
           |defp <validFuncName>(<validArgNames>) when <validArgNames> <logicalOp> <comparableVarOrValue> do: <expressions>
           |def <validFuncName> do:<expressions>
           |def <validFuncName> do <expressions> end
           |def <validFuncName> when <validArgNames> <logicalOp> <comparableVarOrValue> do: <expressions>
           |defp <validFuncName> do:<expressions>
           |defp <validFuncName> do <expressions> end
           |defp <validFuncName> when <validArgNames> <logicalOp> <comparableVarOrValue> do: <expressions>

<validArgNames>::= <lowerCaseChar><validArgName> | <lowerCaseChar><validArgName>,<validArgnames>
<expressions> ::= <expression> | <expression> <expressions>

}
```

# EBNF Elixir

EBNF notation for defining an Elixir module and function

```bnf
{
  MODULE ::= 'defmodule' MODNAME 'do' {FUNCTION} 'end'
  MODNAME ::= UPPERCASELETTER VALIDVARNAME[{'.'UPPERCASELETTER VALIDVARNAME}]

  FUNCTION ::= ('def' | 'defp') VALIDFUNCNAME ['('] [{VALIDARGNAME}] [')'] 'do' {EXPRESSION} 'end'
  |('def' | 'defp') VALIDFUNCNAME ['('] [{VALIDARGNAME}] [')'] 'do:' {EXPRESSION}
  |('def' | 'defp') VALIDFUNCNAME (VALIDARGNAME) 'when' VALIDARGNAME LOGICALOP COMPARABLEVARORVALUE 'do:' {EXPRESSION}
  
  VALIDARGNAMES::= LOWERCASECHAR VALIDARGNAME [{','LOWERCASECHAR VALIDARGNAME}]
  

}
```