%% 3 different function implementations of reversing strings in Erlang for practice

-module(string_reversals).
-author("Daniel Buckley").

%% API
-export([main/0]).

recursivelyReverseString1("", 0) ->
  "";
recursivelyReverseString1(StringToReverse, StringLength) when StringLength > 0 ->
  string:concat(string:sub_string(StringToReverse, length(StringToReverse)), recursivelyReverseString1(string:sub_string(StringToReverse, 1, string:length(StringToReverse) - 1), string:length(StringToReverse)-1)).

recursivelyReverseString2(Rev) ->
  if
    length(Rev) == 0 ->
      " ";
    length(Rev) > 0 ->
     string:concat(string:sub_string(Rev, length(Rev)), recursivelyReverseString2(string:substr(Rev, 1, length(Rev) - 1)))
  end.

builtInReversalOfStrings(ReverseString) ->
  string:reverse(ReverseString).

main() ->
  MyString = "Here is my String that needs to be reversed!",
  ReversedString1 = recursivelyReverseString1(MyString, string:len(MyString)),
  io:fwrite(ReversedString1),

  io:format("~s", ["\n"]),
  ReversedString2 = recursivelyReverseString2("Hello Daniel Buckley"),
  io:fwrite(ReversedString2),

  io:format("~s", ["\n"]),
  ReversedString3 = builtInReversalOfStrings("Using Erlang Built In Funtions!"),
  io:fwrite(ReversedString3)
.


