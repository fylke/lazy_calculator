%%%-------------------------------------------------------------------
%%% @author Magnus
%%% @copyright (C) 2018
%%% @doc
%%%
%%% @end
%%%-------------------------------------------------------------------
-module(input_tests).
-author("Magnus").

-include_lib("eunit/include/eunit.hrl").

tokenizer_simplest_test() ->
  ?assertMatch([], expr_processor:tokenize([])).

tokenizer_normal_test() ->
  ?assertMatch(["A", "add", "2"], expr_processor:tokenize("A add 2")).