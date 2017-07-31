
-module(numbers).
-author("Daniel Buckley").

%% API
-export([main/0]).

findMinimum(List) ->
  FirstItemInList = lists:nth(1, List),
  if
    length(List) == 1 ->
      FirstItemInList;
    length(List) > 1 ->
      findMinimumRecursiveHelper(FirstItemInList,lists:nth(2, List),List)
  end.

findMinimumRecursiveHelper(Min, Next, List) ->
  if
    length(List) == 2 ->
      if
        Next < Min ->
          Next;
        Next >= Min ->
          Min
      end;
    length(List) > 2 ->
      NewList = lists:sublist(List, 2, length(List)),
      if
        Next < Min ->
          findMinimumRecursiveHelper(Next, lists:nth(2, NewList), NewList);
        Next >= Min ->
%%          io:fwrite("NEXT VALUE IS GREATER THAN CURRENT MIN ------- KEEP GOING\n"),
          findMinimumRecursiveHelper(Min, lists:nth(2, NewList), NewList)
      end
    end.

builtInMinimumItemInList(List) ->
  lists:min(List).

findMaximum(List) ->
  FirstElementInList = lists:nth(1, List),
  if
    length(List) == 1 ->
      FirstElementInList;
    length(List) > 1 ->
      findMaximumRecursiveHelper(FirstElementInList, lists:nth(2, List), List)
  end.

findMaximumRecursiveHelper(Max, Next, List) ->
  if
    length(List) == 2 ->
      if
        Max < Next ->
          Next;
        Max >= Next ->
          Max
      end;
    length(List) > 2 ->
      NewList = lists:sublist(List, 2, length(List)),
      if
        Max >= Next ->
          findMaximumRecursiveHelper(Max, lists:nth(2, NewList), NewList);
        Max < Next ->
          findMaximumRecursiveHelper(Next, lists:nth(2, NewList), NewList)
      end
  end.

builtInMaximumFunction(List) ->
  lists:max(List).

sumList(List) ->
  sumList(List, 0).

sumList(List, Sum) ->
%%  Types are immutable so don't forget to create a new variable when trying to do some computation
  if
    length(List) == 1 ->
      NewSum = Sum + lists:nth(1, List);
    length(List) > 1 ->
      NewSum = Sum + lists:nth(1, List),
      NewList = lists:delete(lists:nth(1, List), List),
      sumList(NewList, NewSum)
  end.

minusList(List) ->
  MinusSum = lists:nth(1, List),
  if
    length(List) == 1 ->
      MinusSum;
    length(List) > 1 ->
      NewList = lists:delete(lists:nth(1, List), List),
      minusList(NewList, MinusSum)
  end.

minusList(List, MinusSum) ->
  if
    length(List) == 1 ->
      NewSum = MinusSum - lists:nth(1, List);
    length(List) > 1 ->
      NewSum = MinusSum - lists:nth(1, List),
      NewList = lists:delete(lists:nth(1, List), List),
      minusList(NewList, NewSum)
  end.

builtInSumOfList(List) ->
  lists:sum(List).

main() ->
  List = [15,12,100,1200,12,1,4,5,17,15,11],
%%  erlang:display(List),
  Min = findMinimum(List),
  io:format("~s", ["The minimum value in list using recursive function is "]),
  erlang:display(Min),

  Min2 = builtInMinimumItemInList(List),
  io:format("~s", ["The minimum value in list using built in function is "]),
  erlang:display(Min2),

  Max = findMaximum(List),
  io:format("~s", ["\nThe maximum value in list using recursive function is "]),
  erlang:display(Max),

  Max2 = builtInMaximumFunction(List),
  io:format("~s", ["The maximum value in list using built in function is "]),
  erlang:display(Max2),

  io:format("~s", ["\nThe added value in list using recursive function is "]),
  erlang:display(sumList(List)),

  io:format("~s", ["The added value in list using built in function is "]),
  erlang:display(builtInSumOfList(List)),

  io:format("~s", ["\nThe minus value in list using recursive function is "]),
  erlang:display(minusList(List))
.

