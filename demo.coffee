{log, greaterThan} = require 'coffee-mate'
linq = require 'linq'
linqlite = require './src/index'

n = 1e7

log -> linq.range(1, n).where(greaterThan(n - 10)).first()
log -> linq.from([1, 2, 'a', 3, 'b', new Number(99), new String('hello'), {}, (->), []]).ofType(Object).toArray()

log -> linqlite.range(1, n).where(greaterThan(n - 10)).first()
log -> linqlite.from([1, 2, 'a', 3, 'b', new Number(99), new String('hello'), {}, (->), []]).ofType(Object).toArray()
