require 'coffee-mate/src/global'

isA = (cls) ->
	if cls is Number
		(x) -> typeof x is 'number'
	else if cls is String
		(x) -> typeof x is 'string'
	else if cls is Object
		(x) -> typeof x is 'object'
	else
		(x) -> x instanceof cls

linqWrap = (xs) ->
	select: (f) -> linqWrap map(f) xs
	selectMany: (f) -> linqWrap join map(f) xs
	where: (judge) -> linqWrap filter(judge) xs
	ofType: (cls) -> linqWrap filter(isA cls) xs
	flatten: -> linqWrap join xs
	scan: override
		1: (f) -> linqWrap foldl(f, (head xs)) drop(1) xs
		2: (init, f) -> linqWrap foldl(f, init) xs
	toArray: -> list xs
	first: -> head xs
	log: -> log list xs

linq =
	from: (xs) -> linqWrap xs
	range: override
		1: (n) -> linqWrap range(n)
		2: (i, n) -> linqWrap range(i, i + n)

module.exports = linq
