%%%-------------------------------------------------------------------
%%% @author Magnus
%%% @copyright (C) 2018
%%% @doc
%%%
%%% @end
%%%-------------------------------------------------------------------
-module(parse_tests).
-author("Magnus").

-include_lib("eunit/include/eunit.hrl").

simple_test() ->
  A = 1,
  ?assertMatch(2, expr_processor:add(A, 1)).
