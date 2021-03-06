# The Ring Standard Library
# Common Functions and classes for applications
# 2016, Mahmoud Fayed <msfclipper@yahoo.com>

if filename() = sysargv[2]
	eval("Load 'stdfunctions.ring'")
	eval("Load 'stdbase.ring'")
	string_class_test()
ok

func string_class_test

	See "Testing the String Class" + nl
	oString = new string("Hello, World!")
	oString.println()
	oString.upper().println()
	oString.lower().println()
	oString.left(5).println()
	oString.right(6).println()
	oString = new string("Hi" + nl + "Hello" )
	See oString.lines() + nl
	oString = new string("    Welcome    ")
	oString.println()
	oString.trim().println()
	oString = new string("Hello! ")
	oString.copy(3).println()
	see oString.strcmp("Hello! ") + nl
	see oString.strcmp("Hello ") + nl
	see oString.strcmp("Hello!! ") + nl
	oString = new string(["one","two","three"])
	oString.print()
	see oString.lines() + nl
	oString = new String(1234)
	oString.println()

Class String From StdBase

	Func Init x
		if isstring(x)
			super.init(x)
		but isnumber(x)
			super.init(""+x)
		but islist(x)
			super.init(list2str(x))
		else
			raise("Error: String Class - Init Method - Bad Parameter")
		ok

	Func Lower
		return new string( std_lower(cValue) )

	Func Upper
		return new string( std_upper(cValue) )

	Func Left x
		return new string( std_left(cValue,x) )

	Func Right x
		return new string( std_right(cValue,x) )

	Func Lines
		return std_lines(cValue)

	Func Trim
		return new string( std_trim(cValue) )

	Func Copy x
		return new string( std_copy(cValue,x) )

	Func strcmp cStr
		return std_strcmp(cValue,cStr)
