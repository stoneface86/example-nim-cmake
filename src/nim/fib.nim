
# nim code to be called from your C code should be marked with exportc
# noconv will use the same calling convention as your compiler's default
# or you can use an explicit convention if you prefer (just make sure your header prototype matches)

proc fib(a: cint): cint {.exportc, noconv.} =
    if a <= 2:
        result = 1
    else:
        result = fib(a - 1) + fib(a - 2)
