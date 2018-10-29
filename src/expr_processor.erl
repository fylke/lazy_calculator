%%%-------------------------------------------------------------------
%%% @author Magnus
%%% @copyright (C) 2018
%%% @doc
%%%
%%% @end
%%%-------------------------------------------------------------------
-module(expr_processor).
-author("Magnus").

%% API
-export([add/2, parse_expr/1, tokenize/1]).

-record(expr, {register, operator, operand}).

add(Reg, Operand)
  when is_integer(Reg),
       is_integer(Operand) ->
  Reg + Operand.

tokenize(String)
    when is_list(String) ->
  string:tokens(String, " ").

-spec(parse_expr(Expr :: string()) ->
  {ok,  :: #expr{}} | {error, Reason :: string()}).
parse_expr(ExprString) ->
  [Register, Operator, Operand] = string:tokens(ExprString, " "),
  %if is_reserved(Register) -> {error, "Reserved word " ++ Register ++ " used as register!"};
  %end,
  OperatorAsAtom =
    case string:lowercase(Operator) of
      "add" -> add;
      "multiply" -> multiply;
      "subtract" -> subtract;
      _ ->
    end,
  #expr{register=Register, operator=OperatorAsAtom, operand=Operand}.


is_reserved(Word) ->
  case string:lowercase(Word) of
    "add" -> true;
    "multiply" -> true;
    "subtract" -> true;
    _ -> false;
  end.

is_alpha_num(String) ->
  case re:run(String, "^[0-9A-Za-z]+$") of
    {match, _} -> true;
    nomatch -> false
  end.